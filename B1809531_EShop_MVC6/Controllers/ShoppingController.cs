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

		private async Task<Cart?> GetCustomerCart(string id)
		{
            var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == id,
                        include: p => p.Include(n => n.Cartdetails));
            return cart;
        }
		public async Task<IActionResult> GetCart()
		{
            var userClaim = User.Identity as ClaimsIdentity;
			string id = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;
			var cart = await GetCustomerCart(id);
            
			if(cart == null)
			{
				return NotFound();
			}
           
			return View(_mapper.Map<CartModel>(cart));
		}

		public async Task<IActionResult> AddToCart(string prodcutId, int quantity)
		{
            var userClaim = User.Identity as ClaimsIdentity;
            string id = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;

            var cart = await GetCustomerCart(id);
            var product = await _unitOfWork.GetRepository<Product>().FindAsync(prodcutId);
			if(product == null || cart == null || quantity < 0 || 
				(product != null && quantity > product.Productquantity) )
			{
				return NoContent();
			}

			var cartDetail = cart.Cartdetails;

			//check product in cart
			var isInCart = cartDetail.FirstOrDefault(n => n.Productid == id);
			if (isInCart != null)
			{
				isInCart.Cartdetailquantity += quantity;
				_unitOfWork.GetRepository<Cartdetail>().Update(isInCart);				
			}
			else
			{
				Cartdetail item = new Cartdetail();
				item.Productid = id;	
				item.Cartdetailquantity = quantity;
				item.Cartdetailprice = product.Productsaleprice;
				item.Cartid = cart.Cartid;
				await _unitOfWork.GetRepository<Cartdetail>().InsertAsync(item);				
			}
			cart.Cartquantity += quantity;
			_unitOfWork.GetRepository<Cart>().Update(cart);
			await _unitOfWork.SaveChangesAsync();
			return PartialView("_cartQuatity");
		}
	}
}
