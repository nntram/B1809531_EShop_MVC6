using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PAYMENTDETAILS")]
    [Index(nameof(Paymentdataid), Name = "PAYMENTDETAILS2_FK")]
    [Index(nameof(Orderid), Name = "PAYMENTDETAILS_FK")]
    public partial class Paymentdetail
    {
        [Key]
        [Column("ORDERID")]
        [StringLength(64)]
        public string Orderid { get; set; } = null!;
        [Key]
        [Column("PAYMENTDATAID")]
        [StringLength(64)]
        public string Paymentdataid { get; set; } = null!;
        [Column("PAYMENTDETAILSID")]
        [StringLength(64)]
        public string? Paymentdetailsid { get; set; }
        [Column("PAYMENTDETAILSVALUE")]
        [StringLength(256)]
        public string? Paymentdetailsvalue { get; set; }

        [ForeignKey(nameof(Orderid))]
        [InverseProperty("Paymentdetails")]
        public virtual Order Order { get; set; } = null!;
        [ForeignKey(nameof(Paymentdataid))]
        [InverseProperty(nameof(Paymentdatum.Paymentdetails))]
        public virtual Paymentdatum Paymentdata { get; set; } = null!;
    }
}
