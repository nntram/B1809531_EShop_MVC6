using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("PRODUCT")]
    [Index(nameof(Brandid), Name = "PRODUCT_BRAND_FK")]
    [Index(nameof(Categoryid), Name = "PRODUCT_CATEGORY_FK")]
    public partial class Product
    {
        public Product()
        {
            Cartitems = new HashSet<Cartitem>();
            Discounts = new HashSet<Discount>();
            Invoiceitems = new HashSet<Invoiceitem>();
            Orderitems = new HashSet<Orderitem>();
            Productimages = new HashSet<Productimage>();
            Reviews = new HashSet<Review>();
            Warehousereceiptitems = new HashSet<Warehousereceiptitem>();
        }

        [Key]
        [Column("PRODUCTID")]
        [StringLength(64)]
        public string Productid { get; set; } = null!;
        [Column("BRANDID")]
        [StringLength(64)]
        public string Brandid { get; set; } = null!;
        [Column("CATEGORYID")]
        [StringLength(64)]
        public string Categoryid { get; set; } = null!;
        [Column("PRODUCTNAME")]
        [StringLength(256)]
        public string? Productname { get; set; }
        [Column("PRODUCTDESCRIBE")]
        public string? Productdescribe { get; set; }
        [Column("PRODUCTPRICE")]
        public int? Productprice { get; set; }
        [Column("PRODUCTQUANTITY")]
        public int? Productquantity { get; set; }
        [Column("PRODUCTCREATEDDATE")]
        public long? Productcreateddate { get; set; }
        [Column("PRODUCTINACITVE")]
        public bool? Productinacitve { get; set; }
        [Column("PRODUCTSALEPRICE")]
        public int? Productsaleprice { get; set; }
        [Column("PRODUCTISHOT")]
        public bool? Productishot { get; set; }

        [ForeignKey(nameof(Brandid))]
        [InverseProperty("Products")]
        public virtual Brand Brand { get; set; } = null!;
        [ForeignKey(nameof(Categoryid))]
        [InverseProperty("Products")]
        public virtual Category Category { get; set; } = null!;
        [InverseProperty(nameof(Cartitem.Product))]
        public virtual ICollection<Cartitem> Cartitems { get; set; }
        [InverseProperty(nameof(Discount.Product))]
        public virtual ICollection<Discount> Discounts { get; set; }
        [InverseProperty(nameof(Invoiceitem.Product))]
        public virtual ICollection<Invoiceitem> Invoiceitems { get; set; }
        [InverseProperty(nameof(Orderitem.Product))]
        public virtual ICollection<Orderitem> Orderitems { get; set; }
        [InverseProperty(nameof(Productimage.Product))]
        public virtual ICollection<Productimage> Productimages { get; set; }
        [InverseProperty(nameof(Review.Product))]
        public virtual ICollection<Review> Reviews { get; set; }
        [InverseProperty(nameof(Warehousereceiptitem.Product))]
        public virtual ICollection<Warehousereceiptitem> Warehousereceiptitems { get; set; }
    }
}
