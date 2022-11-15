using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("BANNER")]
    public partial class Banner
    {
        [Key]
        [Column("BANNERID")]
        [StringLength(64)]
        public string Bannerid { get; set; } = null!;
        [Column("BANNERBUTTONTEXT")]
        [StringLength(32)]
        public string? Bannerbuttontext { get; set; }
        [Column("BANNERDESC")]
        [StringLength(256)]
        public string? Bannerdesc { get; set; }
        [Column("BANNERSMALLTEXT")]
        [StringLength(64)]
        public string? Bannersmalltext { get; set; }
        [Column("BANNERMIDTEXT")]
        [StringLength(64)]
        public string? Bannermidtext { get; set; }
        [Column("BANNERLARGETEXT1")]
        [StringLength(64)]
        public string? Bannerlargetext1 { get; set; }
        [Column("BANNERLARGELTEXT2")]
        [StringLength(64)]
        public string? Bannerlargeltext2 { get; set; }
        [Column("BANNERDISCOUNT")]
        [StringLength(64)]
        public string? Bannerdiscount { get; set; }
        [Column("BANNERSALETIME")]
        [StringLength(64)]
        public string? Bannersaletime { get; set; }
        [Column("BANNERIMG")]
        [StringLength(256)]
        public string? Bannerimg { get; set; }
        [Column("BANNERPRODUCTID")]
        [StringLength(64)]
        public string? Bannerproductid { get; set; }
        [Column("BANNERCREATEDDATE")]
        public long? Bannercreateddate { get; set; }
    }
}
