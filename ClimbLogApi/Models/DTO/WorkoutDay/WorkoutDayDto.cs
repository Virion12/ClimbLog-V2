using ClimbLogApi.Models.DTO.workoutSession;

namespace ClimbLogApi.Models.DTO.WorkoutDay
{
    public class WorkoutDayDto 
    {
        public int Id { get; set; }
        public int WorkoutPlanId { get; set; }
        public WorkoutDayOfWeek WorkoutDayOfWeek { get; set; }
        public List<WorkoutSesssionDto> Sessions { get; set; } = new();
    }
}
