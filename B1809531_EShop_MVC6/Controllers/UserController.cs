using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AspNetCoreHero.ToastNotification.Notyf;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using BC = BCrypt.Net.BCrypt;
using System.Security.Claims;
using reCAPTCHA.AspNetCore.Attributes;
using AutoMapper;

namespace B1809531_EShop_MVC6.Controllers
{
	public class UserController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;
		public readonly INotyfService _notifyService;
		public readonly IMapper _mapper;
		public UserController(IUnitOfWork unitOfWork, INotyfService notifyService, IMapper mapper)
		{
			_unitOfWork = unitOfWork;
			_notifyService = notifyService;
			_mapper = mapper;
		}
		public IActionResult Login()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> Login([FromForm]LoginModel loginModel)
		{
			if (!ModelState.IsValid)
			{
				return View(loginModel);
			}
			var user = await _unitOfWork.GetRepository<Customer>().GetFirstOrDefaultAsync(
								predicate: u => u.Customerusername == loginModel.username);
			if (user != null && BC.Verify(loginModel.password, user.Customerpassword))
			{
				var getCart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
									predicate: prop => prop.Customerid == user.Customerid);
				var cartQuantity = getCart.Cartquantity;

                List<Claim> claims = new List<Claim>
					{
						new Claim(ClaimTypes.NameIdentifier, user.Customerid),
						new Claim(ClaimTypes.Name, user.Customername),
						new Claim(ClaimTypes.Role, "Customer"),
						new Claim("CartQuantity", cartQuantity.ToString()),
					};

				// create identity
				ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

				// create principal
				ClaimsPrincipal principal = new ClaimsPrincipal(identity);

				// sign-in
				await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
						principal: principal,
						properties: new AuthenticationProperties
						{ 
							AllowRefresh = true,
							IsPersistent = loginModel.remember, // for 'remember me' feature
						});
				return RedirectToAction(nameof(HomeController.Index), "Home");
			}
			else if (user != null && user.Customerinactive == false)
			{
				ModelState.AddModelError("", "Tài khoản đã bị vô hiệu.");
			}
			else
			{
				ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu.");
			}
			return View();
		}

		public async Task<IActionResult> Logout()
		{
			// Clear the existing external cookie
			await HttpContext.SignOutAsync(
				CookieAuthenticationDefaults.AuthenticationScheme);

			return RedirectToAction(nameof(HomeController.Index), "Home");
		}
		

		public IActionResult Forbidden()
		{
			return View();
		}
        
        public IActionResult Register()
        {
            return View();
        }
		[HttpPost]
		[ValidateAntiForgeryToken]
        [ValidateRecaptcha]
        public async Task<IActionResult> Register([FromForm] CustomerCreateModel model)
        {
			var checkModel = true;
			if(!ModelState.IsValid)
			{
                ModelState.AddModelError("", "Dữ liệu không hợp lệ.");
				checkModel = false;
			}

			var checkUserName = _unitOfWork.GetRepository<Customer>()
								.GetFirstOrDefault(predicate: p => p.Customerusername == model.Customerusername);
			if (checkUserName != null) {
                ModelState.AddModelError("Customerusername", "Tên đăng nhập đã tồn tại.");
				checkModel = false;
			}
            var checkEmail = await _unitOfWork.GetRepository<Customer>()
                                .GetFirstOrDefaultAsync(predicate: p => p.Customeremail == model.Customeremail);
            if (checkEmail != null)
            {
                ModelState.AddModelError("Customeremail", "Email đã được đăng ký.");
				checkModel = false;
			}
			if (model.Customerpassword != model.Customerpassword)
			{
				ModelState.AddModelError("Customeremail", "Mật khẩu không khớp.");
				checkModel = false;
			}
			if (!checkModel)
			{
				return View(model);
			}

			var checkWard = await _unitOfWork.GetRepository<Ward>()
								.GetFirstOrDefaultAsync(predicate: p => p.Wardid == model.Wardid);
			if (checkWard == null)
			{
				return NotFound();
            }

			var customer = _mapper.Map<Customer>(model);
			customer.Customerpassword = BC.HashPassword(model.Customerpassword);
			customer.Customerinactive = true;
			customer.Customerid = Guid.NewGuid().ToString();	

			var cart = new Cart();
			cart.Customerid = customer.Customerid;
			cart.Cartquantity = 0;

            _unitOfWork.GetRepository<Customer>().Insert(customer);
			_unitOfWork.GetRepository<Cart>().Insert(cart);
            await _unitOfWork.SaveChangesAsync();
			_notifyService.Success("Đăng ký thành công. Đăng nhập để tiếp tục.");
			return RedirectToAction("Login");
        }
    }
}
