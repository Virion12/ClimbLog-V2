using Microsoft.EntityFrameworkCore;

namespace ClimbLogApi.Models.DB
{
    public class ApiDbContext : DbContext
    {
        public ApiDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }

    }
}
