using ClimbLogApi.Models.DTO.benchmark;
using ClimbLogApi.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClimbLogApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class BenchmarkController : ControllerBase
    {
        private readonly IBenchmarkService _benchmarkService;

        public BenchmarkController(IBenchmarkService benchmarkService) {
            _benchmarkService = benchmarkService;
        }

        private int GetUserId() => int.Parse(User.FindFirst("UserId")!.Value);

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id) {
            int userId = GetUserId();
            try
            {
                var benchmark = await _benchmarkService.GetBenchmark(id, userId);
                if (benchmark == null)
                {
                    return NotFound();
                }
                return Ok(benchmark);
            }
            catch (Exception ex) {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            int userId = GetUserId();
            try
            {
                var benchmarks = await _benchmarkService.GetBenchmarks(userId);
                if(benchmarks == null || benchmarks.Any());
                {
                    return NotFound();
                }
                return Ok(benchmarks);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateBenchmark([FromBody] CreateBenchmarkDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            int userId = GetUserId();
            try
            {
                int BenchmarkId = await _benchmarkService.CreateBenchmark(dto, userId);
                return Ok(new { id = BenchmarkId });
            }
            catch (Exception ex) {
                return BadRequest($"{ex.Message}");
            }
        }

        [HttpPut("{id}")]

        public async Task<IActionResult> Update(int id,[FromBody] BenchmarkDto dto)
        {
            if (!ModelState.IsValid) {
            return BadRequest(ModelState);
            }

            if (id != dto.Id)
            {
                return BadRequest("Id mismatch");
            }

            int userId = GetUserId();
            try
            {
                bool isUpdated = await _benchmarkService.UpdateBenchmark(userId, dto);
                if (!isUpdated) {
                    return NotFound();
                }
                return NoContent();
            }
            catch (Exception ex) {
                return BadRequest($"{ex.Message}");
            }

        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            int userId = GetUserId();
            try
            {
                bool IsDeleted = await _benchmarkService.DeleteBenchmark(id, userId);
                if (!IsDeleted) {
                    return NotFound();
                }
                return NoContent();
            }
            catch (Exception ex) {
                return BadRequest($"Could not delete {ex.Message}");
            }
        }
    }
}
