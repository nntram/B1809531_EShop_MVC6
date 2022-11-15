﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using B1809531_EShop_MVC6.Entities;
using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification.Abstractions;
using B1809531_EShop_MVC6.Data;
using AutoMapper;
using B1809531_EShop_MVC6.Models;

namespace B1809531_EShop_MVC6.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BrandsController : Controller
    {
        private readonly naricosmeticContext _context;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public INotyfService _notifyService {get;}

        public BrandsController(naricosmeticContext context, IUnitOfWork unitOfWork, INotyfService notifyService, IMapper mapper)
        {
            _context = context;
            _unitOfWork = unitOfWork;
            _notifyService = notifyService;
            _mapper = mapper;
        }

        // GET: Admin/Brands
        public async Task<IActionResult> Index()
        {
              return View(await _unitOfWork.GetRepository<Brand>().GetAllAsync());
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

            return View(brand);
        }

        // GET: Admin/Brands/Create
        public IActionResult Create()
        {
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(BrandModel brandModel)
        {
            var brand = _mapper.Map<Brand>(brandModel);
            
            if (ModelState.IsValid)
            {                
                await _unitOfWork.GetRepository<Brand>().InsertAsync(brand);
                _unitOfWork.SaveChanges();
                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));
            }
            
            _notifyService.Error("Đã xảy ra lỗi.");
            return View(brandModel);
        }

        // GET: Admin/Brands/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Brands == null)
            {
                return NotFound();
            }

            var brand = await _unitOfWork.GetRepository<Brand>()
                .FindAsync(id);
            if (brand == null)
            {
                return NotFound();
            }
            return View(brand);
        }
      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Brandid,Brandname,Brandcreateddate,Brandimage")] Brand brand)
        {
            if (id != brand.Brandid)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(brand);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BrandExists(brand.Brandid))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(brand);
        }

        // GET: Admin/Brands/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Brands == null)
            {
                return NotFound();
            }

            var brand = await _context.Brands
                .FirstOrDefaultAsync(m => m.Brandid == id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(brand);
        }

        // POST: Admin/Brands/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Brands == null)
            {
                return Problem("Entity set 'naricosmeticContext.Brands'  is null.");
            }
            var brand = await _context.Brands.FindAsync(id);
            if (brand != null)
            {
                _context.Brands.Remove(brand);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BrandExists(string id)
        {
            return _unitOfWork.GetRepository<Brand>().Exists(n => n.Brandid == id);
        }
    }
}
