using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class CartDetailModel
    {
        [StringLength(64)]
        public string Cartid { get; set; } = null!;
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        public int? Cartdetailquantity { get; set; }
        public int? Cartdetailprice { get; set; }

    }
}
