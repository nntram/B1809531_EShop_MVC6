using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("ROLE")]
    public partial class Role
    {
        public Role()
        {
            RolePermisions = new HashSet<RolePermision>();
            StaffRoles = new HashSet<StaffRole>();
        }

        [Key]
        [Column("ROLEID")]
        [StringLength(64)]
        public string Roleid { get; set; } = null!;
        [Column("ROLENAME")]
        [StringLength(256)]
        public string? Rolename { get; set; }

        [InverseProperty(nameof(RolePermision.Role))]
        public virtual ICollection<RolePermision> RolePermisions { get; set; }
        [InverseProperty(nameof(StaffRole.Role))]
        public virtual ICollection<StaffRole> StaffRoles { get; set; }
    }
}
