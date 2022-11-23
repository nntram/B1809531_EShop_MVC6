using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("INVOICE")]
    [Index(nameof(Customerid), Name = "CUSTOMER_INVOICE_FK")]
    [Index(nameof(Staffid), Name = "INVOICE_STAFF_FK")]
    [Index(nameof(Wardid), Name = "INVOICE_WARD_FK")]
    [Index(nameof(Orderid), Name = "ORDER_INVOICE2_FK")]
    [Index(nameof(Paymenttypeid), Name = "PAYMENT_INVOICE_FK")]
    public partial class Invoice
    {
        public Invoice()
        {
            Invoiceitems = new HashSet<Invoiceitem>();
        }

        [Key]
        [Column("INVOICEID")]
        [StringLength(64)]
        public string Invoiceid { get; set; } = null!;
        [Column("WARDID")]
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [Column("CUSTOMERID")]
        [StringLength(64)]
        public string Customerid { get; set; } = null!;
        [Column("ORDERID")]
        [StringLength(64)]
        public string Orderid { get; set; } = null!;
        [Column("STAFFID")]
        [StringLength(64)]
        public string Staffid { get; set; } = null!;
        [Column("PAYMENTTYPEID")]
        [StringLength(64)]
        public string Paymenttypeid { get; set; } = null!;
        [Column("INVOICECREATEDDATE")]
        public long? Invoicecreateddate { get; set; }
        [Column("INVOICETRACKINGCODE")]
        [StringLength(128)]
        public string? Invoicetrackingcode { get; set; }
        [Column("INVOICEADRESS")]
        [StringLength(256)]
        public string? Invoiceadress { get; set; }
        [Column("INVOICESHIPCOST")]
        [StringLength(256)]
        public string? Invoiceshipcost { get; set; }
        [Column("INVOICEDISCOUNT")]
        public int? Invoicediscount { get; set; }

        [ForeignKey(nameof(Customerid))]
        [InverseProperty("Invoices")]
        public virtual Customer Customer { get; set; } = null!;
        [ForeignKey(nameof(Orderid))]
        [InverseProperty("Invoices")]
        public virtual Order Order { get; set; } = null!;
        [ForeignKey(nameof(Paymenttypeid))]
        [InverseProperty("Invoices")]
        public virtual Paymenttype Paymenttype { get; set; } = null!;
        [ForeignKey(nameof(Staffid))]
        [InverseProperty(nameof(staff.Invoices))]
        public virtual staff Staff { get; set; } = null!;
        [ForeignKey(nameof(Wardid))]
        [InverseProperty("Invoices")]
        public virtual Ward Ward { get; set; } = null!;
        [InverseProperty(nameof(Invoiceitem.Invoice))]
        public virtual ICollection<Invoiceitem> Invoiceitems { get; set; }
    }
}
