using ClimbLogApi.Models.DTO.Exercise;

namespace ClimbLogApi.Models.DTO.workoutSession
{
    public class WorkoutSesssionDto 
    {
        public int Id { get; set; }
        public int WorkoutDayId { get; set; }
        public TimeSpan Start { get; set; }
        public required List<ExerciseDto> Exercises { get; set; } = new();
        public string Location { get; set; } = "Default";
        public required string Name { get; set; }
    }
}
