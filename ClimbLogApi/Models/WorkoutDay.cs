namespace ClimbLogApi.Models
{
    public class WorkoutDay
    {
        public int Id { get; set; }
        public int WorkoutPlanId { get; set; }
        public WorkoutPlan WorkoutPlan { get; set; } = null!;
        public WorkoutDayOfWeek WorkoutDayOfWeek { get; set; }
        public List<WorkoutSession> Sessions { get; set; } = new();


    }
}
