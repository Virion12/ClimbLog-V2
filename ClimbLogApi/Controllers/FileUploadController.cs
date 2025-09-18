using ClimbLogApi.Migrations;
using ClimbLogApi.Models;
using ClimbLogApi.Models.DB;
using ClimbLogApi.Models.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace ClimbLogApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class FileUploadController : ControllerBase
    {
        private readonly ApiDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public FileUploadController(ApiDbContext context, IWebHostEnvironment environment)
        {
            
            _context = context;
            _environment = environment;
        }

        [HttpPost("upload")]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {
            try
            {
                var userID = int.Parse(User.FindFirst("UserId")!.Value);
                if (file == null || file.Length == 0)
                {
                    return BadRequest(new { success = false, message = "No file uploaded" });
                }
                var uplaodPath = Path.Combine(_environment.ContentRootPath,"uploads","routes",$"{userID}");
                if (!Directory.Exists(uplaodPath))
                {
                    Directory.CreateDirectory(uplaodPath);
                }
                var fileName = $"{Guid.NewGuid()}";
                var filePath = Path.Combine(uplaodPath, fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }
                return Ok($"{fileName}");

            }
            catch (Exception e)
            {
                return BadRequest($"Error: {e.Message}");
            }
        }
        [HttpGet("{filename}")]
        public IActionResult GetOneFile(string filename)
        {
            var userID = int.Parse(User.FindFirst("UserId")!.Value);
            if (string.IsNullOrEmpty(filename))
                return BadRequest("Empty file name");

            var path = Path.Combine(_environment.ContentRootPath, "uploads", "routes", $"{userID}", filename);
            if (!System.IO.File.Exists(path))
                return NotFound("File not found");

            var provider = new Microsoft.AspNetCore.StaticFiles.FileExtensionContentTypeProvider();
            if (!provider.TryGetContentType(path, out var contentType))
            {
                contentType = "application/octet-stream"; 
            }

            return PhysicalFile(path, contentType, Path.GetFileName(path));
        }








    }
}
