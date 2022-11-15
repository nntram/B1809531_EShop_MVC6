using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("WARD")]
    [Index("Districtid", Name = "DISTRICT_WARD_FK")]
    public partial class Ward
    {
        public Ward()
        {
            Customers = new HashSet<Customer>();
            Invoices = new HashSet<Invoice>();
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("WARDID")]
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [Column("DISTRICTID")]
        [StringLength(64)]
        public string Districtid { get; set; } = null!;
        [Column("WARDNAME")]
        [StringLength(128)]
        public string? Wardname { get; set; }

        [ForeignKey("Districtid")]
        [InverseProperty("Wards")]
        public virtual District District { get; set; } = null!;
        [InverseProperty("Ward")]
        public virtual ICollection<Customer> Customers { get; set; }
        [InverseProperty("Ward")]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [InverseProperty("Ward")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
