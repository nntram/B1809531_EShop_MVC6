using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Warehousereceiptitem
    {
        public string Productid { get; set; } = null!;
        public string Warehousereceiptid { get; set; } = null!;
        public string? Warehousereceiptitemid { get; set; }
        public int? Warehousereceiptitemquantity { get; set; }
        public int? Warehousereceiptitemprice { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual Warehousereceipt Warehousereceipt { get; set; } = null!;
    }
}
