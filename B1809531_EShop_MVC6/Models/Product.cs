using System;
using System.Collections.Generic;

namespace B1809531_EShop_MVC6.Models
{
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

        public string Productid { get; set; } = null!;
        public string Brandid { get; set; } = null!;
        public string Categoryid { get; set; } = null!;
        public string? Productname { get; set; }
        public string? Productdescribe { get; set; }
        public int? Productprice { get; set; }
        public int? Productquantity { get; set; }
        public long? Productcreateddate { get; set; }
        public bool? Productinacitve { get; set; }
        public int? Productsaleprice { get; set; }

        public virtual Brand Brand { get; set; } = null!;
        public virtual Category Category { get; set; } = null!;
        public virtual ICollection<Cartitem> Cartitems { get; set; }
        public virtual ICollection<Discount> Discounts { get; set; }
        public virtual ICollection<Invoiceitem> Invoiceitems { get; set; }
        public virtual ICollection<Orderitem> Orderitems { get; set; }
        public virtual ICollection<Productimage> Productimages { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
        public virtual ICollection<Warehousereceiptitem> Warehousereceiptitems { get; set; }
    }
}
