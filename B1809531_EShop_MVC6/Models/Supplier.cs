using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            Warehousereceipts = new HashSet<Warehousereceipt>();
        }

        public string Supplierid { get; set; } = null!;
        public string? Suppliername { get; set; }
        public string? Supplieremail { get; set; }
        public string? Supplierphonenumber { get; set; }
        public string? Supplieraddress { get; set; }
        public long? Suppliercreacteddate { get; set; }

        public virtual ICollection<Warehousereceipt> Warehousereceipts { get; set; }
    }
}
