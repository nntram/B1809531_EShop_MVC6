using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Ward
    {
        public Ward()
        {
            Customers = new HashSet<Customer>();
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
        }

        public string Wardid { get; set; } = null!;
        public string Districtid { get; set; } = null!;
        public string? Wardname { get; set; }

        public virtual District District { get; set; } = null!;
        public virtual ICollection<Customer> Customers { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
