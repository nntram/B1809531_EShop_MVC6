using AutoMapper;
using B1809531_EShop_MVC6.Entities;
using B1809531_EShop_MVC6.Models;

namespace B1809531_EShop_MVC6.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Brand, BrandModel>().ReverseMap();
            CreateMap<Brand, Brand>();
            CreateMap<Brand, BrandCreateModel>().ReverseMap();
        }
    }
}
