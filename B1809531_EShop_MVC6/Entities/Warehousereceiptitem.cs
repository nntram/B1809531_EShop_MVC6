using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("WAREHOUSERECEIPTITEM")]
    [Index("Warehousereceiptid", Name = "WAREHOUSERECEIPTITEM2_FK")]
    [Index("Productid", Name = "WAREHOUSERECEIPTITEM_FK")]
    public partial class Warehousereceiptitem
    {
        [Key]
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Key]
        [Column("WAREHOUSERECEIPTID")]
        [StringLength(64)]
        public string Warehousereceiptid { get; set; } = null!;
        [Column("WAREHOUSERECEIPTITEMID")]
        [StringLength(64)]
        public string? Warehousereceiptitemid { get; set; }
        [Column("WAREHOUSERECEIPTITEMQUANTITY")]
        public int? Warehousereceiptitemquantity { get; set; }
        [Column("WAREHOUSERECEIPTITEMPRICE")]
        public int? Warehousereceiptitemprice { get; set; }

        [ForeignKey("Productid")]
        [InverseProperty("Warehousereceiptitems")]
        public virtual Product Product { get; set; } = null!;
        [ForeignKey("Warehousereceiptid")]
        [InverseProperty("Warehousereceiptitems")]
        public virtual Warehousereceipt Warehousereceipt { get; set; } = null!;
    }
}
