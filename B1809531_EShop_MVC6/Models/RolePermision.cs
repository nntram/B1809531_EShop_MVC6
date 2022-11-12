using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class RolePermision
    {
        public string Roleid { get; set; } = null!;
        public string Permisionid { get; set; } = null!;
        public string? Rolepermisionid { get; set; }

        public virtual Permision Permision { get; set; } = null!;
        public virtual Role Role { get; set; } = null!;
    }
}
