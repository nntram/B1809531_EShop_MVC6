using System.ComponentModel.DataAnnotations;
using System.Configuration;

namespace B1809531_EShop_MVC6.Models
{
    public class ProductUpdateModel
    {

        [StringLength(64)]
        public string? Productid { get; set; }
        [StringLength(64)]
        public string Brandid { get; set; } = null!;
        [StringLength(64)]
        public string Categoryid { get; set; } = null!;
        [StringLength(256)]
        public string Productname { get; set; } = null!;
        public string Productdescribe { get; set; } = null!;
        [IntegerValidator(MinValue = 0)]
        public int Productprice { get; set; }
        [IntegerValidator(MinValue = 0)]
        public int Productquantity { get; set; }
        public bool Productinacitve { get; set; } = true;
        [IntegerValidator(MinValue = 0)]
        public int Productsaleprice { get; set; }
        public bool Productishot { get; set; } = false;
    }
}
