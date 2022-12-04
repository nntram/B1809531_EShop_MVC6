using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("DISTRICT")]
    public partial class District
    {
        public District()
        {
            Provinces = new HashSet<Province>();
        }

        [Key]
        [Column("DISTRICTID")]
        [StringLength(64)]
        public string Districtid { get; set; } = null!;
        [Column("DISTRICTNAME")]
        [StringLength(128)]
        public string? Districtname { get; set; }

        [InverseProperty("District")]
        public virtual ICollection<Province> Provinces { get; set; }
    }
}
