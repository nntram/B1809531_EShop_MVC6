using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Brand
    {
        public Brand()
        {
            Categorydiscounts = new HashSet<Categorydiscount>();
            Products = new HashSet<Product>();
        }

        public string Brandid { get; set; } = null!;
        public string? Brandname { get; set; }
        public long? Brandcreateddate { get; set; }
        public string? Brandimage { get; set; }

        public virtual ICollection<Categorydiscount> Categorydiscounts { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
