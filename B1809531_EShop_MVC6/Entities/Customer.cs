using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("CUSTOMER")]
    [Index(nameof(Cartid), Name = "CUSTOMER_CART2_FK")]
    [Index(nameof(Wardid), Name = "CUSTOMER_WARD_FK")]
    public partial class Customer
    {
        public Customer()
        {
            Blogcomments = new HashSet<Blogcomment>();
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
            Reviews = new HashSet<Review>();
        }

        [Key]
        [Column("CUSTOMERID")]
        [StringLength(64)]
        public string Customerid { get; set; } = null!;
        [Column("WARDID")]
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [Column("CARTID")]
        [StringLength(64)]
        public string Cartid { get; set; } = null!;
        [Column("CUSTOMERNAME")]
        [StringLength(256)]
        public string? Customername { get; set; }
        [Column("CUSTOMERGENDER")]
        public int? Customergender { get; set; }
        [Column("CUSTIOMERCREATEDDATE")]
        public long? Custiomercreateddate { get; set; }
        [Column("CUSTOMERPHONENUMBER")]
        [StringLength(16)]
        public string? Customerphonenumber { get; set; }
        [Column("CUSTOMERADDRESS")]
        [StringLength(256)]
        public string? Customeraddress { get; set; }
        [Column("CUSTOMERWARD")]
        public int? Customerward { get; set; }

        [ForeignKey(nameof(Cartid))]
        [InverseProperty("Customers")]
        public virtual Cart Cart { get; set; } = null!;
        [ForeignKey(nameof(Wardid))]
        [InverseProperty("Customers")]
        public virtual Ward Ward { get; set; } = null!;
        [InverseProperty(nameof(Blogcomment.Customer))]
        public virtual ICollection<Blogcomment> Blogcomments { get; set; }
        [InverseProperty(nameof(Invoice.Customer))]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [InverseProperty(nameof(Order.Customer))]
        public virtual ICollection<Order> Orders { get; set; }
        [InverseProperty(nameof(Review.Customer))]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
