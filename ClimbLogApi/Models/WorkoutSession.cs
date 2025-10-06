namespace ClimbLogApi.Models
{
    public class WorkoutSession
    {
        public int Id { get; set; }
        public int WorkoutDayId { get; set; }
        public WorkoutDay WorkoutDay { get; set; } = null!;
        public TimeSpan Start { get; set; }
        public List<Exercise> Exercises { get; set; } = new();
        public String Location { get; set; } = "Default";
    }
}
