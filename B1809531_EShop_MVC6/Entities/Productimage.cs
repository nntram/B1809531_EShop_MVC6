﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PRODUCTIMAGE")]
    [Index(nameof(Productid), Name = "PRODUCT_IMAGE_FK")]
    public partial class Productimage
    {
        [Key]
        [Column("PRODUCTIMAGEID")]
        [StringLength(64)]
        public string Productimageid { get; set; } = null!;
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Column("PRODUCTIMAGEURL")]
        public string? Productimageurl { get; set; }

        [ForeignKey(nameof(Productid))]
        [InverseProperty("Productimages")]
        public virtual Product Product { get; set; } = null!;
    }
}
