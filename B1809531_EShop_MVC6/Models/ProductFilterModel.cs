namespace B1809531_EShop_MVC6.Models
{
    public class ProductFilterModel
    {
        public int? page { get; set; } = 1;
        public string? search { get; set; }
        public string? category { get; set; }
        public string? brand { get; set; }
    }
}
