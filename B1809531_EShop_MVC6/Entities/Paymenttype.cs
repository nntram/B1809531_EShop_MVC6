using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PAYMENTTYPE")]
    public partial class Paymenttype
    {
        public Paymenttype()
        {
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
            Paymentdata = new HashSet<Paymentdatum>();
        }

        [Key]
        [Column("PAYMENTTYPEID")]
        [StringLength(64)]
        public string Paymenttypeid { get; set; } = null!;
        [Column("PAYMENTTYPENAME")]
        [StringLength(256)]
        public string? Paymenttypename { get; set; }

        [InverseProperty(nameof(Invoice.Paymenttype))]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [InverseProperty(nameof(Order.Paymenttype))]
        public virtual ICollection<Order> Orders { get; set; }
        [InverseProperty(nameof(Paymentdatum.Paymenttype))]
        public virtual ICollection<Paymentdatum> Paymentdata { get; set; }
    }
}
