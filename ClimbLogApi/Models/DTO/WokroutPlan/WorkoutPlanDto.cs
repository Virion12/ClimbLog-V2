using ClimbLogApi.Models.DTO.WorkoutDay;

namespace ClimbLogApi.Models.DTO.WokroutPlan
{
    public class WorkoutPlanDto 
    {
        public int Id { get; set; }
        public bool IsPublic { get; set; } = false;
        public string Name { get; set; } = string.Empty;
        public string ImagePath { get; set; } = string.Empty;
        public List<WorkoutDayDto> WorkoutDays { get; set; } = new();
        public DateTime CreatedAt { get; set; }
        public DateTime LastUpdatedAt { get; set;} 
    }
}
