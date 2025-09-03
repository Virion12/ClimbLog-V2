using Microsoft.EntityFrameworkCore;

namespace ClimbLogApi.Models.DB
{
    public class ApiDbContext : DbContext
    {
        public ApiDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<RefreshToken> RefreshTokens { get; set; }
        public DbSet<Route> Routes { get; set; }
    }
}
