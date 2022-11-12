using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Cartitem
    {
        public string Productid { get; set; } = null!;
        public string Cartid { get; set; } = null!;
        public string? Cartitemid { get; set; }
        public int? Cartitemprice { get; set; }
        public int? Cartitemquantity { get; set; }

        public virtual Cart Cart { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
