using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class BrandModel
    {
        [StringLength(64)]
        public string? Brandid { get; set; }
        [Required]
        [StringLength(256)]
        public string? Brandname { get; set; }

        [StringLength(256)]
        public string? Brandimage { get; set; }
    }
}
