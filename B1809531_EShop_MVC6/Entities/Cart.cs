using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("CART")]
    public partial class Cart
    {
        public Cart()
        {
            Cartitems = new HashSet<Cartitem>();
            Customers = new HashSet<Customer>();
        }

        [Key]
        [Column("CARTID")]
        [StringLength(64)]
        public string Cartid { get; set; } = null!;

        [InverseProperty(nameof(Cartitem.Cart))]
        public virtual ICollection<Cartitem> Cartitems { get; set; }
        [InverseProperty(nameof(Customer.Cart))]
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
