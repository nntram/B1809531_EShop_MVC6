using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Invoiceitem
    {
        public string Productid { get; set; } = null!;
        public string Invoiceid { get; set; } = null!;
        public string? Invoiceitemid { get; set; }
        public int? Invoiceitemprice { get; set; }
        public int? Invoiceitemquantity { get; set; }

        public virtual Invoice Invoice { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
