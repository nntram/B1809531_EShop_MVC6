using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("SHIPMENTSTATUS")]
    public partial class Shipmentstatus
    {
        public Shipmentstatus()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("SHIPMENTSTATUSID")]
        [StringLength(64)]
        public string Shipmentstatusid { get; set; } = null!;
        [Column("SHIPMENTSTATUSNAME")]
        [StringLength(256)]
        public string? Shipmentstatusname { get; set; }
        [Column("SHIPMENTSTATUSDESCRIPTION")]
        [StringLength(256)]
        public string? Shipmentstatusdescription { get; set; }

        [InverseProperty("Shipmentstatus")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
