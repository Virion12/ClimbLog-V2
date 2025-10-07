using ClimbLogApi.Models;
using ClimbLogApi.Models.DTO.WokroutPlan;

namespace ClimbLogApi.Services.Interfaces
{
    public interface IWorkoutPlanService
    {
        Task<IEnumerator<WorkoutPlanDto>> GetUsersPlanAsync(int userId);
        Task<WorkoutPlanDto> GetUserPlanByIdAsync(int id, int userId);
        Task<WorkoutPlan> CreatePlanAsync(CreateWorkPlanDto dto, int userId);
    }
}
