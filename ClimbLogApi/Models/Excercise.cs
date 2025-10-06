namespace ClimbLogApi.Models
{
    public class Exercise
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public double Time { get; set; }
        public double BreakTime { get; set; }
        public int SetNumber { get; set; }
        public int RepNumber { get; set; }
        public int WorkoutSessionId { get; set; }
        public WorkoutSession WorkoutSession { get; set; } = null!;
    }
}
