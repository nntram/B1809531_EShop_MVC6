using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("CATEGORYDISCOUNT")]
    [Index("Brandid", Name = "CATEGORYDISCOUNT_BRAND_FK")]
    [Index("Categoryid", Name = "CATEGORY_DISCOUNT_FK")]
    public partial class Categorydiscount
    {
        [Key]
        [Column("CATEGORYDISCOUNTID")]
        [StringLength(64)]
        public string Categorydiscountid { get; set; } = null!;
        [Column("CATEGORYID")]
        [StringLength(64)]
        public string Categoryid { get; set; } = null!;
        [Column("BRANDID")]
        [StringLength(64)]
        public string Brandid { get; set; } = null!;
        [Column("CATEGORYDISCOUNTSTARTDATE")]
        public long? Categorydiscountstartdate { get; set; }
        [Column("CATEGORYDISCOUNTENDDATE")]
        public long? Categorydiscountenddate { get; set; }
        [Column("CATEGORYDISCOUNTVALUE")]
        public int? Categorydiscountvalue { get; set; }
        [Column("CATEGORYDISCOUNTUNIT")]
        [StringLength(128)]
        public string? Categorydiscountunit { get; set; }
        [Column("CATEGORYDISCOUNTDESCRIPTION")]
        [StringLength(256)]
        public string? Categorydiscountdescription { get; set; }
        [Column("CATEGORYDISCOUNTCREATEDDATE")]
        public long? Categorydiscountcreateddate { get; set; }
        [Column("CATEGORYDISCOUNTINACTIVE")]
        public bool? Categorydiscountinactive { get; set; }

        [ForeignKey("Brandid")]
        [InverseProperty("Categorydiscounts")]
        public virtual Brand Brand { get; set; } = null!;
        [ForeignKey("Categoryid")]
        [InverseProperty("Categorydiscounts")]
        public virtual Category Category { get; set; } = null!;
    }
}
