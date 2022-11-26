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
    public class CategoriesController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IFileManagerServies _fileManagerService;
        public readonly INotyfService _notifyService;

        public CategoriesController(IUnitOfWork unitOfWork, IMapper mapper,
            IFileManagerServies fileManagerService,
            INotyfService notifyService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _fileManagerService = fileManagerService;
            _notifyService = notifyService;
        }

        // GET: Admin/Categories
        public async Task<IActionResult> Index()
        {
            var category = (await _unitOfWork.GetRepository<Category>()
                .GetPagedListAsync(orderBy: n => n.OrderByDescending(p => p.Categorycreateddate),
                                    pageSize: int.MaxValue)).Items;
            return View(_mapper.Map<IEnumerable<CategoryModel>>(category));
        }

        // GET: Admin/Categories/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Category>() == null)
            {
                return NotFound();
            }

            var category = await _unitOfWork.GetRepository<Category>()
                .GetFirstOrDefaultAsync(predicate: m => m.Categoryid == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<CategoryModel>(category));
        }

        // GET: Admin/Categories/Create
        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([FromForm] CategoryCreateModel categoryCreateModel)
        {
            if (categoryCreateModel.CategoryImageFile != null)
            {
                var checkImageFile = FileValid.IsImageValid(categoryCreateModel.CategoryImageFile);
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(categoryCreateModel);
                }

            }

            var category = _mapper.Map<Category>(categoryCreateModel);

            if (ModelState.IsValid)
            {
                if (CategoryNameExists(categoryCreateModel.Categoryname))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(categoryCreateModel);
                }

                if (categoryCreateModel.CategoryImageFile?.Length > 0)
                {
                    var upLoadImage = await _fileManagerService.UploadSingleImage(categoryCreateModel.CategoryImageFile, GetPath.CategoryImage);
                    if (upLoadImage.Length > 0)
                    {
                        category.Categoryimage = upLoadImage;
                    }
                    else
                    {
                        _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                    }
                }

                _unitOfWork.GetRepository<Category>().Insert(category);
                await _unitOfWork.SaveChangesAsync();

                _notifyService.Success("Thêm thành công.");
                return RedirectToAction(nameof(Index));
            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(categoryCreateModel);
        }

        // GET: Admin/Categories/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Category>() == null)
            {
                return NotFound();
            }

            var category = await _unitOfWork.GetRepository<Category>()
                .FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<CategoryUpdateModel>(category));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([FromForm] CategoryUpdateModel categoryUpdateModel)
        {
            if (!(categoryUpdateModel.Categoryid is not null && CategoryExists(categoryUpdateModel.Categoryid)))
            {
                return NotFound();
            }

            if (categoryUpdateModel.CategoryImageFile != null)
            {
                var checkImageFile = FileValid.IsImageValid(categoryUpdateModel.CategoryImageFile);
                if (!checkImageFile)
                {
                    _notifyService.Error("Đã xảy ra lỗi. Định dạng ảnh không hợp lệ.");
                    return View(categoryUpdateModel);
                }

                categoryUpdateModel.Categoryimage = categoryUpdateModel.CategoryImageFile.FileName;
            }

            if (ModelState.IsValid)
            {
                if (CategoryNameExists(categoryUpdateModel.Categoryname, categoryUpdateModel.Categoryid))
                {
                    _notifyService.Error("Đã xảy ra lỗi. Tên đã tồn tại.");
                    return View(categoryUpdateModel);
                }

                var category = await _unitOfWork.GetRepository<Category>().FindAsync(categoryUpdateModel.Categoryid);
                if (category == null)
                {
                    return NotFound();
                }

                var categoryImage = category.Categoryimage;
                _mapper.Map(categoryUpdateModel, category);
                try
                {
                    if (categoryUpdateModel.CategoryImageFile?.Length > 0)
                    {
                        var upLoadImage = await _fileManagerService.UploadSingleImage(categoryUpdateModel.CategoryImageFile, GetPath.CategoryImage);
                        if (upLoadImage.Length > 0)
                        {
                            category.Categoryimage = upLoadImage;
                            if (categoryImage != null && categoryImage != "")
                            {
                                _fileManagerService.DeleteSingleImage(GetPath.CategoryImage + categoryImage);
                            }
                        }
                        else
                        {
                            _notifyService.Error("Đã xảy ra lỗi khi upload ảnh.");
                        }
                    }

                    _unitOfWork.GetRepository<Category>().Update(category);
                    await _unitOfWork.SaveChangesAsync();

                    _notifyService.Success("Chỉnh sửa thành công.");
                    return RedirectToAction("Details", "Categories", new {id = categoryUpdateModel.Categoryid });
                }
                catch (Exception)
                {
                    _notifyService.Error("Đã xảy ra lỗi.");
                    return RedirectToAction(nameof(Index));
                }

            }

            _notifyService.Error("Dữ liệu không hợp lệ, vui lòng kiểm tra lại.");
            return View(categoryUpdateModel);
        }

        // GET: Admin/Categories/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _unitOfWork.GetRepository<Category>() == null)
            {
                return NotFound();
            }

            var category = await _unitOfWork.GetRepository<Category>()
                .FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }

            return View(_mapper.Map<CategoryModel>(category));
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_unitOfWork.GetRepository<Category>() == null)
            {
                return Problem("Entity set 'Categories'  is null.");
            }
            var category = await _unitOfWork.GetRepository<Category>().FindAsync(id);
            if (category != null)
            {
                var category_Products = await _unitOfWork.GetRepository<Product>().GetFirstOrDefaultAsync(predicate: n => n.Categoryid == id);
                if (category_Products != null)
                {
                    _notifyService.Error("Không thể xóa do ràng buộc dữ liệu.");
                    return RedirectToAction(nameof(Index));
                }
                _unitOfWork.GetRepository<Category>().Delete(category);

                if (category.Categoryimage != null && category.Categoryimage != "")
                {
                    _fileManagerService.DeleteSingleImage(GetPath.CategoryImage + category.Categoryimage);
                }
            }
            _notifyService.Success("Xóa thành công");
            await _unitOfWork.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoryExists(string id)
        {
            var category = _unitOfWork.GetRepository<Category>().Find(id);
            return category != null;
        }

        private bool CategoryNameExists(string name)
        {
            var category = _unitOfWork.GetRepository<Category>().GetFirstOrDefault(
                               predicate: n => n.Categoryname.ToLower() == name.ToLower());
            return category != null;
        }

        private bool CategoryNameExists(string name, string id)
        {
            var category = _unitOfWork.GetRepository<Category>().GetFirstOrDefault(
                                predicate: n => (n.Categoryname.ToLower() == name.ToLower() && n.Categoryid != id));
            return category != null;
        }
    }
}
