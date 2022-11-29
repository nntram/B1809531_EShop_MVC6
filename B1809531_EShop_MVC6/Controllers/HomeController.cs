using Arch.EntityFrameworkCore.UnitOfWork;
using AutoMapper;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public HomeController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IActionResult> Index()
        {
            var categories = (await _unitOfWork.GetRepository<Category>()
                                .GetPagedListAsync(pageSize: int.MaxValue)).Items;
            ViewBag.Categories = _mapper.Map<IEnumerable<CategoryModel>>(categories);
            var brands = (await _unitOfWork.GetRepository<Brand>()
                                .GetPagedListAsync(pageSize: int.MaxValue)).Items;
            ViewBag.Brands = _mapper.Map<IEnumerable<BrandModel>>(brands);
            var products = (await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                                predicate: p => p.Productishot == true && p.Productinacitve == true,
                                include: source => source.Include(m => m.Productimages),
                                pageSize: int.MaxValue)).Items;
            ViewBag.Products = _mapper.Map<IEnumerable<ProductModel>>(products);
            return View();
        }

       

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}