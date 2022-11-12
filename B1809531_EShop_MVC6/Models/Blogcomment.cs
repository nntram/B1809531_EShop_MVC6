using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Blogcomment
    {
        public string Blogcommentid { get; set; } = null!;
        public string Blogid { get; set; } = null!;
        public string Customerid { get; set; } = null!;
        public string? Blogcommentcontent { get; set; }

        public virtual Blog Blog { get; set; } = null!;
        public virtual Customer Customer { get; set; } = null!;
    }
}
