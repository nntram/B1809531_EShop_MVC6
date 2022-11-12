using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace B1809531_EShop_MVC6.Models
{
    public partial class naricosmeticContext : DbContext
    {
        public naricosmeticContext()
        {
        }

        public naricosmeticContext(DbContextOptions<naricosmeticContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Banner> Banners { get; set; } = null!;
        public virtual DbSet<Blog> Blogs { get; set; } = null!;
        public virtual DbSet<Blogcomment> Blogcomments { get; set; } = null!;
        public virtual DbSet<Brand> Brands { get; set; } = null!;
        public virtual DbSet<Cart> Carts { get; set; } = null!;
        public virtual DbSet<Cartitem> Cartitems { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Categorydiscount> Categorydiscounts { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Discount> Discounts { get; set; } = null!;
        public virtual DbSet<District> Districts { get; set; } = null!;
        public virtual DbSet<Invoice> Invoices { get; set; } = null!;
        public virtual DbSet<Invoiceitem> Invoiceitems { get; set; } = null!;
        public virtual DbSet<Mapproduct> Mapproducts { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<Orderitem> Orderitems { get; set; } = null!;
        public virtual DbSet<Paymentdatum> Paymentdata { get; set; } = null!;
        public virtual DbSet<Paymentdetail> Paymentdetails { get; set; } = null!;
        public virtual DbSet<Paymenttype> Paymenttypes { get; set; } = null!;
        public virtual DbSet<Permision> Permisions { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Productimage> Productimages { get; set; } = null!;
        public virtual DbSet<Productpricing> Productpricings { get; set; } = null!;
        public virtual DbSet<Province> Provinces { get; set; } = null!;
        public virtual DbSet<Review> Reviews { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<RolePermision> RolePermisions { get; set; } = null!;
        public virtual DbSet<Shipmentstatus> Shipmentstatuses { get; set; } = null!;
        public virtual DbSet<Shipmenttype> Shipmenttypes { get; set; } = null!;
        public virtual DbSet<StaffRole> StaffRoles { get; set; } = null!;
        public virtual DbSet<Supplier> Suppliers { get; set; } = null!;
        public virtual DbSet<Voucher> Vouchers { get; set; } = null!;
        public virtual DbSet<Ward> Wards { get; set; } = null!;
        public virtual DbSet<Warehousereceipt> Warehousereceipts { get; set; } = null!;
        public virtual DbSet<Warehousereceiptitem> Warehousereceiptitems { get; set; } = null!;
        public virtual DbSet<staff> staff { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=WINDOWS\\NGOCTRAM;Initial Catalog=naricosmetic;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Banner>(entity =>
            {
                entity.ToTable("BANNER");

                entity.Property(e => e.Bannerid)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERID");

                entity.Property(e => e.Bannerbuttontext)
                    .HasMaxLength(32)
                    .HasColumnName("BANNERBUTTONTEXT");

                entity.Property(e => e.Bannercreateddate)
                    .HasColumnName("BANNERCREATEDDATE")
                    .HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");

                entity.Property(e => e.Bannerdesc)
                    .HasMaxLength(256)
                    .HasColumnName("BANNERDESC");

                entity.Property(e => e.Bannerdiscount)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERDISCOUNT");

                entity.Property(e => e.Bannerimg)
                    .HasMaxLength(256)
                    .HasColumnName("BANNERIMG");

                entity.Property(e => e.Bannerlargeltext2)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERLARGELTEXT2");

                entity.Property(e => e.Bannerlargetext1)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERLARGETEXT1");

                entity.Property(e => e.Bannermidtext)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERMIDTEXT");

                entity.Property(e => e.Bannerproductid)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERPRODUCTID");

                entity.Property(e => e.Bannersaletime)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERSALETIME");

                entity.Property(e => e.Bannersmalltext)
                    .HasMaxLength(64)
                    .HasColumnName("BANNERSMALLTEXT");
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.HasKey(e => e.Blogid)
                    .IsClustered(false);

                entity.ToTable("BLOG");

                entity.Property(e => e.Blogid)
                    .HasMaxLength(64)
                    .HasColumnName("BLOGID");

                entity.Property(e => e.Blogcontent)
                    .HasMaxLength(1024)
                    .HasColumnName("BLOGCONTENT");

                entity.Property(e => e.Blogcreateddate).HasColumnName("BLOGCREATEDDATE");

                entity.Property(e => e.Blogtitle)
                    .HasMaxLength(256)
                    .HasColumnName("BLOGTITLE");
            });

            modelBuilder.Entity<Blogcomment>(entity =>
            {
                entity.HasKey(e => e.Blogcommentid)
                    .IsClustered(false);

                entity.ToTable("BLOGCOMMENT");

                entity.HasIndex(e => e.Blogid, "BLOG_BLOGCOMMENT_FK");

                entity.HasIndex(e => e.Customerid, "CUSTOMER_BLOGCOMMENT_FK");

                entity.Property(e => e.Blogcommentid)
                    .HasMaxLength(64)
                    .HasColumnName("BLOGCOMMENTID");

                entity.Property(e => e.Blogcommentcontent)
                    .HasMaxLength(512)
                    .HasColumnName("BLOGCOMMENTCONTENT");

                entity.Property(e => e.Blogid)
                    .HasMaxLength(64)
                    .HasColumnName("BLOGID");

                entity.Property(e => e.Customerid)
                    .HasMaxLength(64)
                    .HasColumnName("CUSTOMERID");

                entity.HasOne(d => d.Blog)
                    .WithMany(p => p.Blogcomments)
                    .HasForeignKey(d => d.Blogid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BLOGCOMM_BLOG_BLOG_BLOG");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Blogcomments)
                    .HasForeignKey(d => d.Customerid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BLOGCOMM_CUSTOMER__CUSTOMER");
            });

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.HasKey(e => e.Brandid)
                    .IsClustered(false);

                entity.ToTable("BRAND");

                entity.Property(e => e.Brandid)
                    .HasMaxLength(64)
                    .HasColumnName("BRANDID")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Brandcreateddate)
                    .HasColumnName("BRANDCREATEDDATE")
                    .HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");

                entity.Property(e => e.Brandimage)
                    .HasMaxLength(256)
                    .HasColumnName("BRANDIMAGE");

                entity.Property(e => e.Brandname)
                    .HasMaxLength(256)
                    .HasColumnName("BRANDNAME");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasKey(e => e.Cartid)
                    .IsClustered(false);

                entity.ToTable("CART");

                entity.Property(e => e.Cartid)
                    .HasMaxLength(64)
                    .HasColumnName("CARTID");
            });

            modelBuilder.Entity<Cartitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Cartid });

                entity.ToTable("CARTITEM");

                entity.HasIndex(e => e.Cartid, "CARTITEM2_FK");

                entity.HasIndex(e => e.Productid, "CARTITEM_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Cartid)
                    .HasMaxLength(64)
                    .HasColumnName("CARTID");

                entity.Property(e => e.Cartitemid)
                    .HasMaxLength(64)
                    .HasColumnName("CARTITEMID");

                entity.Property(e => e.Cartitemprice).HasColumnName("CARTITEMPRICE");

                entity.Property(e => e.Cartitemquantity).HasColumnName("CARTITEMQUANTITY");

                entity.HasOne(d => d.Cart)
                    .WithMany(p => p.Cartitems)
                    .HasForeignKey(d => d.Cartid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CARTITEM_CARTITEM2_CART");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Cartitems)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CARTITEM_CARTITEM_PRODUCT");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.Categoryid)
                    .IsClustered(false);

                entity.ToTable("CATEGORY");

                entity.Property(e => e.Categoryid)
                    .HasMaxLength(64)
                    .HasColumnName("CATEGORYID")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Categorycreacteddate)
                    .HasColumnName("CATEGORYCREACTEDDATE")
                    .HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");

                entity.Property(e => e.Categoryimage)
                    .HasMaxLength(256)
                    .HasColumnName("CATEGORYIMAGE");

                entity.Property(e => e.Categoryname)
                    .HasMaxLength(256)
                    .HasColumnName("CATEGORYNAME");
            });

            modelBuilder.Entity<Categorydiscount>(entity =>
            {
                entity.HasKey(e => e.Categorydiscountid)
                    .IsClustered(false);

                entity.ToTable("CATEGORYDISCOUNT");

                entity.HasIndex(e => e.Brandid, "CATEGORYDISCOUNT_BRAND_FK");

                entity.HasIndex(e => e.Categoryid, "CATEGORY_DISCOUNT_FK");

                entity.Property(e => e.Categorydiscountid)
                    .HasMaxLength(64)
                    .HasColumnName("CATEGORYDISCOUNTID");

                entity.Property(e => e.Brandid)
                    .HasMaxLength(64)
                    .HasColumnName("BRANDID");

                entity.Property(e => e.Categorydiscountcreateddate).HasColumnName("CATEGORYDISCOUNTCREATEDDATE");

                entity.Property(e => e.Categorydiscountdescription)
                    .HasMaxLength(256)
                    .HasColumnName("CATEGORYDISCOUNTDESCRIPTION");

                entity.Property(e => e.Categorydiscountenddate).HasColumnName("CATEGORYDISCOUNTENDDATE");

                entity.Property(e => e.Categorydiscountinactive).HasColumnName("CATEGORYDISCOUNTINACTIVE");

                entity.Property(e => e.Categorydiscountstartdate).HasColumnName("CATEGORYDISCOUNTSTARTDATE");

                entity.Property(e => e.Categorydiscountunit)
                    .HasMaxLength(128)
                    .HasColumnName("CATEGORYDISCOUNTUNIT");

                entity.Property(e => e.Categorydiscountvalue).HasColumnName("CATEGORYDISCOUNTVALUE");

                entity.Property(e => e.Categoryid)
                    .HasMaxLength(64)
                    .HasColumnName("CATEGORYID");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Categorydiscounts)
                    .HasForeignKey(d => d.Brandid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CATEGORY_CATEGORYD_BRAND");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Categorydiscounts)
                    .HasForeignKey(d => d.Categoryid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CATEGORY_CATEGORY__CATEGORY");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => e.Customerid)
                    .IsClustered(false);

                entity.ToTable("CUSTOMER");

                entity.HasIndex(e => e.Cartid, "CUSTOMER_CART2_FK");

                entity.HasIndex(e => e.Wardid, "CUSTOMER_WARD_FK");

                entity.Property(e => e.Customerid)
                    .HasMaxLength(64)
                    .HasColumnName("CUSTOMERID");

                entity.Property(e => e.Cartid)
                    .HasMaxLength(64)
                    .HasColumnName("CARTID");

                entity.Property(e => e.Custiomercreateddate).HasColumnName("CUSTIOMERCREATEDDATE");

                entity.Property(e => e.Customeraddress)
                    .HasMaxLength(256)
                    .HasColumnName("CUSTOMERADDRESS");

                entity.Property(e => e.Customergender).HasColumnName("CUSTOMERGENDER");

                entity.Property(e => e.Customername)
                    .HasMaxLength(256)
                    .HasColumnName("CUSTOMERNAME");

                entity.Property(e => e.Customerphonenumber)
                    .HasMaxLength(16)
                    .HasColumnName("CUSTOMERPHONENUMBER");

                entity.Property(e => e.Customerward).HasColumnName("CUSTOMERWARD");

                entity.Property(e => e.Wardid)
                    .HasMaxLength(64)
                    .HasColumnName("WARDID");

                entity.HasOne(d => d.Cart)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.Cartid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CUSTOMER_CUSTOMER__CART");

                entity.HasOne(d => d.Ward)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.Wardid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CUSTOMER_CUSTOMER__WARD");
            });

            modelBuilder.Entity<Discount>(entity =>
            {
                entity.HasKey(e => e.Discountid)
                    .IsClustered(false);

                entity.ToTable("DISCOUNT");

                entity.HasIndex(e => e.Productid, "DISCOUNT_PRODUCT_FK");

                entity.Property(e => e.Discountid)
                    .HasMaxLength(64)
                    .HasColumnName("DISCOUNTID");

                entity.Property(e => e.Discountcreateddate).HasColumnName("DISCOUNTCREATEDDATE");

                entity.Property(e => e.Discountdescription)
                    .HasMaxLength(256)
                    .HasColumnName("DISCOUNTDESCRIPTION");

                entity.Property(e => e.Discountenddate).HasColumnName("DISCOUNTENDDATE");

                entity.Property(e => e.Discountinactive).HasColumnName("DISCOUNTINACTIVE");

                entity.Property(e => e.Discountstartdate).HasColumnName("DISCOUNTSTARTDATE");

                entity.Property(e => e.Discountunit)
                    .HasMaxLength(128)
                    .HasColumnName("DISCOUNTUNIT");

                entity.Property(e => e.Discountvalue).HasColumnName("DISCOUNTVALUE");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Discounts)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DISCOUNT_DISCOUNT__PRODUCT");
            });

            modelBuilder.Entity<District>(entity =>
            {
                entity.HasKey(e => e.Districtid)
                    .IsClustered(false);

                entity.ToTable("DISTRICT");

                entity.HasIndex(e => e.Provinceid, "PROVINCE_DISTRICT_FK");

                entity.Property(e => e.Districtid)
                    .HasMaxLength(64)
                    .HasColumnName("DISTRICTID");

                entity.Property(e => e.Districtname)
                    .HasMaxLength(128)
                    .HasColumnName("DISTRICTNAME");

                entity.Property(e => e.Provinceid)
                    .HasMaxLength(64)
                    .HasColumnName("PROVINCEID");

                entity.HasOne(d => d.Province)
                    .WithMany(p => p.Districts)
                    .HasForeignKey(d => d.Provinceid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DISTRICT_PROVINCE__PROVINCE");
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.HasKey(e => e.Invoiceid)
                    .IsClustered(false);

                entity.ToTable("INVOICE");

                entity.HasIndex(e => e.Customerid, "CUSTOMER_INVOICE_FK");

                entity.HasIndex(e => e.Staffid, "INVOICE_STAFF_FK");

                entity.HasIndex(e => e.Wardid, "INVOICE_WARD_FK");

                entity.HasIndex(e => e.Orderid, "ORDER_INVOICE2_FK");

                entity.HasIndex(e => e.Paymenttypeid, "PAYMENT_INVOICE_FK");

                entity.Property(e => e.Invoiceid)
                    .HasMaxLength(64)
                    .HasColumnName("INVOICEID");

                entity.Property(e => e.Customerid)
                    .HasMaxLength(64)
                    .HasColumnName("CUSTOMERID");

                entity.Property(e => e.Invoiceadress)
                    .HasMaxLength(256)
                    .HasColumnName("INVOICEADRESS");

                entity.Property(e => e.Invoicecreateddate).HasColumnName("INVOICECREATEDDATE");

                entity.Property(e => e.Invoicediscount).HasColumnName("INVOICEDISCOUNT");

                entity.Property(e => e.Invoiceshipcost)
                    .HasMaxLength(256)
                    .HasColumnName("INVOICESHIPCOST");

                entity.Property(e => e.Invoicetrackingcode)
                    .HasMaxLength(128)
                    .HasColumnName("INVOICETRACKINGCODE");

                entity.Property(e => e.Orderid)
                    .HasMaxLength(64)
                    .HasColumnName("ORDERID");

                entity.Property(e => e.Paymenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTTYPEID");

                entity.Property(e => e.Staffid)
                    .HasMaxLength(64)
                    .HasColumnName("STAFFID");

                entity.Property(e => e.Wardid)
                    .HasMaxLength(64)
                    .HasColumnName("WARDID");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.Customerid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICE_CUSTOMER__CUSTOMER");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.Orderid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICE_ORDER_INV_ORDER");

                entity.HasOne(d => d.Paymenttype)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.Paymenttypeid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICE_PAYMENT_I_PAYMENTT");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.Staffid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICE_INVOICE_S_STAFF");

                entity.HasOne(d => d.Ward)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.Wardid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICE_INVOICE_W_WARD");
            });

            modelBuilder.Entity<Invoiceitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Invoiceid });

                entity.ToTable("INVOICEITEM");

                entity.HasIndex(e => e.Invoiceid, "INVOICEITEM2_FK");

                entity.HasIndex(e => e.Productid, "INVOICEITEM_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Invoiceid)
                    .HasMaxLength(64)
                    .HasColumnName("INVOICEID");

                entity.Property(e => e.Invoiceitemid)
                    .HasMaxLength(64)
                    .HasColumnName("INVOICEITEMID");

                entity.Property(e => e.Invoiceitemprice).HasColumnName("INVOICEITEMPRICE");

                entity.Property(e => e.Invoiceitemquantity).HasColumnName("INVOICEITEMQUANTITY");

                entity.HasOne(d => d.Invoice)
                    .WithMany(p => p.Invoiceitems)
                    .HasForeignKey(d => d.Invoiceid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICEI_INVOICEIT_INVOICE");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Invoiceitems)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_INVOICEI_INVOICEIT_PRODUCT");
            });

            modelBuilder.Entity<Mapproduct>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("mapproduct");

                entity.Property(e => e.Brandid)
                    .HasMaxLength(255)
                    .HasColumnName("brandid");

                entity.Property(e => e.Content).HasColumnName("content");

                entity.Property(e => e.F11).HasMaxLength(255);

                entity.Property(e => e.ImageM).HasColumnName("imageM");

                entity.Property(e => e.ImageUrl)
                    .HasMaxLength(255)
                    .HasColumnName("image_url");

                entity.Property(e => e.Img1)
                    .HasMaxLength(255)
                    .HasColumnName("img-1");

                entity.Property(e => e.Img2)
                    .HasMaxLength(255)
                    .HasColumnName("img-2");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ProductType)
                    .HasMaxLength(255)
                    .HasColumnName("product_type");

                entity.Property(e => e.SalePrice).HasColumnName("sale_price");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => e.Orderid)
                    .IsClustered(false);

                entity.ToTable("ORDER");

                entity.HasIndex(e => e.Customerid, "CUSTOMNER_ORDER_FK");

                entity.HasIndex(e => e.Paymenttypeid, "ORDER_PAYMENT_FK");

                entity.HasIndex(e => e.Shipmentstatusid, "ORDER_SHIPMENTSTATUS_FK");

                entity.HasIndex(e => e.Shipmenttypeid, "ORDER_SHIPMENTTYPE_FK");

                entity.HasIndex(e => e.Voucherid, "ORDER_VOUCHER_FK");

                entity.HasIndex(e => e.Wardid, "ORDER_WARD_FK");

                entity.Property(e => e.Orderid)
                    .HasMaxLength(64)
                    .HasColumnName("ORDERID");

                entity.Property(e => e.Customerid)
                    .HasMaxLength(64)
                    .HasColumnName("CUSTOMERID");

                entity.Property(e => e.Orderadress)
                    .HasMaxLength(256)
                    .HasColumnName("ORDERADRESS");

                entity.Property(e => e.Ordercreateddate).HasColumnName("ORDERCREATEDDATE");

                entity.Property(e => e.Ordershipcost).HasColumnName("ORDERSHIPCOST");

                entity.Property(e => e.Ordertrackingcode)
                    .HasMaxLength(128)
                    .HasColumnName("ORDERTRACKINGCODE");

                entity.Property(e => e.Paymenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTTYPEID");

                entity.Property(e => e.Shipmentstatusid)
                    .HasMaxLength(64)
                    .HasColumnName("SHIPMENTSTATUSID");

                entity.Property(e => e.Shipmenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("SHIPMENTTYPEID");

                entity.Property(e => e.Voucherid)
                    .HasMaxLength(64)
                    .HasColumnName("VOUCHERID");

                entity.Property(e => e.Wardid)
                    .HasMaxLength(64)
                    .HasColumnName("WARDID");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Customerid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_CUSTOMNER_CUSTOMER");

                entity.HasOne(d => d.Paymenttype)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Paymenttypeid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ORDER_PAY_PAYMENTT");

                entity.HasOne(d => d.Shipmentstatus)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Shipmentstatusid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ORDER_SHI_SHIPMENT");

                entity.HasOne(d => d.Shipmenttype)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Shipmenttypeid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ORDER_SHI_SHIPMENT2");

                entity.HasOne(d => d.Voucher)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Voucherid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ORDER_VOU_VOUCHER");

                entity.HasOne(d => d.Ward)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Wardid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ORDER_WAR_WARD");
            });

            modelBuilder.Entity<Orderitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Orderid });

                entity.ToTable("ORDERITEM");

                entity.HasIndex(e => e.Orderid, "ORDERITEM2_FK");

                entity.HasIndex(e => e.Productid, "ORDERITEM_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Orderid)
                    .HasMaxLength(64)
                    .HasColumnName("ORDERID");

                entity.Property(e => e.Orderitemld)
                    .HasMaxLength(64)
                    .HasColumnName("ORDERITEMLD");

                entity.Property(e => e.Orderitemprice).HasColumnName("ORDERITEMPRICE");

                entity.Property(e => e.Orderitemquantity).HasColumnName("ORDERITEMQUANTITY");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Orderitems)
                    .HasForeignKey(d => d.Orderid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDERITE_ORDERITEM_ORDER");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Orderitems)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDERITE_ORDERITEM_PRODUCT");
            });

            modelBuilder.Entity<Paymentdatum>(entity =>
            {
                entity.HasKey(e => e.Paymentdataid)
                    .IsClustered(false);

                entity.ToTable("PAYMENTDATA");

                entity.HasIndex(e => e.Paymenttypeid, "PAYMENTDATA_FK");

                entity.Property(e => e.Paymentdataid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTDATAID");

                entity.Property(e => e.Paymentdataname)
                    .HasMaxLength(256)
                    .HasColumnName("PAYMENTDATANAME");

                entity.Property(e => e.Paymentdatatype)
                    .HasMaxLength(256)
                    .HasColumnName("PAYMENTDATATYPE");

                entity.Property(e => e.Paymenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTTYPEID");

                entity.HasOne(d => d.Paymenttype)
                    .WithMany(p => p.Paymentdata)
                    .HasForeignKey(d => d.Paymenttypeid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PAYMENTD_PAYMENTDA_PAYMENTT");
            });

            modelBuilder.Entity<Paymentdetail>(entity =>
            {
                entity.HasKey(e => new { e.Orderid, e.Paymentdataid });

                entity.ToTable("PAYMENTDETAILS");

                entity.HasIndex(e => e.Paymentdataid, "PAYMENTDETAILS2_FK");

                entity.HasIndex(e => e.Orderid, "PAYMENTDETAILS_FK");

                entity.Property(e => e.Orderid)
                    .HasMaxLength(64)
                    .HasColumnName("ORDERID");

                entity.Property(e => e.Paymentdataid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTDATAID");

                entity.Property(e => e.Paymentdetailsid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTDETAILSID");

                entity.Property(e => e.Paymentdetailsvalue)
                    .HasMaxLength(256)
                    .HasColumnName("PAYMENTDETAILSVALUE");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Paymentdetails)
                    .HasForeignKey(d => d.Orderid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PAYMENTD_PAYMENTDE_ORDER");

                entity.HasOne(d => d.Paymentdata)
                    .WithMany(p => p.Paymentdetails)
                    .HasForeignKey(d => d.Paymentdataid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PAYMENTD_PAYMENTDE_PAYMENTD");
            });

            modelBuilder.Entity<Paymenttype>(entity =>
            {
                entity.HasKey(e => e.Paymenttypeid)
                    .IsClustered(false);

                entity.ToTable("PAYMENTTYPE");

                entity.Property(e => e.Paymenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("PAYMENTTYPEID");

                entity.Property(e => e.Paymenttypename)
                    .HasMaxLength(256)
                    .HasColumnName("PAYMENTTYPENAME");
            });

            modelBuilder.Entity<Permision>(entity =>
            {
                entity.HasKey(e => e.Permisionid)
                    .IsClustered(false);

                entity.ToTable("PERMISION");

                entity.Property(e => e.Permisionid)
                    .HasMaxLength(64)
                    .HasColumnName("PERMISIONID");

                entity.Property(e => e.Permisionname)
                    .HasMaxLength(256)
                    .HasColumnName("PERMISIONNAME");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Productid)
                    .IsClustered(false);

                entity.ToTable("PRODUCT");

                entity.HasIndex(e => e.Brandid, "PRODUCT_BRAND_FK");

                entity.HasIndex(e => e.Categoryid, "PRODUCT_CATEGORY_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Brandid)
                    .HasMaxLength(64)
                    .HasColumnName("BRANDID");

                entity.Property(e => e.Categoryid)
                    .HasMaxLength(64)
                    .HasColumnName("CATEGORYID");

                entity.Property(e => e.Productcreateddate)
                    .HasColumnName("PRODUCTCREATEDDATE")
                    .HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");

                entity.Property(e => e.Productdescribe).HasColumnName("PRODUCTDESCRIBE");

                entity.Property(e => e.Productinacitve)
                    .HasColumnName("PRODUCTINACITVE")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Productname)
                    .HasMaxLength(256)
                    .HasColumnName("PRODUCTNAME");

                entity.Property(e => e.Productprice)
                    .HasColumnName("PRODUCTPRICE")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.Productquantity)
                    .HasColumnName("PRODUCTQUANTITY")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.Productsaleprice).HasColumnName("PRODUCTSALEPRICE");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Brandid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PRODUCT_PRODUCT_B_BRAND");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Categoryid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PRODUCT_PRODUCT_C_CATEGORY");
            });

            modelBuilder.Entity<Productimage>(entity =>
            {
                entity.HasKey(e => e.Productimageid)
                    .IsClustered(false);

                entity.ToTable("PRODUCTIMAGE");

                entity.HasIndex(e => e.Productid, "PRODUCT_IMAGE_FK");

                entity.Property(e => e.Productimageid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTIMAGEID")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Productimageurl).HasColumnName("PRODUCTIMAGEURL");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Productimages)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PRODUCTI_PRODUCT_I_PRODUCT");
            });

            modelBuilder.Entity<Productpricing>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("PRODUCTPRICING");

                entity.HasIndex(e => e.Productid, "PROCDUCT_PRICING_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Productpricingbase).HasColumnName("PRODUCTPRICINGBASE");

                entity.Property(e => e.Productpricingcreateddate).HasColumnName("PRODUCTPRICINGCREATEDDATE");

                entity.Property(e => e.Productpricingenddate).HasColumnName("PRODUCTPRICINGENDDATE");

                entity.Property(e => e.Productpricingid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTPRICINGID");

                entity.Property(e => e.Productpricinginactive).HasColumnName("PRODUCTPRICINGINACTIVE");

                entity.Property(e => e.Productpricingstartdate).HasColumnName("PRODUCTPRICINGSTARTDATE");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PRODUCTP_PROCDUCT__PRODUCT");
            });

            modelBuilder.Entity<Province>(entity =>
            {
                entity.HasKey(e => e.Provinceid)
                    .IsClustered(false);

                entity.ToTable("PROVINCE");

                entity.Property(e => e.Provinceid)
                    .HasMaxLength(64)
                    .HasColumnName("PROVINCEID");

                entity.Property(e => e.Provincename)
                    .HasMaxLength(128)
                    .HasColumnName("PROVINCENAME");
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.HasKey(e => e.Reviewid)
                    .IsClustered(false);

                entity.ToTable("REVIEW");

                entity.HasIndex(e => e.Customerid, "CUSTOMER_REVIEW_FK");

                entity.HasIndex(e => e.Productid, "PRODUCT_REVIEW_FK");

                entity.Property(e => e.Reviewid)
                    .HasMaxLength(64)
                    .HasColumnName("REVIEWID");

                entity.Property(e => e.Customerid)
                    .HasMaxLength(64)
                    .HasColumnName("CUSTOMERID");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Reviewcontent)
                    .HasMaxLength(512)
                    .HasColumnName("REVIEWCONTENT");

                entity.Property(e => e.Reviewcreateddate).HasColumnName("REVIEWCREATEDDATE");

                entity.Property(e => e.Reviewphoto1)
                    .HasMaxLength(512)
                    .HasColumnName("REVIEWPHOTO1");

                entity.Property(e => e.Reviewphoto2)
                    .HasMaxLength(512)
                    .HasColumnName("REVIEWPHOTO2");

                entity.Property(e => e.Reviewphoto3)
                    .HasMaxLength(512)
                    .HasColumnName("REVIEWPHOTO3");

                entity.Property(e => e.Reviewrate).HasColumnName("REVIEWRATE");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.Customerid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_REVIEW_CUSTOMER__CUSTOMER");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_REVIEW_PRODUCT_R_PRODUCT");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.Roleid)
                    .IsClustered(false);

                entity.ToTable("ROLE");

                entity.Property(e => e.Roleid)
                    .HasMaxLength(64)
                    .HasColumnName("ROLEID");

                entity.Property(e => e.Rolename)
                    .HasMaxLength(256)
                    .HasColumnName("ROLENAME");
            });

            modelBuilder.Entity<RolePermision>(entity =>
            {
                entity.HasKey(e => new { e.Roleid, e.Permisionid });

                entity.ToTable("ROLE_PERMISION");

                entity.HasIndex(e => e.Permisionid, "ROLE_PERMISION2_FK");

                entity.HasIndex(e => e.Roleid, "ROLE_PERMISION_FK");

                entity.Property(e => e.Roleid)
                    .HasMaxLength(64)
                    .HasColumnName("ROLEID");

                entity.Property(e => e.Permisionid)
                    .HasMaxLength(64)
                    .HasColumnName("PERMISIONID");

                entity.Property(e => e.Rolepermisionid)
                    .HasMaxLength(64)
                    .HasColumnName("ROLEPERMISIONID");

                entity.HasOne(d => d.Permision)
                    .WithMany(p => p.RolePermisions)
                    .HasForeignKey(d => d.Permisionid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ROLE_PER_ROLE_PERM_PERMISIO");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RolePermisions)
                    .HasForeignKey(d => d.Roleid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ROLE_PER_ROLE_PERM_ROLE");
            });

            modelBuilder.Entity<Shipmentstatus>(entity =>
            {
                entity.HasKey(e => e.Shipmentstatusid)
                    .IsClustered(false);

                entity.ToTable("SHIPMENTSTATUS");

                entity.Property(e => e.Shipmentstatusid)
                    .HasMaxLength(64)
                    .HasColumnName("SHIPMENTSTATUSID");

                entity.Property(e => e.Shipmentstatusdescription)
                    .HasMaxLength(256)
                    .HasColumnName("SHIPMENTSTATUSDESCRIPTION");

                entity.Property(e => e.Shipmentstatusname)
                    .HasMaxLength(256)
                    .HasColumnName("SHIPMENTSTATUSNAME");
            });

            modelBuilder.Entity<Shipmenttype>(entity =>
            {
                entity.HasKey(e => e.Shipmenttypeid)
                    .IsClustered(false);

                entity.ToTable("SHIPMENTTYPE");

                entity.Property(e => e.Shipmenttypeid)
                    .HasMaxLength(64)
                    .HasColumnName("SHIPMENTTYPEID");

                entity.Property(e => e.Shipmenttypename)
                    .HasMaxLength(256)
                    .HasColumnName("SHIPMENTTYPENAME");
            });

            modelBuilder.Entity<StaffRole>(entity =>
            {
                entity.HasKey(e => new { e.Staffid, e.Roleid });

                entity.ToTable("STAFF_ROLE");

                entity.HasIndex(e => e.Roleid, "STAFF_ROLE2_FK");

                entity.HasIndex(e => e.Staffid, "STAFF_ROLE_FK");

                entity.Property(e => e.Staffid)
                    .HasMaxLength(64)
                    .HasColumnName("STAFFID");

                entity.Property(e => e.Roleid)
                    .HasMaxLength(64)
                    .HasColumnName("ROLEID");

                entity.Property(e => e.Staffroleid)
                    .HasMaxLength(64)
                    .HasColumnName("STAFFROLEID");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.StaffRoles)
                    .HasForeignKey(d => d.Roleid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_STAFF_RO_STAFF_ROL_ROLE");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.StaffRoles)
                    .HasForeignKey(d => d.Staffid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_STAFF_RO_STAFF_ROL_STAFF");
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.HasKey(e => e.Supplierid)
                    .IsClustered(false);

                entity.ToTable("SUPPLIER");

                entity.Property(e => e.Supplierid)
                    .HasMaxLength(64)
                    .HasColumnName("SUPPLIERID");

                entity.Property(e => e.Supplieraddress)
                    .HasMaxLength(256)
                    .HasColumnName("SUPPLIERADDRESS");

                entity.Property(e => e.Suppliercreacteddate).HasColumnName("SUPPLIERCREACTEDDATE");

                entity.Property(e => e.Supplieremail)
                    .HasMaxLength(256)
                    .HasColumnName("SUPPLIEREMAIL");

                entity.Property(e => e.Suppliername)
                    .HasMaxLength(256)
                    .HasColumnName("SUPPLIERNAME");

                entity.Property(e => e.Supplierphonenumber)
                    .HasMaxLength(16)
                    .IsUnicode(false)
                    .HasColumnName("SUPPLIERPHONENUMBER")
                    .IsFixedLength();
            });

            modelBuilder.Entity<Voucher>(entity =>
            {
                entity.HasKey(e => e.Voucherid)
                    .IsClustered(false);

                entity.ToTable("VOUCHER");

                entity.Property(e => e.Voucherid)
                    .HasMaxLength(64)
                    .HasColumnName("VOUCHERID");

                entity.Property(e => e.Voucheravailable).HasColumnName("VOUCHERAVAILABLE");

                entity.Property(e => e.Vouchercreateddate).HasColumnName("VOUCHERCREATEDDATE");

                entity.Property(e => e.Voucherdescription)
                    .HasMaxLength(256)
                    .HasColumnName("VOUCHERDESCRIPTION");

                entity.Property(e => e.Voucherenddate).HasColumnName("VOUCHERENDDATE");

                entity.Property(e => e.Voucherinactive).HasColumnName("VOUCHERINACTIVE");

                entity.Property(e => e.Vouchermaxdiscount).HasColumnName("VOUCHERMAXDISCOUNT");

                entity.Property(e => e.Voucherminordervalue).HasColumnName("VOUCHERMINORDERVALUE");

                entity.Property(e => e.Voucherstartdate).HasColumnName("VOUCHERSTARTDATE");
            });

            modelBuilder.Entity<Ward>(entity =>
            {
                entity.HasKey(e => e.Wardid)
                    .IsClustered(false);

                entity.ToTable("WARD");

                entity.HasIndex(e => e.Districtid, "DISTRICT_WARD_FK");

                entity.Property(e => e.Wardid)
                    .HasMaxLength(64)
                    .HasColumnName("WARDID");

                entity.Property(e => e.Districtid)
                    .HasMaxLength(64)
                    .HasColumnName("DISTRICTID");

                entity.Property(e => e.Wardname)
                    .HasMaxLength(128)
                    .HasColumnName("WARDNAME");

                entity.HasOne(d => d.District)
                    .WithMany(p => p.Wards)
                    .HasForeignKey(d => d.Districtid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WARD_DISTRICT__DISTRICT");
            });

            modelBuilder.Entity<Warehousereceipt>(entity =>
            {
                entity.HasKey(e => e.Warehousereceiptid)
                    .IsClustered(false);

                entity.ToTable("WAREHOUSERECEIPT");

                entity.HasIndex(e => e.Supplierid, "WAREHOUSERECEIPT_SUPPLIER_FK");

                entity.Property(e => e.Warehousereceiptid)
                    .HasMaxLength(64)
                    .HasColumnName("WAREHOUSERECEIPTID");

                entity.Property(e => e.Supplierid)
                    .HasMaxLength(64)
                    .HasColumnName("SUPPLIERID");

                entity.Property(e => e.Warehousereceiptcreateddate).HasColumnName("WAREHOUSERECEIPTCREATEDDATE");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.Warehousereceipts)
                    .HasForeignKey(d => d.Supplierid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WAREHOUS_WAREHOUSE_SUPPLIER");
            });

            modelBuilder.Entity<Warehousereceiptitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Warehousereceiptid });

                entity.ToTable("WAREHOUSERECEIPTITEM");

                entity.HasIndex(e => e.Warehousereceiptid, "WAREHOUSERECEIPTITEM2_FK");

                entity.HasIndex(e => e.Productid, "WAREHOUSERECEIPTITEM_FK");

                entity.Property(e => e.Productid)
                    .HasMaxLength(64)
                    .HasColumnName("PRODUCTID");

                entity.Property(e => e.Warehousereceiptid)
                    .HasMaxLength(64)
                    .HasColumnName("WAREHOUSERECEIPTID");

                entity.Property(e => e.Warehousereceiptitemid)
                    .HasMaxLength(64)
                    .HasColumnName("WAREHOUSERECEIPTITEMID");

                entity.Property(e => e.Warehousereceiptitemprice).HasColumnName("WAREHOUSERECEIPTITEMPRICE");

                entity.Property(e => e.Warehousereceiptitemquantity).HasColumnName("WAREHOUSERECEIPTITEMQUANTITY");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Warehousereceiptitems)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WAREHOUS_WAREHOUSE_PRODUCT");

                entity.HasOne(d => d.Warehousereceipt)
                    .WithMany(p => p.Warehousereceiptitems)
                    .HasForeignKey(d => d.Warehousereceiptid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WAREHOUS_WAREHOUSE_WAREHOUS");
            });

            modelBuilder.Entity<staff>(entity =>
            {
                entity.HasKey(e => e.Staffid)
                    .IsClustered(false);

                entity.ToTable("STAFF");

                entity.HasIndex(e => e.Warehousereceiptid, "STAFF_WAREHOUSERECEIPT_FK");

                entity.Property(e => e.Staffid)
                    .HasMaxLength(64)
                    .HasColumnName("STAFFID");

                entity.Property(e => e.Staffcreareddate).HasColumnName("STAFFCREAREDDATE");

                entity.Property(e => e.Staffemail)
                    .HasMaxLength(256)
                    .HasColumnName("STAFFEMAIL");

                entity.Property(e => e.Staffgender).HasColumnName("STAFFGENDER");

                entity.Property(e => e.Staffidentification)
                    .HasMaxLength(16)
                    .HasColumnName("STAFFIDENTIFICATION");

                entity.Property(e => e.Staffname)
                    .HasMaxLength(256)
                    .HasColumnName("STAFFNAME");

                entity.Property(e => e.Staffpassword)
                    .HasMaxLength(256)
                    .HasColumnName("STAFFPASSWORD");

                entity.Property(e => e.Staffphonenumber)
                    .HasMaxLength(16)
                    .HasColumnName("STAFFPHONENUMBER");

                entity.Property(e => e.Staffusername)
                    .HasMaxLength(256)
                    .HasColumnName("STAFFUSERNAME");

                entity.Property(e => e.Warehousereceiptid)
                    .HasMaxLength(64)
                    .HasColumnName("WAREHOUSERECEIPTID");

                entity.HasOne(d => d.Warehousereceipt)
                    .WithMany(p => p.staff)
                    .HasForeignKey(d => d.Warehousereceiptid)
                    .HasConstraintName("FK_STAFF_STAFF_WAR_WAREHOUS");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
