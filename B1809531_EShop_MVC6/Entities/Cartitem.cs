using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("CARTITEM")]
    [Index(nameof(Cartid), Name = "CARTITEM2_FK")]
    [Index(nameof(Productid), Name = "CARTITEM_FK")]
    public partial class Cartitem
    {
        [Key]
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Key]
        [Column("CARTID")]
        [StringLength(64)]
        public string Cartid { get; set; } = null!;
        [Column("CARTITEMID")]
        [StringLength(64)]
        public string? Cartitemid { get; set; }
        [Column("CARTITEMPRICE")]
        public int? Cartitemprice { get; set; }
        [Column("CARTITEMQUANTITY")]
        public int? Cartitemquantity { get; set; }

        [ForeignKey(nameof(Cartid))]
        [InverseProperty("Cartitems")]
        public virtual Cart Cart { get; set; } = null!;
        [ForeignKey(nameof(Productid))]
        [InverseProperty("Cartitems")]
        public virtual Product Product { get; set; } = null!;
    }
}
