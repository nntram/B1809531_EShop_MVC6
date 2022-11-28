using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("REVIEW")]
    [Index("Customerid", Name = "CUSTOMER_REVIEW_FK")]
    [Index("Productid", Name = "PRODUCT_REVIEW_FK")]
    public partial class Review
    {
        [Key]
        [Column("REVIEWID")]
        [StringLength(64)]
        public string Reviewid { get; set; } = null!;
        [Column("CUSTOMERID")]
        [StringLength(64)]
        public string Customerid { get; set; } = null!;
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Column("REVIEWCREATEDDATE")]
        public long? Reviewcreateddate { get; set; }
        [Column("REVIEWCONTENT")]
        [StringLength(512)]
        public string? Reviewcontent { get; set; }
        [Column("REVIEWRATE")]
        public int? Reviewrate { get; set; }
        [Column("REVIEWPHOTO1")]
        [StringLength(512)]
        public string? Reviewphoto1 { get; set; }
        [Column("REVIEWPHOTO2")]
        [StringLength(512)]
        public string? Reviewphoto2 { get; set; }
        [Column("REVIEWPHOTO3")]
        [StringLength(512)]
        public string? Reviewphoto3 { get; set; }

        [ForeignKey("Customerid")]
        [InverseProperty("Reviews")]
        public virtual Customer Customer { get; set; } = null!;
        [ForeignKey("Productid")]
        [InverseProperty("Reviews")]
        public virtual Product Product { get; set; } = null!;
    }
}
