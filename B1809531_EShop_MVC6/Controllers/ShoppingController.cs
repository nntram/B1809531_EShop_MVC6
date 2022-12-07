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
            var customer = await _unitOfWork.GetRepository<Customer>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == cusomterId && p.Customerinactive== true);
            if(customer == null)
            {
                return null;
            }
            var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == cusomterId,
                        include: p => p.Include(n => n.Cartdetails));
            return cart;
        }
		public IActionResult GetCart()
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
                await _unitOfWork.SaveChangesAsync();
            }
			else
			{
				Cartdetail item = new Cartdetail();
				item.Productid = productId;	
				item.Cartdetailquantity = quantity;				
				item.Cartid = cart.Cartid;
				await _unitOfWork.GetRepository<Cartdetail>().InsertAsync(item);
                _unitOfWork.SaveChanges();
			}
			cart.Cartquantity += quantity;
			_unitOfWork.GetRepository<Cart>().Update(cart);
			await _unitOfWork.SaveChangesAsync();

            return Json(new { success = true });
        }

        public async Task<IActionResult> AddOne(string cartDetailtId)
		{
			var cartDetail = await _unitOfWork.GetRepository<Cartdetail>().FindAsync(cartDetailtId);

			if (cartDetail == null)
			{
				return NoContent() ;
			}

			var product = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(
					predicate: p => (p.Productinacitve == true && p.Productid == cartDetail.Productid));
			var cart = await _unitOfWork.GetRepository<Cart>().FindAsync(cartDetail.Cartid);

			if (product == null || cart == null)
			{
				return NoContent() ;
			}

			if(cartDetail.Cartdetailquantity + 1 > product.Productquantity)
			{
                return NoContent();
            }

			cartDetail.Cartdetailquantity++;
			_unitOfWork.GetRepository<Cartdetail>().Update(cartDetail);
            await _unitOfWork.SaveChangesAsync();

            cart.Cartquantity++;
			_unitOfWork.GetRepository<Cart>().Update(cart);
			await _unitOfWork.SaveChangesAsync();
            return Json(new { success = true });
        }

        public async Task<IActionResult> MinusOne(string cartDetailtId)
        {
            var cartDetail = await _unitOfWork.GetRepository<Cartdetail>().FindAsync(cartDetailtId);

            if (cartDetail == null)
            {
                return NoContent();
            }

            var product = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(
                    predicate: p => (p.Productinacitve == true && p.Productid == cartDetail.Productid));
            var cart = await _unitOfWork.GetRepository<Cart>().FindAsync(cartDetail.Cartid);

            if (product == null || cart == null || cartDetail.Cartdetailquantity < 2)
            {
                return NoContent();
            }
      
            cartDetail.Cartdetailquantity--;
            _unitOfWork.GetRepository<Cartdetail>().Update(cartDetail);
            await _unitOfWork.SaveChangesAsync();

            cart.Cartquantity--;
            _unitOfWork.GetRepository<Cart>().Update(cart);
            await _unitOfWork.SaveChangesAsync();
            return Json(new { success = true });
        }

        public async Task<IActionResult> Remove(string cartDetailtId)
        {
            var cartDetail = await _unitOfWork.GetRepository<Cartdetail>().FindAsync(cartDetailtId);

            if (cartDetail == null)
            {
                return NoContent();
            }

            var product = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(
                    predicate: p => (p.Productinacitve == true && p.Productid == cartDetail.Productid));
            var cart = await _unitOfWork.GetRepository<Cart>().FindAsync(cartDetail.Cartid);

            if (product == null || cart == null)
            {
                return NoContent();
            }

            var quantity = cartDetail.Cartdetailquantity;
            _unitOfWork.GetRepository<Cartdetail>().Delete(cartDetail);
            await _unitOfWork.SaveChangesAsync();

            cart.Cartquantity -= quantity;
            _unitOfWork.GetRepository<Cart>().Update(cart);
            await _unitOfWork.SaveChangesAsync();
            return Json(new { success = true });
        }
        [HttpGet]
        public async Task<IActionResult> Checkout()
        {
            var userClaim = User.Identity as ClaimsIdentity;
            string cusomterId = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;
            var customer = await _unitOfWork.GetRepository<Customer>().GetFirstOrDefaultAsync(
                       predicate: p => p.Customerid == cusomterId && p.Customerinactive == true);
            if (customer == null)
            {
                return NotFound();
            }
            var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == cusomterId,
                        include: p => p.Include(n => n.Cartdetails)
                                        .ThenInclude(m => m.Product)
                                        .ThenInclude(q => q.Productimages));

            if (cart == null)
            {
                return NotFound();
            }
            if(cart.Cartquantity < 1)
            {
                return RedirectToAction("GetCart");
            }

            var cartDetail = cart.Cartdetails;
            ViewBag.Infor = (customer.Customername, customer.Customerphonenumber, customer.Customeraddress);
            return View(_mapper.Map<IEnumerable<CartDetailModel>>(cartDetail));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Checkout(IEnumerable<CartDetailModel> model)
        {
            var name = Request.Form["customerName"].ToString();
            var phone = Request.Form["customerPhone"].ToString();
            var address = Request.Form["customerAddress"].ToString();

            var userClaim = User.Identity as ClaimsIdentity;
            string cusomterId = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;
            var cart = await GetCustomerCart(cusomterId);
            if (cart == null)
            {
                return NotFound();
            }

            var order = new Order();
            order.Customerid = cusomterId;
            order.Orderadress = address;
            order.Orderphonenumber = phone;
            order.Orderid = Guid.NewGuid().ToString();  
            await _unitOfWork.GetRepository<Order>().InsertAsync(order);
            _unitOfWork.SaveChanges();
            
            foreach (var item in cart.Cartdetails)
            {
                var product = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(
                    predicate: p => (p.Productinacitve == true && p.Productid == item.Productid));
                if(product == null)
                {
                    continue;
                }
                Orderdetail orderdetail= new Orderdetail();
                orderdetail.Orderid = order.Orderid;
                orderdetail.Productid = item.Productid;
                orderdetail.Orderdetailquantity = item.Cartdetailquantity;
                orderdetail.Orderdetailprice = product.Productprice;
                await _unitOfWork.GetRepository<Orderdetail>().InsertAsync(orderdetail);
                _unitOfWork.SaveChanges();

                var cartDetail = await _unitOfWork.GetRepository<Cartdetail>().FindAsync(item.Cartdetailid);
                _unitOfWork.GetRepository<Cartdetail>().Delete(cartDetail);
                await _unitOfWork.SaveChangesAsync();               
            }
            var updateCart = await GetCustomerCart(cusomterId);
            updateCart.Cartquantity = 0;
            _unitOfWork.GetRepository<Cart>().Update(updateCart);
            _unitOfWork.SaveChanges();

            _notifyService.Success("Đặt hàng thành công, cảm ơn bạn!");
            return RedirectToAction("Index", "Home");
        }

    }
}
