using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("SHIPMENTTYPE")]
    public partial class Shipmenttype
    {
        public Shipmenttype()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("SHIPMENTTYPEID")]
        [StringLength(64)]
        public string Shipmenttypeid { get; set; } = null!;
        [Column("SHIPMENTTYPENAME")]
        [StringLength(256)]
        public string? Shipmenttypename { get; set; }

        [InverseProperty("Shipmenttype")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
