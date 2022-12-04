using AspNetCoreHero.ToastNotification.Abstractions;
using AspNetCoreHero.ToastNotification.Notyf;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;
using System.Text;

namespace B1809531_EShop_MVC6.Controllers
{
    public class UserController : Controller
    {
		private readonly IConfiguration _config;
		public readonly INotyfService _notifyService;

		public UserController(IConfiguration config, INotyfService notifyService)
		{
			_config = config;
			_notifyService = notifyService;
		}
		public IActionResult Login()
		{
			return View();
		}

		[HttpPost] 
		public IActionResult Login(string username, string password)
        {
			if ((username != "secret") || (password != "secret"))
			{
				_notifyService.Error("Login failed.");
				return View((object)"Login Failed");
			}
				
			

			return RedirectToAction("Log");
		}
		[HttpGet]
		[Authorize]
		public string GetData()
		{
			return "Hello you can access it.";
		}
	
	}
}
