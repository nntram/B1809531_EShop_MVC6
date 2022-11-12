using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Banner
    {
        public string Bannerid { get; set; } = null!;
        public string? Bannerbuttontext { get; set; }
        public string? Bannerdesc { get; set; }
        public string? Bannersmalltext { get; set; }
        public string? Bannermidtext { get; set; }
        public string? Bannerlargetext1 { get; set; }
        public string? Bannerlargeltext2 { get; set; }
        public string? Bannerdiscount { get; set; }
        public string? Bannersaletime { get; set; }
        public string? Bannerimg { get; set; }
        public string? Bannerproductid { get; set; }
        public long? Bannercreateddate { get; set; }
    }
}
