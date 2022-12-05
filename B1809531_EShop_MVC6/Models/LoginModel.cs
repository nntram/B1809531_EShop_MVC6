using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
	public class LoginModel
	{
		[Required]
		public string username { get; set; }
		[Required]
		[DataType(DataType.Password)]
		public string password { get; set; }
		public bool remember { get; set; } = false;
	}
}
