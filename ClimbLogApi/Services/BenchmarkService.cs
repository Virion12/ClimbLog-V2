using ClimbLogApi.Models;
using ClimbLogApi.Models.DB;
using ClimbLogApi.Models.DTO.benchmark;
using ClimbLogApi.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace ClimbLogApi.Services
{
    public class BenchmarkService : IBenchmarkService
    {
        private readonly ApiDbContext _dbContext;

        public BenchmarkService(ApiDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> CreateBenchmark(CreateBenchmarkDto dto, int userId)
        {
            var benchmark = new Benchmark
            {
                UserID = userId,
                CreatedAt = DateTime.UtcNow,
                BodyWeight = dto.BodyWeight,
                Ex1Points = dto.Ex1Points,
                Ex2Points = dto.Ex2Points,
                Ex3Points = dto.Ex3Points,
                Ex4Points = dto.Ex4Points,

            };

            _dbContext.Benchmarks.Add(benchmark);
            await _dbContext.SaveChangesAsync();
            return benchmark.Id;
        }

        public async Task<bool> DeleteBenchmark(int id, int userId)
        {
            var benchmark = await _dbContext.Benchmarks
                                .FirstOrDefaultAsync(b => b.Id == id && b.UserID == userId);

            if (benchmark == null)
            {
                return false;
            }

            _dbContext.Benchmarks.Remove(benchmark);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public async Task<IEnumerable<Benchmark>> GetBenchmarks(int userId)
        {
            var benchmark = await _dbContext.Benchmarks.Where(b=> b.UserID == userId).ToListAsync();
            return benchmark;
        }

        public async Task<Benchmark> GetBenchmark(int id, int userId)
        {
            var benchmark = await _dbContext.Benchmarks
                                .FirstOrDefaultAsync(b => b.Id == id && b.UserID == userId);
            if(benchmark == null)
            {
                throw new Exception("No benchmark with this correlated id for this user");
            }
            return benchmark;
        }

        public async Task<bool> UpdateBenchmark(int userId, BenchmarkDto dto)
        {
            var benchmark = await _dbContext.Benchmarks
                                .FirstOrDefaultAsync(b => b.Id == dto.Id && b.UserID == userId);

            if (benchmark == null)
            {
                return false;
            }

            benchmark.BodyWeight = dto.BodyWeight;
            benchmark.Ex1Points = dto.Ex1Points;
            benchmark.Ex3Points = dto.Ex3Points;
            benchmark.Ex2Points = dto.Ex2Points;
            benchmark.Ex4Points = dto.Ex4Points;

           await _dbContext.SaveChangesAsync();

            return true;
        }
    }
}
