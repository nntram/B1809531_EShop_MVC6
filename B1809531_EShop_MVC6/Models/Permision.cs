using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Permision
    {
        public Permision()
        {
            RolePermisions = new HashSet<RolePermision>();
        }

        public string Permisionid { get; set; } = null!;
        public string? Permisionname { get; set; }

        public virtual ICollection<RolePermision> RolePermisions { get; set; }
    }
}
