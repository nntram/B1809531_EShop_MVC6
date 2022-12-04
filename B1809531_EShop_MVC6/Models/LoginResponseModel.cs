using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
	public class LoginResponseModel
	{
		public string Customerid { get; set; } = null!;
		public string? Customername { get; set; }
		public long? Custiomercreateddate { get; set; }
		public string? Customerphonenumber { get; set; }
	
	}
}
