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
            CreateMap<Brand, BrandUpdateModel>().ReverseMap();
            CreateMap<Brand, BrandCreateModel>().ReverseMap();

            CreateMap<Category, CategoryModel>().ReverseMap();
            CreateMap<Category, CategoryUpdateModel>().ReverseMap();
            CreateMap<Category, CategoryCreateModel>().ReverseMap();

            CreateMap<Product, ProductModel>().ReverseMap();
            CreateMap<Product, ProductUpdateModel>().ReverseMap();
            CreateMap<Product, ProductCreateModel>().ReverseMap();
            CreateMap<Productimage, ProductImageModel>().ReverseMap();

            CreateMap<Province, ProvinceModel>().ReverseMap();
            CreateMap<District, DistrictModel>().ReverseMap();
            CreateMap<Ward, WardModel>().ReverseMap();

            CreateMap<Customer, CustomerCreateModel>().ReverseMap();

            CreateMap<Cart, CartModel>().ReverseMap();
            CreateMap<Cartdetail, CartDetailModel>().ReverseMap();

        }
    }
}
