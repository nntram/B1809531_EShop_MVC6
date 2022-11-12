using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Voucher
    {
        public Voucher()
        {
            Orders = new HashSet<Order>();
        }

        public string Voucherid { get; set; } = null!;
        public long? Voucherstartdate { get; set; }
        public long? Voucherenddate { get; set; }
        public int? Vouchermaxdiscount { get; set; }
        public int? Voucherminordervalue { get; set; }
        public string? Voucherdescription { get; set; }
        public long? Vouchercreateddate { get; set; }
        public int? Voucheravailable { get; set; }
        public bool? Voucherinactive { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
