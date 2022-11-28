﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("BRAND")]
    public partial class Brand
    {
        public Brand()
        {
            Categorydiscounts = new HashSet<Categorydiscount>();
            Products = new HashSet<Product>();
        }

        [Key]
        [Column("BRANDID")]
        [StringLength(64)]
        public string Brandid { get; set; } = null!;
        [Column("BRANDNAME")]
        [StringLength(256)]
        public string? Brandname { get; set; }
        [Column("BRANDCREATEDDATE")]
        public long? Brandcreateddate { get; set; }
        [Column("BRANDIMAGE")]
        [StringLength(256)]
        public string? Brandimage { get; set; }

        [InverseProperty("Brand")]
        public virtual ICollection<Categorydiscount> Categorydiscounts { get; set; }
        [InverseProperty("Brand")]
        public virtual ICollection<Product> Products { get; set; }
    }
}
