﻿using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
    public partial class Productimage
    {
        public string Productimageid { get; set; } = null!;
        public string Productid { get; set; } = null!;
        public string? Productimageurl { get; set; }

        public virtual Product Product { get; set; } = null!;
    }
}
