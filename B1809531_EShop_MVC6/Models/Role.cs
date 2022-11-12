using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Role
    {
        public Role()
        {
            RolePermisions = new HashSet<RolePermision>();
            StaffRoles = new HashSet<StaffRole>();
        }

        public string Roleid { get; set; } = null!;
        public string? Rolename { get; set; }

        public virtual ICollection<RolePermision> RolePermisions { get; set; }
        public virtual ICollection<StaffRole> StaffRoles { get; set; }
    }
}
