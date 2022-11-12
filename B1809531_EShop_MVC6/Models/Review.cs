using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Review
    {
        public string Reviewid { get; set; } = null!;
        public string Customerid { get; set; } = null!;
        public string Productid { get; set; } = null!;
        public long? Reviewcreateddate { get; set; }
        public string? Reviewcontent { get; set; }
        public int? Reviewrate { get; set; }
        public string? Reviewphoto1 { get; set; }
        public string? Reviewphoto2 { get; set; }
        public string? Reviewphoto3 { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
