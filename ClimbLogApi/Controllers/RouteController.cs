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
    public class RouteController : ControllerBase
    {
        private readonly ApiDbContext _context;

        public RouteController(ApiDbContext context)
        {
            _context = context;
        }


        //Ok
        [HttpGet("my-all")]
        public async Task<IActionResult> GetAllRoutesForUser()
        {
            var userID = int.Parse(User.FindFirst("UserId")!.Value);
            var routes = await _context.Routes.Where(r => r.UserID == userID).ToListAsync();

            if (!routes.Any())
                return NotFound("No routes found for this user");


            return Ok(routes);

        }


        //ADD

        [HttpPost("add-many")]
        public async Task<IActionResult> AddManyRoutes([FromBody] AddRoutesDTO routes)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);


            var userID = int.Parse(User.FindFirst("UserId")!.Value);

            foreach (var pasedRoute in routes.Routes)
            {
                var route = new ClimbLogApi.Models.Route
                {
                    UserID = userID,
                    CreatedAt = DateTime.UtcNow,
                    LastUpdatedAt = DateTime.UtcNow,
                    IsPublic = pasedRoute.IsPublic,
                    Name = pasedRoute.Name,
                    Color = pasedRoute.Color,
                    Heigth = pasedRoute.Heigth,
                    IsPowery = pasedRoute.IsPowery,
                    IsSloppy = pasedRoute.IsSloppy,
                    IsDynamic = pasedRoute.IsDynamic,
                    IsCrimpy = pasedRoute.IsCrimpy,
                    IsReachy = pasedRoute.IsReachy,
                    IsOnsighted = pasedRoute.IsOnsighted,
                    IsRedPointed = pasedRoute.IsRedPointed,
                    IsFlashed = pasedRoute.IsFlashed,
                    IsFavorite = pasedRoute.IsFavorite,
                    NumberOfTried = pasedRoute.NumberOfTried,
                    IsDone = pasedRoute.IsDone,
                    Grade = pasedRoute.Grade,
                    ImagePath = pasedRoute.ImagePath,
                    thumbnailPath = pasedRoute.thumbnailPath

                };

                try
                {
                    _context.Routes.Add(route);

                }
                catch (Exception ex)
                {
                    return BadRequest($"Unable to add route due to {ex.Message}");
                }

            }
            try
            {
                await _context.SaveChangesAsync();
                return Ok();
            }
            catch (Exception ex) { return BadRequest(ex.Message); }



        }

        //Ok
        [HttpPost("add-one")]
        public async Task<IActionResult> AddMyRoute([FromBody] RouteDto dto)
        {
            var userID = int.Parse(User.FindFirst("UserId")!.Value);
            var route = new ClimbLogApi.Models.Route
            {
                UserID = userID,
                CreatedAt = DateTime.UtcNow,
                LastUpdatedAt = DateTime.UtcNow,
                IsPublic = dto.IsPublic,
                Name = dto.Name,
                Color = dto.Color,
                Heigth = dto.Heigth,
                IsPowery = dto.IsPowery,
                IsSloppy = dto.IsSloppy,
                IsDynamic = dto.IsDynamic,
                IsCrimpy = dto.IsCrimpy,
                IsReachy = dto.IsReachy,
                IsOnsighted = dto.IsOnsighted,
                IsRedPointed = dto.IsRedPointed,
                IsFlashed = dto.IsFlashed,
                IsFavorite = dto.IsFavorite,
                NumberOfTried = dto.NumberOfTried,
                IsDone = dto.IsDone,
                Grade = dto.Grade,
                ImagePath = dto.ImagePath,
                thumbnailPath = dto.thumbnailPath,
            };

            try
            {
                _context.Add(route);
                await _context.SaveChangesAsync();
                return Ok(new { routeid = route.Id});
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Adding route failed: {ex.Message}" });
            }
        }


        //Update

        //SyncAll : Determine if needed

        //OK
        [HttpPatch("update-route-by-id")]
        public async Task<IActionResult> UpdateById([FromBody] UpdateRouteDto route)
        {
            var routeId = route.Id;
            if (routeId == 0)
            {
                return NotFound("incorrect route id");
            }
            ;


            var routeEx = await _context.Routes.FindAsync(routeId);
            if (routeEx == null)
            {
                return NotFound("No route found for this user");
            }

            routeEx.Name = route.Name;
            routeEx.Color = route.Color;
            routeEx.Heigth = route.Heigth;
            routeEx.IsPublic = route.IsPublic;
            routeEx.IsPowery = route.IsPowery;
            routeEx.IsSloppy = route.IsSloppy;
            routeEx.IsDynamic = route.IsDynamic;
            routeEx.IsCrimpy = route.IsCrimpy;
            routeEx.IsReachy = route.IsReachy;
            routeEx.IsOnsighted = route.IsOnsighted;
            routeEx.IsRedPointed = route.IsRedPointed;
            routeEx.IsFlashed = route.IsFlashed;
            routeEx.IsFavorite = route.IsFavorite;
            routeEx.NumberOfTried = route.NumberOfTried;
            routeEx.IsDone = route.IsDone;
            routeEx.Grade = route.Grade;
            routeEx.ImagePath = route.ImagePath;
            routeEx.thumbnailPath = route.thumbnailPath;
            routeEx.LastUpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return Ok(routeEx);
        }

        //Remove route : OK
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("No correct id");
            }

            try
            {
                var route = await _context.Routes.FindAsync(id);
                if (route == null)
                {
                    return BadRequest("route with provided id does not exists");
                }
                _context.Routes.Remove(route);
                await _context.SaveChangesAsync();
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Removal of route failed: {ex.Message}" });
            }
        }


        //Remove-Bulk : To Test
        [HttpDelete("delete-bulk")]
        public async Task<IActionResult> DdeleteBulkByID([FromBody]List<int> ids)
        {
            if (ids.Count == 0)
                return BadRequest("List of routes ");

            foreach (int id in ids) {
                try
                {
                    var route = await _context.Routes.FindAsync(id);
                    if (route == null)
                        return BadRequest("route with provided id does not exists");

                    try
                    {
                        _context.Routes.Remove(route);
                    }
                    catch (Exception ex) { 
                        return BadRequest(new { message = ex.Message });
                    }
                }
                catch (Exception ex) { 
                return BadRequest(new { message = ex.Message });
                }
            }
            try
            {
                await _context.SaveChangesAsync();
                return NoContent();
            }
            catch (Exception ex) {
            return BadRequest(ex.Message);
            }
        }




    }
}
