﻿using Microsoft.AspNetCore.Mvc;
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
        public INotyfService _notifyService {get;}

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
            var brand = await _unitOfWork.GetRepository<Brand>().GetAllAsync();
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
                .GetFirstOrDefaultAsync (predicate: m => m.Brandid == id);
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
            if (brandCreateModel.BrandImageFile != null )
            {
                var checkImageFile = FileValid.IsImageValid(brandCreateModel.BrandImageFile);
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(brandCreateModel);
                }

                brandCreateModel.Brandimage = brandCreateModel.BrandImageFile.FileName;
            }
       
            var brand = _mapper.Map<Brand>(brandCreateModel);
            
            if (ModelState.IsValid)
            {
                if (BrandNameExists(brandCreateModel.Brandname))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(brandCreateModel);
                }

                _unitOfWork.GetRepository<Brand>().Insert(brand);
                await _unitOfWork.SaveChangesAsync();

                if(brandCreateModel.BrandImageFile?.Length > 0)
                {
                    var upLoadImage = _fileManagerService.UploadSingleImage(brandCreateModel.BrandImageFile, GetPath.BrandImage);
                    if (!upLoadImage)
                    {
                        _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                    }
                }

                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));
            }
            
            _notifyService.Error("Đã xảy ra lỗi.");
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

            return View(_mapper.Map<BrandModel>(brand));
        }
      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([FromForm] BrandModel brandModel)
        {
            if (!(brandModel.Brandid is not null && BrandExists(brandModel.Brandid)))
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(brandModel.Brandid);
                if (brand == null)
                {
                    return NotFound();
                }
                var brandUpdated = _mapper.Map(brandModel, brand);
                try
                {
                    _unitOfWork.GetRepository<Brand>().Update(brandUpdated);
                    await _unitOfWork.SaveChangesAsync();
                    _notifyService.Success("Chỉnh sửa thành công.");
                }
                catch (Exception e)
                {
                    _notifyService.Error("Đã xảy ra lỗi.");
                    return RedirectToAction(nameof(Index));
                }
               
                return RedirectToAction(nameof(Index));
            }
            return View(brandModel);
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
                return Problem("Entity set 'naricosmeticContext.Brands'  is null.");
            }
            var brand = await _unitOfWork.GetRepository<Brand>().FindAsync(id);
            if (brand != null)
            {
                _unitOfWork.GetRepository<Brand>().Delete(brand);
            }
            _notifyService.Success("Xóa thành công");
            await _unitOfWork.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BrandExists(string id)
        {
            return _unitOfWork.GetRepository<Brand>().Exists(n => n.Brandid == id);
        }

        private bool BrandNameExists(string name)
        {
            return _unitOfWork.GetRepository<Brand>().Exists(n => n.Brandname.ToLower() == name.ToLower());
        }
    }
}
