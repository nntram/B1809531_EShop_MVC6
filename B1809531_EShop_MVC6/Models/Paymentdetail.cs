using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Paymentdetail
    {
        public string Orderid { get; set; } = null!;
        public string Paymentdataid { get; set; } = null!;
        public string? Paymentdetailsid { get; set; }
        public string? Paymentdetailsvalue { get; set; }

        public virtual Order Order { get; set; } = null!;
        public virtual Paymentdatum Paymentdata { get; set; } = null!;
    }
}
