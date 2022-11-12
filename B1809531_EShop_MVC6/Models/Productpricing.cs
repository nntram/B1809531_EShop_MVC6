using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Productpricing
    {
        public string Productid { get; set; } = null!;
        public string? Productpricingid { get; set; }
        public int? Productpricingbase { get; set; }
        public long? Productpricingstartdate { get; set; }
        public long? Productpricingenddate { get; set; }
        public bool? Productpricinginactive { get; set; }
        public long? Productpricingcreateddate { get; set; }

        public virtual Product Product { get; set; } = null!;
    }
}
