namespace ClimbLogApi.Models.DTO.benchmark
{
    public class CreateBenchmarkDto
    {
        public int UserID { get; set; }
        public double BodyWeight { get; set; }
        public int Ex1Points { get; set; }
        public int Ex2Points { get; set; }
        public int Ex3Points { get; set; }
        public int Ex4Points { get; set; }
    }
}
