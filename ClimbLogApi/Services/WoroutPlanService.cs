using ClimbLogApi.Models;
using ClimbLogApi.Models.DB;
using ClimbLogApi.Models.DTO.Exercise;
using ClimbLogApi.Models.DTO.WokroutPlan;
using ClimbLogApi.Models.DTO.WorkoutDay;
using ClimbLogApi.Models.DTO.workoutSession;
using ClimbLogApi.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

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

        public async Task<WorkoutPlanDto> GetUserPlanByIdAsync(int id, int userId)
        {
            var plan = await _context.WorkoutPlans
                .Include(p => p.WorkoutDays)
                    .ThenInclude(d => d.Sessions)
                        .ThenInclude(s => s.Exercises)
                .FirstOrDefaultAsync(p => p.Id == id && p.UserId == userId);

            if (plan == null)
                return null;    

            return new WorkoutPlanDto
            {
                Id = plan.Id,
                Name = plan.Name,
                ImagePath = plan.ImagePath,
                IsPublic = plan.IsPublic,
                CreatedAt = plan.CreatedAt,
                LastUpdatedAt = plan.LastUpdatedAt,
                WorkoutDays = plan.WorkoutDays.Select(d => new WorkoutDayDto
                {
                    Id = d.Id,
                    WorkoutDayOfWeek = d.WorkoutDayOfWeek,
                    Sessions = d.Sessions.Select(s => new WorkoutSesssionDto
                    {
                        Id = s.Id,
                        Name = s.Name,
                        Location = s.Location,
                        Start = s.Start,
                        Exercises = s.Exercises.Select(e => new ExerciseDto
                        {
                            Id = e.Id,
                            Name = e.Name,
                            SetNumber = e.SetNumber,
                            RepNumber = e.RepNumber,
                            Time = e.Time,
                            BreakTime = e.BreakTime
                        }).ToList()
                    }).ToList()
                }).ToList()
            };
        }

        public Task<IEnumerable<WorkoutPlanDto>> GetUsersPlansAsync(int userId)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateWorkoutPlanAsync(WorkoutPlanDto dto, int userId)
        {

            var plan = await _context.WorkoutPlans
                            .Include(p => p.WorkoutDays)
                                .ThenInclude(d => d.Sessions)
                                    .ThenInclude(s => s.Exercises)
                            .FirstOrDefaultAsync(p => p.Id == dto.Id && p.UserId == userId);

            if (plan == null)
            {
                return false;
            }


            plan.ImagePath = dto.ImagePath;
            plan.Name = dto.Name;
            plan.IsPublic = dto.IsPublic;
            plan.LastUpdatedAt = DateTime.UtcNow;

            _context.WorkoutDays.RemoveRange(plan.WorkoutDays);

            if (dto.WorkoutDays != null && dto.WorkoutDays.Any())
            {
                foreach(var day in dto.WorkoutDays)
                {
                    var workoutday = new WorkoutDay 
                    { 
                        WorkoutDayOfWeek = day.WorkoutDayOfWeek,


                    };

                    if (day.Sessions != null && day.Sessions.Any()) 
                    { 
                       foreach (var sessionDto in day.Sessions)
                        {
                            var session = new WorkoutSession
                            {
                                Name = sessionDto.Name,
                                Location = sessionDto.Location,
                                Start = sessionDto.Start,
                            };
                            if(sessionDto.Exercises != null && sessionDto.Exercises.Any())
                            {
                                foreach(var exerciseDto  in sessionDto.Exercises)
                                {
                                    var exercise = new Exercise {
                                        Name = exerciseDto.Name,
                                        Time = exerciseDto.Time,
                                        BreakTime = exerciseDto.BreakTime,
                                        SetNumber = exerciseDto.SetNumber,
                                        RepNumber = exerciseDto.RepNumber,

                                    };

                                    session.Exercises.Add(exercise);
                                }
                            }
                            workoutday.Sessions.Add(session);
                        }
                    }



                    plan.WorkoutDays.Add(workoutday);
                }
            }

            await _context.SaveChangesAsync();

            return true;
        }
    }
}
