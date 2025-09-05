namespace ClimbLogApi.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string PhotoUrl { get; set; } = string.Empty;
        public double Weigth { get; set; }
        public double Heigth { get; set; }
        public DateTime LastSync { get; set; }
        
    }
}
