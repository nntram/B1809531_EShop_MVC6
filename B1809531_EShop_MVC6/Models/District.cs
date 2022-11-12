using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class District
    {
        public District()
        {
            Wards = new HashSet<Ward>();
        }

        public string Districtid { get; set; } = null!;
        public string Provinceid { get; set; } = null!;
        public string? Districtname { get; set; }

        public virtual Province Province { get; set; } = null!;
        public virtual ICollection<Ward> Wards { get; set; }
    }
}
