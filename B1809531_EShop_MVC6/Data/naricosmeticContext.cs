using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using B1809531_EShop_MVC6.Entities;

namespace B1809531_EShop_MVC6.Data
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
                entity.Property(e => e.Bannercreateddate).HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.HasKey(e => e.Blogid)
                    .IsClustered(false);
            });

            modelBuilder.Entity<Blogcomment>(entity =>
            {
                entity.HasKey(e => e.Blogcommentid)
                    .IsClustered(false);

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

                entity.Property(e => e.Brandid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Brandcreateddate).HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasKey(e => e.Cartid)
                    .IsClustered(false);
            });

            modelBuilder.Entity<Cartitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Cartid });

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

                entity.Property(e => e.Categoryid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Categorycreateddate).HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");
            });

            modelBuilder.Entity<Categorydiscount>(entity =>
            {
                entity.HasKey(e => e.Categorydiscountid)
                    .IsClustered(false);

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

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => e.Orderid)
                    .IsClustered(false);

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

                entity.HasOne(d => d.Paymenttype)
                    .WithMany(p => p.Paymentdata)
                    .HasForeignKey(d => d.Paymenttypeid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PAYMENTD_PAYMENTDA_PAYMENTT");
            });

            modelBuilder.Entity<Paymentdetail>(entity =>
            {
                entity.HasKey(e => new { e.Orderid, e.Paymentdataid });

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
            });

            modelBuilder.Entity<Permision>(entity =>
            {
                entity.HasKey(e => e.Permisionid)
                    .IsClustered(false);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Productid)
                    .IsClustered(false);

                entity.Property(e => e.Productid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Productcode).ValueGeneratedOnAdd()
                .Metadata.SetAfterSaveBehavior(PropertySaveBehavior.Ignore); ;

                entity.Property(e => e.Productcreateddate).HasDefaultValueSql("(datediff_big(millisecond,'1970-01-01 00:00:00',getdate()))");

                entity.Property(e => e.Productinacitve).HasDefaultValueSql("((1))");

                entity.Property(e => e.Productprice).HasDefaultValueSql("((0))");

                entity.Property(e => e.Productquantity).HasDefaultValueSql("((0))");

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

                entity.Property(e => e.Productimageid).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Productimages)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PRODUCTI_PRODUCT_I_PRODUCT");
            });

            modelBuilder.Entity<Productpricing>(entity =>
            {
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
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.HasKey(e => e.Reviewid)
                    .IsClustered(false);

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
            });

            modelBuilder.Entity<RolePermision>(entity =>
            {
                entity.HasKey(e => new { e.Roleid, e.Permisionid });

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
            });

            modelBuilder.Entity<Shipmenttype>(entity =>
            {
                entity.HasKey(e => e.Shipmenttypeid)
                    .IsClustered(false);
            });

            modelBuilder.Entity<StaffRole>(entity =>
            {
                entity.HasKey(e => new { e.Staffid, e.Roleid });

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

                entity.Property(e => e.Supplierphonenumber).IsFixedLength();
            });

            modelBuilder.Entity<Voucher>(entity =>
            {
                entity.HasKey(e => e.Voucherid)
                    .IsClustered(false);
            });

            modelBuilder.Entity<Ward>(entity =>
            {
                entity.HasKey(e => e.Wardid)
                    .IsClustered(false);

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

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.Warehousereceipts)
                    .HasForeignKey(d => d.Supplierid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WAREHOUS_WAREHOUSE_SUPPLIER");
            });

            modelBuilder.Entity<Warehousereceiptitem>(entity =>
            {
                entity.HasKey(e => new { e.Productid, e.Warehousereceiptid });

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
