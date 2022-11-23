﻿using Microsoft.AspNetCore.Mvc;
using B1809531_EShop_MVC6.Entities;
using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AutoMapper;
using B1809531_EShop_MVC6.Models;
using B1809531_EShop_MVC6.Helpers;
using B1809531_EShop_MVC6.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using X.PagedList;

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

        public IActionResult AjaxIndex(int page = 1)
        {
            var listPaged = GetPagedNames(page);
            ViewBag.Names = listPaged;
            return View();
        }

        public IActionResult GetOnePageOfNames(int page = 1)
        {
            var listPaged = GetPagedNames(page);
            ViewBag.Names = listPaged;
            return PartialView("_NameListPartial", ViewBag.Names);
        }

        public IActionResult Error()
        {
            return View();
        }

        protected IPagedList<string> GetPagedNames(int? page)
        {
            // return a 404 if user browses to before the first page
            if (page.HasValue && page < 1)
                return null;

            // retrieve list from database/whereverand
            var listUnpaged = GetStuffFromDatabase();

            // page the list
            const int pageSize = 20;
            var listPaged = listUnpaged.ToPagedList(page ?? 1, pageSize);

            // return a 404 if user browses to pages beyond last page. special case first page if no items exist
            if (listPaged.PageNumber != 1 && page.HasValue && page > listPaged.PageCount)
                return null;

            return listPaged;
        }

        protected IEnumerable<string> GetStuffFromDatabase()
        {
            var sampleData = System.IO.File.ReadAllText("Names.txt");
            return sampleData.Split('\n');
        }

        // GET: Admin/Products
        public async Task<IActionResult> Index(ProductFilterModel filterModel)
        {
            var pageNumber = filterModel.page ?? 1;
            var product = (await _unitOfWork.GetRepository<Product>().GetPagedListAsync(
                    predicate: source => source.Productinacitve == true,
                    include: source => source.Include(m => m.Productimages),
                    orderBy: n => n.OrderByDescending(p => p.Productcreateddate))).Items;

            //if (!String.IsNullOrEmpty(filterModel.search))
            //{
            //    product = product.Where(n =>
            //            n.Productname.ToLower().Contains(filterModel.search.ToLower()));
            //}

            //if (!String.IsNullOrEmpty(filterModel.brand))
            //{
            //    product = product.Where(n =>
            //            n.Brandid == filterModel.brand);
            //}

            //if (!String.IsNullOrEmpty(filterModel.category))
            //{
            //    product = product.Where(n =>
            //            n.Categoryid == filterModel.category);
            //}

            var productModel = _mapper.Map<IEnumerable<ProductModel>>(product);
            //PagedList<ProductModel> model = new PagedList<ProductModel>(productModel.AsQueryable(), pageNumber, Const.PageSize);

            var brands = (await _unitOfWork.GetRepository<Brand>().GetPagedListAsync(selector: s => new { s.Brandid, s.Brandname })).Items;
            ViewBag.Brands = new SelectList(brands, "Brandid", "Brandname");

            var catergories = (await _unitOfWork.GetRepository<Category>().GetPagedListAsync(selector: s => new { s.Categoryid, s.Categoryname })).Items;
            ViewBag.Categories = new SelectList(catergories, "Categoryid", "Categoryname");
            return View(productModel);
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
        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([FromForm] ProductCreateModel productCreateModel)
        {
            //if (productCreateModel.ProductImageFile != null )
            //{
            //    var checkImageFile = FileValid.IsImageValid(productCreateModel.ProductImageFile);
            //    if (!checkImageFile)
            //    {
            //        _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
            //        return View(productCreateModel);
            //    }

            //}

            var product = _mapper.Map<Product>(productCreateModel);

            if (ModelState.IsValid)
            {
                if (ProductNameExists(productCreateModel.Productname))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(productCreateModel);
                }

                //if (productCreateModel.ProductImageFile?.Length > 0)
                //{
                //    var upLoadImage = await _fileManagerService.UploadSingleImage(productCreateModel.ProductImageFile, GetPath.ProductImage);
                //    if (upLoadImage.Length > 0)
                //    {
                //        product.Productimage = upLoadImage;
                //    }
                //    else
                //    {
                //        _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                //    }    
                //}

                _unitOfWork.GetRepository<Product>().Insert(product);
                await _unitOfWork.SaveChangesAsync();

                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));
            }

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

            return View(_mapper.Map<ProductCreateModel>(product));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([FromForm] ProductCreateModel productCreateModel)
        {
            if (!(productCreateModel.Productid is not null && ProductExists(productCreateModel.Productid)))
            {
                return NotFound();
            }

            //if (productCreateModel.ProductImageFile != null)
            //{
            //    var checkImageFile = FileValid.IsImageValid(productCreateModel.ProductImageFile);
            //    if (!checkImageFile)
            //    {
            //        _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
            //        return View(productCreateModel);
            //    }

            //    productCreateModel.Productimage = productCreateModel.ProductImageFile.FileName;
            //}

            if (ModelState.IsValid)
            {
                if (ProductNameExists(productCreateModel.Productname, productCreateModel.Productid))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(productCreateModel);
                }

                var product = await _unitOfWork.GetRepository<Product>().FindAsync(productCreateModel.Productid);
                if (product == null)
                {
                    return NotFound();
                }

                //var productImage = product.Productimage;
                _mapper.Map(productCreateModel, product);
                try
                {
                    //if (productCreateModel.ProductImageFile?.Length > 0)
                    //{
                    //    var upLoadImage = await _fileManagerService.UploadSingleImage(productCreateModel.ProductImageFile, GetPath.ProductImage);
                    //    if (upLoadImage.Length > 0)
                    //    {
                    //        product.Productimage = upLoadImage;
                    //        if(productImage != null && productImage != "")
                    //        {
                    //            _fileManagerService.DeleteSingleImage(GetPath.ProductImage + productImage);
                    //        }
                    //    }
                    //    else
                    //    {
                    //        _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                    //    }
                    //}

                    _unitOfWork.GetRepository<Product>().Update(product);
                    await _unitOfWork.SaveChangesAsync();

                    _notifyService.Success("Chỉnh sửa thành công.");
                    return RedirectToAction(nameof(Index));
                }
                catch (Exception)
                {
                    _notifyService.Error("Đã xảy ra lỗi.");
                    return RedirectToAction(nameof(Index));
                }

            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(productCreateModel);
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
