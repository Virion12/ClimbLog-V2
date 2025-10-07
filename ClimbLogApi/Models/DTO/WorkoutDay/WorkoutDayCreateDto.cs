using ClimbLogApi.Models.DTO.workoutSession;

namespace ClimbLogApi.Models.DTO.WorkoutDay
{
    public class WorkoutDayCreateDto
    {
        public int WorkoutPlanId { get; set; }
        public WorkoutDayOfWeek WorkoutDayOfWeek { get; set; }
        public List<WorkoutSessionCreateDto> Sessions { get; set; } = new();
    }
}
