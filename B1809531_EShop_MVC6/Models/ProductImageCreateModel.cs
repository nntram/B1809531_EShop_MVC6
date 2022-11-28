using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class ProductImageCreateModel
    {
        [StringLength(64)]
        public string? Productimageid { get; set; }
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        public string? Productimageurl { get; set; }
        public IFormFileCollection ProductImageFile { get; set; } = null!;
    }
}
