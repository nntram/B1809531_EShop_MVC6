using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Keyless]
    [Table("PRODUCTPRICING")]
    [Index("Productid", Name = "PROCDUCT_PRICING_FK")]
    public partial class Productpricing
    {
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Column("PRODUCTPRICINGID")]
        [StringLength(64)]
        public string? Productpricingid { get; set; }
        [Column("PRODUCTPRICINGBASE")]
        public int? Productpricingbase { get; set; }
        [Column("PRODUCTPRICINGSTARTDATE")]
        public long? Productpricingstartdate { get; set; }
        [Column("PRODUCTPRICINGENDDATE")]
        public long? Productpricingenddate { get; set; }
        [Column("PRODUCTPRICINGINACTIVE")]
        public bool? Productpricinginactive { get; set; }
        [Column("PRODUCTPRICINGCREATEDDATE")]
        public long? Productpricingcreateddate { get; set; }

        [ForeignKey("Productid")]
        public virtual Product Product { get; set; } = null!;
    }
}
