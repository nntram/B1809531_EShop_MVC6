using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PAYMENTDATA")]
    [Index("Paymenttypeid", Name = "PAYMENTDATA_FK")]
    public partial class Paymentdatum
    {
        public Paymentdatum()
        {
            Paymentdetails = new HashSet<Paymentdetail>();
        }

        [Key]
        [Column("PAYMENTDATAID")]
        [StringLength(64)]
        public string Paymentdataid { get; set; } = null!;
        [Column("PAYMENTTYPEID")]
        [StringLength(64)]
        public string Paymenttypeid { get; set; } = null!;
        [Column("PAYMENTDATANAME")]
        [StringLength(256)]
        public string? Paymentdataname { get; set; }
        [Column("PAYMENTDATATYPE")]
        [StringLength(256)]
        public string? Paymentdatatype { get; set; }

        [ForeignKey("Paymenttypeid")]
        [InverseProperty("Paymentdata")]
        public virtual Paymenttype Paymenttype { get; set; } = null!;
        [InverseProperty("Paymentdata")]
        public virtual ICollection<Paymentdetail> Paymentdetails { get; set; }
    }
}
