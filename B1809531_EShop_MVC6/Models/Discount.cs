using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Discount
    {
        public string Discountid { get; set; } = null!;
        public string Productid { get; set; } = null!;
        public long? Discountstartdate { get; set; }
        public long? Discountenddate { get; set; }
        public int? Discountvalue { get; set; }
        public string? Discountunit { get; set; }
        public string? Discountdescription { get; set; }
        public long? Discountcreateddate { get; set; }
        public bool? Discountinactive { get; set; }

        public virtual Product Product { get; set; } = null!;
    }
}
