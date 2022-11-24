using Microsoft.AspNetCore.Mvc;
using B1809531_EShop_MVC6.Entities;
using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using AutoMapper;
using B1809531_EShop_MVC6.Models;
using B1809531_EShop_MVC6.Helpers;
using B1809531_EShop_MVC6.Services.Interfaces;

namespace B1809531_EShop_MVC6.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BrandsController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IFileManagerServies _fileManagerService;
        public readonly INotyfService _notifyService;

        public BrandsController(IUnitOfWork unitOfWork, IMapper mapper,
            IFileManagerServies fileManagerService,
            INotyfService notifyService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _fileManagerService = fileManagerService;
            _notifyService = notifyService;
        }

        // GET: Admin/Brands
        public async Task<IActionResult> Index()
        {
            var brand = (await _unitOfWork.GetRepository<Brand>()
                .GetPagedListAsync(orderBy: n => n.OrderByDescending(p => p.Brandcreateddate),
                                    pageSize: int.MaxValue)).Items;
            return View(_mapper.Map<IEnumerable<BrandModel>>(brand));
        }

        // GET: Admin/Brands/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Brand>() == null)
            {
                return NotFound();
            }

            var brand = await _unitOfWork.GetRepository<Brand>()
                .GetFirstOrDefaultAsync(predicate: m => m.Brandid == id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<BrandModel>(brand));
        }

        // GET: Admin/Brands/Create
        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([FromForm] BrandCreateModel brandCreateModel)
        {
            if (brandCreateModel.BrandImageFile != null)
            {
                var checkImageFile = FileValid.IsImageValid(brandCreateModel.BrandImageFile);
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(brandCreateModel);
                }

            }

            var brand = _mapper.Map<Brand>(brandCreateModel);

            if (ModelState.IsValid)
            {
                if (BrandNameExists(brandCreateModel.Brandname))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(brandCreateModel);
                }

                if (brandCreateModel.BrandImageFile?.Length > 0)
                {
                    var upLoadImage = await _fileManagerService.UploadSingleImage(brandCreateModel.BrandImageFile, GetPath.BrandImage);
                    if (upLoadImage.Length > 0)
                    {
                        brand.Brandimage = upLoadImage;
                    }
                    else
                    {
                        _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                    }
                }

                _unitOfWork.GetRepository<Brand>().Insert(brand);
                await _unitOfWork.SaveChangesAsync();

                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));
            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(brandCreateModel);
        }

        // GET: Admin/Brands/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Brand>() == null)
            {
                return NotFound();
            }

            var brand = await _unitOfWork.GetRepository<Brand>()
                .FindAsync(id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<BrandUpdateModel>(brand));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([FromForm] BrandUpdateModel brandUpdateModel)
        {
            if (!(brandUpdateModel.Brandid is not null && BrandExists(brandUpdateModel.Brandid)))
            {
                return NotFound();
            }

            if (brandUpdateModel.BrandImageFile != null)
            {
                var checkImageFile = FileValid.IsImageValid(brandUpdateModel.BrandImageFile);
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(brandUpdateModel);
                }

                brandUpdateModel.Brandimage = brandUpdateModel.BrandImageFile.FileName;
            }

            if (ModelState.IsValid)
            {
                if (BrandNameExists(brandUpdateModel.Brandname, brandUpdateModel.Brandid))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(brandUpdateModel);
                }

                var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(brandUpdateModel.Brandid);
                if (brand == null)
                {
                    return NotFound();
                }

                var brandImage = brand.Brandimage;
                _mapper.Map(brandUpdateModel, brand);
                try
                {
                    if (brandUpdateModel.BrandImageFile?.Length > 0)
                    {
                        var upLoadImage = await _fileManagerService.UploadSingleImage(brandUpdateModel.BrandImageFile, GetPath.BrandImage);
                        if (upLoadImage.Length > 0)
                        {
                            brand.Brandimage = upLoadImage;
                            if (brandImage != null && brandImage != "")
                            {
                                _fileManagerService.DeleteSingleImage(GetPath.BrandImage + brandImage);
                            }
                        }
                        else
                        {
                            _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                        }
                    }

                    _unitOfWork.GetRepository<Brand>().Update(brand);
                    await _unitOfWork.SaveChangesAsync();

                    _notifyService.Success("Chỉnh sửa thành công.");
                    return RedirectToAction("Details", brandUpdateModel.Brandid);
                }
                catch (Exception)
                {
                    _notifyService.Error("Đã xảy ra lỗi.");
                    return RedirectToAction(nameof(Index));
                }

            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(brandUpdateModel);
        }

        // GET: Admin/Brands/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Brand>() == null)
            {
                return NotFound();
            }

            var brand = await _unitOfWork.GetRepository<Brand>()
                .FindAsync(id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<BrandModel>(brand));
        }

        // POST: Admin/Brands/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_unitOfWork.GetRepository<Brand>() == null)
            {
                return Problem("Entity set 'Brands'  is null.");
            }
            var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(id);
            if (brand != null)
            {
                var brand_Products = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(predicate: n => n.Brandid == id);
                if (brand_Products != null)
                {
                    _notifyService.Error("Không thể xóa do ràng buộc dữ liệu.");
                    return RedirectToAction(nameof(Index));
                }
                _unitOfWork.GetRepository<Brand>().Delete(brand);

                if (brand.Brandimage != null && brand.Brandimage != "")
                {
                    _fileManagerService.DeleteSingleImage(GetPath.BrandImage + brand.Brandimage);
                }
            }
            _notifyService.Success("Xóa thành công");
            await _unitOfWork.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BrandExists(string id)
        {
            var brand = _unitOfWork.GetRepository<Brand>().Find(id);
            return brand != null;
        }

        private bool BrandNameExists(string name)
        {
            var brand = _unitOfWork.GetRepository<Brand>().GetFirstOrDefault(
                               predicate: n => n.Brandname.ToLower() == name.ToLower());
            return brand != null;
        }

        private bool BrandNameExists(string name, string id)
        {
            var brand = _unitOfWork.GetRepository<Brand>().GetFirstOrDefault(
                                predicate: n => (n.Brandname.ToLower() == name.ToLower() && n.Brandid != id));
            return brand != null;
        }
    }
}
