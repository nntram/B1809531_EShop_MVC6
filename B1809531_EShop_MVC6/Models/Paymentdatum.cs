using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Paymentdatum
    {
        public Paymentdatum()
        {
            Paymentdetails = new HashSet<Paymentdetail>();
        }

        public string Paymentdataid { get; set; } = null!;
        public string Paymenttypeid { get; set; } = null!;
        public string? Paymentdataname { get; set; }
        public string? Paymentdatatype { get; set; }

        public virtual Paymenttype Paymenttype { get; set; } = null!;
        public virtual ICollection<Paymentdetail> Paymentdetails { get; set; }
    }
}
