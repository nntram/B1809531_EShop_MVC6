using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class CategoryUpdateModel
    {
        [StringLength(64)]
        public string? Categoryid { get; set; }
        [StringLength(256)]
        public string? Categoryname { get; set; }
        public long? Categorycreateddate { get; set; }
        [StringLength(256)]
        public string? Categoryimage { get; set; }
        public IFormFile? CategoryImageFile { get; set; }
    }
}
