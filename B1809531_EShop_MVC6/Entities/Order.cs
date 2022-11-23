using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("ORDER")]
    [Index(nameof(Customerid), Name = "CUSTOMNER_ORDER_FK")]
    [Index(nameof(Paymenttypeid), Name = "ORDER_PAYMENT_FK")]
    [Index(nameof(Shipmentstatusid), Name = "ORDER_SHIPMENTSTATUS_FK")]
    [Index(nameof(Shipmenttypeid), Name = "ORDER_SHIPMENTTYPE_FK")]
    [Index(nameof(Voucherid), Name = "ORDER_VOUCHER_FK")]
    [Index(nameof(Wardid), Name = "ORDER_WARD_FK")]
    public partial class Order
    {
        public Order()
        {
            Invoices = new HashSet<Invoice>();
            Orderitems = new HashSet<Orderitem>();
            Paymentdetails = new HashSet<Paymentdetail>();
        }

        [Key]
        [Column("ORDERID")]
        [StringLength(64)]
        public string Orderid { get; set; } = null!;
        [Column("SHIPMENTTYPEID")]
        [StringLength(64)]
        public string Shipmenttypeid { get; set; } = null!;
        [Column("SHIPMENTSTATUSID")]
        [StringLength(64)]
        public string Shipmentstatusid { get; set; } = null!;
        [Column("CUSTOMERID")]
        [StringLength(64)]
        public string Customerid { get; set; } = null!;
        [Column("WARDID")]
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [Column("VOUCHERID")]
        [StringLength(64)]
        public string Voucherid { get; set; } = null!;
        [Column("PAYMENTTYPEID")]
        [StringLength(64)]
        public string Paymenttypeid { get; set; } = null!;
        [Column("ORDERCREATEDDATE")]
        public long? Ordercreateddate { get; set; }
        [Column("ORDERTRACKINGCODE")]
        [StringLength(128)]
        public string? Ordertrackingcode { get; set; }
        [Column("ORDERADRESS")]
        [StringLength(256)]
        public string? Orderadress { get; set; }
        [Column("ORDERSHIPCOST")]
        public int? Ordershipcost { get; set; }

        [ForeignKey(nameof(Customerid))]
        [InverseProperty("Orders")]
        public virtual Customer Customer { get; set; } = null!;
        [ForeignKey(nameof(Paymenttypeid))]
        [InverseProperty("Orders")]
        public virtual Paymenttype Paymenttype { get; set; } = null!;
        [ForeignKey(nameof(Shipmentstatusid))]
        [InverseProperty("Orders")]
        public virtual Shipmentstatus Shipmentstatus { get; set; } = null!;
        [ForeignKey(nameof(Shipmenttypeid))]
        [InverseProperty("Orders")]
        public virtual Shipmenttype Shipmenttype { get; set; } = null!;
        [ForeignKey(nameof(Voucherid))]
        [InverseProperty("Orders")]
        public virtual Voucher Voucher { get; set; } = null!;
        [ForeignKey(nameof(Wardid))]
        [InverseProperty("Orders")]
        public virtual Ward Ward { get; set; } = null!;
        [InverseProperty(nameof(Invoice.Order))]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [InverseProperty(nameof(Orderitem.Order))]
        public virtual ICollection<Orderitem> Orderitems { get; set; }
        [InverseProperty(nameof(Paymentdetail.Order))]
        public virtual ICollection<Paymentdetail> Paymentdetails { get; set; }
    }
}
