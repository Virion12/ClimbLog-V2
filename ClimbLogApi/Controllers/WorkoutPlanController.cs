using ClimbLogApi.Models.DTO.WokroutPlan;
using ClimbLogApi.Services;
using ClimbLogApi.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Runtime.InteropServices.Marshalling;

namespace ClimbLogApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class WorkoutPlanController : Controller
    {
        private readonly IWorkoutPlanService _workoutPlanService;

        public WorkoutPlanController(IWorkoutPlanService workoutPlanService)
        {
            _workoutPlanService = workoutPlanService;
        }

        private int GetUserId() => int.Parse(User.FindFirst("UserId")!.Value);


        [HttpGet("{id}")]
        public async Task<IActionResult> GetPlanById(int id)
        {
            int UserId = GetUserId();
            try
            {
                var plan = await _workoutPlanService.GetUserPlanByIdAsync(id,UserId);
                if (plan == null)
                {
                    return NotFound();
                }
                return Ok(plan);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }


        //To implemente in future
        [HttpGet("my-all")]
        public async Task<IActionResult> GetAllRoutesForUser()
        {
            int UserId = GetUserId();
            try
            {
                return Ok();
            }
            catch (Exception ex) { 
            return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreatePlan([FromBody] CreateWorkPlanDto dto)
        {

            if(!ModelState.IsValid)
                return BadRequest(ModelState);

            int UserId = GetUserId();
            try
            {
                int BackendPlanId = await _workoutPlanService.CreatePlanAsync(dto, UserId);
                return Ok(new { id = BackendPlanId });
            }
            catch (Exception ex) { 
                return BadRequest(ex.Message);
            }

        }
    }
}
