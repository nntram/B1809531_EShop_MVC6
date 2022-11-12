using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class StaffRole
    {
        public string Staffid { get; set; } = null!;
        public string Roleid { get; set; } = null!;
        public string? Staffroleid { get; set; }

        public virtual Role Role { get; set; } = null!;
        public virtual staff Staff { get; set; } = null!;
    }
}
