using Arch.EntityFrameworkCore.UnitOfWork;
using B1809531_EShop_MVC6.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using B1809531_EShop_MVC6.Models;
using AutoMapper;

namespace B1809531_EShop_MVC6.Controllers.Components
{
    public class CartItemViewComponent : ViewComponent
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public CartItemViewComponent(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var userClaim = User.Identity as ClaimsIdentity;
            string cusomterId = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;
            var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                        predicate: p => p.Customerid == cusomterId,
                        include: p => p.Include(n => n.Cartdetails)
                                        .ThenInclude(m => m.Product)
                                        .ThenInclude(q => q.Productimages));

            var cartDetail = cart.Cartdetails;
            return View(_mapper.Map<IEnumerable<CartDetailModel>>(cartDetail));
        }
    }
}
