namespace ClimbLogApi.Models
{
    public class Route
    {
        public int Id { get; set; }
        public int UserID { get; set; }
        public bool IsPublic { get; set; } = false;
        public string Name { get; set; } = string.Empty;
        public string Color { get; set; } = string.Empty;
        public double Heigth { get; set; } = 0;
        public bool IsPowery { get; set; }
        public bool IsSloppy { get; set; }
        public bool IsDynamic { get; set; }
        public bool IsCrimpy { get; set; }
        public bool IsReachy { get; set; }
        public bool IsOnsighted { get; set; }
        public bool IsRedPointed { get; set; }
        public bool IsFlashed { get; set; }
        public bool IsFavorite { get; set; }
        public int NumberOfTried { get; set; }
        public bool IsDone { get; set; }
        public string Grade { get; set; } = "4a";
        public string ImagePath { get; set; } = string.Empty;
        public string thumbnailPath { get; set; } = string.Empty ;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime LastUpdatedAt { get; set; } = DateTime.UtcNow;
        public User User { get; set; }

    }
}
