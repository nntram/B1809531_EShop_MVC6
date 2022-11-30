namespace B1809531_EShop_MVC6.Models
{
    public class ProductFilterModel
    {      
        public string? category { get; set; }
        public string? brand { get; set; }
        public bool? isGetHot { get; set; } = false;
        public bool? isGetNotInActive { get; set; } = false;
        public bool? isGetOutOfStock { get; set; } = false;
        public string? productName { get; set; }
        public string? orderBy { get; set;}
    }
}
