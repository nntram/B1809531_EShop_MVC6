﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("ORDERSTATUS")]
    public partial class Orderstatus
    {
        public Orderstatus()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("ORDERSTATUSID")]
        public int Orderstatusid { get; set; }
        [Column("ORDERSTATUSNAME")]
        [StringLength(256)]
        public string? Orderstatusname { get; set; }

        [InverseProperty("Orderstatus")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
