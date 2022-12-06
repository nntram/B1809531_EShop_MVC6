using Microsoft.AspNetCore.Mvc;

namespace B1809531_EShop_MVC6.Controllers
{
    public class CartAjaxController : Controller
    {
        public IActionResult HeaderCart()
        {
            return ViewComponent("HeaderCart");
        }
        public IActionResult CartItem()
        {
            return ViewComponent("CartItem");
        }

    }
}
