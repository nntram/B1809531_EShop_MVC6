using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("ROLE_PERMISION")]
    [Index("Permisionid", Name = "ROLE_PERMISION2_FK")]
    [Index("Roleid", Name = "ROLE_PERMISION_FK")]
    public partial class RolePermision
    {
        [Key]
        [Column("ROLEID")]
        [StringLength(64)]
        public string Roleid { get; set; } = null!;
        [Key]
        [Column("PERMISIONID")]
        [StringLength(64)]
        public string Permisionid { get; set; } = null!;
        [Column("ROLEPERMISIONID")]
        [StringLength(64)]
        public string? Rolepermisionid { get; set; }

        [ForeignKey("Permisionid")]
        [InverseProperty("RolePermisions")]
        public virtual Permision Permision { get; set; } = null!;
        [ForeignKey("Roleid")]
        [InverseProperty("RolePermisions")]
        public virtual Role Role { get; set; } = null!;
    }
}
