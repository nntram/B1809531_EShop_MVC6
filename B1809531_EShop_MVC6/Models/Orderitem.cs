using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Orderitem
    {
        public string Productid { get; set; } = null!;
        public string Orderid { get; set; } = null!;
        public string? Orderitemld { get; set; }
        public int? Orderitemprice { get; set; }
        public int? Orderitemquantity { get; set; }

        public virtual Order Order { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
