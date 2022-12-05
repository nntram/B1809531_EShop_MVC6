using Arch.EntityFrameworkCore.UnitOfWork;
using AutoMapper;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Controllers
{
    public class AddressController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public AddressController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IActionResult> GetProvince()
        {
            var data = (await _unitOfWork.GetRepository<Province>().GetPagedListAsync(
                            pageSize: int.MaxValue))
                            .Items;
            return Ok(_mapper.Map<IEnumerable<ProvinceModel>>(data));
        }

        public async Task<IActionResult> GetDistrict(string provinceId)
        {
            var data = (await _unitOfWork.GetRepository<District>().GetPagedListAsync(
                            pageSize: int.MaxValue,
                            predicate: p => p.Provinceid == provinceId))
                            .Items;
            return Ok(_mapper.Map<IEnumerable<DistrictModel>>(data));
        }
        public async Task<IActionResult> GetWard(string districtId)
        {
            var data = (await _unitOfWork.GetRepository<Ward>().GetPagedListAsync(
                            pageSize: int.MaxValue,
                            predicate: p => p.Districtid == districtId))
                            .Items;
            return Ok(_mapper.Map<IEnumerable<WardModel>>(data));
        }

    }
}
