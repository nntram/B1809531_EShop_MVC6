using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Blogcomments = new HashSet<Blogcomment>();
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
            Reviews = new HashSet<Review>();
        }

        public string Customerid { get; set; } = null!;
        public string Wardid { get; set; } = null!;
        public string Cartid { get; set; } = null!;
        public string? Customername { get; set; }
        public int? Customergender { get; set; }
        public long? Custiomercreateddate { get; set; }
        public string? Customerphonenumber { get; set; }
        public string? Customeraddress { get; set; }
        public int? Customerward { get; set; }

        public virtual Cart Cart { get; set; } = null!;
        public virtual Ward Ward { get; set; } = null!;
        public virtual ICollection<Blogcomment> Blogcomments { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
