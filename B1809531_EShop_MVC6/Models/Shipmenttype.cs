using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Shipmenttype
    {
        public Shipmenttype()
        {
            Orders = new HashSet<Order>();
        }

        public string Shipmenttypeid { get; set; } = null!;
        public string? Shipmenttypename { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
