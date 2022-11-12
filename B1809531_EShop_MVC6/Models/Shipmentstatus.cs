using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Shipmentstatus
    {
        public Shipmentstatus()
        {
            Orders = new HashSet<Order>();
        }

        public string Shipmentstatusid { get; set; } = null!;
        public string? Shipmentstatusname { get; set; }
        public string? Shipmentstatusdescription { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
