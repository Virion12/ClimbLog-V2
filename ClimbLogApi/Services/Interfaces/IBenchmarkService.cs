using ClimbLogApi.Models;
using ClimbLogApi.Models.DTO.benchmark;

namespace ClimbLogApi.Services.Interfaces
{
    public interface IBenchmarkService
    {
        Task<IEnumerable<Benchmark>> GetBenchmarks( int userId);

        Task<Benchmark> GetBenchmark(int id, int userId);

        Task<int> CreateBenchmark(CreateBenchmarkDto dto, int userId);

        Task<bool> DeleteBenchmark(int id, int userId);

        Task<bool> UpdateBenchmark(int userId, BenchmarkDto dto);


    }
}
