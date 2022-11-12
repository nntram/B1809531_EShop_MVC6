using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Warehousereceipt
    {
        public Warehousereceipt()
        {
            Warehousereceiptitems = new HashSet<Warehousereceiptitem>();
            staff = new HashSet<staff>();
        }

        public string Warehousereceiptid { get; set; } = null!;
        public string Supplierid { get; set; } = null!;
        public long? Warehousereceiptcreateddate { get; set; }

        public virtual Supplier Supplier { get; set; } = null!;
        public virtual ICollection<Warehousereceiptitem> Warehousereceiptitems { get; set; }
        public virtual ICollection<staff> staff { get; set; }
    }
}
