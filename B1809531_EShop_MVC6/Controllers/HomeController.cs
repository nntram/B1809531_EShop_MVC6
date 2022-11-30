using Arch.EntityFrameworkCore.UnitOfWork;
using AutoMapper;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.RazorPages;
using X.PagedList;
using Microsoft.AspNetCore.Mvc.Rendering;
using B1809531_EShop_MVC6.Helpers;

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
                                pageSize: Const.ProductFeaturePageSize)).Items;
            ViewBag.Products = _mapper.Map<IEnumerable<ProductModel>>(products);
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public async Task<IActionResult> GetProductList(ProductFilterModel filter, int page = 1)
        {
            var listPaged = await GetPaged(page, filter);

            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                        selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");

            return View(listPaged);
        }

        public async Task<IActionResult> GetOnePage(ProductFilterModel filter,int page = 1)
        {
            var listPaged = await GetPaged(page, filter);           
            return PartialView("_productListPartial", listPaged);
        }

        protected async Task<IEnumerable<ProductModel>> GetPaged(int? page, ProductFilterModel filter)
        {
            if (page.HasValue && page < 1)
                return null;
            
            IEnumerable<Product>  product = (await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                predicate: source => source.Productinacitve == true,
                include: source => source.Include(m => m.Productimages),
                orderBy: n => n.OrderByDescending(p => p.Productcreateddate),
                pageSize: int.MaxValue)).Items;            

            if (!String.IsNullOrEmpty(filter.brand))
            {
                product = product.Where(n =>
                        n.Brandid == filter.brand);
            }

            if (!String.IsNullOrEmpty(filter.category))
            {
                product = product.Where(n =>
                        n.Categoryid == filter.category);
            }

            if (filter.isGetHot == true)
            {
                product = product.Where(n =>
                        n.Productishot == true);
            }
            
            if(!String.IsNullOrEmpty(filter.orderBy))
            {
                switch(filter.orderBy)
                {
                    case "price_asc":
                        product = product.OrderBy(p => p.Productsaleprice);
                        break;
                    case "price_desc":
                        product = product.OrderByDescending(p => p.Productsaleprice);
                        break;
                }
            }

            var listUnpaged = _mapper.Map<IEnumerable<ProductModel>>(product);          
            var listPaged = listUnpaged.ToPagedList(page ?? 1, Const.ProductPageSize);

            if (listPaged.PageNumber != 1 && page.HasValue && page > listPaged.PageCount)
                return null;

            return listPaged;
        }

        public async Task<IActionResult> GetProductDetails(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Product>() == null)
            {
                return NotFound();
            }

            var product = await _unitOfWork.GetRepository<Product>()
                .GetFirstOrDefaultAsync(include: source => source
                .Include(m => m.Productimages)
                .Include(m => m.Brand)
                .Include(m => m.Category),
                predicate: m => m.Productid == id && m.Productinacitve == true);

            if (product == null)
            {
                return NotFound();
            }
            var relatedProduct =(await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                                  predicate: p => p.Productinacitve == true && 
                                                p.Categoryid == product.Categoryid &&
                                                p.Productishot == true,
                                  orderBy: p => p.OrderByDescending(
                                                q => q.Productcreateddate),
                                  include: p => p.Include(q => q.Productimages),
                                  pageSize: Const.RelatedProductPageSize)).Items as IEnumerable<Product>;
            
            ViewBag.RelatedProduct = _mapper.Map<IEnumerable<ProductModel>>(relatedProduct);
            return View(_mapper.Map<ProductModel>(product));

        }
    }
}