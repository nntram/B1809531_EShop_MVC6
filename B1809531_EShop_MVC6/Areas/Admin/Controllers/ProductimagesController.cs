using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using B1809531_EShop_MVC6.Data;
using B1809531_EShop_MVC6.Entities;
using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AutoMapper;
using B1809531_EShop_MVC6.Services.Interfaces;
using B1809531_EShop_MVC6.Models;
using B1809531_EShop_MVC6.Helpers;
using System.Drawing.Drawing2D;

namespace B1809531_EShop_MVC6.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductimagesController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IFileManagerServies _fileManagerService;
        public readonly INotyfService _notifyService;

        public ProductimagesController(IUnitOfWork unitOfWork, IMapper mapper, IFileManagerServies fileManagerService, INotyfService notifyService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _fileManagerService = fileManagerService;
            _notifyService = notifyService;
        }


        // GET: Admin/Productimages
        public async Task<IActionResult> Index(string id)
        {
            var images = (await _unitOfWork.GetRepository<Productimage>().GetPagedListAsync(
                    predicate: source => source.Productid == id,
                    pageSize: int.MaxValue)).Items;
            if (images == null)
            {
                return NotFound();
            }
            var product = await _unitOfWork.GetRepository<Product>().FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewBag.Product = _mapper.Map<ProductModel>(product);
            return View(_mapper.Map<IEnumerable<ProductImageModel>>(images));
        }
    
        // GET: Admin/Productimages/Create
        public async Task<IActionResult> Create(string id)
        {
            var product = await _unitOfWork.GetRepository<Product>().FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewBag.Product = _mapper.Map<ProductModel>(product);
            return View();
        }
    
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([FromForm] ProductImageCreateModel productimage)
        {
            var product = await _unitOfWork.GetRepository<Product>().FindAsync(productimage.Productid);
            if (product == null)
            {
                return NotFound();
            }

            if (productimage.ProductImageFile != null)
            {
                var checkImageFile = true;
                foreach (var imgFile in productimage.ProductImageFile)
                {
                    if (!FileValid.IsImageValid(imgFile))
                    {
                        checkImageFile = false;
                        break;
                    }
                }

                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(productimage);
                }

                foreach (var imgFile in productimage.ProductImageFile)
                {
                    if (imgFile?.Length > 0)
                    {
                        var productImage = new Productimage();
                        productImage.Productid = product.Productid;
                        var upLoadImage = await _fileManagerService.UploadSingleImage(imgFile, GetPath.ProductImage);
                        if (upLoadImage.Length > 0)
                        {
                            productImage.Productimageurl = upLoadImage;
                            _unitOfWork.GetRepository<Productimage>().Insert(productImage);
                            await _unitOfWork.SaveChangesAsync();
                        }
                        else
                        {
                            _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                        }
                    }
                }
                _notifyService.Success("Thêm thành công.");
                return RedirectToAction("Index", "Productimages", new {id = productimage.Productid});

            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            ViewBag.Product = _mapper.Map<ProductModel>(product);
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> DeleteAjax(string id)
        {
            var image = (await _unitOfWork.GetRepository<Productimage>().FindAsync(id));

            if (image == null)
            {
                return NotFound();
            }

            var image_Product_Count = _unitOfWork.GetRepository<Productimage>().Count(
                            predicate: source => source.Productid == image.Productid);

            if (image_Product_Count < 2)
            {
                //Do nothing
            }
            else
            {
                _unitOfWork.GetRepository<Productimage>().Delete(image);
                await _unitOfWork.SaveChangesAsync();
                _fileManagerService.DeleteSingleImage(GetPath.ProductImage + image.Productimageurl);
            }

            var images = (await _unitOfWork.GetRepository<Productimage>().GetPagedListAsync(
                   predicate: source => source.Productid == image.Productid,
                   pageSize: int.MaxValue)).Items;
            return PartialView("_imgListPartial", _mapper.Map<IEnumerable<ProductImageModel>>(images));
        }
    }
}
