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

            CreateMap<Category, CategoryModel>().ReverseMap();
            CreateMap<Category, Category>();
            CreateMap<Category, CategoryCreateModel>().ReverseMap();

            CreateMap<Product, ProductModel>().ReverseMap();
            CreateMap<Product, Product>();
            CreateMap<Product, ProductCreateModel>().ReverseMap();
            CreateMap<Productimage, ProductImageModel>().ReverseMap();
        }
    }
}
