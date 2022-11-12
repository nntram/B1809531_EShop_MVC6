using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Province
    {
        public Province()
        {
            Districts = new HashSet<District>();
        }

        public string Provinceid { get; set; } = null!;
        public string? Provincename { get; set; }

        public virtual ICollection<District> Districts { get; set; }
    }
}
