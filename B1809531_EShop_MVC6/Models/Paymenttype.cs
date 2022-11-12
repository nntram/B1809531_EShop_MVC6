using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Paymenttype
    {
        public Paymenttype()
        {
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
            Paymentdata = new HashSet<Paymentdatum>();
        }

        public string Paymenttypeid { get; set; } = null!;
        public string? Paymenttypename { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Paymentdatum> Paymentdata { get; set; }
    }
}
