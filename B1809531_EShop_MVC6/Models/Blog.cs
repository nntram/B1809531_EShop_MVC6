using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Blog
    {
        public Blog()
        {
            Blogcomments = new HashSet<Blogcomment>();
        }

        public string Blogid { get; set; } = null!;
        public string? Blogtitle { get; set; }
        public string? Blogcontent { get; set; }
        public long? Blogcreateddate { get; set; }

        public virtual ICollection<Blogcomment> Blogcomments { get; set; }
    }
}
