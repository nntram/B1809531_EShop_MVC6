using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PROVINCE")]
    [Index("Districtid", Name = "PROVINCE_DISTRICT_FK")]
    public partial class Province
    {
        public Province()
        {
            Wards = new HashSet<Ward>();
        }

        [Key]
        [Column("PROVINCEID")]
        [StringLength(64)]
        public string Provinceid { get; set; } = null!;
        [Column("DISTRICTID")]
        [StringLength(64)]
        public string Districtid { get; set; } = null!;
        [Column("PROVINCENAME")]
        [StringLength(128)]
        public string? Provincename { get; set; }

        [ForeignKey("Districtid")]
        [InverseProperty("Provinces")]
        public virtual District District { get; set; } = null!;
        [InverseProperty("Province")]
        public virtual ICollection<Ward> Wards { get; set; }
    }
}
