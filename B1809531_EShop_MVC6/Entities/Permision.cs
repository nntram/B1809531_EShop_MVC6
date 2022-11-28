using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PERMISION")]
    public partial class Permision
    {
        public Permision()
        {
            RolePermisions = new HashSet<RolePermision>();
        }

        [Key]
        [Column("PERMISIONID")]
        [StringLength(64)]
        public string Permisionid { get; set; } = null!;
        [Column("PERMISIONNAME")]
        [StringLength(256)]
        public string? Permisionname { get; set; }

        [InverseProperty("Permision")]
        public virtual ICollection<RolePermision> RolePermisions { get; set; }
    }
}
