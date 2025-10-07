using ClimbLogApi.Models.DTO.WorkoutDay;

namespace ClimbLogApi.Models.DTO.WokroutPlan
{
    public class CreateWorkPlanDto
    {
        public bool IsPublic { get; set; } = false;
        public string Name { get; set; } = string.Empty;
        public string ImagePath { get; set; } = string.Empty;
        
        
        //change
        public List<WorkoutDayCreateDto> WorkoutDays { get; set; } = new();
    }
}
