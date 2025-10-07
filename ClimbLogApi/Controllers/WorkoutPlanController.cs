using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ClimbLogApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class WorkoutPlanController : Controller
    {

        
        
        //Ok
        [HttpGet("my-all")]
        public async Task<IActionResult> GetAllRoutesForUser()
        {
           


            return Ok();

        }
    }
}
