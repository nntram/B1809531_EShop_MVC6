using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("WARD")]
    [Index("Provinceid", Name = "WARD_PROVINCE_FK")]
    public partial class Ward
    {
        public Ward()
        {
            Customers = new HashSet<Customer>();
            Suppliers = new HashSet<Supplier>();
        }

        [Key]
        [Column("WARDID")]
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [Column("PROVINCEID")]
        [StringLength(64)]
        public string Provinceid { get; set; } = null!;
        [Column("WARDNAME")]
        [StringLength(128)]
        public string? Wardname { get; set; }

        [ForeignKey("Provinceid")]
        [InverseProperty("Wards")]
        public virtual Province Province { get; set; } = null!;
        [InverseProperty("Ward")]
        public virtual ICollection<Customer> Customers { get; set; }
        [InverseProperty("Ward")]
        public virtual ICollection<Supplier> Suppliers { get; set; }
    }
}
