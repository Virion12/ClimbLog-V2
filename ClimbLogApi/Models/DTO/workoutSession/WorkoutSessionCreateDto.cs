using ClimbLogApi.Models.DTO.Exercise;

namespace ClimbLogApi.Models.DTO.workoutSession
{
    public class WorkoutSessionCreateDto
    {
        public int WorkoutDayId { get; set; }
        public  TimeSpan Start { get; set; }
        public required List<ExerciseCreateDto> Exercises { get; set; } = new();
        public string Location { get; set; } = "Default";
        public required string Name { get; set; }

    }
}
