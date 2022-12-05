using Microsoft.AspNetCore.Mvc;
using B1809531_EShop_MVC6.Entities;
using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AutoMapper;
using B1809531_EShop_MVC6.Models;
using B1809531_EShop_MVC6.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using B1809531_EShop_MVC6.Helpers;

namespace B1809531_EShop_MVC6.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductsController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IFileManagerServies _fileManagerService;
        public readonly INotyfService _notifyService;

        public ProductsController(IUnitOfWork unitOfWork, IMapper mapper,
            IFileManagerServies fileManagerService,
            INotyfService notifyService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _fileManagerService = fileManagerService;
            _notifyService = notifyService;
        }

        public async Task<IActionResult> Index(ProductFilterModel filter)
        {
            var listPaged = await GetPaged(filter);           

            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                        selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");

            return View(listPaged);
        }

        public async Task<IActionResult> GetOnePage(ProductFilterModel filter)
        {
            var listPaged = await GetPaged(filter);
            return PartialView("_listPartial", listPaged);
        }

        protected async Task<IEnumerable<ProductModel>> GetPaged(ProductFilterModel filter)
        {          
            IEnumerable<Product> product;
            if (filter.isGetNotInActive == true )
            {
                product = (await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                     predicate: source => source.Productinacitve == false,
                     include: source => source.Include(m => m.Productimages),
                     pageSize: int.MaxValue)).Items;
            }
            else
            {
                product = (await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                    predicate: source => source.Productinacitve == true,
                    include: source => source.Include(m => m.Productimages),
                    orderBy: n => n.OrderByDescending(p => p.Productcreateddate),
                    pageSize: int.MaxValue)).Items;
            }

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

            if(filter.isGetHot == true)
            {
                product = product.Where(n =>
                        n.Productishot == true);
            }

            if (filter.isGetNotInActive == true)
            {
                product = product.Where(n =>
                        n.Productinacitve == false);
            }

            if (filter.isGetOutOfStock == true)
            {
                product = product.Where(n =>
                        n.Productquantity < 6);
            }

            var listUnpaged = _mapper.Map<IEnumerable<ProductModel>>(product);           

            return listUnpaged;
        }


        // GET: Admin/Products/Details/5
        public async Task<IActionResult> Details(string id)
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
                predicate: m => m.Productid == id);

            if (product == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<ProductModel>(product));
        }

        // GET: Admin/Products/Create
        public async Task<IActionResult> Create()
        {
            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                       selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([FromForm] ProductCreateModel productCreateModel)
        {
            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                       selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");

            if (productCreateModel.ProductImageFile != null)
            {               
                var checkImageFile =true; 
                foreach(var imgFile in productCreateModel.ProductImageFile)
                {
                    if (!FileValid.IsImageValid(imgFile))
                    {
                        checkImageFile= false;
                        break;
                    }
                }
                
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(productCreateModel);
                }

            }

            if (ModelState.IsValid)
            {
                if (ProductNameExists(productCreateModel.Productname))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(productCreateModel);
                }
                var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(productCreateModel.Brandid);
                var category = await _unitOfWork.GetRepository<Category>().FindAsync(productCreateModel.Categoryid);
                
                if (category == null || brand == null)
                {
                    return NotFound();
                }
                var product = _mapper.Map<Product>(productCreateModel);
                product.Productid = Guid.NewGuid().ToString();
                _unitOfWork.GetRepository<Product>().Insert(product);
                await _unitOfWork.SaveChangesAsync();

                if (productCreateModel.ProductImageFile != null)
                {
                    foreach (var imgFile in productCreateModel.ProductImageFile)
                    {
                        if (imgFile?.Length > 0)
                        {
                            var productImage = new Productimage(); 
                            productImage.Productid = product.Productid;     
                            var upLoadImage = await _fileManagerService.UploadSingleImage(imgFile, GetPath.ProductImage);
                            if (upLoadImage.Length > 0)
                            {
                                productImage.Productimageurl= upLoadImage;
                                _unitOfWork.GetRepository<Productimage>().Insert(productImage);
                                await _unitOfWork.SaveChangesAsync();
                            }
                            else
                            {
                                _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                            }
                        }
                    }
                }

                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));

            }

            //var errors = ModelState
            //       .Where(x => x.Value.Errors.Count > 0)
            //       .Select(x => new { x.Key, x.Value.Errors }).ToArray();
            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(productCreateModel);
        }

        // GET: Admin/Products/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Product>() == null)
            {
                return NotFound();
            }

            var product = await _unitOfWork.GetRepository<Product>()
                .FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                       selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");

            return View(_mapper.Map<ProductUpdateModel>(product));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([FromForm] ProductUpdateModel productUpdateModel)
        {                              
            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(
                       selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(
                        selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");

            if (ModelState.IsValid)
            {
                if (ProductNameExists(productUpdateModel.Productname, productUpdateModel.Productid))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(productUpdateModel);
                }
                var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(productUpdateModel.Brandid);
                var category = await _unitOfWork.GetRepository<Category>().FindAsync(productUpdateModel.Categoryid);
                var product = await _unitOfWork.GetRepository<Product>().FindAsync(productUpdateModel.Productid);
                if(product == null || category == null || brand == null)
                {
                    return NotFound();
                }
                _mapper.Map(productUpdateModel, product);
                
                _unitOfWork.GetRepository<Product>().Update(product);
                await _unitOfWork.SaveChangesAsync();

                _notifyService.Success("Chỉnh sửa thành công.");
                return RedirectToAction("Details", "Products", new { id = product.Productid });
            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(productUpdateModel);
        }

        // GET: Admin/Products/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Product>() == null)
            {
                return NotFound();
            }

            var product = await _unitOfWork.GetRepository<Product>()
                .FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<ProductModel>(product));
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_unitOfWork.GetRepository<Product>() == null)
            {
                return Problem("Entity set 'Products'  is null.");
            }
            var product = await _unitOfWork.GetRepository<Product>().FindAsync(id);
            if (product != null)
            {
                //kiem tra 

                _unitOfWork.GetRepository<Product>().Delete(product);

                //if(product.Productimage != null && product.Productimage != "")
                //{
                //    _fileManagerService.DeleteSingleImage(GetPath.ProductImage + product.Productimage);
                //}
            }
            _notifyService.Success("Xóa thành công");
            await _unitOfWork.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(string id)
        {
            var product = _unitOfWork.GetRepository<Product>().Find(id);
            return product != null;
        }

        private bool ProductNameExists(string name)
        {
            var product = _unitOfWork.GetRepository<Product>().GetFirstOrDefault(
                                predicate: n => n.Productname.ToLower() == name.ToLower());
            return product != null;
        }

        private bool ProductNameExists(string name, string id)
        {
            var product = _unitOfWork.GetRepository<Product>().GetFirstOrDefault(
                               predicate: n => (n.Productname.ToLower() == name.ToLower() && n.Productid != id));
            return product != null;
        }
    
    }
}
