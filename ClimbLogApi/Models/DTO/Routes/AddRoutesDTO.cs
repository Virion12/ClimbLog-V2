using System.ComponentModel.DataAnnotations;

namespace ClimbLogApi.Models.DTO.Routes
{
    public class AddRoutesDTO
    {
        [Required]
        [MinLength(1, ErrorMessage = "At least one route must be provided.")]
        public required List<RouteDto> Routes { get; set; } =new List<RouteDto>();
    }
}
