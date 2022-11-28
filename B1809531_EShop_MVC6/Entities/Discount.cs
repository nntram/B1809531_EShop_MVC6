using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("DISCOUNT")]
    [Index("Productid", Name = "DISCOUNT_PRODUCT_FK")]
    public partial class Discount
    {
        [Key]
        [Column("DISCOUNTID")]
        [StringLength(64)]
        public string Discountid { get; set; } = null!;
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Column("DISCOUNTSTARTDATE")]
        public long? Discountstartdate { get; set; }
        [Column("DISCOUNTENDDATE")]
        public long? Discountenddate { get; set; }
        [Column("DISCOUNTVALUE")]
        public int? Discountvalue { get; set; }
        [Column("DISCOUNTUNIT")]
        [StringLength(128)]
        public string? Discountunit { get; set; }
        [Column("DISCOUNTDESCRIPTION")]
        [StringLength(256)]
        public string? Discountdescription { get; set; }
        [Column("DISCOUNTCREATEDDATE")]
        public long? Discountcreateddate { get; set; }
        [Column("DISCOUNTINACTIVE")]
        public bool? Discountinactive { get; set; }

        [ForeignKey("Productid")]
        [InverseProperty("Discounts")]
        public virtual Product Product { get; set; } = null!;
    }
}
