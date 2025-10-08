using ClimbLogApi.Models;
using ClimbLogApi.Models.DB;
using ClimbLogApi.Models.DTO.WokroutPlan;
using ClimbLogApi.Services.Interfaces;

namespace ClimbLogApi.Services
{
    public class WorkoutPlanService : IWorkoutPlanService
    {
        private readonly ApiDbContext _context;

        public WorkoutPlanService(ApiDbContext context)
        {
            _context = context;
        }
        public async Task<int> CreatePlanAsync(CreateWorkPlanDto dto, int userId)
        {
            var plan = new WorkoutPlan
            {
                UserId = userId,
                Name = dto.Name,
                ImagePath = dto.ImagePath,
                IsPublic = dto.IsPublic,
                CreatedAt = DateTime.UtcNow,
                LastUpdatedAt = DateTime.UtcNow 
            };

            if (dto.WorkoutDays != null && dto.WorkoutDays.Any())
            {
                foreach (var dayDto in dto.WorkoutDays)
                {
                    var workoutDay = new WorkoutDay
                    {
                        WorkoutDayOfWeek = dayDto.WorkoutDayOfWeek
                    };

                    if (dayDto.Sessions != null && dayDto.Sessions.Any())
                    {
                        foreach (var sessionDto in dayDto.Sessions)
                        {
                            var session = new WorkoutSession
                            {
                                Location = sessionDto.Location,
                                Start = sessionDto.Start,
                                Name = sessionDto.Name
                            };

                            if (sessionDto.Exercises != null && sessionDto.Exercises.Any())
                            {
                                foreach (var exerciseDto in sessionDto.Exercises)
                                {
                                    var exercise = new Exercise
                                    {
                                        Name = exerciseDto.Name,
                                        Time = exerciseDto.Time,
                                        RepNumber = exerciseDto.RepNumber,
                                        SetNumber = exerciseDto.SetNumber,
                                        BreakTime = exerciseDto.BreakTime
                                    };
                                    session.Exercises.Add(exercise);
                                }
                            }

                            workoutDay.Sessions.Add(session);
                        }
                    } 

                    plan.WorkoutDays.Add(workoutDay);
                }
            }

            _context.WorkoutPlans.Add(plan);
            await _context.SaveChangesAsync();
            return plan.Id;
        }

        public Task<bool> DeletePlanAsync(int id, int userId)
        {
            throw new NotImplementedException();
        }

        public Task<WorkoutPlanDto> GetUserPlanByIdAsync(int id, int userId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<WorkoutPlanDto>> GetUsersPlansAsync(int userId)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdateWorkoutPlanAsync(WorkoutPlanDto dto, int userId)
        {
            throw new NotImplementedException();
        }
    }
}
