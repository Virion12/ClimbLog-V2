namespace ClimbLogApi.Models.DTO.Exercise
{
    public class ExerciseCreateDto
    {
         public int WorkoutSessionId { get; set; }
         public required string Name { get; set; }
         public  double Time { get; set; }
         public  double BreakTime { get; set; }
         public int SetNumber { get; set; }
         public int RepNumber { get; set; }
    }
}
