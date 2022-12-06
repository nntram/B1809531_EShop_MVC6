using Arch.EntityFrameworkCore.UnitOfWork;
using B1809531_EShop_MVC6.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Controllers.Components
{
    public class HeaderCartViewComponent : ViewComponent
    {
        private readonly IUnitOfWork _unitOfWork;

        public HeaderCartViewComponent(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            int quantity = 0;
            bool isAuthenticated = false;
            if (User.Identity.IsAuthenticated)
            {
                isAuthenticated = true;
                var userClaim = User.Identity as ClaimsIdentity;
                string cusomterId = userClaim.FindFirst(ClaimTypes.NameIdentifier).Value;
                var cart = await _unitOfWork.GetRepository<Cart>().GetFirstOrDefaultAsync(
                            predicate: p => p.Customerid == cusomterId,
                            include: p => p.Include(n => n.Cartdetails));
                if (cart != null)
                {
                    quantity = cart.Cartquantity ?? 0;
                }
            }            
            return View((isAuthenticated, quantity));
        }
    }
}
