using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class staff
    {
        public staff()
        {
            Invoices = new HashSet<Invoice>();
            StaffRoles = new HashSet<StaffRole>();
        }

        public string Staffid { get; set; } = null!;
        public string? Warehousereceiptid { get; set; }
        public string? Staffname { get; set; }
        public int? Staffgender { get; set; }
        public string? Staffphonenumber { get; set; }
        public string? Staffemail { get; set; }
        public long? Staffcreareddate { get; set; }
        public string? Staffusername { get; set; }
        public string? Staffpassword { get; set; }
        public string? Staffidentification { get; set; }

        public virtual Warehousereceipt? Warehousereceipt { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<StaffRole> StaffRoles { get; set; }
    }
}
