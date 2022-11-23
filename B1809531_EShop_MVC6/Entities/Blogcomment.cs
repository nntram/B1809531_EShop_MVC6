using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("BLOGCOMMENT")]
    [Index(nameof(Blogid), Name = "BLOG_BLOGCOMMENT_FK")]
    [Index(nameof(Customerid), Name = "CUSTOMER_BLOGCOMMENT_FK")]
    public partial class Blogcomment
    {
        [Key]
        [Column("BLOGCOMMENTID")]
        [StringLength(64)]
        public string Blogcommentid { get; set; } = null!;
        [Column("BLOGID")]
        [StringLength(64)]
        public string Blogid { get; set; } = null!;
        [Column("CUSTOMERID")]
        [StringLength(64)]
        public string Customerid { get; set; } = null!;
        [Column("BLOGCOMMENTCONTENT")]
        [StringLength(512)]
        public string? Blogcommentcontent { get; set; }

        [ForeignKey(nameof(Blogid))]
        [InverseProperty("Blogcomments")]
        public virtual Blog Blog { get; set; } = null!;
        [ForeignKey(nameof(Customerid))]
        [InverseProperty("Blogcomments")]
        public virtual Customer Customer { get; set; } = null!;
    }
}
