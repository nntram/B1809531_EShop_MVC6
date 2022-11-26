using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class ProductCreateModel
    {
        [StringLength(64)]
        public string? Productid { get; set; }
        [StringLength(64)]
        public string Brandid { get; set; } = null!;
        [StringLength(64)]
        public string Categoryid { get; set; } = null!;
        [StringLength(256)]
        public string? Productname { get; set; }
        public string? Productdescribe { get; set; }
        public int? Productprice { get; set; }
        public int? Productquantity { get; set; }
        public long? Productcreateddate { get; set; }
        public bool? Productinacitve { get; set; }
        public int? Productsaleprice { get; set; }
        public IFormFileCollection ProductImageFile { get; set; }
        public bool Productishot { get; set; } = false;
    }
}
