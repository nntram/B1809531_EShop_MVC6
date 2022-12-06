using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AutoMapper;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace B1809531_EShop_MVC6.Controllers
{
	[Authorize(Roles = "Customer")]
	public class ShoppingController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;
        private readonly INotyfService _notifyService;
        private readonly IMapper _mapper;
         
        public ShoppingController(IUnitOfWork unitOfWork, INotyfService notifyService, IMapper mapper)
		{
			_unitOfWork = unitOfWork;
			_notifyService = notifyService;
			_mapper = mapper;
		}

		private async Task<Cart?> GetCustomerCart(string cusomterId)
		{
            var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == cusomterId,
                        include: p => p.Include(n => n.Cartdetails));
            return cart;
        }
		public async Task<IActionResult> GetCart()
		{         
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> AddToCart(string productId, int quantity)
		{
            var userClaim = User.Identity as ClaimsIdentity;
            string cusomterId = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;

            var cart = await GetCustomerCart(cusomterId);
            var product = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(
							predicate: p => (p.Productid == productId && p.Productinacitve == true));
			if(product == null || cart == null || quantity < 1 || 
				(product != null && quantity > product.Productquantity) )
			{
				return NoContent();
			}

			var cartDetail = cart.Cartdetails;

			//check product in cart
			var isInCart = cartDetail.FirstOrDefault(n => n.Productid == productId);
			if (isInCart != null)
			{
				if(quantity + isInCart.Cartdetailquantity > product.Productquantity)
				{
                    return NoContent();
                }
				isInCart.Cartdetailquantity += quantity;
				_unitOfWork.GetRepository<Cartdetail>().Update(isInCart);				
			}
			else
			{
				Cartdetail item = new Cartdetail();
				item.Productid = productId;	
				item.Cartdetailquantity = quantity;				
				item.Cartid = cart.Cartid;
				await _unitOfWork.GetRepository<Cartdetail>().InsertAsync(item);				
			}
			cart.Cartquantity += quantity;
			_unitOfWork.GetRepository<Cart>().Update(cart);
			await _unitOfWork.SaveChangesAsync();

            return Json(new { success = true });
        }
	}
}
