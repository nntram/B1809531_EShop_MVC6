using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Category
    {
        public Category()
        {
            Categorydiscounts = new HashSet<Categorydiscount>();
            Products = new HashSet<Product>();
        }

        public string Categoryid { get; set; } = null!;
        public string? Categoryname { get; set; }
        public long? Categorycreacteddate { get; set; }
        public string? Categoryimage { get; set; }

        public virtual ICollection<Categorydiscount> Categorydiscounts { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
