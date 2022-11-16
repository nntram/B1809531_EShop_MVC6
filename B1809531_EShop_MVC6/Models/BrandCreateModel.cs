using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class BrandCreateModel
    {
        [StringLength(64)]
        public string? Brandid { get; set; }
        [Required]
        [StringLength(256)]
        public string Brandname { get; set; }
        public long? Brandcreateddate { get; set; }

        [StringLength(256)]
        public string? Brandimage { get; set; }

        public IFormFile? BrandImageFile { get; set; }
    }
}
