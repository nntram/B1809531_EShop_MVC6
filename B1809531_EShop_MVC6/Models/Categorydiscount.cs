using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Categorydiscount
    {
        public string Categorydiscountid { get; set; } = null!;
        public string Categoryid { get; set; } = null!;
        public string Brandid { get; set; } = null!;
        public long? Categorydiscountstartdate { get; set; }
        public long? Categorydiscountenddate { get; set; }
        public int? Categorydiscountvalue { get; set; }
        public string? Categorydiscountunit { get; set; }
        public string? Categorydiscountdescription { get; set; }
        public long? Categorydiscountcreateddate { get; set; }
        public bool? Categorydiscountinactive { get; set; }

        public virtual Brand Brand { get; set; } = null!;
        public virtual Category Category { get; set; } = null!;
    }
}
