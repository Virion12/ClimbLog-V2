using Azure.Core;
using ClimbLogApi.Models;
using ClimbLogApi.Models.DB;
using ClimbLogApi.Services;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ClimbLogApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class authController : ControllerBase
    {
        private readonly ApiDbContext _db;
        private readonly TokenService _tokenService;

        public authController(ApiDbContext db, TokenService tokenService)
        {
            _db = db;
            _tokenService = tokenService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] LoginRequest request)
        {
            if (await _db.Users.AnyAsync(u => u.Username == request.Username))
                return BadRequest("Username already exists");

            var user = new User
            {
                Username = request.Username,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.Password)
            };

            _db.Users.Add(user);
            await _db.SaveChangesAsync();

            return Ok(new { message = "User registered successfully" });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            var user = await _db.Users.FirstOrDefaultAsync(u => u.Username == request.Username);
            if (user == null || !BCrypt.Net.BCrypt.Verify(request.Password, user.PasswordHash))
                return Unauthorized("Invalid credentials");

            var token = _tokenService.GenerateToken(user.Username, user.Id);

            string rawRefreshToken = _tokenService.GenerateRefreshToken();

            var existingRefreshToken = await _db.RefreshTokens.FirstOrDefaultAsync(r => r.UserId == user.Id);

            if (existingRefreshToken != null)
            {
                existingRefreshToken.Token = BCrypt.Net.BCrypt.HashPassword(rawRefreshToken);
                existingRefreshToken.ExpiresOnUtc = DateTime.UtcNow.AddDays(30);
                _db.Update(existingRefreshToken);
            }
            else
            {
                var refreshToken = new RefreshToken
                {
                    Id = Guid.NewGuid(),
                    UserId = user.Id,
                    Token = BCrypt.Net.BCrypt.HashPassword(rawRefreshToken),
                    ExpiresOnUtc = DateTime.UtcNow.AddDays(30)
                };
                _db.Add(refreshToken);
            }

            await _db.SaveChangesAsync();

            return Ok(new { accessToken = token, refreshToken = rawRefreshToken });
        }

        [HttpPost("refresh")]
        public async Task<IActionResult> Refresh([FromBody] RefreshRequest request)
        {
            if (request == null)
                return BadRequest("Invalid request");

            var user = await _db.Users.FirstOrDefaultAsync(u => u.Username == request.Username);
            if (user == null)
                return BadRequest("No user with this username was found");

            var refreshTokenFromDb = await _db.RefreshTokens.FirstOrDefaultAsync(r => r.UserId == user.Id);
            if (refreshTokenFromDb == null)
                return BadRequest("There is no refresh token in DB");

            bool isValid = BCrypt.Net.BCrypt.Verify(request.RefreshToken, refreshTokenFromDb.Token);
            if (!isValid)
                return BadRequest("The corresponding request token was not found");

            if (refreshTokenFromDb.ExpiresOnUtc < DateTime.UtcNow)
                return BadRequest("Refresh token expired please login ");

            var token = _tokenService.GenerateToken(user.Username, user.Id);

            string rawRefreshToken = _tokenService.GenerateRefreshToken();
            refreshTokenFromDb.Token = BCrypt.Net.BCrypt.HashPassword(rawRefreshToken);
            refreshTokenFromDb.ExpiresOnUtc = DateTime.UtcNow.AddDays(30);

            _db.Update(refreshTokenFromDb);
            await _db.SaveChangesAsync();

            return Ok(new { accessToken = token, refreshToken = rawRefreshToken });
        }

    }

    public class RefreshRequest {
        public string Username { get; set; } = "";
        public string RefreshToken { get; set; } = "";
    }

    public class LoginRequest
    {
        public string Username { get; set; } = "";
        public string Password { get; set; } = "";
    }
}
