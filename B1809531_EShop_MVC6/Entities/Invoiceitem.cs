using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("INVOICEITEM")]
    [Index("Invoiceid", Name = "INVOICEITEM2_FK")]
    [Index("Productid", Name = "INVOICEITEM_FK")]
    public partial class Invoiceitem
    {
        [Key]
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Key]
        [Column("INVOICEID")]
        [StringLength(64)]
        public string Invoiceid { get; set; } = null!;
        [Column("INVOICEITEMID")]
        [StringLength(64)]
        public string? Invoiceitemid { get; set; }
        [Column("INVOICEITEMPRICE")]
        public int? Invoiceitemprice { get; set; }
        [Column("INVOICEITEMQUANTITY")]
        public int? Invoiceitemquantity { get; set; }

        [ForeignKey("Invoiceid")]
        [InverseProperty("Invoiceitems")]
        public virtual Invoice Invoice { get; set; } = null!;
        [ForeignKey("Productid")]
        [InverseProperty("Invoiceitems")]
        public virtual Product Product { get; set; } = null!;
    }
}
