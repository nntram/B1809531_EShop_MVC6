using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class CategoryModel
    {      
        [StringLength(64)]
        public string Categoryid { get; set; } = null!;
        [StringLength(256)]
        public string? Categoryname { get; set; }    
        public long? Categorycreateddate { get; set; }  
        [StringLength(256)]
        public string? Categoryimage { get; set; }
    }
}
