using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("ORDERITEM")]
    [Index("Orderid", Name = "ORDERITEM2_FK")]
    [Index("Productid", Name = "ORDERITEM_FK")]
    public partial class Orderitem
    {
        [Key]
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Key]
        [Column("ORDERID")]
        [StringLength(64)]
        public string Orderid { get; set; } = null!;
        [Column("ORDERITEMLD")]
        [StringLength(64)]
        public string? Orderitemld { get; set; }
        [Column("ORDERITEMPRICE")]
        public int? Orderitemprice { get; set; }
        [Column("ORDERITEMQUANTITY")]
        public int? Orderitemquantity { get; set; }

        [ForeignKey("Orderid")]
        [InverseProperty("Orderitems")]
        public virtual Order Order { get; set; } = null!;
        [ForeignKey("Productid")]
        [InverseProperty("Orderitems")]
        public virtual Product Product { get; set; } = null!;
    }
}
