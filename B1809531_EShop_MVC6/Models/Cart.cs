using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Cart
    {
        public Cart()
        {
            Cartitems = new HashSet<Cartitem>();
            Customers = new HashSet<Customer>();
        }

        public string Cartid { get; set; } = null!;

        public virtual ICollection<Cartitem> Cartitems { get; set; }
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
