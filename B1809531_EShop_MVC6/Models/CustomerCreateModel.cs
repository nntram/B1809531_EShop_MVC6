using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class CustomerCreateModel
    {
        [StringLength(64)]
        public string Wardid { get; set; } = null!;
        [StringLength(128)]
        public string? Customername { get; set; }
        public bool? Customergender { get; set; }
        [StringLength(16)]
        public string? Customerphonenumber { get; set; }
        [StringLength(256)]
        public string? Customeraddress { get; set; }
        [StringLength(128)]
        public string? Customeremail { get; set; }
        [StringLength(128)]
        public string? Customerusername { get; set; }
        [StringLength(256)]
        public string? Customerpassword { get; set; }
        [StringLength(256)]
        public string? CustomerpasswordConfirm { get; set; }

		[StringLength(64)]
		public string Districtid { get; set; } = null!;
		[StringLength(64)]
		public string Provinceid { get; set; } = null!;
	}
}
