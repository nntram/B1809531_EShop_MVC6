using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Invoice
    {
        public Invoice()
        {
            Invoiceitems = new HashSet<Invoiceitem>();
        }

        public string Invoiceid { get; set; } = null!;
        public string Wardid { get; set; } = null!;
        public string Customerid { get; set; } = null!;
        public string Orderid { get; set; } = null!;
        public string Staffid { get; set; } = null!;
        public string Paymenttypeid { get; set; } = null!;
        public long? Invoicecreateddate { get; set; }
        public string? Invoicetrackingcode { get; set; }
        public string? Invoiceadress { get; set; }
        public string? Invoiceshipcost { get; set; }
        public int? Invoicediscount { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
        public virtual Paymenttype Paymenttype { get; set; } = null!;
        public virtual staff Staff { get; set; } = null!;
        public virtual Ward Ward { get; set; } = null!;
        public virtual ICollection<Invoiceitem> Invoiceitems { get; set; }
    }
}
