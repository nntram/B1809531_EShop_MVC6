using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace B1809531_EShop_MVC6.Models
{
    public class DistrictModel
    {
        public string Districtid { get; set; }
        public string Provinceid { get; set; } 
        public string? Districtname { get; set; }
    }
}
