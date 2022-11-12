using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Order
    {
        public Order()
        {
            Invoices = new HashSet<Invoice>();
            Orderitems = new HashSet<Orderitem>();
            Paymentdetails = new HashSet<Paymentdetail>();
        }

        public string Orderid { get; set; } = null!;
        public string Shipmenttypeid { get; set; } = null!;
        public string Shipmentstatusid { get; set; } = null!;
        public string Customerid { get; set; } = null!;
        public string Wardid { get; set; } = null!;
        public string Voucherid { get; set; } = null!;
        public string Paymenttypeid { get; set; } = null!;
        public long? Ordercreateddate { get; set; }
        public string? Ordertrackingcode { get; set; }
        public string? Orderadress { get; set; }
        public int? Ordershipcost { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual Paymenttype Paymenttype { get; set; } = null!;
        public virtual Shipmentstatus Shipmentstatus { get; set; } = null!;
        public virtual Shipmenttype Shipmenttype { get; set; } = null!;
        public virtual Voucher Voucher { get; set; } = null!;
        public virtual Ward Ward { get; set; } = null!;
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<Orderitem> Orderitems { get; set; }
        public virtual ICollection<Paymentdetail> Paymentdetails { get; set; }
    }
}
