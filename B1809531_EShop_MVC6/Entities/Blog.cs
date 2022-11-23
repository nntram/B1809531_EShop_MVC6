using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("BLOG")]
    public partial class Blog
    {
        public Blog()
        {
            Blogcomments = new HashSet<Blogcomment>();
        }

        [Key]
        [Column("BLOGID")]
        [StringLength(64)]
        public string Blogid { get; set; } = null!;
        [Column("BLOGTITLE")]
        [StringLength(256)]
        public string? Blogtitle { get; set; }
        [Column("BLOGCONTENT")]
        [StringLength(1024)]
        public string? Blogcontent { get; set; }
        [Column("BLOGCREATEDDATE")]
        public long? Blogcreateddate { get; set; }

        [InverseProperty(nameof(Blogcomment.Blog))]
        public virtual ICollection<Blogcomment> Blogcomments { get; set; }
    }
}
