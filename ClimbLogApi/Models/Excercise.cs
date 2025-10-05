namespace ClimbLogApi.Models
{
    public class Excercise
    {
        public int Id { get; set; }
        public int WorkoutPlanId { get; set; }
        public WorkoutPlan WorkoutPlan { get; set; }
        public double Time { get; set; }
        public double BreakTime { get; set; }
        public int SetNumber { get; set; }
        public int RepNumber { get; set; }
    }
}
