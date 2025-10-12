using ClimbLogApi.Models;
using ClimbLogApi.Models.DTO.WokroutPlan;

namespace ClimbLogApi.Services.Interfaces
{
    public interface IWorkoutPlanService
    {
        Task<IEnumerable<WorkoutPlan>> GetUsersPlansAsync(int userId);
        Task<WorkoutPlanDto> GetUserPlanByIdAsync(int id, int userId);
        Task<int> CreatePlanAsync(CreateWorkPlanDto dto, int userId);
        Task<bool> UpdateWorkoutPlanAsync(WorkoutPlanDto dto, int userId);
        Task<bool> DeletePlanAsync(int id, int userId);

    }
}
