using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using B1809531_EShop_MVC6.Entities;

namespace B1809531_EShop_MVC6.Models
{
    public class CartModel
    {
        [StringLength(64)]
        public string Cartid { get; set; } = null!;
        [StringLength(64)]
        public string? Customerid { get; set; }
        public int? Cartquantity { get; set; }
        public ICollection<CartDetailModel> Cartdetails { get; set; }
    }
}
