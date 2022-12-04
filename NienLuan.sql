/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     12/4/2022 10:37:50 AM                        */
/*==============================================================*/
drop database nienluan
--GO
--create database nienluan
--go
--use nienluan
--go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CART') and o.name = 'FK_CART_CUSTOMER__CUSTOMER')
alter table CART
   drop constraint FK_CART_CUSTOMER__CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARTDETAIL') and o.name = 'FK_CARTDETA_CARTDETAI_CART')
alter table CARTDETAIL
   drop constraint FK_CARTDETA_CARTDETAI_CART
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARTDETAIL') and o.name = 'FK_CARTDETA_CARTDETAI_PRODUCT')
alter table CARTDETAIL
   drop constraint FK_CARTDETA_CARTDETAI_PRODUCT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CUSTOMER') and o.name = 'FK_CUSTOMER_CUSTOMER__WARD')
alter table CUSTOMER
   drop constraint FK_CUSTOMER_CUSTOMER__WARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INVOICE') and o.name = 'FK_INVOICE_CUSTOMER__CUSTOMER')
alter table INVOICE
   drop constraint FK_INVOICE_CUSTOMER__CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INVOICE') and o.name = 'FK_INVOICE_ORDER_INV_ORDER')
alter table INVOICE
   drop constraint FK_INVOICE_ORDER_INV_ORDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INVOICE') and o.name = 'FK_INVOICE_STAFF_INV_STAFF')
alter table INVOICE
   drop constraint FK_INVOICE_STAFF_INV_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INVOICEDETAIL') and o.name = 'FK_INVOICED_INVOICEDE_INVOICE')
alter table INVOICEDETAIL
   drop constraint FK_INVOICED_INVOICEDE_INVOICE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INVOICEDETAIL') and o.name = 'FK_INVOICED_INVOICEDE_PRODUCT')
alter table INVOICEDETAIL
   drop constraint FK_INVOICED_INVOICEDE_PRODUCT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_CUSTOMER__CUSTOMER')
alter table "ORDER"
   drop constraint FK_ORDER_CUSTOMER__CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_ORDER_STA_ORDERSTA')
alter table "ORDER"
   drop constraint FK_ORDER_ORDER_STA_ORDERSTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_STAFF_ORD_STAFF')
alter table "ORDER"
   drop constraint FK_ORDER_STAFF_ORD_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDERDETAIL') and o.name = 'FK_ORDERDET_ORDERDETA_ORDER')
alter table ORDERDETAIL
   drop constraint FK_ORDERDET_ORDERDETA_ORDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDERDETAIL') and o.name = 'FK_ORDERDET_ORDERDETA_PRODUCT')
alter table ORDERDETAIL
   drop constraint FK_ORDERDET_ORDERDETA_PRODUCT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCT') and o.name = 'FK_PRODUCT_CATEGORY__CATEGORY')
alter table PRODUCT
   drop constraint FK_PRODUCT_CATEGORY__CATEGORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCT') and o.name = 'FK_PRODUCT_PRODUCT_B_BRAND')
alter table PRODUCT
   drop constraint FK_PRODUCT_PRODUCT_B_BRAND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTIMAGE') and o.name = 'FK_PRODUCTI_PRODUCT_I_PRODUCT')
alter table PRODUCTIMAGE
   drop constraint FK_PRODUCTI_PRODUCT_I_PRODUCT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROVINCE') and o.name = 'FK_PROVINCE_PROVINCE__DISTRICT')
alter table PROVINCE
   drop constraint FK_PROVINCE_PROVINCE__DISTRICT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAFF') and o.name = 'FK_STAFF_STAFF_ROL_ROLE')
alter table STAFF
   drop constraint FK_STAFF_STAFF_ROL_ROLE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUPPLIER') and o.name = 'FK_SUPPLIER_SUPLIER_W_WARD')
alter table SUPPLIER
   drop constraint FK_SUPPLIER_SUPLIER_W_WARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WARD') and o.name = 'FK_WARD_WARD_PROV_PROVINCE')
alter table WARD
   drop constraint FK_WARD_WARD_PROV_PROVINCE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WAREHOUSERECEIPT') and o.name = 'FK_WAREHOUS_STAFF_WRR_STAFF')
alter table WAREHOUSERECEIPT
   drop constraint FK_WAREHOUS_STAFF_WRR_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WAREHOUSERECEIPT') and o.name = 'FK_WAREHOUS_SUPPLIER__SUPPLIER')
alter table WAREHOUSERECEIPT
   drop constraint FK_WAREHOUS_SUPPLIER__SUPPLIER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WAREHOUSERECEIPTDETAIL') and o.name = 'FK_WAREHOUS_WAREHOUSE_WAREHOUS')
alter table WAREHOUSERECEIPTDETAIL
   drop constraint FK_WAREHOUS_WAREHOUSE_WAREHOUS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WAREHOUSERECEIPTDETAIL') and o.name = 'FK_WAREHOUS_WAREHOUSE_PRODUCT')
alter table WAREHOUSERECEIPTDETAIL
   drop constraint FK_WAREHOUS_WAREHOUSE_PRODUCT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BRAND')
            and   type = 'U')
   drop table BRAND
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CART')
            and   name  = 'CUSTOMER_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CART.CUSTOMER_CARD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CART')
            and   type = 'U')
   drop table CART
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARTDETAIL')
            and   name  = 'CARTDETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARTDETAIL.CARTDETAIL2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARTDETAIL')
            and   name  = 'CARTDETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARTDETAIL.CARTDETAIL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARTDETAIL')
            and   type = 'U')
   drop table CARTDETAIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORY')
            and   type = 'U')
   drop table CATEGORY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CUSTOMER')
            and   name  = 'CUSTOMER_WARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CUSTOMER.CUSTOMER_WARD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DISTRICT')
            and   type = 'U')
   drop table DISTRICT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INVOICE')
            and   name  = 'CUSTOMER_INVOICE_FK'
            and   indid > 0
            and   indid < 255)
   drop index INVOICE.CUSTOMER_INVOICE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INVOICE')
            and   name  = 'STAFF_INVOICE_FK'
            and   indid > 0
            and   indid < 255)
   drop index INVOICE.STAFF_INVOICE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INVOICE')
            and   name  = 'ORDER_INVOICE_FK'
            and   indid > 0
            and   indid < 255)
   drop index INVOICE.ORDER_INVOICE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INVOICE')
            and   type = 'U')
   drop table INVOICE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INVOICEDETAIL')
            and   name  = 'INVOICEDETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index INVOICEDETAIL.INVOICEDETAIL2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INVOICEDETAIL')
            and   name  = 'INVOICEDETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index INVOICEDETAIL.INVOICEDETAIL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INVOICEDETAIL')
            and   type = 'U')
   drop table INVOICEDETAIL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'CUSTOMER_ORDER_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".CUSTOMER_ORDER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'STAFF_ORDER_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".STAFF_ORDER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'ORDER_STATUS_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".ORDER_STATUS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"ORDER"')
            and   type = 'U')
   drop table "ORDER"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDERDETAIL')
            and   name  = 'ORDERDETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDERDETAIL.ORDERDETAIL2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDERDETAIL')
            and   name  = 'ORDERDETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDERDETAIL.ORDERDETAIL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ORDERDETAIL')
            and   type = 'U')
   drop table ORDERDETAIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ORDERSTATUS')
            and   type = 'U')
   drop table ORDERSTATUS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT')
            and   name  = 'CATEGORY_PRODUCT_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT.CATEGORY_PRODUCT_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT')
            and   name  = 'PRODUCT_BRAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT.PRODUCT_BRAND_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCT')
            and   type = 'U')
   drop table PRODUCT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTIMAGE')
            and   name  = 'PRODUCT_IMAGE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTIMAGE.PRODUCT_IMAGE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTIMAGE')
            and   type = 'U')
   drop table PRODUCTIMAGE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROVINCE')
            and   name  = 'PROVINCE_DISTRICT_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROVINCE.PROVINCE_DISTRICT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVINCE')
            and   type = 'U')
   drop table PROVINCE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROLE')
            and   type = 'U')
   drop table ROLE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAFF')
            and   name  = 'STAFF_ROLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAFF.STAFF_ROLE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STAFF')
            and   type = 'U')
   drop table STAFF
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUPPLIER')
            and   name  = 'SUPLIER_WARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUPPLIER.SUPLIER_WARD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUPPLIER')
            and   type = 'U')
   drop table SUPPLIER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WARD')
            and   name  = 'WARD_PROVINCE_FK'
            and   indid > 0
            and   indid < 255)
   drop index WARD.WARD_PROVINCE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WARD')
            and   type = 'U')
   drop table WARD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WAREHOUSERECEIPT')
            and   name  = 'STAFF_WRRECEIPT_FK'
            and   indid > 0
            and   indid < 255)
   drop index WAREHOUSERECEIPT.STAFF_WRRECEIPT_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WAREHOUSERECEIPT')
            and   name  = 'SUPPLIER_WAREHOUSE_FK'
            and   indid > 0
            and   indid < 255)
   drop index WAREHOUSERECEIPT.SUPPLIER_WAREHOUSE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WAREHOUSERECEIPT')
            and   type = 'U')
   drop table WAREHOUSERECEIPT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WAREHOUSERECEIPTDETAIL')
            and   name  = 'WAREHOUSERECEIPTDETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index WAREHOUSERECEIPTDETAIL.WAREHOUSERECEIPTDETAIL2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WAREHOUSERECEIPTDETAIL')
            and   name  = 'WAREHOUSERECEIPTDETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index WAREHOUSERECEIPTDETAIL.WAREHOUSERECEIPTDETAIL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WAREHOUSERECEIPTDETAIL')
            and   type = 'U')
   drop table WAREHOUSERECEIPTDETAIL
go

/*==============================================================*/
/* Table: BRAND                                                 */
/*==============================================================*/
create table BRAND (
   BRANDID              nvarchar(64)          not null DEFAULT (newid()),
   BRANDNAME            nvarchar(256)         null,
   BRANDCREATEDDATE     bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   BRANDIMAGE           nvarchar(256)         null,
   constraint PK_BRAND primary key nonclustered (BRANDID)
)
go

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
create table CART (
   CARTID               nvarchar(64)          not null DEFAULT (newid()),
   CUSTOMERID           nvarchar(64)          null,
   CARTQUANTITY         int                  DEFAULT 0,
   constraint PK_CART primary key nonclustered (CARTID)
)
go

/*==============================================================*/
/* Index: CUSTOMER_CARD_FK                                      */
/*==============================================================*/
create index CUSTOMER_CARD_FK on CART (
CUSTOMERID ASC
)
go

/*==============================================================*/
/* Table: CARTDETAIL                                            */
/*==============================================================*/
create table CARTDETAIL (
   CARTID               nvarchar(64)          not null ,
   PRODUCTID            nvarchar(64)          not null,
  CARTDETAILID      nvarchar(64)           not null DEFAULT (newid()),
   CARTDETAILQUANTITY int                  null DEFAULT 0,
   CARTDETAILPRICE   int                  null DEFAULT 0,
   constraint PK_CARTDETAIL primary key (CARTDETAILID)
)
go

/*==============================================================*/
/* Index: CARTDETAIL_FK                                         */
/*==============================================================*/
create index CARTDETAIL_FK on CARTDETAIL (
CARTID ASC
)
go

/*==============================================================*/
/* Index: CARTDETAIL2_FK                                        */
/*==============================================================*/
create index CARTDETAIL2_FK on CARTDETAIL (
PRODUCTID ASC
)
go

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY (
   CATEGORYID           nvarchar(64)          not null DEFAULT (newid()),
   CATEGORYNAME         nvarchar(256)         null,
   CATEGORYCREATEDDATE bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   CATEGORYIMAGE        nvarchar(256)         null,
   constraint PK_CATEGORY primary key nonclustered (CATEGORYID)
)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CUSTOMERID           nvarchar(64)          not null DEFAULT (newid()),
   WARDID               nvarchar(64)          not null,
   CUSTOMERNAME         nvarchar(128)         null,
   CUSTOMERGENDER       bit                  null,
   CUSTIOMERCREATEDDATE bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   CUSTOMERPHONENUMBER  nvarchar(16)          null,
   CUSTOMERADDRESS      nvarchar(256)         null,
   CUSTOMEREMAIL        nvarchar(128)         null,
   CUSTOMEREMAILCONFIRM nvarchar(128)         null,
   CUSTOMERUSERNAME     nvarchar(128)         null,
   CUSTOMERPASSWORD    nvarchar(256)         null,
   CUSTOMERAVATAR       nvarchar(256)         null,
   CUSTOMERINACTIVE     bit                  null,
   constraint PK_CUSTOMER primary key nonclustered (CUSTOMERID)
)
go

/*==============================================================*/
/* Index: CUSTOMER_WARD_FK                                      */
/*==============================================================*/
create index CUSTOMER_WARD_FK on CUSTOMER (
WARDID ASC
)
go

/*==============================================================*/
/* Table: DISTRICT                                              */
/*==============================================================*/
create table DISTRICT (
   DISTRICTID           nvarchar(64)          not null DEFAULT (newid()),
   DISTRICTNAME         nvarchar(128)         null,
   constraint PK_DISTRICT primary key nonclustered (DISTRICTID)
)
go

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE (
   INVOICEID            nvarchar(64)          not null DEFAULT (newid()),
   STAFFID              nvarchar(64)          null,
   CUSTOMERID           nvarchar(64)          not null,
   ORDERID              nvarchar(64)          not null,
   INVOICECREATEDDATE   bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   INVOICETRACKINGCODE  nvarchar(128)         null,
   INVOICEADRESS        nvarchar(256)         null,
   INVOICESHIPCOST      nvarchar(256)         null,
   constraint PK_INVOICE primary key nonclustered (INVOICEID)
)
go

/*==============================================================*/
/* Index: ORDER_INVOICE_FK                                      */
/*==============================================================*/
create index ORDER_INVOICE_FK on INVOICE (
ORDERID ASC
)
go

/*==============================================================*/
/* Index: STAFF_INVOICE_FK                                      */
/*==============================================================*/
create index STAFF_INVOICE_FK on INVOICE (
STAFFID ASC
)
go

/*==============================================================*/
/* Index: CUSTOMER_INVOICE_FK                                   */
/*==============================================================*/
create index CUSTOMER_INVOICE_FK on INVOICE (
CUSTOMERID ASC
)
go

/*==============================================================*/
/* Table: INVOICEDETAIL                                         */
/*==============================================================*/
create table INVOICEDETAIL (
   INVOICEID            nvarchar(64)          not null ,
   PRODUCTID            nvarchar(64)          not null,
   INVOICEDETAILID      nvarchar(64)          not null DEFAULT (newid()),
   INVOICEDETAILQUANTITY int                  null,
   INVOICEDETAILPRICE   int                  null,
   constraint PK_INVOICEDETAIL primary key (INVOICEDetailID)
)
go

/*==============================================================*/
/* Index: INVOICEDETAIL_FK                                      */
/*==============================================================*/
create index INVOICEDETAIL_FK on INVOICEDETAIL (
INVOICEID ASC
)
go

/*==============================================================*/
/* Index: INVOICEDETAIL2_FK                                     */
/*==============================================================*/
create index INVOICEDETAIL2_FK on INVOICEDETAIL (
PRODUCTID ASC
)
go

/*==============================================================*/
/* Table: "ORDER"                                               */
/*==============================================================*/
create table "ORDER" (
   ORDERID              nvarchar(64)          not null DEFAULT (newid()),
   STAFFID              nvarchar(64)          null,
   ORDERSTATUSID        int                  not null,
   CUSTOMERID           nvarchar(64)          not null,
   ORDERCREATEDDATE     bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   ORDERTRACKINGCODE    nvarchar(128)         null,
   ORDERADRESS          nvarchar(256)         null,
   ORDERSHIPCOST        int                  null,
   constraint PK_ORDER primary key nonclustered (ORDERID)
)
go

/*==============================================================*/
/* Index: ORDER_STATUS_FK                                       */
/*==============================================================*/
create index ORDER_STATUS_FK on "ORDER" (
ORDERSTATUSID ASC
)
go

/*==============================================================*/
/* Index: STAFF_ORDER_FK                                        */
/*==============================================================*/
create index STAFF_ORDER_FK on "ORDER" (
STAFFID ASC
)
go

/*==============================================================*/
/* Index: CUSTOMER_ORDER_FK                                     */
/*==============================================================*/
create index CUSTOMER_ORDER_FK on "ORDER" (
CUSTOMERID ASC
)
go

/*==============================================================*/
/* Table: ORDERDETAIL                                           */
/*==============================================================*/
create table ORDERDETAIL (
   ORDERID              nvarchar(64)          not null ,
   PRODUCTID            nvarchar(64)          not null,
   ORDERDETAILID      nvarchar(64)          not null DEFAULT (newid()),
   ORDERDETAILQUANTITY int                  null,
  ORDERDETAILPRICE   int                  null,
   constraint PK_ORDERDETAIL primary key (ORDERdetailid)
)
go

/*==============================================================*/
/* Index: ORDERDETAIL_FK                                        */
/*==============================================================*/
create index ORDERDETAIL_FK on ORDERDETAIL (
ORDERID ASC
)
go

/*==============================================================*/
/* Index: ORDERDETAIL2_FK                                       */
/*==============================================================*/
create index ORDERDETAIL2_FK on ORDERDETAIL (
PRODUCTID ASC
)
go

/*==============================================================*/
/* Table: ORDERSTATUS                                           */
/*==============================================================*/
create table ORDERSTATUS (
   ORDERSTATUSID        int                  not null DEFAULT (newid()),
   ORDERSTATUSNAME      nvarchar(256)         null,
   constraint PK_ORDERSTATUS primary key nonclustered (ORDERSTATUSID)
)
go

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   PRODUCTID            nvarchar(64)          not null DEFAULT (newid()),
   CATEGORYID           nvarchar(64)          not null,
   BRANDID              nvarchar(64)          not null,
   PRODUCTNAME          nvarchar(256)         null,
   PRODUCTDESCRIBE      nvarchar(max)        null,
   PRODUCTPRICE			int                  null,
   PRODUCTSALEPRICE		int                  null,
   PRODUCTQUANTITY      int                  null,
   PRODUCTCREATEDDATE   bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   PRODUCTINACITVE      bit                  null,
   PRODUCTCODE			int					identity(100,1),
   PRODUCTISHOT			bit					null,
   constraint PK_PRODUCT primary key nonclustered (PRODUCTID)
)
go

/*==============================================================*/
/* Index: PRODUCT_BRAND_FK                                      */
/*==============================================================*/
create index PRODUCT_BRAND_FK on PRODUCT (
BRANDID ASC
)
go

/*==============================================================*/
/* Index: CATEGORY_PRODUCT_FK                                   */
/*==============================================================*/
create index CATEGORY_PRODUCT_FK on PRODUCT (
CATEGORYID ASC
)
go

/*==============================================================*/
/* Table: PRODUCTIMAGE                                          */
/*==============================================================*/
create table PRODUCTIMAGE (
   PRODUCTIMAGEID       nvarchar(64)          not null DEFAULT (newid()),
   PRODUCTID            nvarchar(64)          not null,
   PRODUCTIMAGEURL      nvarchar(1024)        null,
   constraint PK_PRODUCTIMAGE primary key nonclustered (PRODUCTIMAGEID)
)
go

/*==============================================================*/
/* Index: PRODUCT_IMAGE_FK                                      */
/*==============================================================*/
create index PRODUCT_IMAGE_FK on PRODUCTIMAGE (
PRODUCTID ASC
)
go

/*==============================================================*/
/* Table: PROVINCE                                              */
/*==============================================================*/
create table PROVINCE (
   PROVINCEID           nvarchar(64)          not null DEFAULT (newid()),
   DISTRICTID           nvarchar(64)          not null,
   PROVINCENAME         nvarchar(128)         null,
   constraint PK_PROVINCE primary key nonclustered (PROVINCEID)
)
go

/*==============================================================*/
/* Index: PROVINCE_DISTRICT_FK                                  */
/*==============================================================*/
create index PROVINCE_DISTRICT_FK on PROVINCE (
DISTRICTID ASC
)
go

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ROLEID               nvarchar(64)          not null DEFAULT (newid()),
   ROLENAME             nvarchar(256)         null,
   constraint PK_ROLE primary key nonclustered (ROLEID)
)
go

/*==============================================================*/
/* Table: STAFF                                                 */
/*==============================================================*/
create table STAFF (
   STAFFID              nvarchar(64)          not null DEFAULT (newid()),
   ROLEID               nvarchar(64)          not null,
   STAFFNAME            nvarchar(128)         null,
   STAFFGENDER          int                  null,
   STAFFPHONENUMBER     nvarchar(16)          null,
   STAFFEMAIL           nvarchar(256)         null,
   STAFFCREAREDDATE     bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   STAFFLOGINNAME       nvarchar(128)         null,
   STAFFPASSWORD        nvarchar(256)         null,
   STAFFINACTIVE        bit                  null,
   constraint PK_STAFF primary key nonclustered (STAFFID)
)
go

/*==============================================================*/
/* Index: STAFF_ROLE_FK                                         */
/*==============================================================*/
create index STAFF_ROLE_FK on STAFF (
ROLEID ASC
)
go

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER (
   SUPPLIERID           nvarchar(64)          not null DEFAULT (newid()), 
   WARDID               nvarchar(64)          not null,
   SUPPLIERNAME         nvarchar(256)         null,
   SUPPLIEREMAIL        nvarchar(256)         null,
   SUPPLIERPHONENUMBER  char(16)             null,
   SUPPLIERADDRESS      nvarchar(256)         null,
   SUPPLIERCREACTEDDATE bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   constraint PK_SUPPLIER primary key nonclustered (SUPPLIERID)
)
go

/*==============================================================*/
/* Index: SUPLIER_WARD_FK                                       */
/*==============================================================*/
create index SUPLIER_WARD_FK on SUPPLIER (
WARDID ASC
)
go

/*==============================================================*/
/* Table: WARD                                                  */
/*==============================================================*/
create table WARD (
   WARDID               nvarchar(64)          not null DEFAULT (newid()),
   PROVINCEID           nvarchar(64)          not null,
   WARDNAME             nvarchar(128)         null,
   constraint PK_WARD primary key nonclustered (WARDID)
)
go

/*==============================================================*/
/* Index: WARD_PROVINCE_FK                                      */
/*==============================================================*/
create index WARD_PROVINCE_FK on WARD (
PROVINCEID ASC
)
go

/*==============================================================*/
/* Table: WAREHOUSERECEIPT                                      */
/*==============================================================*/
create table WAREHOUSERECEIPT (
   WAREHOUSERECEIPTID   nvarchar(64)          not null DEFAULT (newid()),
   STAFFID              nvarchar(64)          null,
   SUPPLIERID           nvarchar(64)          not null,
   WAREHOUSERECEIPTCREATEDDATE bigint               null DEFAULT (datediff_big(millisecond,'1970-01-01 00:00:00',getdate())),
   constraint PK_WAREHOUSERECEIPT primary key nonclustered (WAREHOUSERECEIPTID)
)
go

/*==============================================================*/
/* Index: SUPPLIER_WAREHOUSE_FK                                 */
/*==============================================================*/
create index SUPPLIER_WAREHOUSE_FK on WAREHOUSERECEIPT (
SUPPLIERID ASC
)
go

/*==============================================================*/
/* Index: STAFF_WRRECEIPT_FK                                    */
/*==============================================================*/
create index STAFF_WRRECEIPT_FK on WAREHOUSERECEIPT (
STAFFID ASC
)
go

/*==============================================================*/
/* Table: WAREHOUSERECEIPTDETAIL                                */
/*==============================================================*/
create table WAREHOUSERECEIPTDETAIL (
   WAREHOUSERECEIPTID   nvarchar(64)          not null,
   PRODUCTID            nvarchar(64)          not null,
   WRDETAILID           nvarchar(64)          not null DEFAULT (newid()),
   WRDETAILQUATITY      int                  null,
   WRDETAILPRICE        int                  null,
   constraint PK_WAREHOUSERECEIPTDETAIL primary key ( WRDETAILID)
)
go

/*==============================================================*/
/* Index: WAREHOUSERECEIPTDETAIL_FK                             */
/*==============================================================*/
create index WAREHOUSERECEIPTDETAIL_FK on WAREHOUSERECEIPTDETAIL (
WAREHOUSERECEIPTID ASC
)
go

/*==============================================================*/
/* Index: WAREHOUSERECEIPTDETAIL2_FK                            */
/*==============================================================*/
create index WAREHOUSERECEIPTDETAIL2_FK on WAREHOUSERECEIPTDETAIL (
PRODUCTID ASC
)
go

alter table CART
   add constraint FK_CART_CUSTOMER__CUSTOMER foreign key (CUSTOMERID)
      references CUSTOMER (CUSTOMERID)
go

alter table CARTDETAIL
   add constraint FK_CARTDETA_CARTDETAI_CART foreign key (CARTID)
      references CART (CARTID)
go

alter table CARTDETAIL
   add constraint FK_CARTDETA_CARTDETAI_PRODUCT foreign key (PRODUCTID)
      references PRODUCT (PRODUCTID)
go

alter table CUSTOMER
   add constraint FK_CUSTOMER_CUSTOMER__WARD foreign key (WARDID)
      references WARD (WARDID)
go

alter table INVOICE
   add constraint FK_INVOICE_CUSTOMER__CUSTOMER foreign key (CUSTOMERID)
      references CUSTOMER (CUSTOMERID)
go

alter table INVOICE
   add constraint FK_INVOICE_ORDER_INV_ORDER foreign key (ORDERID)
      references "ORDER" (ORDERID)
go

alter table INVOICE
   add constraint FK_INVOICE_STAFF_INV_STAFF foreign key (STAFFID)
      references STAFF (STAFFID)
go

alter table INVOICEDETAIL
   add constraint FK_INVOICED_INVOICEDE_INVOICE foreign key (INVOICEID)
      references INVOICE (INVOICEID)
go

alter table INVOICEDETAIL
   add constraint FK_INVOICED_INVOICEDE_PRODUCT foreign key (PRODUCTID)
      references PRODUCT (PRODUCTID)
go

alter table "ORDER"
   add constraint FK_ORDER_CUSTOMER__CUSTOMER foreign key (CUSTOMERID)
      references CUSTOMER (CUSTOMERID)
go

alter table "ORDER"
   add constraint FK_ORDER_ORDER_STA_ORDERSTA foreign key (ORDERSTATUSID)
      references ORDERSTATUS (ORDERSTATUSID)
go

alter table "ORDER"
   add constraint FK_ORDER_STAFF_ORD_STAFF foreign key (STAFFID)
      references STAFF (STAFFID)
go

alter table ORDERDETAIL
   add constraint FK_ORDERDET_ORDERDETA_ORDER foreign key (ORDERID)
      references "ORDER" (ORDERID)
go

alter table ORDERDETAIL
   add constraint FK_ORDERDET_ORDERDETA_PRODUCT foreign key (PRODUCTID)
      references PRODUCT (PRODUCTID)
go

alter table PRODUCT
   add constraint FK_PRODUCT_CATEGORY__CATEGORY foreign key (CATEGORYID)
      references CATEGORY (CATEGORYID)
go

alter table PRODUCT
   add constraint FK_PRODUCT_PRODUCT_B_BRAND foreign key (BRANDID)
      references BRAND (BRANDID)
go

alter table PRODUCTIMAGE
   add constraint FK_PRODUCTI_PRODUCT_I_PRODUCT foreign key (PRODUCTID)
      references PRODUCT (PRODUCTID)
go

alter table PROVINCE
   add constraint FK_PROVINCE_PROVINCE__DISTRICT foreign key (DISTRICTID)
      references DISTRICT (DISTRICTID)
go

alter table STAFF
   add constraint FK_STAFF_STAFF_ROL_ROLE foreign key (ROLEID)
      references ROLE (ROLEID)
go

alter table SUPPLIER
   add constraint FK_SUPPLIER_SUPLIER_W_WARD foreign key (WARDID)
      references WARD (WARDID)
go

alter table WARD
   add constraint FK_WARD_WARD_PROV_PROVINCE foreign key (PROVINCEID)
      references PROVINCE (PROVINCEID)
go

alter table WAREHOUSERECEIPT
   add constraint FK_WAREHOUS_STAFF_WRR_STAFF foreign key (STAFFID)
      references STAFF (STAFFID)
go

alter table WAREHOUSERECEIPT
   add constraint FK_WAREHOUS_SUPPLIER__SUPPLIER foreign key (SUPPLIERID)
      references SUPPLIER (SUPPLIERID)
go

alter table WAREHOUSERECEIPTDETAIL
   add constraint FK_WAREHOUS_WAREHOUSE_WAREHOUS foreign key (WAREHOUSERECEIPTID)
      references WAREHOUSERECEIPT (WAREHOUSERECEIPTID)
go

alter table WAREHOUSERECEIPTDETAIL
   add constraint FK_WAREHOUS_WAREHOUSE_PRODUCT foreign key (PRODUCTID)
      references PRODUCT (PRODUCTID)
go

GO
INSERT [dbo].[BRAND] ([BRANDID], [BRANDNAME], [BRANDCREATEDDATE], [BRANDIMAGE]) VALUES (N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'Lancome', 1668802424110, N'677afbcc-27b2-4110-b6f8-2f819558db2c.jpg')
INSERT [dbo].[BRAND] ([BRANDID], [BRANDNAME], [BRANDCREATEDDATE], [BRANDIMAGE]) VALUES (N'A31D98D2-1410-445C-BD93-ADB94EABADD9', N'Estee Lauder', 1669189471713, N'c661b385-b6b8-4b45-89ad-4802edcad4df.jpg')
INSERT [dbo].[BRAND] ([BRANDID], [BRANDNAME], [BRANDCREATEDDATE], [BRANDIMAGE]) VALUES (N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'La Roche-Posay', 1668186982480, N'laroche.png')
INSERT [dbo].[BRAND] ([BRANDID], [BRANDNAME], [BRANDCREATEDDATE], [BRANDIMAGE]) VALUES (N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N' Kiehl''s', 1668186982480, N'kiehls.jpg')
INSERT [dbo].[BRAND] ([BRANDID], [BRANDNAME], [BRANDCREATEDDATE], [BRANDIMAGE]) VALUES (N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'Obagi', 1668186988480, N'obagi.jpeg')
GO
INSERT [dbo].[CATEGORY] ([CATEGORYID], [CATEGORYNAME], [CATEGORYCREATEDDATE], [CATEGORYIMAGE]) VALUES (N'0B8C35C4-02C7-45D9-9D16-9CB6C2D2DCFC', N'Toner / Nước hoa hồng', 1668804305306, N'c781cb36-2da3-4e85-b4aa-b6d75c499380.png')
INSERT [dbo].[CATEGORY] ([CATEGORYID], [CATEGORYNAME], [CATEGORYCREATEDDATE], [CATEGORYIMAGE]) VALUES (N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa rửa mặt', 1668044438206, N'6e104231-4ad9-4d1e-ba30-8f2acffc37fb.png')
INSERT [dbo].[CATEGORY] ([CATEGORYID], [CATEGORYNAME], [CATEGORYCREATEDDATE], [CATEGORYIMAGE]) VALUES (N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem chống nắng', 1668044472983, N'df1d4835-0012-46a6-843a-4a0834ad3e7c.png')
INSERT [dbo].[CATEGORY] ([CATEGORYID], [CATEGORYNAME], [CATEGORYCREATEDDATE], [CATEGORYIMAGE]) VALUES (N'6F3B0BB6-CCD8-42B3-97AE-F2785EC29E54', N'Dầu / Nước tẩy trang', 1668804992370, N'4bd41dbf-d418-4f80-9723-3a99f1c34e09.png')
INSERT [dbo].[CATEGORY] ([CATEGORYID], [CATEGORYNAME], [CATEGORYCREATEDDATE], [CATEGORYIMAGE]) VALUES (N'B5784BBC-9FDD-40B5-A97A-E76E7C3FBC59', N'Kem dưỡng da', 1669709083170, N'0b7fa847-dc1f-4696-885a-facefe2bed9a.png')
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'b8495b7e-22af-4ed0-8fa9-20a9115166d2', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'hahaaa edit', N'<p><strong>helloo &nbsp;edit</strong></p>', 550000, 5, 1669603350596, 0, 450000, 0, 137)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'f16153b3-5a84-4329-b880-a5017aa3042f', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'sp 2', N'<p><strong>mô tả</strong></p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>h1</td><td>h2</td></tr><tr><td>h3</td><td>h4<img src="https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w="></td></tr></tbody></table></figure><p>&nbsp;</p>', 3, 3, 1669605611516, 0, 3, 1, 125)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'ae479602-40ed-4036-ab71-96982986e8c2', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'6F3B0BB6-CCD8-42B3-97AE-F2785EC29E54', N'sp hot', N'<p><strong><u>Khôngcáchđược&nbsp;</u></strong></p><p>&nbsp;</p>', 900000, 8, 1669607715596, 0, 899000, 1, 102)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'bd404dbc-99a0-44e5-bd03-3bd525e6de1c', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'sp 3', N'<p>nhập dấu cách ok</p>', 5, 5, 1669608554456, 0, 5, 1, 138)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'3418a59f-fa74-4221-ac14-45ee265fa7b7', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'sp không hot 2', N'<p><strong><u>Mô tả ok edit</u></strong></p>', 560000, 7, 1669613168586, 0, 510000, 0, 139)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'39501f03-47d7-4f45-8f05-4562d98d39a9', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'sp 101 sao kỳ vậy', N'<figure class="table"><table><tbody><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><p>mô tả</p>', 890000, 5, 1669605037056, 0, 888800, 1, 101)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'98D2245C-9ED0-460A-9D9F-20C690A8A0B0', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Kiểm Soát Dầu La Roche-Posay Anthelios XL Dry Touch Gel-Cream SPF 50+ UVB & UVA 50ml', N'<p><strong>Kem Chống Nắng Kiểm Soát Dầu La Roche-Posay Anthelios XL Dry Touch Gel-Cream SPF 50+ UVB & UVA 50ml</strong> là dòng sản phẩm cao cấp đến từ thương hiệu La Roche-Posay nổi tiếng. Với các thành phần lành tín,h <strong>La Roche-Posay Anthelios XL Dry Touch</strong> là sản phẩm kem chống nắng<strong> </strong>dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ, hỗ trợ ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/07/la-roche-posay-anthelios-xl-gel-creme-toucher-sec-spf50-plus-50-ml-1-jpg-1625134215-01072021171015.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: justify;"><a href="https://vuahanghieu.com/la-roche-posay">La Roche-Posay</a> là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm</a> được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="text-align: justify; font-size: 18pt;"><strong>Thành phần Kem chống nắng La Roche-Posay Anthelios XL Dry Touch Gel-Cream</strong></h2><p><strong>Thành phần chính</strong></p><ul><li>Công nghệ độc quyền XL-PROTECT: chống nắng tối ưu, hỗ trợ bảo vệ da trước tia UVA-UVB, tia hồng ngoại & tác hại từ ô nhiễm.</li><li>Hoạt chất AIRLICIUM: thành phần hỗ trợ giúp giảm dầu, mồ hôi & bã nhờn dư thừa. Hiệu quả vượt trội, có thể hấp thu lượng bã nhờn gấp 100 lần khối lượng.</li><li>Nước khoáng La Roche-Posay: hỗ trợ giúp làm dịu và chống dấu hiệu tuổi tác trên da.</li></ul><p><strong>Thành phần khác</strong></p><p>Xem trên bao bì sản phẩm. Đa phần các sản phẩm của <a href="https://vuahanghieu.com/la-roche-posay/my-pham">mỹ phẩm La Roche-Posay</a> đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/09/la-roche-posay-anthelios-xl-dry-touch-gel-cream-jpg-1631522675-13092021154435.jpg" alt="Th&agrave;nh phần Kem chống nắng La Roche-Posay Anthelios XL Dry Touch Gel-Cream" width="600" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem chống nắng La Roche-Posay Anthelios XL Dry Touch Gel-Cream SPF 50+</strong></h2><p>- Chứa màng lọc bảo vệ da phổ rộng XL-PROTECT là sự pha trộn giữa các bộ lọc UV và hoạt chất chống oxy hóa mạnh mẽ, không chỉ cung cấp khả năng bảo vệ da khỏi tác hại của tia UVA & UVB phổ rộng mà còn chống lại các tác nhân gây hại khác như tia hồng ngoại và ô nhiễm môi trường, ngăn ngừa sạm nám, đốm nâu, tác nhân gây dấu hiệu tuổi tác & kích ứng ánh nắng.</p><p>- Chỉ số chống nắng cao SPF 50+ PA++++, <a href="https://vuahanghieu.com/la-roche-posay/kem-chong-nang">kem chống nắng La Roche-Posay</a> hỗ trợ bảo vệ da tối ưu dưới ánh nắng.</p><p>- Hỗ trợ kiểm soát bã nhờn với hoạt chất Airlicium - chứa các vi hạt siêu nhỏ có khả năng tan chảy và thẩm thấu ngay vào da, hấp thụ bã nhờn & mồ hôi vượt trội gấp 100 lần khối lượng, từ đó kiểm soát mọi nguyên nhân dẫn đến tình trạng da bóng nhờn (bã nhờn, mồ hôi và độ ẩm), duy trì làn da khô ráo & thoáng mịn.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/07/la-roche-posay-anthelios-xl-gel-creme-toucher-sec-spf50-plus-50-ml-3-jpg-1625134227-01072021171027.jpg" class="product-img-responsive"/></p><p>- Hỗ trợ làm dịu da và hạn chế tình trạng oxy hóa với thành phần giàu nước khoáng La Roche-Posay.</p><p>- Hỗ trợ dưỡng ẩm da với Glycerin, hỗ trợ duy trì làn da ẩm mượt và thoải mái, không bị khô căng bong tróc khi tiếp xúc với ánh nắng trong thời gian dài.</p><p>- Kết cấu dạng kem gel với công nghệ Dry-touch thẩm thấu nhanh vào da, mang đến cảm giác khô thoáng nhanh chóng, không đọng vệt trắng.</p><p>- Có thể dùng làm lớp lót trước khi trang điểm.</p><p>- Công thức chống thấm nước thích hợp dùng hằng ngày và cả những hoạt động ngoài trời.</p><h2 style="font-size: 18pt;"><strong>Đối tượng sử dụng</strong></h2><ul><li>Phù hợp cho da dầu và da hỗn hợp.</li><li>Sử dụng cho da mặt.</li></ul><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng kem chống nắng La Roche-Posay</strong></h2><p>- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p>- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p>- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p style="text-align: justify;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;"><a href="https://vuahanghieu.com/la-roche-posay"><strong>LA ROCHE-POSAY</strong></a></td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;"><a href="https://vuahanghieu.com/my-pham/phap">Mỹ phẩm Pháp</a></td></tr><tr><td style="width: 41.4747%;"><strong>Phân loại</strong></td><td style="width: 40.4761%;"><a href="https://vuahanghieu.com/kem-chong-nang">Kem chống nắng</a></td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table>', 550000, 10, 1668113694670, 1, 455000, 0, 103)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'0FBD86AD-D97D-416E-83D4-7E1FD79013E5', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml', N'<p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. <strong>La Roche-Posay Anthelios Clear Skin SPF 60</strong> hỗ trợ chống nắng cũng như tạo một lớp nền cho da thêm mềm mượt, khỏe khoắn với độ chống nắng SPF60.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/10/kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-anh-2-jpg-1666146129-19102022092209.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: left;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="text-align: left; font-size: 18pt;"><strong>Thiết kế Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml </strong></h2><p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml</strong> có thiết kế dạng tuyp với dung tích 50ml dễ dàng mang theo bất cứ đâu. Kích thước nhỏ gọn, thông tin được in chi tiết trên thân lọ.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/10/kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-jpg-1666146116-19102022092156.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml </strong></h2><p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Clear Skin SPF 60, 50ml </strong>với kết cấu thẩm thấu nhanh, hỗ trợ làm giảm mụn và để lại làn da mịn với cảm giác sạch sẽ. Da được bảo vệ, không gây cảm giác bóng nhờn.</p><p style="text-align: left;">Kết cấu đột phá:</p><p style="text-align: left;">- Một công thức nhẹ với kết cấu hiệu ứng thấm nhanh hỗ trợ làm giảm tắc nghẽn lỗ chân lông hoặc gây ra mụn.</p><p style="text-align: left;">- Một phức hợp hấp thụ dầu độc đáo. Được cung cấp bởi Perlite & Silica được biết đến với đặc tính hỗ trợ chống bóng nhờn, hỗ trợ giúp hấp thụ dầu thừa.</p><p style="text-align: left;">- Với ưu điểm chống nước lên đến 80 phút, <strong>La Roche-Posay Anthelios Clear Skin SPF 60 </strong>còn dễ dàng thoa vào da nhờ độ thẩm thấu nhanh chóng.</p><p style="text-align: left;">Đây là kem chống nắng cho da dầu với phổ bảo vệ phổ rộng SPF 60, và La Roche-Posay Anthelios Clear Skin Dry Touch Sunscreen SPF 60 cũng thích hợp cho cả da nhạy cảm nữa.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/10/kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-anh-1-jpg-1666146123-19102022092203.jpg" class="product-img-responsive"/></p><p style="text-align: left;">- Hỗ trợ chống nắng cũng như tạo lớp nền mềm mịn trên da.</p><p>- Hỗ trợ bảo vệ da khỏi tia ánh nắng mặt trời, hỗ trợ bảo vệ da khỏi tình trạng tăng sắc tố.</p><p>- Hỗ trợ làm giảm tác hại UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p>- Hỗ trợ làm giảm những tác hại của ánh nắng mỗi ngày.</p><p>- Hỗ trợ cải thiện làn da mịn màng tươi sáng.</p><p style="text-align: left;">Sản phẩm không gây kích ứng, phù hợp cho da nhạy cảm và dễ kích ứng với ánh nắng.</p><p style="text-align: left;">*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: left;">- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p style="text-align: left;">- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p style="text-align: left;">- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p style="text-align: left;">- Thoa lại sau mỗi 2 giờ.</p><p style="text-align: left;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px; float: left;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF 60</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p style="text-align: left;"> </p>', 490000, 10, 1668113694670, 1, 425000, 1, 104)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'6E45CA14-CF14-4BF5-A83A-1133D8389BD0', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+, 50ml', N'<p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+, 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. <strong>La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream</strong> hỗ trợ chống nắng cũng như tạo một lớp nền cho da thêm mềm mượt, khỏe khoắn.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: left;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="text-align: left; font-size: 18pt;"><strong>Thiết kế Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+</strong></h2><p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+</strong> có thiết kế dạng tuyp với dung tích 50ml dễ dàng mang theo bất cứ đâu. Kích thước nhỏ gọn, thông tin được in chi tiết trên thân lọ.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/kem-chong-nang-la-roche-posay-anthelios-ultra-sensitiv-eyes-innovation-tinted-bb-cream-spf-50-anh-1-jpg-1663042204-13092022111004.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+, 50ml</strong></h2><p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Ultra Sensitive Eyes Innovation Tinted BB Cream SPF 50+, 50ml</strong> là loại kem có màu có độ bảo vệ rất cao được đặc chế dành riêng cho da nhạy cảm và dễ phản ứng. Hỗ trợ  giúp chống nắng tối ưu, bảo vệ da trước tia UVA-UVB, tia hồng ngoại và những tác hại từ ánh nắng và ô nhiễm: Dấu hiệu tuổi tác trên da, đốm nâu, nám, kích ứng ánh nắng.</p><p style="text-align: left;">- Hỗ trợ chống nắng cũng như tạo lớp nền mềm mịn trên da.</p><p>- Hỗ trợ bảo vệ da khỏi tia ánh nắng mặt trời, hỗ trợ bảo vệ da khỏi tình trạng tăng sắc tố.</p><p>- Hỗ trợ làm giảm tác hại UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p>- Hỗ trợ làm giảm những tác hại của ánh nắng mỗi ngày.</p><p>- Hỗ trợ cải thiện làn da mịn màng tươi sáng.</p><p style="text-align: left;">Sản phẩm không gây kích ứng, phù hợp cho da nhạy cảm và dễ kích ứng với ánh nắng.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/kem-chong-nang-la-roche-posay-anthelios-ultra-sensitiv-eyes-innovation-tinted-bb-cream-spf-50-anh-2-jpg-1663042212-13092022111012.jpg" class="product-img-responsive"/></p><p style="text-align: left;">*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: left;">- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p style="text-align: left;">- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p style="text-align: left;">- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p style="text-align: left;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px; float: left;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p style="text-align: left;"> </p>', 690000, 10, 1668113694670, 1, 429000, 0, 105)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'1832108B-1F39-449E-B41D-DDA42839F150', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Hydrating Cream Ultra Protection SPF50+ 50ml', N'<p><strong>Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Hydrating Cream Ultra Protection SPF50+ 50ml&nbsp;</strong>là dòng sản phẩm kem chống nắng cao cấp đến từ thương hiệu La Roche-Posay nổi tiếng. Với các thành phần lành tính, <strong>La Roche-Posay Hydrating Cream Ultra Protection </strong>là sản phẩm kem chống nắng<strong>&nbsp;</strong>dành cho làn da khô nhạy cảm, hỗ trợ ngăn ngừa tia UVA/UVB bảo vệ toàn diện cho làn da luôn khỏe mạnh.</p><p style="text-align:center;"><img class="product-img-responsive" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/81a329b2e9e286ca5d089aa08f131436-jpg-1662620041-08092022135401.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align:justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng.&nbsp;</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg"></p><p style="text-align:justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size:18pt;"><strong>Ưu điểm của Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Hydrating Cream Ultra Protection SPF50+ 50ml</strong></h2><p><strong>Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Hydrating Cream Ultra Protection SPF50+ 50ml </strong>không chỉ dừng lại ở tia cực tím UVA-UVB khỏi tác nhân tia cực tím mà còn giúp da tránh khỏi những ảnh hưởng của tia hồng ngoại và&nbsp; các hạt ô nhiễm nhờ hệ thống màng lọc được cấp bằng sáng chế Mexoplex.&nbsp;</p><p>Sản phẩm còn có chứa nước khoáng La Roche-Posay vô cùng giàu khoáng chất giúp cung cấp độ ẩm sâu cho da, cải thiện tình trạng khô căng, bong tróc khó chịu trên da, đặc biệt là làn da khô nhạy cảm.&nbsp;</p><p>Chất kem thấm nhanh, không gây nhờn rít, thông thoáng tức thì thích hợp với làn da nhạy cảm nhất, hoàn toàn không gây kích ứng da</p><p>Kem chống nắng có thể dùng cho cả vùng mắt mà không lo gây cay mắt, có khả năng chống nước cao vì thế có thể sử dụng khi hoạt động ngoài trời.&nbsp;</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/hjjh-jpg-1662620056-08092022135416.jpg"></p><p><span style="font-size:18pt;"><strong>Đặc điểm Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Hydrating Cream Ultra Protection SPF50+ 50ml</strong></span></p><p><strong>Thiết kế Sản Phẩm:</strong></p><p>Dạng tuýp có đầu pump để có thể lấy kem chống nắng dễ dàng, nhờ bao bì này kem chống nắng sẽ tránh tiếp xúc không khí, không gây ảnh hưởng đến sản phẩm bên trong. Kem chống nắng có nắp bảo vệ vì thế sau khi sử dụng lưu ý đóng nắp kín.</p><p><strong>Kết Cấu Sản Phẩm:</strong></p><p>Kem Chống Nắng La Roche-Posay Anthelios Hydrating Cream sở hữu chất kem mịn mượt, dễ tán, khi thoa lên da sẽ để lại cảm giác ẩm mượt nhưng không hề tạo cảm giác bí bách, nhờn rít khó chịu.</p><p><strong>Loại da phù hợp:&nbsp;</strong></p><ul><li>Da khô nhạy cảm&nbsp;</li><li>Da nhạy cảm</li><li>Da dễ kích ứng khi tiếp xúc với ánh nắng</li><li>Da cần được bảo vệ khỏi tia UV</li></ul><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/imgpsh_fullsize_anim-jpg-1662635323-08092022180843.jpg"></p><h2 style="font-size:18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p>- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p>- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/09/1-jpg-1662633815-08092022174335.jpg"></p><p style="text-align:justify;"><strong>*Thành phần:</strong> Đa phần các sản phẩm của <strong>La Roche-Posay </strong>đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><p style="text-align:justify;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><figure class="table"><table style="border-collapse:collapse;height:108px;width:99.2287%;" border="1"><tbody><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Thương hiệu</td><td style="height:18px;width:47.0471%;">La Roche-Posay</td></tr><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Xuất xứ</td><td style="height:18px;width:47.0471%;">Pháp</td></tr><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Dung tích</td><td style="height:18px;width:47.0471%;">50ml</td></tr><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Mức chống nắng</td><td style="height:18px;width:47.0471%;">SPF50+</td></tr><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Kích cỡ</td><td style="height:18px;width:47.0471%;">Full hộp</td></tr><tr style="height:18px;"><td style="height:18px;width:52.1807%;">Loại da</td><td style="height:18px;width:47.0471%;">Da khô, nhạy cảm</td></tr></tbody></table></figure>', 550000, 3, 1668113694670, 1, 429000, 1, 106)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'4A6DCE78-171F-4E82-B088-2B29C2E62B56', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng La Roche-Posay Anthelios Invisible Fluid SPF50+ 50ml', N'<p><strong>Kem Chống Nắng La Roche-Posay Anthelios Invisible Fluid SPF50+ 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. La Roche-Posay Anthelios Invisible Fluid SPF50+ kem chống nắng siêu nhẹ nhàng dùng được cho cả da nhạy cảm, da dễ bắt nắng.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/04/36337012cf1a0bd9b014c232329406f1-jpg-1649066284-04042022165804.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="text-align: justify; font-size: 18pt;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios Invisible Fluid SPF50+ 50ml</strong></h2><p style="text-align: justify;">Với công thức đặc biệt dạng sữa lỏng nhẹ nhàng và mềm mại, mang lại cảm giác tươi mát và dễ chịu dưới cái nóng bức của mùa hè. Đặc biệt sản phẩm không gây nhờn rít, đổ mồ hôi, không gây cảm giác khó chịu cho da bạn.</p><ul style="text-align: justify;"><li>Hỗ trợ bảo vệ da khỏi tia nắng mặt trời.</li><li>Hỗ trợ bảo vệ vượt trội trước tia UVA/UVB, các tác nhân ô nhiễm môi trường.</li><li>Hỗ trợ cải thiện sắc tố da hoàn hảo.</li><li>Sản phẩm dành cho mọi loại da.</li></ul><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/04/f64b7944fe4be7a13d849fa59d0c0afd-jpg-1649066293-04042022165813.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</strong></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p>- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p>- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/07/kem-chong-nang-banana-boat-spf80-90ml-1_2_13c349562e504f98a064d89fc724f57a_grande-jpg-1627370591-27072021142311.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p> </p>', 750000, 10, 1668113694670, 1, 475000, 0, 107)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'40512CC2-47BB-43F5-95F1-454B39F83F15', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Anthelios Creme Hydratante SPF50+, 50ml', N'<p><strong>Kem Chống Nắng Cho Da Khô Nhạy Cảm La Roche-Posay Anthelios Creme Hydratante SPF50+, 50ml</strong> là dòng sản phẩm kem chống nắng cao cấp đến từ thương hiệu La Roche-Posay nổi tiếng. Với các thành phần lành tính, <strong>La Roche-Posay Anthelios Creme Hydratante SPF50+</strong> là sản phẩm kem chống nắng<strong> </strong>dành cho làn da khô nhạy cảm, hỗ trợ ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/06/134-jpg-1654594203-07062022163003.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem chống nắng La Roche-Posay Anthelios Creme Hydratante SPF50+</strong></h2><p>- Công nghệ độc quyền XL-PROTECT chống nắng tối ưu, bảo vệ da trước tia UVA-UVB, tia hồng ngoại & tác hại từ ô nhiễm.</p><p>- Hỗ trợ giảm dầu, mồ hôi & bã nhờn dư thừa. </p><p>- Hỗ trợ làm dịu và chống oxy hóa.</p><p>- Dòng Anthelios với màng lọc UVA, màng lọc quang phổ rộng, kết cấu và công nghệ mới để đạt được độ bảo vệ cao nhất khỏi tia UVA.</p><p>- Khả năng kháng nước, mồ hôi & cát cao, phù hợp với tắm biển.</p><p>- Có thể sử dụng cho vùng da quanh mắt, không kích ứng da.</p><p>- Cấp nước và làm dịu da, phù hợp cả da kích ứng với ánh sáng.</p><p>- Dạng Creme cùng công thức chống thấm nước, kem chống nắng <strong>La Roche-Posay Anthelios Creme Hydratante SPF50+</strong> thích hợp dùng hàng ngày và cả những hoạt động ngoài trời, để bạn luôn "tự tin” dưới nắng, dưới ánh mặt trời "gay gắt” nhất.</p><p>- Trẻ hóa da, hỗ trợ da bạn mịn màng hơn bởi lớp kem chống nắng "bí mật”.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/06/obagi-rx-c-therapy-night-cream-6-jpg-1656256615-26062022221655.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p>- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p>- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p style="text-align: justify;"><strong>*Thành phần:</strong> Đa phần các sản phẩm của <strong>La Roche-Posay </strong>đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><p style="text-align: justify;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr><tr><td style="width: 41.4747%;"><strong>Loại da</strong></td><td style="width: 40.4761%;">Da khô, nhạy cảm</td></tr></tbody></table>', 550000, 10, 1668113694670, 1, 429000, 0, 108)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'9A796C49-C48B-4755-8E23-7D23BE31894C', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Xịt Chống Nắng Kiềm Dầu La Roche-Posay Anthelios Invisible Fresh Mist SPF 50+, 75ml', N'<p><strong>Xịt Chống Nắng Kiềm Dầu La Roche-Posay Anthelios Invisible Fresh Mist SPF 50+, 75ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. La Roche-Posay Anthelios Invisible Fresh Mist SPF 50+ là xịt chống nắng dạng phun sương mịn, thẩm thấu nhanh, mang lại cảm giác khô thoáng cho làn da, da giảm bóng nhờn đến 80%.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/la-roche-posay-anthelios-anti-shine3-png-1639551335-15122021135535.png" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="text-align: justify; font-size: 18pt;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios Invisible Fresh Mist SPF 50+</strong></h2><p>- Hỗ trợ hống nắng tối ưu, bảo vệ da trước tia UVA-UVB, tia hồng ngoại và môi trường ô nhiễm</p><p>- Hỗ trợ ngăn chặn - đẩy lùi các dấu hiệu mụn sưng viêm, lỗ chân lông nở to hay lão hóa sớm như nám sạm, tàn nhang, chảy xệ,... gây ra ra bởi môi trường</p><p>- Hỗ trợ kiềm dầu, giảm mồ hôi & bã nhờn dư thừa, ngăn ngừa tình trạng mụn</p><p>- Hỗ trợ làm dịu và chống oxy hóa nhờ thành phần nước khoáng chứa bên trong công thức</p><p>- Có thể xịt trực tiếp trên lớp trang điểm.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/la-roche-posay-anthelios-anti-shine4-jpg-1639551348-15122021135548.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</strong></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Lắc đều trước khi sử dụng.</p><p>- Đặt cách bề mặt da 15cm, xịt đều khắp bề mặt da</p><p>- Không xịt lâu quá 3 giây tại một vùng da, tránh tiếp xúc với vùng mắt và miệng.</p><p>- Dùng tay vỗ nhẹ để kem chống nắng phủ đều khắp làn da.</p><p>- Nên sử dụng trước khi tiếp xúc với ánh nắng 20 phút và xịt lại sau mỗi 2h</p><p>-  Tẩy trang vào cuối ngày</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/07/kem-chong-nang-banana-boat-spf80-90ml-1_2_13c349562e504f98a064d89fc724f57a_grande-jpg-1627370591-27072021142311.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Bảo quản:</strong> </p><p>Đóng nắp kỹ sau khi sử dụng.</p><p>Bảo quản nơi khô ráo, thoáng mát.</p><p>Tránh ánh nắng trực tiếp và nhiệt độ cao.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/la-roche-posay-anthelios-anti-shine2-jpg-1639551357-15122021135557.jpg" class="product-img-responsive"/></p><table style="border-collapse: collapse; width: 81.9508%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">75ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p> </p>', 690000, 14, 1668113694670, 1, 490000, 0, 109)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'8100DFCF-0F96-4A13-9137-4558D8CDD82B', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Dạng Gel Hỗ Trợ Làm Sáng Da La Roche-Posay Uvidea Anthelios Tone-Up Rosy SPF50+ 30ml', N'<p><strong>Kem Chống Nắng Dạng Gel Hỗ Trợ Làm Sáng Da La Roche-Posay Uvidea Anthelios Tone-Up Rosy SPF50+ 30ml</strong> là dòng sản phẩm cao cấp đến từ thương hiệu La Roche-Posay nổi tiếng. Với các thành phần lành tính <strong>La Roche-Posay Uvidea Anthelios Tone-Up Rosy</strong> hỗ trợ bảo vệ da ưu việt rất được ưa chuộng hiện nay.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/06/kem-chong-nang9p-jpg-1611802507-28012021095507-jpg-1623049809-07062021141009.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem chống nắng La Roche-Posay Uvidea Anthelios Tone-Up Rosy SPF50+</strong></h2><p>- Hỗ trợ giúp tăng cường hàng rào bảo vệ da khỏi tác hại của ánh sáng mặt trời.</p><p>- Hỗ trợ bảo vệ da tối ưu khỏi tia UV và các tác động tiêu cực từ không khí ô nhiễm như hiện nay.</p><p>- Hỗ trợ nâng tông da ngay sau khi sử dụng sản phẩm cho làn da bạn trở nên rạng rỡ, sáng ngời sức sống.</p><p>- Hỗ trợ nuôi dưỡng làn da luôn sáng khỏe, ức chế sự hình thành melanin,</p><p>- Hỗ trợ cải thiện sắc tố da hoàn hảo nhờ dưỡng chất từ chiết xuất hoa mẫu đơn.</p><p>- Cấu trúc đặc biệt không gây nhờn rít và duy trì độ ẩm mượt trên da suốt ngày dài.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/06/kem-chong-nang9po-jpg-1611802517-28012021095517-jpg-1623049792-07062021140952.jpg" class="product-img-responsive"/></p><p>Đặc biệt, sản phẩm không bị xuống tông hay xuất hiện vệt chảy trắng như các dòng mỹ phẩm thông thường. Có thể sử dụng như kem lót với hiệu ứng sáng da tự nhiên, bền màu, tạo bước đệm tuyệt vời để giữ lớp make-up tiếp theo của bạn mịn lì, lâu trôi giúp bạn thoải mái, tự tin trong mọi việc.</p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p>- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p>- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/06/kem-chong-nang9pop-jpg-1611802538-28012021095538-jpg-1623049800-07062021141000.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Thành phần:</strong> Đa phần các sản phẩm của <strong>La Roche-Posay </strong>đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><p style="text-align: justify;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;"><strong>La Roche-Posay</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 50%; height: 18px;">30ml</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 50%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 50%; height: 18px;">Full hộp</td></tr></tbody></table>', 750000, 10, 1668113694670, 1, 525000, 0, 110)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'ADB93C84-86BC-4C69-9CC3-3A6CB697F9E2', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng La Roche-Posay Anthelios Anti-Imperfections Gel 50ml', N'<p style="text-align: left;"><strong>Kem Chống Nắng La Roche-Posay Anthelios Anti-Imperfections Gel 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. <strong>La Roche-Posay Anthelios Anti-Imperfections Gel </strong>hỗ trợ bảo vệ da toàn diện.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/10/kem-chong-nang-larocheposay-anthelios-anti-imperfections-gel-1-jpg-1634199521-14102021151841.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: left;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios Anti-Imperfections Gel 50ml</strong></h2><p><strong>Kem Chống Nắng La Roche-Posay Anthelios Anti-Imperfections Gel </strong>với Công nghệ hiện đại XL-PROTECT, màng lọc quang phổ rộng với SPF50+/UVA-PF hỗ trợ chống nắng tối ưu, bảo vệ da toàn diện khỏi tia UVA, UVB, tia hồng ngoại & tác hại từ ô nhiễm. Phù hợp cho da bị bóng dầu, dễ phát sinh và tái phát mụn.</p><p style="text-align: left;">- Hỗ trợ bảo vệ da khỏi tác hại của ánh nắng mặt trời, môi trường bên ngoài.</p><p style="text-align: left;">- Hỗ trợ làm giảm dầu, giảm mồ hôi cho da</p><p style="text-align: left;">- Lên tone nhẹ nhàng một chút ban đầu, không bóng, kiềm dầu ổn và chống nước khá tốt</p><p style="text-align: left;">- Hỗ trợ giảm mụn & giảm sưng viêm.</p><p style="text-align: left;">- Hỗ trợ ngăn ngừa tình trạng sạm nám trên da sớm. </p><p>- Chất kem chống nắng khi thoa lên da trông tự nhiên.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/10/kem-chong-nang-larocheposay-anthelios-anti-imperfections-gel-2-jpg-1634199530-14102021151850.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: left;">Lấy một lượng kem chống nắng vừa đủ, thoa các điểm trên khuôn mặt và tán đều, đặc biệt ở vùng cổ, trán, viền tóc và những vùng tiếp xúc nhiều với ánh nắng. Nên thoa lại kem chống nắng sau 2-4 tiếng.</p><p style="text-align: left;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px; float: left;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p style="text-align: left;"> </p>', 650000, 10, 1668113694670, 1, 495000, 0, 111)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'29D52A39-ED9B-46AF-813D-1A56C4720D45', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Có Màu La Roche-Posay Anthelios XL Tinted Fluid SPF 50+ UVB + UVA 50ml', N'<p><strong>Kem Chống Nắng Có Màu La Roche-Posay Anthelios XL Tinted Fluid SPF 50+ UVB + UVA 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. <strong>La Roche-Posay Anthelios XL Tinted Fluid SPF 50+ UVB + UVA</strong> là kem chống nắng &nbsp;bảo vệ da trước tác hại của tia UVA + UVB, đồng thời nâng tone da nhẹ nhàng.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/kem-chong-nang-la-roche-posay-co-mau-spf50-2-png-1639561576-15122021164616.png"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align:justify;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng.&nbsp;</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg"></p><p style="text-align:justify;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size:18pt;text-align:justify;"><strong>Ưu điểm của Kem Chống Nắng La Roche-Posay Anthelios XL Tinted Fluid SPF 50+ UVB + UVA</strong></h2><p>- Hỗ trợ chống nắng, ngăn ngừa tác động tiêu cực của UVA, UVB lên lớp thượng bì, trung bì.</p><p>- Hỗ trợ đẩy lùi các dấu hiệu tuổi tác, ngăn ngừa tăng gốc tự do và hắc tố melanin bởi ánh nắng mặt trời</p><p>- Hỗ trợ cấp ẩm nhẹ nhàng và làm dịu da</p><p>- Hỗ trợ tiết kiệm thời gian, tối giản các bước trang điểm cầu kỳ vào mỗi sáng</p><p>- Công thức lành tính và được nghiên cứu, sản xuất đạt chuẩn châu Âu: không gây dị ứng, không sinh nhân mụn.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/kem-chong-nang-la-roche-posay-co-mau-spf50-3-jpg-1639561582-15122021164622.jpg"></p><p style="text-align:justify;"><strong>*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</strong></p><h2 style="font-size:18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Thoa kem trước khi ra ngoài 20 phút.</p><p>- Nên thoa lại sau mỗi 2 giờ (khi tiếp xúc với nước hoặc chơi thể thao) để duy trì khả năng bảo vệ của kem.</p><p>- Tẩy trang vào cuối ngày.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/07/kem-chong-nang-banana-boat-spf80-90ml-1_2_13c349562e504f98a064d89fc724f57a_grande-jpg-1627370591-27072021142311.jpg"></p><p style="text-align:justify;"><strong>*Bảo quản:</strong>&nbsp;</p><p>Đóng nắp kỹ sau khi sử dụng.</p><p>Bảo quản nơi khô ráo, thoáng mát.</p><p>Tránh ánh nắng trực tiếp và nhiệt độ cao.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/kem-chong-nang-la-roche-posay-co-mau-spf50-3-png-1639561593-15122021164633.png"></p><figure class="table"><table style="border-collapse:collapse;height:90px;width:81.9508%;" border="1"><tbody><tr style="height:18px;"><td style="height:18px;width:41.4747%;"><strong>Thương hiệu</strong></td><td style="height:18px;width:40.4761%;">La Roche-Posay</td></tr><tr style="height:18px;"><td style="height:18px;width:41.4747%;"><strong>Xuất xứ</strong></td><td style="height:18px;width:40.4761%;">Pháp</td></tr><tr style="height:18px;"><td style="height:18px;width:41.4747%;"><strong>Dung tích</strong></td><td style="height:18px;width:40.4761%;">50ml</td></tr><tr style="height:18px;"><td style="height:18px;width:41.4747%;"><strong>Mức chống nắng</strong></td><td style="height:18px;width:40.4761%;">SPF50+</td></tr><tr style="height:18px;"><td style="height:18px;width:41.4747%;"><strong>Kích cỡ</strong></td><td style="height:18px;width:40.4761%;">Full hộp</td></tr></tbody></table></figure><p>&nbsp;</p>', 570000, 12, 1668113694670, 1, 490000, 1, 112)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'54CD2CC6-FB3F-440B-8A8A-9904BFBF25BF', N'4CD942F9-B23A-42A1-A1B9-550303D2CB00', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Cho Da Nhạy Cảm La Roche-Posay Anthelios Invisible Fluid SPF 50+ 50ml', N'<p style="text-align: left;"><strong>Kem Chống Nắng Cho Da Nhạy Cảm La Roche-Posay Anthelios Invisible Fluid SPF 50+ 50ml</strong> là dòng sản phẩm kem chống nắng mới ra mắt của nhà La Roche-Posay nổi tiếng. <strong>La Roche-Posay Anthelios Invisible Fluid SPF 50+</strong> kem chống nắng dành cho da nhạy cảm rất được ưa chuộng sử dụng.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Về thương hiệu La Roche-Posay nổi tiếng</strong></h2><p style="text-align: left;">La Roche-Posay là thương hiệu dược mỹ phẩm của Pháp, thuộc sở hữu của tập đoàn làm đẹp L’Oréal. Sau hơn 40 năm thành lập, La Roche Posay ngày càng phát triển, có mặt ở nhiều quốc gia trên thế giới. La Roche Posay được đặt tên theo tên ngôi làng ở Vienne, Pháp, nơi có nguồn nước khoáng nổi tiếng tạo nên nguồn cảm hứng và là thành phần chính trong các sản phẩm của hãng. </p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/thuon-logo-jpg-1619412506-26042021114826.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Thương hiệu được ưa chuộng với những sản phẩm chất lượng, lành tính. Các sản phẩm của La Roche-Posay có đặc điểm chung là trong thành phần có nhiều khoáng chất có lợi, nhẹ dịu với những làn da nhạy cảm giúp khắc phục mọi tình trạng về da.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Ưu điểm của Kem Chống Nắng Cho Da Nhạy Cảm La Roche-Posay Anthelios Invisible Fluid SPF 50+ 50ml </strong></h2><p style="text-align: left;"><strong>Kem chống nắng La Roche-Posay Anthelios Invisible Fluid SPF 50+</strong> gồm nhiều màng lọc tia UV có quang phổ rộng giúp chống nắng tối ưu, bảo vệ da trước tia UVA-UVB, tia hồng ngoại và những tác hại từ ánh nắng và ô nhiễm: Lão hóa sớm, đốm nâu, nám, kích ứng ánh nắng.</p><p>- Hỗ trợ bảo vệ da khỏi tia ánh nắng mặt trời, hỗ trợ bảo vệ da khỏi tình trạng tăng sắc tố.</p><p>- Hỗ trợ làm giảm tác hại UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p>- Hỗ trợ làm giảm những tác hại của ánh nắng mỗi ngày.</p><p>- Hỗ trợ cải thiện làn da mịn màng tươi sáng.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/12/00010478-kem-chong-nang-la-roche-posay-anthelios-xl-50-7331-6164_large-jpg-1640253219-23122021165339.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Sản phẩm không gây kích ứng, phù hợp cho da nhạy cảm và dễ kích ứng với ánh nắng.</p><p style="text-align: left;">*Thành phần: Đa phần các sản phẩm của La Roche-Posay đều lành tính, tuy nhiên nên đọc kỹ chi tiết hướng dẫn sử dụng đi kèm.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: left;">- Làm sạch da và dưỡng da cơ bản theo thói quen hàng ngày của bạn.</p><p style="text-align: left;">- Lấy lượng kem vừa đủ, chấm đều 5 điểm trên mặt gồm trán, cằm, mũi và hai bên má. Thoa cả vào phần cổ nếu không muốn sau khi đi nắng về da bạn bị lệch tông quá nhiều nhé.</p><p style="text-align: left;">- Sau đó bạn chờ 15-20 phút cho sản phẩm thẩm thấu vào da rồi mới đi ra nắng để đạt kết quả bảo vệ tốt hơn. Sau khi thoa kem bạn có thể tiếp tục các thao tác trang điểm với sản phẩm khác tùy thích.</p><p style="text-align: left;"><strong>*Bảo quản:</strong> Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 81.9508%; height: 90px; float: left;" border="1"><tbody><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 40.4761%; height: 18px;">La Roche-Posay</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 40.4761%; height: 18px;">Pháp</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 40.4761%; height: 18px;">50ml</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Mức chống nắng</strong></td><td style="width: 40.4761%; height: 18px;">SPF50+</td></tr><tr style="height: 18px;"><td style="width: 41.4747%; height: 18px;"><strong>Kích cỡ</strong></td><td style="width: 40.4761%; height: 18px;">Full hộp</td></tr></tbody></table><p style="text-align: left;"> </p>', 750000, 10, 1668113694670, 1, 485000, 0, 113)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'D762DF28-352D-4007-B173-0EDEA5884087', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml', N'<div class="QnfS4e cZEg1e"><div class="kEwVtd"><div class="iFxuye"><div class="S4aXnb dB6HXe"><span style="text-align: justify;"><strong>Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml</strong> là sản phẩm chăm sóc da dành cho nam đến từ thương hiệu Kiehl''s nổi tiếng của Mỹ. <strong>Kiehl''s Facial Fuel Energizing Face Wash </strong>Gel rửa mặt khôi phục năng lượng và bổ sung độ ẩm cho da nam giới.</span></div><div class="S4aXnb dB6HXe"><span style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/07/9c3066641eaef82193d5cfc70140ad5f-jpg-1659152671-30072022104431.jpg" class="product-img-responsive"/></span></div></div></div></div><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align: justify;">Kiehl''s là một thương hiệu <a title="Mỹ phẩm" href="https://vuahanghieu.com/my-pham" data-keyword-link="1008">mỹ phẩm</a> Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><h2 style="font-size: 18pt; text-align: left;"><strong>Thiết kế <span style="text-align: justify;">Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml </span></strong></h2><p style="text-align: justify;"><span style="text-align: justify;"><strong>Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml</strong></span>nổi bật với vỏ chai màu xanh, trên thân chai được thể hiện thông tin rõ ràng từ tên sản phẩm đến tên thương hiệu và thành phần được công bố trên bao bì. Phần logo tên thương hiệu nổi bật với bao bì sản phẩm nằm trong bộ nhận diện thương hiệu. Hỗ trợ người dùng dễ dàng tìm hiểu và có độ tin tưởng cao.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/07/b722813e047903188a2205e78ecf7cfb-jpg_525x525q80-jpg-1659152683-30072022104443.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Thành phần chính có trong <span style="text-align: justify;">Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml </span></strong></h2><p style="text-align: justify;"><strong>Caffeine:</strong> Caffeine là một dạng chất hữu cơ, được biết đến như một chất kích thích tự nhiên. Trong công thức của Kiehl''s, Caffeine giúp cung cấp năng lượng và cải thiện tình trạng xỉn màu ở làn da.</p><p style="text-align: justify;"><strong>Tinh dầu bạc hà:</strong> Tinh dầu Bạc Hà là một thành phần được biết đến với công dụng giúp "nạp năng lượng", mang lại cảm giác mát lạnh và sảng khoái tức thì cho làn da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/07/293188754_573246994262371_8819016903637902585_n-jpg-1659152691-30072022104451.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>Vitamin E:</strong> Được tìm thấy trong tự nhiên và nổi tiếng với những lợi ích trẻ hóa làn da đã được chứng minh, Vitamin E có thể hỗ trợ giúp vô hiệu hoá các gốc tự do gây hại. Bên cạnh lợi ích trẻ hóa da, Vitamin E còn thường được sử dụng với dưỡng ẩm trong các sản phẩm chăm sóc da.</p><h2 style="text-align: left;"><strong><span style="font-size: 24px;">Ưu điểm nổi bật của <span style="text-align: justify;">Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml </span></span></strong></h2><p><span style="text-align: justify;"><strong>Gel Rửa Mặt Cho Nam Kiehl''s Facial Fuel Energizing Face Wash 250ml </strong>hỗ trợ</span> giúp loại bỏ cặn bã, bụi bẩn và dầu thừa một cách tốt hơn. Bắt đầu ngày mới tràn đầy năng lượng với sữa rửa mặt có chứa Caffeine, tinh dầu Bạc Hà và Vitamin E.</p><ul><li>Hỗ trợ làm sạch thoáng làn da.</li><li>Hỗ trợ bổ sung độ ẩm cho da.</li><li>Hồi sinh vẻ tươi trẻ của làn da, là bước chuẩn bị hoàn hảo trước khi cạo râu.<br/>Hỗ trợ giúp làn da mệt mỏi, xỉn màu trở nên tươi tắn, khỏe mạnh hơn.</li></ul><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/07/6c95c905a7bd1a5e6d02a3902015443d-jpg-1659152698-30072022104458.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><span style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></span></p><ul><li>Làm ướt mặt và tạo bọt với gel rửa mặt.</li><li>Massage lên da theo vòng tròn, hướng lên trên và ra ngoài, tránh vùng mắt.</li><li>Rửa sạch lại với nước.</li><li>Có thể sử dụng cả sáng và tối.</li></ul><p style="text-align: justify;">*<strong>Bảo quản</strong>: Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;"><strong>Kiehl''s</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Giới tính</strong></td><td style="width: 50%; height: 18px;">Nam</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 50%; height: 18px;">250ml</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Loại da</strong></td><td style="width: 50%; height: 18px;">Mọi loại da</td></tr></tbody></table>', 1200000, 10, 1668120323903, 1, 790000, 0, 127)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'FAE5AD8A-CBFE-4E7C-A58D-0A23936C8268', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Đất Sét Kiehl''s Rare Earth Deep Pore Daily Cleanser 150ml', N'<p style="text-align: justify;"><strong>Sữa Rửa Mặt Đất Sét Kiehl''s Rare Earth Deep Pore Daily Cleanser 150ml</strong> dành cho cả nam và nữ đến từ thương hiệu Kiehl''s nổi tiếng của Mỹ. <strong>Kiehl''s Rare Earth Deep Pore Daily Cleanser</strong> có ưu điểm hỗ trợ làm sạch sâu, hỗ trợ thải độc cho da, hỗ trợ làm cho da mịn màng và trắng sáng.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/rare-earth-150ml-9-jpg-1597028077-10082020095437-jpg-1617352921-02042021154201.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align: justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><h2 style="font-size: 18pt; text-align: justify;"><strong>Ưu điểm Kiehl''s Rare Earth Deep Pore Daily Cleanser 150ml</strong></h2><p style="text-align: justify;">- Hỗ trợ làm sạch sâu lỗ chân lông.</p><p style="text-align: justify;">- Hỗ trợ thải độc cho da.</p><p style="text-align: justify;">- Hỗ trợ làm dịu da.</p><p style="text-align: justify;">- Hỗ trợ bổ sung dưỡng chất làm da mịn màng, trắng sáng hơn.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/rare-earth-150ml-3-jpg-1597028142-10082020095542-jpg-1617352962-02042021154242.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">*<strong>Thành phần:</strong><em>Đa phần các sản phẩm của Kiehl''s đều lành tính, tuy nhiên bạn nên tham khảo chi tiết hướng dẫn sử dụng đi kèm.</em></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: justify;">- Lấy lượng vừa đủ sản phẩm lên da ướt</p><p style="text-align: justify;">- Dùng ngón tay sạch, nhẹ nhàng massage quanh mặt và/hoặc cổ theo hướng lên trên và chuyển động vòng tròn ra ngoài.</p><p style="text-align: justify;">- Rửa sạch lại bằng nước ấm</p><p style="text-align: justify;">- Sử dụng hàng ngày mỗi sáng và tối</p><p style="text-align: justify;">- Tránh tiếp xúc vùng mắt.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/rare-earth-150ml-4-jpg-1597028086-10082020095446-jpg-1617352972-02042021154252.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong><em>>>Hướng dẫn bảo quản: </em></strong>Để sản phẩm nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p><table style="border-collapse: collapse; width: 100%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;"><strong>Kiehl''s</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Phân loại</strong></td><td style="width: 50%; height: 18px;">Sữa/Gel rửa mặt</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 50%; height: 18px;">150ml</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Loại da</strong></td><td style="width: 50%; height: 18px;">Mọi loại da</td></tr></tbody></table>', 1150000, 10, 1668120323903, 1, 889000, 0, 128)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'072A6399-E488-4789-96A1-706915900807', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Hoa Cúc Kiehl''s Calendula Deep Cleansing Foaming Face Wash Chai 75ml', N'<p style="text-align:left;"><strong>Sữa Rửa Mặt Hoa Cúc Kiehl’s Calendula Deep Cleansing Foaming Face Wash Chai 75ml</strong> là sản phẩm dành cho cả nam và nữ đến từ thương hiệu Kiehl''s của nước Mỹ. <strong>Kiehl’s Calendula Deep Cleansing Foaming Face Wash</strong> với chiết xuất từ thiên nhiên cho bạn làn da sạch và rạng rỡ hơn.</p><p style="text-align:left;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/nuoc-hoa-hong-obagi-so-2-6-jpg-1597483106-15082020161826-jpg-1617932815-09042021084655.jpg"></p><h2 style="font-size:18pt;text-align:left;"><strong>Thành phần trong Sữa Rửa Mặt Hoa Cúc Kiehl’s Calendula</strong></h2><p style="text-align:left;"><strong>Sữa rửa mặt Kiehl’s Calendula Deep Cleansing Foaming Face Wash</strong> với thành phần chính chiết xuất từ hoa kim cúc trần thảo và các nguyên liệu từ thiên nhiên sẽ hỗ trợ bạn làm sạch da nhẹ nhàng, làm da mềm mại, phù hợp với những ai sở hữu làn da hỗn hợp dầu hoặc da dầu.</p><p style="text-align:left;">*Thành phần:<i> Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</i></p><h3 style="font-size:18pt;text-align:left;"><strong>Ưu điểm của Kiehl’s Calendula Deep Cleansing Foaming Face Wash 75ml</strong></h3><p style="text-align:left;">- Hỗ trợ làm sạch sâu cho da.</p><p style="text-align:left;">- Hỗ trợ giữ độ ẩm trên da.</p><p style="text-align:left;">- Hỗ trợ thu nhỏ lỗ chân lông.</p><p style="text-align:left;">- Hỗ trợ làm sạch bã nhờn dư thừa.</p><p style="text-align:left;">- Công thức nhẹ dịu, hỗ trợ làm dịu vết mụn sưng đỏ.</p><p style="text-align:left;">- Hỗ trợ dưỡng da mịn màng ẩm mượt.</p><p style="text-align:left;">- Mùi thơm tự nhiên hỗ trợ đào thải độc tố bụi bẩn cho làn da sảng khoái.</p><p style="text-align:left;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/my-pham-4-jpg-1597119031-11082020111031-jpg-1617932824-09042021084704.jpg"></p><p style="text-align:left;"><strong>Kiehl’s Calendula Deep Cleansing Foaming Face Wash</strong> lại cực dịu nhẹ, có thể làm dịu đi những nốt mụn sưng đỏ, những vùng da căng rát, khó chịu do cháy nắng hay viêm nhiễm. Do đó Kiehl’s Calendula Deep Cleansing Foaming Face Wash lý tưởng để sử dụng với mọi loại da, tình trạng da.</p><h3 style="text-align:left;"><span style="font-size:18pt;"><strong>Hướng dẫn dử dụng</strong></span></h3><p style="text-align:left;">- Làm ướt mặt và tay với nước ấm.</p><p style="text-align:left;">- Cho sữa rửa mặt vào tay và tạo bọt với 1 ít nước.</p><p style="text-align:left;">- Dùng bọt massage nhẹ nhàng trên da theo chuyển động tròn.</p><p style="text-align:left;">- Rửa mặt sạch lại với nước ấm.</p><p style="text-align:left;">- Dùng khăn mềm để thấm khô.</p><p style="text-align:left;">- Tùy vào cơ địa từng người dùng, kết quả sản phẩm có thể khác nhau.</p><p style="text-align:left;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/my-pham-3-jpg-1597119043-11082020111043-jpg-1617932935-09042021084855.jpg"></p><figure class="table"><table style="border-collapse:collapse;float:left;height:90px;width:100%;" border="1"><tbody><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Thương hiệu</strong></td><td style="height:18px;width:50%;">Kiehl''s</td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Xuất xứ</strong></td><td style="height:18px;width:50%;">Mỹ</td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Phân loại</strong></td><td style="height:18px;width:50%;">Sữa rửa mặt</td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Dung tích</strong></td><td style="height:18px;width:50%;">75ml</td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Loại da</strong></td><td style="height:18px;width:50%;">Mọi loại da</td></tr></tbody></table></figure><h2 style="font-size:18pt;text-align:left;"><strong>Đôi nét về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align:left;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp bổ sung vào.</p><p style="text-align:left;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212-jpg-1617872917-08042021160837.jpg"></p><p style="text-align:left;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s.</p><p style="text-align:left;">Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p>', 630000, 10, 1668120323903, 1, 499000, 1, 129)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'63B244C6-DB36-4734-88F7-83B9FEAB36C7', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Hoa Cúc Kiehl''s Calendula Deep Cleansing Foaming Face Wash 30ml', N'<p style="text-align: justify;"><strong>Sữa Rửa Mặt Hoa Cúc Kiehl’s Calendula Deep Cleansing Foaming Face Wash 30ml</strong> là dòng sản phẩm cao cấp đến từ thương hiệu Kiehl''s nổi tiếng. <strong>Kiehl’s Calendula Deep Cleansing Foaming Face Wash</strong> hỗ trợ làm sạch da mặt cho bạn làn da rạng rỡ hơn.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/5ea3c333c6895-sua-rua-mat-kiehls-calendula-deep-cleansing-foaming-face-wash-30ml-boshop-8-jpg-1617933842-09042021090402.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Đôi nét về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align: justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp bổ sung vào.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212-jpg-1617872917-08042021160837.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><h2 style="font-size: 18pt; text-align: justify;"><strong>Ưu điểm của Kiehl’s Calendula Deep Cleansing Foaming Face Wash 30ml</strong></h2><p style="text-align: justify;">- Hỗ trợ làm sạch sâu da mặt.</p><p style="text-align: justify;">- Hỗ trợ bổ sung độ ẩm cho da.</p><p style="text-align: justify;">- Hỗ trợ thu nhỏ lỗ chân lông.</p><p style="text-align: justify;">- Hỗ trợ làm sạch bã nhờn dư thừa.</p><p style="text-align: justify;">- Công thức nhẹ dịu hỗ trợ làm dịu vết mụn sưng đỏ.</p><p style="text-align: justify;">- Hỗ trợ dưỡng da mịn màng ẩm mượt.</p><p style="text-align: justify;">- Mùi thơm tự nhiên giúp da sảng khoái đào thải độc tố bụi bẩn.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/sua-rua-mat-kiehl-s-calendula-tinh-chat-hoa-cuc-30ml-jpg-1500348770-18072017103250-jpg-1617933832-09042021090352.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Kiehl’s Calendula Deep Cleansing Foaming Face Wash lại cực dịu nhẹ, có thể làm dịu đi những nốt mụn sưng đỏ, những vùng da căng rát, khó chịu do cháy nắng hay viêm nhiễm. Do đó Kiehl’s Calendula Deep Cleansing Foaming Face Wash quá lý tưởng để sử dụng với mọi loại da, tình trạng da.</p><h2 style="font-size: 18pt; text-align: justify;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: justify;">- Làm ướt mặt và tay với nước ấm.</p><p style="text-align: justify;">- Cho sữa rửa mặt vào tay và tạo bọt với 1 ít nước.</p><p style="text-align: justify;">- Dùng bọt massage nhẹ nhàng trên da theo chuyển động tròn.</p><p style="text-align: justify;">- Rửa mặt sạch lại với nước ấm.</p><p style="text-align: justify;">- Dùng khăn mềm để thấm khô.</p><p style="text-align: justify;"><strong>*Bảo quản</strong>: Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%;" border="1"><tbody><tr><td style="width: 50%;"><strong>Thương hiệu</strong></td><td style="width: 50%;"><strong>Kiehl''s</strong></td></tr><tr><td style="width: 50%;"><strong>Xuất xứ</strong></td><td style="width: 50%;">Mỹ</td></tr><tr><td style="width: 50%;"><strong>Phân loại</strong></td><td style="width: 50%;">Sữa rửa mặt</td></tr><tr><td style="width: 50%;"><strong>Dung tích</strong></td><td style="width: 50%;">30ml</td></tr><tr><td style="width: 50%;"><strong>Loại da</strong></td><td style="width: 50%;">Mọi loại da</td></tr></tbody></table><p style="text-align: justify;"> </p><p style="text-align: justify;"> </p>', 700000, 10, 1668120323903, 1, 670000, 0, 130)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'2F8DA53A-95E8-402D-ACC8-B8236D703DE3', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Dưa Leo Kiehl''s Cucumber Herbal Conditioning Cleanser 150ml', N'<p style="text-align:justify;"><strong>Sữa Rửa Mặt Dưa Leo Kiehl''s Cucumber Herbal Conditioning Cleanser 150ml</strong> dành cho cả nam và nữ đến từ thương hiệu Kiehl''s nổi tiếng của Mỹ. Kiehl''s Cucumber Herbal Conditioning Cleanser mang lại cho bạn làn da tươi trẻ và rạng rỡ hơn.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/dua-leo-jpg-1597202386-12082020101946.jpg"></p><p style="text-align:justify;">Sữa rửa mặt tạo bọt nhẹ dịu thích hợp cho <a href="https://vuahanghieu.com/my-pham/moi-loai-da" title="mọi loại da" data-keyword-link="302">mọi loại da</a>, đặc biệt là da khô và <a href="https://vuahanghieu.com/my-pham/da-nhay-cam" title="da nhạy cảm" data-keyword-link="358">da nhạy cảm</a>, hỗ trợ rửa sạch bụi bẩn, hỗ trợ tế bào chết và tẩy trang mỹ phẩm trên da. Đồng thời dưỡng ẩm cho da khô và da nhạy cảm, mang lại cảm giác tươi mát sạch nhẹ suốt cả ngày. Công thức chủ yếu từ dưa leo được cẩn thận chiết xuất để giữ trọn tinh chất dưa leo và dinh dưỡng, cùng với glycerin gốc thực vật, sữa rửa mặt tạo bọt cho da khỏe sạch mà vẫn mềm mịn, mượt mà.</p><h2 style="font-size:18pt;text-align:justify;"><strong>Thành phần trong Kiehl''s Cucumber Herbal&nbsp;</strong></h2><p style="text-align:justify;"><strong>Thành phần có trong sản phẩm:</strong><i>Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</i></p><h2 style="font-size:18pt;text-align:justify;"><strong>Ưu điểm nổi bật của Kiehl''s Cucumber Herbal&nbsp;</strong></h2><p style="text-align:justify;">- Hỗ trợ rửa sạch bụi bẩn, tế bào chết và tẩy trang mỹ phẩm trên da.</p><p style="text-align:justify;">- Hạn chế làm mất độ ẩm tự nhiên trên da.</p><p style="text-align:justify;">- Hỗ trợ mang lại độ mềm mịn tự nhiên cho da.</p><p style="text-align:justify;">- Da khỏe mịn màng.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/dua-leo-p-jpg-1597202494-12082020102134.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align:justify;">- Lấy một lượng nhỏ sữa rửa mặt cho lên đầu ngón tay và tạo bọt.</p><p style="text-align:justify;">- Nhẹ nhàng massage theo chuyển động tròn hướng lên.</p><p style="text-align:justify;">- Tránh vùng mắt.</p><p style="text-align:justify;">- Rửa sạch với nước ấm hoặc lau sạch bằng khăn ướt.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/dua-leo-1-jpg-1597202397-12082020101957.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Đôi nét về thương hiệu Kiehl''s nổi tiếng thế giớ</strong>i</h2><p style="text-align:justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp bổ sung vào, cũng như đại lý độc lập.</p><p style="text-align:justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s.</p><p style="text-align:justify;">Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p>', 1200000, 10, 1668120323903, 1, 720000, 1, 131)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'49BEBE17-0DA7-40AF-809B-1C78F6F94570', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Kiehl''s Dạng Gel Blue Herbal Blemish Cleanser Treatment, 150ml', N'<p style="text-align:justify;"><a href="https://vuahanghieu.com/kiehl-s/sua-rua-mat" title="Sữa Rửa Mặt Kiehl''s" data-keyword-link="911"><strong>Sữa Rửa Mặt Kiehl''s</strong></a><strong> Dạng Gel Blue Herbal Blemish Cleanser Treatment, 150ml</strong> là sản phẩm dành cho cả nam và nữ đến từ thương hiệu Kiehl''s nổi tiếng. <strong>Kiehl''s Dạng Gel Blue Herbal Blemish Cleanser Treatment</strong> hỗ trợ làm sạch da mặt, cho bạn làn da tươi trẻ hơn.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/sua-rua-mat-sach-3-jpg-1597204929-12082020110209.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Thành phần trong Kiehl''s Gel Blue Herbal</strong></h2><p style="text-align:justify;"><strong>Thành phần có trong sản phẩm:</strong><i>Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</i></p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/sua-rua-mat-sach-5-jpg-1597204938-12082020110218.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Ưu điểm nổi bật của Kiehl''s Gel Blue Herbal</strong></h2><p style="text-align:justify;">- Sản phẩm gel đặc tạo bọt dày &amp; mịn, với sự kết hợp của Salicylic Acid &amp; các thành phần tự nhiên làm sạch sâu lỗ chân lông (LCL) và lấy đi dầu thừa &amp; bụi bẩn trên bề mặt da.</p><p style="text-align:justify;">- Sản phẩm hỗ trợ làm sạch da, gia tăng làm lành &amp; hạn chế tình trạng da bị tổn thương, hỗ trợ làm giảm mụn đầu đen &amp; đầu trắng.</p><p style="text-align:justify;">- Ưu điểm tối ưu với sự tăng cường các thành phần tự nhiên đặc trưng của dòng sản phẩm giảm mụn.</p><p style="text-align:justify;">- Được kiểm chứng lành tính.</p><p style="text-align:justify;">- Dành cho khách hàng có tình trạng da tổn thương do mụn.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/sua-rua-mat-sach-4-jpg-1597204949-12082020110229.jpg"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align:justify;">- Làm ướt mặt, tạo bọt và nhẹ nhàng massage, tránh vùng mắt &amp; rửa lại bằng nước ấm. Tùy tình hình da, nếu cảm thấy khô căng thì 1 lần/ngày.</p><p style="text-align:justify;">- Sử dụng 2 lần/ngày.</p><p style="text-align:justify;">*** Hiệu quả sản phẩm tùy thuộc vào tình trạng cơ địa của mỗi người.</p><p style="text-align:justify;">&gt;&gt; Bảo quản sản phẩm nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p><h2 style="font-size:18pt;text-align:justify;"><strong>Đôi nét về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align:justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp bổ sung vào, cũng như đại lý độc lập.</p><p style="text-align:justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s.</p><p style="text-align:justify;">Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p>', 980000, 10, 1668120323903, 1, 889000, 1, 132)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'36B2ACE4-010B-4C83-A99F-FEDF972120E1', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Kiehl''s Centella Sensitive Facial Cleanser 250ml', N'<p><strong>Sữa Rửa Mặt Kiehl''s Centella Sensitive Facial Cleanser 250ml</strong>  là dòng sản phẩm đến từ thương hiệu nổi tiếng Kiehl''s của nước Mỹ. <strong>Kiehl''s Centella Sensitive Facial </strong>hỗ trợ rửa sạch bụi bẩn, hỗ trợ loại bỏ dầu thừa và các tạp chất khác trên da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/03/sua-rua-mat-kiehl-s-centella-sensitive-facial-cleanser-250ml-3-jpg-1616061198-18032021165318.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Ưu điểm Sữa Rửa Mặt Kiehl''s Centella Sensitive Facial Cleanser 250ml</strong></h2><ul><li>Hỗ trợ làm sạch bụi bẩn, dầu và tạp chất trên da.</li><li>Hỗ trợ làm dịu da và hỗ trợ tăng cường lá chắn bảo vệ da.</li><li>Hỗ trợ giữ ẩm làm dịu da suốt 8h.</li><li>Công nghệ làm sạch kép hỗ trợ có thể làm sạch với nước hoặc bằng bông tẩy trang.</li><li>Hỗ trợ làm giảm bít tắt lỗ chân lông.</li><li>Dành cho da nhạy cảm.<img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/03/sua-rua-mat-kiehl-s-centella-sensitive-facial-cleanser-250ml-2-jpg-1616061205-18032021165325.jpg" class="product-img-responsive"/></li></ul><h2 style="font-size: 18pt;"><strong>Thành phần kem </strong><strong>Kiehl''s Age Defender Gel</strong></h2><p>- Serum được bào chế từ tự nhiên lành tính đã được các chuyên gia da liễu tinh lọc đã được kiểm định sử dụng, nhẹ dịu kể cả làn da nhạy cảm.</p><p><strong>- </strong>Thành phần chi tiết: <em>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/kiehl-s">mỹ phẩm của Kiehl''s</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng Kiehl''s CENTELLA CLEANSER </strong></h2><ul><li>Thoa nhẹ nhàng một lớp lên da mặt và vùng da gần mắt.</li><li>Rửa sạch bằng nước.</li><li>Hoặc lau sạch bằng bông tẩy trang.</li><li>Khám phá thêm nhiều sản phẩm phục hồi da nhạy cảm như CENTELLA CICA-CREAM để làm dịu, dưỡng ẩm và hỗ trợ da thêm khoẻ mạnh.</li></ul><p>* Đã được thử nghiệm với các đối tượng có <a title="l&agrave;n da nhạy cảm" href="https://vuahanghieu.com/my-pham/da-nhay-cam" data-keyword-link="396">làn da nhạy cảm</a> dễ kích ứng.</p><p><strong>Lưu ý:</strong></p><p>- Tùy vào cơ địa/thể trạng làn da từng người dùng, thời gian mang lại kết quả có thể khác nhau.</p><p>- Để xa tầm tay trẻ em.</p><p>Việc sử dụng sửa rửa mặt Kiehl''s mỗi ngày sẽ hỗ trợ làn da của bạn như được tiếp thêm sinh lực để duy trì sự tươi mới, khỏe khắn và sạch mịn dài lâu. Bởi thế, hãy dùng sữa rửa mặt ngay từ hôm nay.</p><table style="height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="height: 18px; width: 113px;"><strong>Thương hiệu</strong></td><td style="height: 18px; width: 191px;"><span style="font-size: 11pt;"><a href="https://vuahanghieu.com/kiehl-s">Kiehl''s</a></span></td></tr><tr style="height: 18px;"><td style="height: 18px; width: 113px;"><strong>Xuất xứ</strong></td><td style="height: 18px; width: 191px;"><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr style="height: 18px;"><td style="height: 18px; width: 113px;"><strong>Dung tích</strong></td><td style="height: 18px; width: 191px;">250ml</td></tr><tr style="height: 18px;"><td style="height: 18px; width: 113px;"><strong>Hạn sử dụng</strong></td><td style="height: 18px; width: 191px;">3 năm kể từ ngày sản xuất</td></tr><tr style="height: 18px;"><td style="height: 18px; width: 113px;"><strong>Ngày sản xuất</strong></td><td style="height: 18px; width: 191px;">In trên bao bì</td></tr></tbody></table><h2 style="font-size: 18pt;"><strong><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/03/sua-rua-mat-kiehl-s-centella-sensitive-facial-cleanser-250ml-1-jpg-1616061141-18032021165221.jpg" class="product-img-responsive"/></strong></h2><h2 style="font-size: 18pt;"><strong>Đôi nét về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p>Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp bổ sung vào, cũng như đại lý độc lập.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/03/kiehls-store-696x385-jpg-1616059857-18032021163057.jpg" class="product-img-responsive"/></p><p>Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s.</p><p>Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p>', 1450000, 10, 1668120323903, 1, 1190000, 0, 133)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'DDECA477-7F5A-464E-A272-2F993573862C', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Kiehl''s Ultra Facial Oil-Free Cleanser 150ml', N'<p style="text-align: justify;"><strong>Sữa rửa mặt Kiehl’s Ultra Facial Oil-Free Cleanser 150ml </strong>là sản phẩm dành cho cả nam và nữ đến từ thương hiệu Kiehl''s nổi tiếng của Mỹ. <strong>Kiehl’s Ultra Facial Oil-Free Cleanser </strong>có ưu điểm trong việc hỗ trợ làm sạch da mặt, hỗ trợ kiểm soát nhờn, hỗ trợ làm giảm dầu thừa, hỗ trợ làm sạch dịu nhẹ da.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/sua-rua-mat-jpg-1597389842-14082020142402-jpg-1617356031-02042021163351.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Ưu điểm của Kiehl’s Ultra Facial Oil-Free Cleanser 150ml</strong></h2><p style="text-align: justify;">- Hỗ trợ bổ sung các dưỡng chất cho làn da tươi sáng, khỏe mạnh mang lại cảm giác mát và sảng khoái cho làn da.</p><p style="text-align: justify;">- Hỗ trợ cung cấp một lượng ẩm nhất định cho da.</p><p style="text-align: justify;">- Hỗ trợ tăng sự trao đổi chất của tế bào</p><p style="text-align: justify;">- Hỗ trợ tăng cường tổng hợp collagen.</p><p style="text-align: justify;">- Hỗ trợ tẩy tế bào cho da nhẹ nhàng.</p><p style="text-align: justify;">- Hỗ trợ làm thông thoáng lỗ chân lông, hỗ trợ loại bỏ bụi bẩn, hỗ trợ cân bằng độ PH.</p><p style="text-align: justify;">- Hỗ trợ làm tăng khả năng kháng khuẩn cao.</p><p style="text-align: justify;">- Hỗ trợ cho da luôn sạch sẽ và tươi trẻ.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/sua-rua-mat-1-jpg-1597389901-14082020142501-jpg-1617356048-02042021163408.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>* Thành phần:</strong><em>Đa phần sản phẩm của Kiehl''s đều lành tính, tuy nhiên bạn nên tham khảo chi tiết hướng dẫn sử dụng đi kèm.</em></p><h2 style="font-size: 18pt; text-align: justify;"><strong>Hướng dẫn sử dụng</strong></h2><p style="text-align: justify;">- Bước 1: Rửa mặt bằng nước sạch sau đó lấy một lượng vừa đủ ra tay, thoa len mặt.</p><p style="text-align: justify;">- Bước 2: Nhẹ nhàng thoa đều lên khắp mặt và massage theo chuyển động tròn đều.</p><p style="text-align: justify;">- Bước 3: Rửa mặt sạch lại bằng nước. Sử dụng 2 lần/ngày (sáng, tối).</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/sua-rua-mat-8-jpg-1597389884-14082020142444-jpg-1617356040-02042021163400.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>* Bảo quản</strong>: Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;"><strong>Kiehl''s</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Phân loại</strong></td><td style="width: 50%; height: 18px;">Sữa/Gel rửa mặt</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 50%; height: 18px;">150ml</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Loại da</strong></td><td style="width: 50%; height: 18px;">Mọi loại da</td></tr></tbody></table><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu Kiehl''s nổi tiếng</strong></h2><p style="text-align: justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><p style="text-align: justify;"> </p>', 850000, 10, 1668120323903, 1, 650000, 0, 134)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'B5474AF3-3F6A-4872-BC34-C6B74F5380E1', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Kiehl''s Ultra Facial Cleanser 150ml, Tạo Bọt Dịu Nhẹ', N'<p style="text-align: justify;"><strong>Sữa Rửa Mặt Tạo Bọt Dịu Nhẹ Kiehl’s Ultra Facial Cleanser 150ml</strong> dành cho cả nam và nữ đến từ thương hiệu Kiehl''s nổi tiếng của Mỹ. <strong>Kiehl’s Ultra Facial Cleanser </strong>hỗ trợ mang lại cho bạn làn da sạch và rạng rỡ hơn.</p><h2 style="font-size: 18pt; text-align: justify;"><strong>Về thương hiệu Kiehl''s Mỹ</strong></h2><p style="text-align: justify;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/store-jpg-1617259932-01042021135212.jpg" class="product-img-responsive"/></p><p style="text-align: justify;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><h3 style="font-size: 18pt; text-align: justify;">Ưu điểm nổi bật của <strong>Kiehl’s Ultra Facial Cleanser 150ml</strong></h3><p style="text-align: justify;">- Sữa rửa mặt Kiehl’s Ultra Facial Cleanser với công thức dịu nhẹ hỗ trợ làm sạch da.</p><p style="text-align: justify;">- Hỗ trợ loại bỏ lớp trang điểm.</p><p style="text-align: justify;">- Hỗ trợ làm giảm tình trạng khô da.</p><p style="text-align: justify;">- Hỗ trợ bổ sung cho da có độ ẩm tự nhiên.</p><p style="text-align: justify;">- Hỗ trợ loại bỏ lượng dầu thừa, bụi bẩn và các tế bào ở trên bề mặt da.</p><p style="text-align: justify;">- Hỗ trợ cân bằng độ pH, hỗ trợ duy trì sự cân bằng tự nhiên của làn da.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/kiehl-s-ultra-facial-cleanser-9-jpg-1597035623-10082020120023-jpg-1617350074-02042021145434.jpg" class="product-img-responsive"/></p><h3 style="font-size: 18pt; text-align: justify;"><strong>Hướng dẫn sử dụng</strong></h3><p style="text-align: justify;">- Rửa mặt sạch với nước sau đó lấy một lượng nhỏ ra đầu ngón tay, nhẹ nhàng massage trên da ướt theo chuyển động tròn, hướng lên, tránh tiếp xúc trực tiếp với vùng mắt.</p><p style="text-align: justify;">- Rửa sạch lại với nước hoặc lau bọt thừa trên mặt bằng khăn ướt.</p><p style="text-align: justify;">*** Tùy tình trạng cơ địa mỗi người mà kết quả sản phẩm có thể khác nhau.</p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/04/kiehl-s-ultra-facial-cleanser-11-jpg-1597035644-10082020120044-jpg-1617350081-02042021145441.jpg" class="product-img-responsive"/></p><p style="text-align: justify;"><strong>*Thành phần:</strong> Đa phần các sản phẩm của Kiehl''s đều lành tính, tuy nhiên bạn nên tham khảo chi tiết hướng dẫn sử dụng đi kèm.</p><p style="text-align: justify;"><strong>*Bảo quản</strong>: Để sản phẩm nơi khô ráo, thoáng mát, tránh nhiệt độ cao.</p><table style="border-collapse: collapse; width: 100%;" border="1"><tbody><tr><td style="width: 50%;"><strong>Thương hiệu</strong></td><td style="width: 50%;"><strong>Kiehl’s</strong></td></tr><tr><td style="width: 50%;"><strong>Xuất xứ</strong></td><td style="width: 50%;">Mỹ</td></tr><tr><td style="width: 50%;"><strong>Phân loại</strong></td><td style="width: 50%;">Sữa rửa mặt</td></tr><tr><td style="width: 50%;"><strong>Dung tích</strong></td><td style="width: 50%;">150ml</td></tr><tr><td style="width: 50%;"><strong>Loại da</strong></td><td style="width: 50%;">Mọi loại da</td></tr></tbody></table><p style="text-align: justify;"> </p>', 1200000, 10, 1668120323903, 1, 680000, 0, 135)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'A4792FDA-C06A-4AF2-A4FC-B6099791B87F', N'6606604B-005B-4EA1-A7D0-6C2B2682949E', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'Sữa Rửa Mặt Làm Sạch Sâu Và Sáng Da Kiehl''s Clearly Corrective Brightening Exfoliating Cleanser 150ml', N'<p><strong>Sữa Rửa Mặt Làm Sạch Sâu Và Sáng Da Kiehl''s Clearly Corrective Brightening Exfoliating Cleanser 150ml</strong> là dòng sản phẩm cao cấp đến từ thương hiệu Kieh''s nổi tiếng của Mỹ. <strong>Kiehl''s Clearly Corrective Brightening Exfoliating Cleanser</strong> hỗ trợ làm sạch da mặt cho bạn làn da rạng rỡ hơn.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/08/sua-rua-mat-lam-sang-da-kiehls-c-jpg-1628157324-05082021165524.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt; text-align: left;"><strong>Về thương hiệu Kiehl''s nổi tiếng thế giới</strong></h2><p style="text-align: left;">Kiehl''s là một thương hiệu mỹ phẩm Hoa Kỳ chuyên kinh doanh sản phẩm dưỡng da, tóc và dưỡng thể cao cấp... Khởi đầu từ một cửa hàng đơn lẻ ở Manhattan tại Đại lộ Thứ ba và phía đông tuyến đường 13 vào năm 1851. Kiehl''s đã được L''Oréal mua vào năm 2000 và hiện có hơn 250 cửa hàng bán lẻ trên toàn thế giới và hơn 1.000 điểm bán được doanh số bán hàng của cửa hàng bách hóa cao cấp.</p><p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/06/store-kiehls-34126023-3456-2304-2-jpg-1624959254-29062021163414.jpg" class="product-img-responsive"/></p><p style="text-align: left;">Trong các cửa hàng, Kiehl''s nổi tiếng nhờ tập trung vào dịch vụ khách hàng và "kinh nghiệm thương hiệu bán lẻ". Nhân viên phải trải qua một "khóa học chuyên sâu kéo dài bốn tuần thực tập trong lĩnh vực hóa học, sử dụng và áp dụng các sản phẩm của Kiehl''s. Các sản phẩm mỹ phẩm Kiehl’s có mặt tại thị trường được rất nhiều khách hàng yêu thích bởi chất lượng sản phẩm cực kỳ tốt.</p><h2 style="text-align: left; font-size: 18pt;"><strong>Ưu điểm của Sữa rửa mặt Kiehl''s Clearly Corrective Brightening Exfoliating Cleanser</strong></h2><p>- Hỗ trợ làm sạch sâu, lấy đi bụi bẩn, bã nhờn và các yếu tố gây hại từ môi trường, cải thiện độ rạng rỡ của da.</p><p>- Tẩy da chết dịu nhẹ giúp bề mặt da thêm mềm mịn.</p><p>- Hỗ trợ làm giảm các vết thâm mụn trên da.</p><p>- Da sáng lên trông thấy.</p><p>- Thiết kế bao bì đơn giản, tiện dụng. Kết cấu dạng gel không có quá nhiều hạt li ti. Không làm khô da sau khi sử dụng. </p><p>- Phù hợp với mọi loại da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/08/54182511719fa9f9285c3e9c5e674ef8-jpg-1628157209-05082021165329.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng</strong></h2><p>- Làm ướt mặt và tay với nước.</p><p>- Lấy một lượng sữa rửa mặt vừa đủ.</p><p>- Dùng bọt massage nhẹ nhàng trên da theo chuyển động tròn.</p><p>- Rửa mặt sạch lại với nước.</p><p>- Sử dụng hàng ngày để đạt kết quả tốt nhất.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/08/op-jpg-1628157250-05082021165410.jpg" class="product-img-responsive"/></p><p style="text-align: left;"><strong>*Bảo quản</strong>: Để sản phẩm nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p><p style="text-align: left;"><strong>*Thành phần</strong>: <em>Đa phần các sản phẩm của Kiehl''s đều lành tính, tuy nhiên bạn nên tham khảo chi tiết hướng dẫn sử dụng đi kèm.</em></p><table style="border-collapse: collapse; width: 100%; float: left; height: 90px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;"><strong>Kiehl''s</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Phân loại</strong></td><td style="width: 50%; height: 18px;">Sữa rửa mặt</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Dung tích</strong></td><td style="width: 50%; height: 18px;">150ml</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Loại da</strong></td><td style="width: 50%; height: 18px;">Mọi loại da</td></tr></tbody></table><p style="text-align: left;"> </p>', 990000, 10, 1668120323903, 1, 795000, 0, 136)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'734569B1-CFEE-4D35-B865-8B3250522CCA', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium 85g', N'<p style="text-align:justify;"><strong>Kem Chống Nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium</strong> là dòng <a href="https://vuahanghieu.com/my-pham">mỹ phẩm cao cấp</a> đến từ thương hiêu Obagi nổi tiếng của Mỹ. <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">Kem chống nắng Obagi</a> hỗ trợ bảo vệ da khỏi các bức xạ mặt trời.</p><p style="text-align:justify;">Khác với bản thông thường, phiên bản Matte Premium có công thức thông minh thoáng nhẹ, hỗ trợ cải thiện da nhanh chóng hấp thu và để lại lớp nền mỏng, mờ, hỗ trợ làm giảm bóng nhờn. Bên cạnh đó kem chống nắng <strong>Obagi Sun Shield</strong> còn được bổ sung các thành phần hỗ trợ làm dịu da, hỗ trợ da mềm mại&nbsp; tràn đầy sức sống, cùng Vitamin C&amp; E hỗ trợ da tươi trẻ, săn chắc.</p><h2 style="font-size:18pt;"><strong>Giới thiệu thương hiệu Obagi và sản phẩm kem chống nắng</strong></h2><p>Sản phẩm được nghiên cứu bởi&nbsp;<a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc.&nbsp;<a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a>&nbsp;được xem là thương hiệu&nbsp;<a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm dấu hiệu tuổi tác trên da nám, nhăn, sạm, tàn nhang...<img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"></p><h3><span style="font-size:14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><i>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</i></p><p><i>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia&nbsp;sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</i></p></blockquote><h2 style="font-size:18pt;"><span style="font-size:18pt;"><strong>Về sản phẩm Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium</strong></span></h2><p>Khác với phiên bản thông thường, phiên bản <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang"><strong>Kem chống nắng Matte Premium của Obagi</strong></a> có công thức thông minh thoáng nhẹ, hỗ trợ da nhanh chóng hấp thu và để lại lớp nền mỏng, mờ, hỗ trợ làm giảm bóng nhờn. Ngoài ra, chống nắng còn được bổ sung các thành phần làm dịu da, cùng Vitamin C&amp; E cho da trẻ hoá và săn chắc.</p><h2 style="font-size:18pt;text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/05/kem-chong-nang-obagi-sun-shield-matte-broad-spectrum-spf-50-4a-png-1590026406-21052020090006.png" alt="Giới thiệu kem chống nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium 85g cao cấp" width="600" height=""></h2><p><a href="https://vuahanghieu.com/kem-ho-tro-chong-nang--obagi-sun-shield-matte-broad-spectrum-spf-50-premium-85g-ph023839"><strong>Kem chống nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium 85g</strong></a> hỗ trợ bảo vệ làn da khỏi các bức xạ mặt trời, hỗ trợ làm giảm tình trạng da nám, nhăn, sạm, tàn nhang...</p><h2 style="font-size:18pt;text-align:justify;"><strong>Ưu điểm của kem chống nắng Obagi Sun Shield Matte</strong></h2><p style="text-align:justify;">- Hỗ trợ bảo vệ da khỏi tia ánh nắng mặt trời, hỗ trợ bảo vệ da khỏi tình trạng tăng sắc tố.</p><p style="text-align:justify;">- Hỗ trợ làm giảm tác hại UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p style="text-align:justify;">- Hỗ trợ làm giảm những tác hại của ánh nắng mỗi ngày.</p><p style="text-align:justify;">- Hỗ trợ cải thện làn da mịn màng tươi sáng.</p><p style="text-align:justify;">- <a href="https://vuahanghieu.com/my-pham/kem-chong-nang">Kem chống nắng</a> này thích hợp với mọi loại da.</p><p style="text-align:justify;"><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/05/kem-chong-nang-a61nj-jpg-1590026427-21052020090027.jpg" alt="Ưu điểm của kem chống nắng Obagi Sun Shield Matte" width="600"></p><h2 style="font-size:18pt;text-align:justify;"><strong>Hướng dẫn sử dụng kem chống nắng Obagi:</strong></h2><p style="text-align:justify;">Lấy lượng kem vừa đủ, thoa nhẹ nhàng lên khắp mặt (trừ mí mắt), dùng tay vỗ nhẹ lên da. Dùng ban ngày trước khi ra nắng 15 phút để đạt được kết quả mong muốn.</p><p style="text-align:justify;"><strong>Lưu ý</strong>: Bảo quản sản phẩm nơi khô ráo, thoáng mát, tránh xa tầm tay của trẻ em.</p><figure class="table"><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>Dạng tuýp 85g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table></figure>', 1350000, 10, 1668189699036, 1, 996000, 1, 114)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'DCF4CB48-7B7C-48D8-B421-554847135E33', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Dưỡng Sáng Da Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen 48g', N'<p><strong>Kem Chống Nắng Dưỡng Sáng Da Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen 48g</strong> là dòng mỹ phẩm cao cấp tới từ thương hiệu dược mỹ phẩm Obagi Mỹ nổi tiếng. <strong>Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen</strong> hỗ trợ chống nắng hóa học bảo vệ da với chỉ số chống nắng cao SPF 30, hỗ trợ hạn chế các tổn thương da từ ánh nắng mặt trời, hỗ trợ giảm thiểu sạm nám và nếp nhăn một cách tối ưu.</p><h2><strong>Giới thiệu thương hiệu Obagi và Obagi Clinical Vitamin C SPF 30</strong></h2><p>Sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">kem chống nắng Obagi cao cấp</a> được nghiên cứu bởi <a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc. <strong><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></strong> được xem là thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm nám, sạm, tàn nhang... tuyệt vời cho làn da phái nữ.</p><p><img class="product-img-responsive" style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"/></p><h3><strong>Về thương hiệu Obagi</strong></h3><blockquote><p><em>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</em></p><p><em>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia</em><em> sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</em></p></blockquote><h3><strong>Về sản phẩm kem chống nắng Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen</strong></h3><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-2-jpg-1595912166-28072020115606.jpg" alt="Giới thiệu sản phẩm kem chống nắng Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen 48g" width="600" height="" class="product-img-responsive"/></p><p><a href="https://vuahanghieu.com/kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-48g-ph024500"><strong>Kem chống nắng</strong><strong>Obagi Clinical Vitamin C SPF 30 48g</strong></a> sẽ hỗ trợ hấp thụ hòa toàn tia UVB và một phần các tia UVA từ ánh nắng mặt trời. Đặc biệt, sẽ hỗ trợ trung hòa bức xạ UV do ánh sáng mặt trời, hỗ trợ giảm thiểu tổn thương trên da, hỗ trợ giảm thâm sạm và nám, và hỗ trợ duy trì làn da trắng mịn, trẻ hóa da để bảo vệ làn da tươi trẻ rạng ngời.</p><p>Chỉ số chống nắng SPF 30 sẽ tối ưu hóa hỗ trợ hỗ trợ chống nắng cho làn da lên đến 300 phút và hỗ trợ bảo vệ làn da trước các tác động của tia UVA/UVB lên đến 98%.</p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem Chống Nắng Obagi Clinical Vitamin C SPF 30 Sunscreen</strong></h2><p>- <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">Kem chống nắng Obagi</a> hỗ trợ bảo vệ da khỏi tia UVA và UVB với phổ chống nắng rộng</p><p>- 10% Vitamin C dạng tinh khiết L-AA hỗ trợ giảm oxi hóa và hỗ trợ giảm thâm.</p><p>- Kem dưỡng ban ngày với nhiều chức năng như hỗ trợ dưỡng trắng, dưỡng ẩm, kem lót trang điểm chống nắng.</p><p>- Hỗ trợ mang đến khả năng làm trắng da vượt trội, đồng thời hỗ trợ bảo vệ da khỏi các tác nhân gây hại từ bên ngoài, hạn chế hình thành sắc tố melanin như thâm nám, tàn nhang, đốm nâu... hỗ trợ dưỡng da sáng trắng rạng ngời.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-3-jpg-1595912176-28072020115616.jpg" alt="Ưu điểm của Kem Chống Nắng Obagi Clinical Vitamin C SPF 30 Sunscreen" width="600" class="product-img-responsive"/></p><p>- Hỗ trợ da ít có kích ứng, ngược lại còn hỗ trợ giảm các vấn đề tuổi tác, tăng cường khả năng chống nắng.</p><p>- Hỗ trợ hạn chế các gốc tự do để hỗ trợ giảm các vấn đề tuổi tác của da.</p><p>- Hỗ trợ làm săn chắc da, giảm nếp nhăn trên da.</p><p>- Hỗ trợ ngăn chặn những tổn thương trên da, hỗ trợ bảo vệ làn da khỏe mạnh.</p><h2 style="font-size: 18pt;">Thành Phần <strong>Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen</strong></h2><p>Sản phẩm có kết cấu nhẹ nhàng, phù hợp với mọi loại da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-4-jpg-1595912186-28072020115626.jpg" alt="Th&agrave;nh Phần kem chống nắng Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen" width="600" class="product-img-responsive"/></p><p><em><strong>- Thành phần chi tiết: </strong>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm của Obagi</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><h2 style="font-size: 18pt;"><strong>Cách dùng kem chống nắng Obagi</strong></h2><p>- Sử dụng vào ban ngày ở bước cuối cùng của chu trình dưỡng da và trước lớp make-up.</p><p>- Thoa lượng vừa đủ cho toàn bộ da mặt & cổ.</p><p>- Đợi 15 phút trước khi ra nắng.</p><p>- Sau 2 tiếng cần thoa lại kem để bảo đảm độ bảo vệ tối ưu.</p><p style="text-align: left;"><strong>* Chú ý</strong>: <em>Tùy vào cơ địa/thể trạng làn da từng người dùng, thời gian mang lại kết quả có thể khác nhau.</em></p><p><a href="https://vuahanghieu.com/kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-48g-ph024500"><strong>Kem chống nắng Obagi Clinical Vitamin C Suncare Broad Spectrum SPF 30 Sunscreen</strong></a> được bào chế với kết cấu nhẹ nhàng, hỗ trợ tạo cảm giác thoải mái khi dùng. Đồng thời, công thức kem với thành phần dịu nhẹ phù hợp với mọi loại da.</p><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>48g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table>', 1600000, 10, 1668189699036, 1, 1145000, 0, 115)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'E727978C-F6E1-4FD9-B775-593D82DAE005', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Obagi Nuderm Sunfader SPF 15 Số 6', N'<p><strong>Kem chống nắng, làm trắng da Obagi Nu-Derm Sunfader SPF 15 số 6 </strong>là dòng <a href="https://vuahanghieu.com/my-pham">mỹ phẩm cao cấp</a> đến từ thương hiêu Obagi nổi tiếng của Mỹ. <strong>Obagi Nu-Derm Sunfader </strong>hỗ trợ ngừa da rám nắng, ngừa nám, tàn nhang đồng thời hỗ trợ cải thiện da trắng sáng, mịn màng.</p><h2><strong>Giới thiệu thương hiệu Obagi và Obagi Nu-Derm Sunfader SPF 15</strong></h2><p>Sản phẩm được nghiên cứu bởi <a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc. <strong><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></strong> được xem là thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm dấu hiệu tuổi tác trên da nám, nhăn, sạm, tàn nhang...</p><p><img class="product-img-responsive" style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"/></p><h3><span style="font-size: 14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><em>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</em></p><p><em>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia</em><em> sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</em></p></blockquote><h3><span style="font-size: 14pt;"><strong>Về sản phẩm Obagi Nu-Derm Sunfader SPF 15</strong></span></h3><p><a href="https://vuahanghieu.com/kem-chong-nang-lam-trang-da-obagi-nuderm-sunfader-spf-15-ph024482"><strong>Kem chống nắng Obagi Nu-Derm Sunfader SPF 15 số 6</strong></a> tích hợp vượt bậc là hỗ trợ chống nắng và hỗ trợ dưỡng trắng da, được chiết xuất từ thực vật thiên nhiên và hoạt chất vật lý zinc oxide hỗ trợ hình thành màng chắn ngừa các tác động gây các dấu hiệu tuổi tác, nám da từ bên ngoài, mặt khác hỗ trợ cung cấp dinh dưỡng bên trong hỗ trợ đẩy mạnh việc làm trắng. Vì thế, <strong>kem Obagi Nu-Derm Sunfader SPF 15</strong> hỗ trợ nuôi đưỡng da ngày càng trắng sáng và khỏe mạnh nhờ khả năng hỗ trợ chống tia UVA, UVB, ngừa enzym sản sinh các đốm đen trên bề mặt.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/kem-chong-nang-lam-trang-da-obagi-nuderm-sunfader-spf-15-jpg-1597479691-15082020152131.jpg" alt="Giới thiệu kem chống nắng Obagi Nu-Derm Sunfader SPF 15 số 6 ch&iacute;nh h&atilde;ng" width="600" height="" class="product-img-responsive"/></p><p>Hoạt chất tiên tiến hydroquinone là thành phần siêu dưỡng ẩm được thương hiệu <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm Obagi</a> áp dụng vào <a href="https://vuahanghieu.com/kem-chong-nang-lam-trang-da-obagi-nuderm-sunfader-spf-15-ph024482"><strong>kem chống nắng làm trắng da Obagi Nu-Derm Sunfader SPF 15 số 6</strong></a>, với khả năng hỗ trợ cấp nước và tích nước trên bề mặt cũng như ở sâu tế bào, hỗ trợ da tái cân bằng ẩm, trở nên mềm mại, săn chắc.</p><p><a href="https://vuahanghieu.com/obagi-medical/kem-chong-nang">Kem chống nắng Obagi cao cấp</a> góp phần hỗ trợ cải thiện da khô ráp, mặt khác hỗ trợ hạn chế sự gia tăng sắc tố da gây nám, tàn nhang, đồi mồi, hỗ trợ tăng độ sáng và đều màu cho da.</p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem Chống Nắng Da Obagi Nuderm Sunfader SPF 15 Số 6</strong></h2><p>- Hỗ trợ chống nắng kết hợp làm sáng da và giảm nám, tàn nhang</p><p>- hỗ trợ hạn chế tia UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p>- hỗ trợ bảo vệ da và phòng những tác động của ánh nắng mỗi ngày.</p><p>- hỗ trợ đem lại cho bạn làn da trắng sáng mịn màng.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/nuoc-hoa-hong-obagi-so-2-6-jpg-1597479587-15082020151947.jpg" alt="Ưu điểm của Kem Chống Nắng Da Obagi Nuderm Sunfader SPF 15 Số 6" width="600" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Thành Phần kem chống nắng </strong><strong>Obagi Nu-Derm Sunfader SPF 15</strong></h2><p>- Sản phẩm <a href="https://vuahanghieu.com/kem-chong-nang">kem chống nắng</a> có kết cẩu mỏng nhẹ, nên khi thoa lên da nhanh chóng thẩm thấu hỗ trợ mang lại cảm giác thoải mái.</p><p>- Chi tiết các thành phần: <em>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm của Obagi</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><p><em><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/hq-jpg-1597479602-15082020152002.jpg" alt="Th&agrave;nh Phần kem chống nắng Obagi Nu-Derm Sunfader SPF 15" width="600" class="product-img-responsive"/></em></p><h2 style="font-size: 18pt;"><strong>Hướng Dẫn Sử Dụng:</strong></h2><h3><span style="font-size: 14pt;"><strong>Đối tượng sử dụng</strong></span></h3><p>- Dành cho mọi loại da, kể cả da nhạy cảm.</p><p>- Giải pháp lý tưởng cho làn da cần loại bỏ đốm nâu, tàn nhang, tăng sắc tố.</p><p>- Phụ nữ có nám khó loại bỏ và da gặp dấu hiệu tuổi tác.</p><p>- Phụ nữ thay đổi làn da do thay đổi nội tiết tố.</p><p>- Đang trong quá trình loại bỏ Nám sâu, nám hỗn hợp…</p><p>- Dành cho những ai đang tìm sản phẩm chăm sóc da tích hợp nhiều chức năng như làm trắng da; giảm nám, chống nắng cho da.</p><p>- Những ai mong muốn chăm sóc và bảo vệ da khỏe đẹp, trẻ trung lâu dài theo năm tháng.</p><h3><span style="font-size: 14pt;"><strong>Cách sử dụng sản phẩm đúng cách</strong></span></h3><p>- Làm sạch da mặt và lau nhẹ nhàng.</p><p>- Lấy lượng khoảng 1 đốt ngón tay trỏ; thoa nhẹ nhàng đều lên khắp vùng da (tránh vùng mắt, môi).</p><p>- Lấy tay vỗ nhẹ lên da mặt để dưỡng chất có thể thẩm thấu sâu và đều vào da.</p><p><em><strong>Lưu ý:</strong></em></p><p>- Lắc đều sản phẩm trước khi dùng.</p><p>- Bảo quản sản phẩm nơi khô ráo, thoáng mát. Tránh tiếp xúc với nhiệt độ cao và ánh nắng trực tiếp.</p><p>- Để xa tầm tay trẻ em.</p><p>Sử dụng <a href="https://vuahanghieu.com/kem-chong-nang-lam-trang-da-obagi-nuderm-sunfader-spf-15-ph024482"><strong>kem chống nắng ngừa nám da Obagi NuDerm Sunfader SPF 15 số 6</strong></a> đều đặn mỗi ngày vào ban ngày; bạn sẽ cảm nhận sự thay đổi tích cực trên da qua từng ngày.</p><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>57g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table><p>» <a href="https://vuahanghieu.com/tin-tuc/top-5-kem-chong-nang-obagi-bao-ve-va-duong-da-tot-nhat-nen-dung">Top 5 kem chống nắng Obagi bảo vệ và dưỡng da tốt nhất nên dùng</a></p><p>» <a href="https://vuahanghieu.com/tin-tuc/review-kem-chong-nang-cao-cap-obagi-spf-50-matte-chiet-xuat-tu-thien-nhien">Review kem chống nắng cao cấp Obagi SPF 50 matte chiết xuất từ thiên nhiên</a></p>', 2200000, 10, 1668189699036, 1, 1640000, 0, 116)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'A0FDD5B5-3B86-4C36-BAC5-B5FFC6433E3A', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Vật Lý Có Màu Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50', N'<p><strong>Kem chống nắng Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50</strong> là dòng <a href="https://vuahanghieu.com/my-pham">mỹ phẩm cao cấp</a> của thương hiệu Obagi Mỹ nổi tiếng. <strong>Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50</strong> hỗ trợ hạn chế tổn thương da từ mặt trời, ánh sáng xanh, ánh sáng vô hình và ánh sáng hồng ngoại, bảo vệ da khỏi xạm nám.</p><h2 style="font-size: 18pt;"><strong>Giới thiệu thương hiệu Obagi và Obagi SuzanObagiMD Physical SPF 50</strong></h2><p>Sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">Kem chống nắng Obagi</a> được nghiên cứu bởi <a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc. <strong><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></strong> được xem là thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm nám, sạm, tàn nhang... tuyệt vời cho làn da phái nữ.</p><p><img class="product-img-responsive" style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"/></p><h3><span style="font-size: 14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><em>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</em></p><p><em>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia</em><em> sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</em></p></blockquote><h3><span style="font-size: 14pt;"><strong>Về sản phẩm kem chống nắng Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50</strong></span></h3><p>Ánh sáng mặt trời được biết là làm tăng tốc độ xuất hiện các dấu hiệu tuổi tác trên da. Tuy nhiên, tia UVA và UVB chỉ là hai trong số năm yếu tố gây hại từ ánh mặt trời. 3 yếu tố khác chính là ánh sáng nhìn thấy năng lượng cao (HEV), ánh sáng nhìn thấy (VIS) và bức xạ hồng ngoại (IR), tất cả đều được xem là có khả năng đẩy nhanh tốc độ xuất hiện các dấu hiệu tuổi tác trên da. Công thức của <a href="https://vuahanghieu.com/my-pham/kem-chong-nang">kem chống nắng mới</a> dựa trên vi khoáng, có phổ chống nắng rộng cung cấp khả năng chống nắng tiên tiến, trong khi các chất hạn chế oxy hóa mạnh loại bỏ tác hại của gốc tự do từ các nguồn sáng khác và oxy hóa từ môi trường. Có màu tự nhiên để phù hợp với mọi tông da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-4-jpg-1596188219-31072020163659.jpg" alt="Giới thiệu sản phẩm kem chống nắng Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50" width="600" height="" class="product-img-responsive"/></p><p>Ngoài tác dụng chống tia UVA, UVB, <a href="https://vuahanghieu.com/kem-chong-nang-vat-ly-co-mau-obagi-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-ph024614"><strong>Kem Chống Nắng SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50 </strong></a>còn có khả năng chống cả tia HEV, VIS và bức xạ hồng ngoại IR (cả ba tia đều có khả năng gây các vấn đề tuổi tác trên da).</p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem chống nắng Obagi SuzanObagiMD Physical</strong></h2><p>- Hỗ trợ bảo vệ da bằng titan dioxide và kẽm oxit.</p><p>- Chỉ số PA ++++ | Chống tia HEV, VIS, IR.</p><p>- Kem chống nắng mịn nhẹ, tiệp vào da người dùng cảm thấy thoải mái.</p><p>- Bổng sung aloe vera hỗ trợ làm dịu viêm và đỏ.</p><p>- Công thức có màu da tự nhiên phù hợp với mọi tông da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-3-jpg-1596188192-31072020163632.jpg" alt="Ưu điểm của Kem chống nắng Obagi SuzanObagiMD Physical SPF 50" width="600" class="product-img-responsive"/></p><p><strong>Thành phần chi tiết:</strong><em>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm của Obagi</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng Kem chống nắng vật lý Obagi SPF 50</strong></h2><p>- Thoa lên da 15 phút trước khi ra nắng hoặc tiếp xúc các thiết bị điện tử phát ánh sáng xanh.</p><p>- Sử dụng kèm kem chống nắng chống nước nếu bơi hoặc đổ mồ hôi.</p><p>- Thoa lại sau 2 tiếng.</p><p>- Đối với trẻ dưới sáu tháng tuổi: tham khảo ý kiến bác sĩ.</p><p>- Bảo quản ở nhiệt độ phòng.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-5-jpg-1596188498-31072020164138.jpg" alt="Hướng dẫn sử dụng Kem chống nắng Obagi SPF 50" width="600" class="product-img-responsive"/></p><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>96.3g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table><p>» <a href="https://vuahanghieu.com/kem-chong-nang-vat-ly-obagi-suzanobagimd-physical-defense-broad-spectrum-spf-40-ph024615">Kem Chống Nắng Vật Lý Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40</a></p>', 1380000, 10, 1668189699036, 1, 1060000, 0, 117)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'3FC7B637-73BB-467E-8FBB-7A0D0663918E', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Vật Lý Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40', N'<p><strong>Kem Chống Nắng Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40</strong> là dòng&nbsp;<a href="https://vuahanghieu.com/my-pham">mỹ phẩm cao cấp</a> của thương hiệu Obagi Mỹ nổi tiếng. <strong>Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40 </strong>hỗ trợ hạn chế tổn thương da từ mặt trời, ánh sáng xanh, ánh sáng vô hình và ánh sáng hồng ngoại, hỗ trợ bảo vệ da khỏi sạm nám.</p><h2><strong>Giới thiệu thương hiệu Obagi và Obagi SuzanObagiMD Physical SPF 50</strong></h2><p>Sản phẩm&nbsp;<a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">Kem chống nắng Obagi</a>&nbsp;được nghiên cứu bởi&nbsp;<a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc.&nbsp;<a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a>&nbsp;được xem là thương hiệu&nbsp;<a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a>&nbsp;về khả năng hỗ trợ làm giảm nám, sạm, tàn nhang...&nbsp;tuyệt vời cho làn da phái nữ.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"></p><h3><span style="font-size:14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><i>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</i></p><p><i>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia&nbsp;sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</i></p></blockquote><h3><span style="font-size:14pt;"><strong>Về sản phẩm kem chống nắng Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40</strong></span></h3><p>Ánh sáng mặt trời được biết là làm tăng tốc độ xuất hiện các dấu hiệu tuổi tác trên da. Tuy nhiên, tia UVA và UVB chỉ là hai trong số năm yếu tố gây hại từ ánh mặt trời. 3 yếu tố khác chính là ánh sáng nhìn thấy năng lượng cao (HEV), ánh sáng nhìn thấy (VIS) và bức xạ hồng ngoại (IR), tất cả đều được xem là có khả năng đẩy nhanh tốc độ xuất hiện các dấu hiệu tuổi tác trên da. Công thức của&nbsp;<a href="https://vuahanghieu.com/my-pham/kem-chong-nang">kem chống nắng mới</a>&nbsp;dựa trên vi khoáng, có phổ chống nắng rộng cung cấp khả năng chống nắng tiên tiến, trong khi các chất hạn chế oxy hóa mạnh loại bỏ tác hại của gốc tự do từ các nguồn sáng khác và oxy hóa từ môi trường. Có màu tự nhiên để phù hợp với mọi tông da.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/suzanobagimd-physical-defense-broad-spectrum-spf-40-2-jpg-1596188908-31072020164828.jpg" alt="Giới thiệu sản phẩm kem chống nắng Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40 chính hãng" width="600"></p><p>Ngoài tác dụng chống tia UVA, UVB,&nbsp;<a href="https://vuahanghieu.com/kem-chong-nang-vat-ly-obagi-suzanobagimd-physical-defense-broad-spectrum-spf-40-ph024615"><strong>Kem Chống Nắng Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40</strong></a> còn có khả năng chống cả tia HEV, VIS và bức xạ hồng ngoại IR (cả ba tia đều có khả năng gây lão hoá da).</p><h2 style="font-size:18pt;"><strong>Ưu điểm của sản phẩm Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40</strong></h2><p>- Hỗ trợ bảo vệ da khỏi các tác động của ánh nắng, môi trường.</p><p>- Chỉ số PA ++++ | Chống tia HEV, VIS, IR.</p><p>- Kem chống nắng mịn nhẹ, tiệp vào da mang lại cảm giác thoải mái.</p><p>- Hỗ trợ bổ sung aloe vera làm dịu viêm và đỏ.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/kem-chong-nang-obagi-suzanobagimd-physical-defense-broad-spectrum-spf-40-jpg-1598426173-26082020141613.jpg" alt="Ưu điểm của sản phẩm Obagi SuzanObagiMD Physical Defense Broad Spectrum SPF 40" width="600"></p><h2 style="font-size:18pt;"><strong>Thành phần kem chống nắng Obagi SuzanObagiMD Physical SPF 40</strong></h2><p><strong>Thành phần chi tiết:</strong><i>Hầu hết các sản phẩm&nbsp;</i><a href="https://vuahanghieu.com/obagi-medical/my-pham"><i>mỹ phẩm của Obagi</i></a><i>&nbsp;đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</i></p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-5-jpg-1596188498-31072020164138.jpg" alt="Thành phần kem chống nắng Obagi SuzanObagiMD Physical SPF 40" width="600"></p><h2 style="font-size:18pt;"><strong>Hướng dẫn sử dụng:</strong></h2><p>- Thoa lên da 15 phút trước khi ra nắng hoặc tiếp xúc các thiết bị điện tử phát ánh sáng xanh.</p><p>- Sử dụng kèm kem chống nắng không thấm nước nếu bơi hoặc đổ mồ hôi.</p><p>- Thoa lại sau 2 tiếng.</p><p>- Đối với trẻ dưới sáu tháng tuổi: tham khảo ý kiến bác sĩ.</p><p>- Bảo quản ở nhiệt độ phòng.</p><figure class="table"><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>96.3g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table></figure><p>» <a href="https://vuahanghieu.com/kem-chong-nang-vat-ly-co-mau-obagi-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-ph024614">Kem Chống Nắng Vật Lý Có Màu Obagi SuzanObagiMD Physical Defense Tinted Broad Spectrum SPF 50</a></p>', 1380000, 3, 1668189699036, 1, 1060000, 1, 118)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'506719F2-8BC3-4480-B945-9C29F3F56649', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Obagi Healthy Skin Protection SPF 35', N'<p><strong>Kem Chống Nắng Obagi Healthy Skin Protection SPF35 </strong>đến từ thương hiệu <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm Obagi</a> nổi tiếng của Mỹ. <strong>Obagi Healthy Skin Protection SPF35 </strong>mang tới giải pháp phù hợp dành cho chị em trong việc chăm sóc và bảo vệ da khỏi tia UVA, UVB. Đây là một trong số những nguyên nhân chính làm da nhanh chóng "xuống cấp" và tăng sắc tố da.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-healthy-skin-protection-spf-35-2-jpg-1596195024-31072020183024.jpg" alt="Kem Chống Nắng Obagi Healthy Skin Protection SPF35 chính hãng Mỹ" width="700" height="700"></p><h2 style="font-size:18pt;"><strong>Ưu điểm của Kem Chống Nắng Obagi</strong></h2><p>- Hỗ trợ hạn chế ảnh hưởng của tia UVA, UVB với da: Tia UVA, UVB phát ra từ ánh nắng mặt trời sẽ ảnh hưởng rất lớn tới da khiến da bị sạm đen, xuất hiện nhiều hắc tố trên da gây nên nám, tàn nhang. Sử dụng <a href="https://vuahanghieu.com/kem-chong-nang-obagi-healthy-skin-protection-spf-35-ph024618"><strong>Kem chống nắng Obagi Healthy Skin Protection SPF 35</strong></a> khi đi ra ngoài sẽ hỗ trợ bạn hạn chế được những ảnh hưởng của tia UVA, UVB tới da.</p><p>- Hỗ trợ làn da trắng sáng, mịn màng: Việc sử dụng <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">Kem chống nắng Obagi</a> thường xuyên còn hỗ trợ chăm sóc và dưỡng da, làm da trắng sáng, mịn màng là tâm điểm thu hút mọi ánh nhìn.</p><p>- Bên cạnh đó sản phẩm còn có thể sử dụng làm lớp kem lót trang điểm.</p><p>- Hỗ trợ làm giảm các dấu hiệu tuổi tác trên da.</p><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-healthy-skin-protection-spf-35-3-jpg-1596195035-31072020183035.jpg" alt="Hiệu quả sử dụng Kem Chống Nắng Obagi" width="700" height="875"></p><h2 style="font-size:18pt;"><strong>Thành phần kem chống nắng Obagi</strong></h2><p><strong>Thành phần chính của sản phẩm:</strong><i>Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm</i></p><h2 style="font-size:18pt;"><strong>Hướng dẫn sử dụng kem chống nắng Obagi&nbsp;</strong></h2><ul><li><strong>Bước 1</strong>: Trước tiên các bạn làm sạch da bằng sữa rửa mặt.</li><li><strong>Bước 2</strong>: Thoa đều kem một lượng kem vừa đủ lên da rồi dùng tay vỗ nhẹ để kem thẩm thấu tốt hơn trên da.</li></ul><p><strong>Lưu ý</strong>: Nên sử dụng trước khi rời khỏi nhà.</p><p>- Bảo quản sản phẩm ở nơi khô ráo, thoáng mát.</p><p>- Đậy nắp lại ngay sau khi sử dụng..</p><p>- Sau khi hoạt động ngoài trời nhiều giờ các bạn nên làm sạch da và tiếp tục thoa <a href="https://vuahanghieu.com/kem-chong-nang-obagi-healthy-skin-protection-spf-35-ph024618"><strong>Kem chống nắng Obagi Healthy Skin Protection SPF 35</strong></a> để bảo vệ da.</p><p>Hiện nay <a href="https://vuahanghieu.com/my-pham/kem-chong-nang">dòng kem chống nắng cao cấp</a> này đang được chị em phụ nữ tin tưởng sử dụng với những đánh giá tích cực về chất lượng. Dòng <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm Obagi</a> đã và đang được nhiều beauty blog yêu thích và sử dụng.</p><figure class="table"><table style="border-collapse:collapse;height:72px;width:100%;" border="1"><tbody><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Thương hiệu</strong></td><td style="height:18px;width:50%;"><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Xuất xứ</strong></td><td style="height:18px;width:50%;"><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Phân loại</strong></td><td style="height:18px;width:50%;"><a href="https://vuahanghieu.com/my-pham/kem-chong-nang">Kem chống nắng</a></td></tr><tr style="height:18px;"><td style="height:18px;width:50%;"><strong>Trọng lượng</strong></td><td style="height:18px;width:50%;">85g</td></tr></tbody></table></figure>', 1200000, 10, 1668189699036, 1, 935000, 1, 119)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'D9DF7FDF-9F56-444C-99B0-BC218479F7B0', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Cho Da Nhạy Cảm Obagi Mineral Sunshield Broad Spectrum SPF 50', N'<p><strong>kem chống nắng Obagi Sun Shield Mineral Broad Spectrum SPF 50 cho da nhạy cảm </strong>là dòng mỹ phẩm cao cấp của thương hiệu dược <a href="https://vuahanghieu.com/obagi-medical/my-pham/my">mỹ phẩm Obagi Mỹ</a> nổi tiếng. <strong>Obagi Sun Shield Mineral Broad Spectrum SPF 50</strong> là kem chống nắng vật lý vừa hỗ trợ chống nắng da trước những tác động của tia UVA/UVB vừa cung cấp dưỡng chất dưỡng ẩm cho làm dịu da và hỗ trợ khôi phục hàng rào bảo vệ da.</p><h2><strong>Giới thiệu thương hiệu Obagi và Obagi Sun Shield Mineral Broad Spectrum SPF 50</strong></h2><p>Sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-chong-nang">kem chống nắng Obagi</a> được nghiên cứu bởi <a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc. <strong><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></strong> được xem là thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm nám, sạm, tàn nhang... tuyệt vời cho làn da phái nữ.</p><p><img class="product-img-responsive" style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"/></p><h3><span style="font-size: 14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><em>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</em></p><p><em>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia</em><em> sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</em></p></blockquote><h3><span style="font-size: 14pt;"><strong>Về sản phẩm kem chống nắng Obagi Sun Shield Mineral Broad Spectrum SPF 50</strong></span></h3><p><a href="https://vuahanghieu.com/obagi-medical-mineral-sunshield-broad-spectrum-spf-50-ph024619"><strong>Kem chống nắng Obagi Sun Shield Mineral broad spectrum </strong><strong>SPF 50</strong></a> sử dụng công nghệ chống nắng tiên tiến invisible Zinc với thành phần vật lý hỗ trợ chống tia UV, bảo vệ làn da khỏe mạnh, trắng sáng và mịn màng từ sâu bên trong.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-mineral-sunshield-broad-spectrum-spf-50-2-jpg-1596195685-31072020184125.jpg" alt="Giới thiệu sản phẩm kem chống nắng Obagi Sun Shield Mineral Broad Spectrum SPF 50 ch&iacute;nh h&atilde;ng" width="600" class="product-img-responsive"/></p><p>Với chỉ số chống nắng SPF 50 cực mạnh, kem chống nắng <strong>Obagi Sun Shield Mineral SPF 50</strong> khi tiếp xúc lên bề mặt da sẽ hỗ trợ hình thành hàng rào bảo vệ da bên ngoài, phản xạ tia UVA, UVB từ ánh nắng, từ đó hạn chế tích tụ hắc tố melanin gây nám, tàn nhang trên bề mặt. Song song đó, <a href="https://vuahanghieu.com/obagi-medical-mineral-sunshield-broad-spectrum-spf-50-ph024619">kem chống nắng Obagi Sun Shield Mineral SPF 50</a> chứa các chất khoáng tự nhiên hấp và phân tán tia cực tím, bảo vệ da nhạy cảm, đồng thời kem chống nắng tăng cường năng lượng giải hóa oxy.</p><p>Bên cạnh đó, <strong>kem chống nắng Obagi Sun Shield Mineral SPF 50</strong> được thiết kế dưới dạng màng liên kết đặc biệt làm kem bền hơn, phải hơn 40 phút khi da tiếp xúc với nước. Nhờ đó, chúng ta tha hồ vận động hay chơi thể thao dưới nước vào ban ngày.</p><h2 style="text-align: justify; font-size: 18pt;"><strong>Ưu điểm của sản phẩm Obagi Sun Shield Mineral Broad Spectrum SPF 50</strong></h2><p style="text-align: justify;">– Kem chống nắng bảo vệ da trước cả tia UVA và UVB.</p><p style="text-align: justify;">– Hỗ trợ dưỡng ẩm cần thiết cho da.</p><p style="text-align: justify;">– Hỗ trợ phục hồi hàng rào bảo vệ da.</p><p style="text-align: justify;">– Hỗ trợ làm trắng da từ bên trong.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-mineral-sunshield-broad-spectrum-spf-50-4-jpg-1596195773-31072020184253.jpg" alt="Ưu điểm của sản phẩm Obagi Sun Shield Mineral Broad Spectrum SPF 50" width="600" class="product-img-responsive"/></p><h2 style="text-align: justify; font-size: 18pt;"><strong>Thành Phần KCN </strong><strong>Obagi Sun Shield Mineral</strong></h2><p style="text-align: justify;">- <strong>Thành phần chi tiết</strong>: <em>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm của Obagi</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><p style="text-align: justify;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-healthy-skin-protection-spf-35-3-jpg-1596195782-31072020184302.jpg" alt="Th&agrave;nh Phần KCN Obagi Sun Shield Mineral" width="600" class="product-img-responsive"/></p><h2 style="text-align: justify; font-size: 18pt;"><strong>Hướng dẫn sử dụng kem chống nắng Obagi Sun Shield Mineral Broad Spectrum SPF 50</strong></h2><div class="hdSudDetail"><p>- Dùng Kem chống nắng cho da nhạy cảm Obagi Sun Shield Mineral Broad Spectrum SPF 50 trên làn da đã được làm sạch, trước khi ra ngoài nắng 30 phút.</p><p>- Lặp lại kem chống năng sau 2h ở ngoài nắng hoặc sau khi đi bơi.</p></div><p>- Kết quả có thể khác nhau tuỳ theo cơ địa của từng người.</p><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>85g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table>', 1200000, 10, 1668189699036, 1, 936000, 0, 120)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'813961A8-1495-45DC-917A-A6B385B42509', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Lót Chống Nắng Che Khuyết Điểm Obagi Tint SPF 50 Warm 85g', N'<p><strong>Kem lót chống nắng che khuyết điểm Obagi Tint SPF 50 Warm</strong> là dòng mỹ phẩm cao cấp đến từ <a href="https://vuahanghieu.com/obagi-medical/my">thương hiệu Obagi Mỹ</a> nổi tiếng. <strong>Obagi Tint SPF 50 Warm</strong> bảo vệ làn da khỏi ánh nắng mặt trời, làm da tránh khỏi quá trình oxy hóa có nguồn gốc phát ra từ nhiệt. Kem làm da đều màu, cho tông màu da trắng hồng tự nhiên, không gây mụn, đã được bác sỹ da liễu của Mỹ thử nghiệm lành tính.</p><h2><strong>Giới thiệu thương hiệu Obagi và Obagi Tint SPF 50 Warm</strong></h2><p>Sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-lot">kem lót Obagi</a> được nghiên cứu bởi <a href="https://www.obagi.com/">tập đoàn Obagi</a>, ra đời tại Mỹ, được áp dụng công nghệ sản xuất tiên tiến với đội ngũ chuyên gia bác sĩ chuyên sâu để tạo nên những công thức cải thiện da vượt bậc. <strong><a href="https://vuahanghieu.com/obagi-medical">Obagi</a></strong> được xem là thương hiệu <a href="https://vuahanghieu.com/my-pham">mỹ phẩm nổi tiếng</a> về khả năng hỗ trợ làm giảm nám, sạm, tàn nhang... tuyệt vời cho làn da phái nữ.</p><p><img class="product-img-responsive" style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"/></p><h3><span style="font-size: 14pt;"><strong>Về thương hiệu Obagi</strong></span></h3><blockquote><p><em>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn.</em></p><p><em>Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia</em><em> sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất và bán các sản phẩm này.</em></p></blockquote><h3><span style="font-size: 14pt;"><strong>Về sản phẩm kem lót chống nắng che khuyết điểm Obagi Tint SPF 50 Warm</strong></span></h3><p>Chỉ cần một lớp <a href="https://vuahanghieu.com/kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-ph024617"><strong>kem lót chống nắng che khuyết điểm Obagi Tint SPF 50 Warm</strong></a> là bạn đã có thể che phủ những khuyết điểm trên gương mặt hoàn hảo, làm làn da trắng sáng mượt mà và đặc biệt da sẽ được hỗ trợ bảo vệ da tối ưu làn da trước tác động của tia UVA, UVB từ ánh sáng mặt trời, hỗ trợ da tránh khỏi quá trình oxy hóa có nguồn gốc phát ra từ nhiệt.</p><p>Hơn thế nữa, <a href="https://vuahanghieu.com/obagi-medical/my-pham/kem-lot">kem lót Obagi</a> cung cấp dưỡng chất cần thiết để làm dịu da, tạo lớp màng tự nhiên bảo vệ da khỏi những tác động xấu, sản phẩm phù hợp với mọi làn da, kể cả vùng da nhạy cảm nhất.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/01/kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-warm-3-jpg-1609744035-04012021140715.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Ưu điểm của sản phẩm kem lót </strong><strong>Obagi Tint SPF 50 Warm</strong></h2><p><a href="https://vuahanghieu.com/kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-ph024617"><strong>Kem lót chống nắng Obagi Tint SPF 50 Warm</strong></a> là kem chống nắng phổ rộng giúp hạn chế làm tổn hại lớp thượng bì, trung bì và độ lành tính tương đối cao, ngoài ra công nghệ mới có thể hạn chế tia hồng ngoại hỗ trợ hạn chế các vấn đề tuổi tác trên da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/01/kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-warm-4-jpg-1609744044-04012021140724.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Thành phần </strong><strong>kem lót che khuyết điểm </strong><strong>Obagi Tint SPF 50 Warm</strong></h2><p><strong>Thành phần chính: </strong><em>Hầu hết các sản phẩm <a href="https://vuahanghieu.com/obagi-medical/my-pham">mỹ phẩm của Obagi</a> đều lành tính. Tuy nhiên các bạn nên tham khảo chi tiết trên hướng dẫn sử dụng đi kèm.</em></p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/01/obagi-rx-c-therapy-night-cream-6-jpg-1609744066-04012021140746.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng kem lót Obagi cao cấp </strong><strong>Obagi Tint SPF 50</strong></h2><p>– Dùng lượng vừa đủ, thoa nhẹ nhàng lên khắp mặt (trừ mí mắt), dùng tay vỗ nhẹ lên da.Thóa trước khi ra nắng 15p, thoa lại sau 2h khi tiếp xúc trực tiếp với nắng.</p><p>– Dùng ban ngày.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/duong-am-cho-da-jpg-1597474524-15082020135524.jpg" alt="Hướng dẫn sử dụng kem l&oacute;t Obagi cao cấp Obagi Tint SPF 50" width="600" class="product-img-responsive"/></p><table border="1"><tbody><tr><td><strong>Thương hiệu</strong></td><td><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td><strong>Xuất xứ</strong></td><td><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td><strong>Trọng lượng</strong></td><td>85g</td></tr><tr><td><strong>Hạn sử dụng</strong></td><td>3 năm kể từ ngày sản xuất</td></tr><tr><td><strong>Ngày sản xuất</strong></td><td>In trên bao bì</td></tr></tbody></table>', 1200000, 10, 1668189699036, 1, 948000, 0, 121)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'F1853671-CCF2-469B-B0A2-FF7F72259AEE', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Obagi Nu-Derm Sun Shield Matte Broad Spectrum SPF 50 Sunscreen 85g', N'<p><strong><a href="https://vuahanghieu.com/obagi-medical/kem-chong-nang" title="Kem Chống Nắng Obagi" data-keyword-link="920">Kem Chống Nắng Obagi</a> Nu-Derm Sun Shield Matte Broad Spectrum SPF 50 Sunscreen 85g</strong> đến từ thương hiệu mỹ phẩm Obagi nổi tiếng của Mỹ. <strong>Obagi Nu-Derm Sun Shield Matte Broad Spectrum SPF 50 </strong>mang tới giải pháp phù hợp dành cho chị em trong việc chăm sóc và bảo vệ da khỏi tia UVA, UVB. Đây là một trong số những nguyên nhân chính làm da nhanh chóng "xuống cấp" và tăng sắc tố da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/01/plo-jpg-1611558668-25012021141108.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Ưu điểm của Kem Chống Nắng Obagi</strong></h2><p>- Hỗ trợ hạn chế ảnh hưởng của tia UVA, UVB với da: Tia UVA, UVB phát ra từ ánh nắng mặt trời sẽ ảnh hưởng rất lớn tới da khiến da bị sạm đen, xuất hiện nhiều hắc tố trên da gây nên nám, tàn nhang. Sử dụng kem chống nắng <strong>Obagi Nu-Derm Sun Shield Matte Broad Spectrum SPF 50</strong> khi đi ra ngoài sẽ hỗ trợ bạn hạn chế được những ảnh hưởng của tia UVA, UVB tới da.</p><p>- Hỗ trợ làn da trắng sáng, mịn màng: Việc sử dụng Kem chống nắng Obagi thường xuyên còn hỗ trợ chăm sóc và dưỡng da, làm da trắng sáng, mịn màng là tâm điểm thu hút mọi ánh nhìn.</p><p>- Hỗ trợ bảo vệ da khỏi sự tăng trưởng của các hắc sắc tốt,  cho làn da tươi sáng và mịn màng hơn mỗi ngày</p><p>- Hỗ trợ làm giảm các dấu hiệu tuổi tác trên da.</p><p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/07/kem-chong-nang-obagi-healthy-skin-protection-spf-35-3-jpg-1596195035-31072020183035.jpg" alt="Hiệu quả sử dụng Kem Chống Nắng Obagi" width="700" height="875" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Thành phần kem chống nắng Obagi</strong></h2><p><strong>Thành phần chính của sản phẩm:</strong><em>Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm</em></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng kem chống nắng Obagi </strong></h2><ul><li><strong>Bước 1</strong>: Trước tiên các bạn làm sạch da bằng sữa rửa mặt.</li><li><strong>Bước 2</strong>: Thoa đều kem một lượng kem vừa đủ lên da rồi dùng tay vỗ nhẹ để kem thẩm thấu tốt hơn trên da.</li></ul><p><strong>Lưu ý</strong>: Nên sử dụng trước khi rời khỏi nhà tầm 15-20 phút.</p><p>- Bảo quản sản phẩm ở nơi khô ráo, thoáng mát.</p><p>- Đậy nắp lại ngay sau khi sử dụng..</p><p>- Sau khi hoạt động ngoài trời nhiều giờ các bạn nên làm sạch da và tiếp tục thoa <strong>Obagi Nu-Derm Sun Shield Matte Broad Spectrum SPF 50</strong> để bảo vệ da.</p><table style="border-collapse: collapse; width: 100%; height: 72px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;">Obagi</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ phẩm Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Phân loại</strong></td><td style="width: 50%; height: 18px;">Kem chống nắng</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Trọng lượng</strong></td><td style="width: 50%; height: 18px;">85g</td></tr></tbody></table>', 1200000, 10, 1668189699036, 1, 889000, 0, 122)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'002DEAFF-B827-493D-B7B1-36FA2E4B86EB', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 85g', N'<p><strong><a href="https://vuahanghieu.com/obagi-medical/kem-chong-nang" title="Kem Chống Nắng Obagi" data-keyword-link="920">Kem Chống Nắng Obagi</a> Sun Shield Matte Broad Spectrum SPF 50 85g</strong> đến từ thương hiệu mỹ phẩm Obagi nổi tiếng của Mỹ. <strong>Obagi Sun Shield Matte Broad Spectrum SPF 50</strong><strong> </strong>mang tới giải pháp phù hợp dành cho chị em trong việc chăm sóc và bảo vệ da khỏi tia UVA, UVB. Đây là một trong số những nguyên nhân chính làm da nhanh chóng "xuống cấp" và tăng sắc tố da.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/05/kcn-obagi2-png-1620614385-10052021093945.png" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Ưu điểm của kem chống nắng Obagi Sun Shield Matte Broad Spectrum SPF 50</strong></h2><p>- Chống nắng, kết hợp làm sáng da và bảo vệ da khỏi tăng sắc tố.</p><p>- Hạn chế ảnh hưởng của UVA, UVB làm tổn hại lớp thượng bì, trung bì.</p><p>- Hỗ trợ bảo vệ da và hạn chế những tác động của ánh nắng mỗi ngày.</p><p>- Đem lại cho bạn làn da mịn màng tươi sáng.</p><p style="text-align: center;"><img src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2021/05/31928_2_1024x1024-jpg-1620614393-10052021093953.jpg" class="product-img-responsive"/></p><h2 style="font-size: 18pt;"><strong>Thành phần kem chống nắng Obagi</strong></h2><p><strong>Thành phần chính của sản phẩm:</strong><em>Tham khảo chi tiết trên hướng dẫn sử dụng đi kèm</em></p><h2 style="font-size: 18pt;"><strong>Hướng dẫn sử dụng kem chống nắng Obagi </strong></h2><ul><li><strong>Bước 1</strong>: Trước tiên các bạn làm sạch da bằng sữa rửa mặt.</li><li><strong>Bước 2</strong>: Thoa đều kem một lượng kem vừa đủ lên da rồi dùng tay vỗ nhẹ để kem thẩm thấu tốt hơn trên da.</li></ul><p><strong>Lưu ý</strong>: Nên sử dụng trước khi rời khỏi nhà tầm 15-20 phút.</p><p>- Bảo quản sản phẩm ở nơi khô ráo, thoáng mát.</p><p>- Đậy nắp lại ngay sau khi sử dụng..</p><p>- Sau khi hoạt động ngoài trời nhiều giờ các bạn nên làm sạch da và tiếp tục thoa <strong>Obagi Sun Shield Matte Broad Spectrum SPF 50</strong> để bảo vệ da.</p><table style="border-collapse: collapse; width: 100%; height: 72px;" border="1"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Thương hiệu</strong></td><td style="width: 50%; height: 18px;">Obagi</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Xuất xứ</strong></td><td style="width: 50%; height: 18px;">Mỹ phẩm Mỹ</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Phân loại</strong></td><td style="width: 50%; height: 18px;">Kem chống nắng</td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;"><strong>Trọng lượng</strong></td><td style="width: 50%; height: 18px;">85g</td></tr></tbody></table>', 1250000, 10, 1668189699036, 1, 893000, 0, 123)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'B5CAE405-4BD9-45B6-9184-3BD97D63C137', N'72EF37BD-237A-4A46-8BA6-C53D17F455E2', N'84D76D27-A3BD-4842-A6F0-7DCF8DC06A38', N'Kem Chống Nắng Vật Lý Obagi Nu-Derm Physical UV Broad Spectrum SPF 32 57g', N'<p><strong>Kem Chống Nắng Vật Lý Obagi Nu-Derm Physical UV Broad Spectrum SPF 32 57g </strong>là dòng&nbsp;<a href="https://vuahanghieu.com/my-pham">mỹ phẩm cao cấp</a> đến từ thương hiêu Obagi nổi tiếng của Mỹ. <strong>Obagi Nu-Derm Physical UV Broad Spectrum SPF 32&nbsp;</strong>hỗ trợ bảo vệ da trước các tác hại của bức xạ tia UVB và UVA. Công thức đặc biệt giúp kết cấu sản phẩm lướt êm ái trên da và không gây mụn.</p><h2 style="font-size:18pt;"><strong>Giới thiệu thương hiệu Obagi&nbsp;</strong></h2><p><img class="product-img-responsive" style="display:block;margin-left:auto;margin-right:auto;" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2020/08/obagi-medical-jpg-1598261136-24082020162536.jpg" alt="Giới thiệu thương hiệu Obagi" width="600" height="383"></p><p>Obagi là một công ty sản xuất kinh doanh các sản phẩm chuyên về chăm sóc da, đặt trụ sở tại Long Beach, California. Các hệ thống sản phẩm của Obagi được chế tạo để hỗ trợ giảm những rối loạn về da của người lớn. Các sản phẩm trong hệ thống Obagi Nuderm được các Bác sĩ Zein E. Obagi và các chuyên gia sáng chế năm 1988. Bác sĩ Obagi và các cộng tác viên của Ông bắt đầu sản xuất các sản phẩm này.</p><h2 style="font-size:18pt;"><strong>Ưu điểm của Kem Chống Nắng Obagi Nu-Derm Physical UV Broad Spectrum SPF 32</strong></h2><p>- Hỗ trợ hạn chế tia UVA, UVB làm tổn thương da</p><p>- Hỗ trợ bảo vệ da và phòng những tác động của ánh nắng mỗi ngày.</p><p>- Hỗ trợ đem lại cho bạn làn da trắng sáng mịn màng.</p><p>- Chất kem mềm mịn thấm nhanh vào da và không gây mụn</p><p style="text-align:center;"><img class="product-img-responsive" src="https://cdn.vuahanghieu.com/unsafe/0x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/content/2022/05/d1e220e8-69ec-4333-a0b0-91a610d6-jpg-1652157754-10052022114234.jpg"></p><h2 style="font-size:18pt;"><strong>Hướng Dẫn Sử Dụng Kem Chống Nắng</strong></h2><p>- Thoa kem chống nắng trước khi ra ngoài 15 phút</p><p>- Cách 2 tiếng lại thoa kem chống nắng 1 lần để bảo vệ làn da.</p><p><i><strong>Lưu ý:</strong></i></p><p>- Chỉ sử dụng ngoài da</p><p>- Để xa tầm tay trẻ em</p><p>- Bảo quản ở nhiệt độ phòng</p><figure class="table"><table style="width:676px;" border="1"><tbody><tr><td style="width:265.391px;"><strong>Thương hiệu</strong></td><td style="width:394.609px;"><a href="https://vuahanghieu.com/obagi-medical"><strong>Obagi</strong></a></td></tr><tr><td style="width:265.391px;"><strong>Xuất xứ</strong></td><td style="width:394.609px;"><a href="https://vuahanghieu.com/my-pham/my">Mỹ phẩm Mỹ</a></td></tr><tr><td style="width:265.391px;"><strong>Trọng lượng</strong></td><td style="width:394.609px;">57g</td></tr><tr><td style="width:265.391px;"><strong>Loại da</strong></td><td style="width:394.609px;">Da thường, da khô, da hỗn hợp, da dầu</td></tr><tr><td style="width:265.391px;"><strong>Giới tính</strong></td><td style="width:394.609px;">Unisex</td></tr></tbody></table></figure><p>&nbsp;</p>', 1890000, 0, 1668189699036, 1, 1450000, 0, 124)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'585cab9f-7265-40c0-b06c-e4b417f37ad3', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'B71CC1A9-AD1E-4236-A190-D269FC366167', N'hahaaa 2', N'<p>okk</p>', 5600, 7, 1669604249610, 0, 5500, 0, 100)
INSERT [dbo].[PRODUCT] ([PRODUCTID], [BRANDID], [CATEGORYID], [PRODUCTNAME], [PRODUCTDESCRIBE], [PRODUCTPRICE], [PRODUCTQUANTITY], [PRODUCTCREATEDDATE], [PRODUCTINACITVE], [PRODUCTSALEPRICE], [PRODUCTISHOT], [PRODUCTCODE]) VALUES (N'12685bd9-7244-4b5e-bc46-a7f77afbfe69', N'F6DA46C5-DEA4-475A-8C10-9AD44A0FD049', N'6F3B0BB6-CCD8-42B3-97AE-F2785EC29E54', N'sp không hot', N'<ol><li>mô tả // First define the new key<br>builder.HasKey(p =&gt; new { p.BusinessDay, p.ClientId, p.Version });<br><br>// Then configure the auto generated column<br>// This (especially the `SetAfterUpdateBehavior` call) must be after&nbsp;<br>// unassociating the property as a PK, otherwise you''ll get an exception<br>builder.Property(p =&gt; p.Id)<br>&nbsp; &nbsp; .ValueGeneratedOnAdd()<br>&nbsp; &nbsp; .Metadata.SetAfterSaveBehavior(PropertySaveBehavior.Ignore); // &lt;--</li></ol>', 44456, 6, 1669606013906, 0, 34567, 0, 126)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'30B3164D-E0AB-4A0E-A6F1-7AAD2F248E7A', N'3418a59f-fa74-4221-ac14-45ee265fa7b7', N'b620cb0a-27c2-4aab-a903-134575e0bfa8.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'B453E8FA-5E95-491C-B1A2-BDCC281A1382', N'ae479602-40ed-4036-ab71-96982986e8c2', N'77388d6b-d24a-4886-a115-6602eb49df29.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'7222DB27-9D69-472D-8087-49CA7217C5D8', N'12685bd9-7244-4b5e-bc46-a7f77afbfe69', N'82841875-f561-4ee7-9c8d-122b304aecc9.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'8379CA3C-1509-45B1-A121-7681FEB87FFA', N'f16153b3-5a84-4329-b880-a5017aa3042f', N'0193d17e-df30-42e8-af8e-989ef6830a07.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'D59D5BB7-2E56-46FD-8CA6-D1F82A438C68', N'f16153b3-5a84-4329-b880-a5017aa3042f', N'5f956f6a-22f3-4f40-aa5c-184ab240568d.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'AD9B5C38-2382-4736-B06A-4336642C11C0', N'bd404dbc-99a0-44e5-bd03-3bd525e6de1c', N'ef4020e6-8fec-477b-af7d-7939c3ce2d21.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'ADBFFCC7-8614-476C-9505-B585CC377FBB', N'b8495b7e-22af-4ed0-8fa9-20a9115166d2', N'356d5c38-0c12-481e-870d-175e56fad75f.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'FD95AF76-5ADC-4190-AF10-B7942422F7EE', N'585cab9f-7265-40c0-b06c-e4b417f37ad3', N'48930623-c45a-4cd8-9278-fe16cac2ac32.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'AB832D37-9D13-4D08-A728-EE80418A115E', N'bd404dbc-99a0-44e5-bd03-3bd525e6de1c', N'a6787a21-f586-4f38-b86d-78747e739030.jpeg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'386219E0-0FA9-4715-9B83-740E2EFABE28', N'734569B1-CFEE-4D35-B865-8B3250522CCA', N'kem-chong-nang-obagi-sun-shield-matte-broad-spectrum-spf-50-premium-85g-5ec5e092ca420-21052020085946.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'42E64BF8-C935-4A67-97C3-1E9C841505F8', N'DCF4CB48-7B7C-48D8-B421-554847135E33', N'kem-chong-nang-duong-sang-da-obagi-clinical-vitamin-c-suncare-broad-spectrum-spf-30-sunscreen-48g-5f1fafd784d60-28072020115551.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'30453D0C-DAC2-48ED-8648-2A259CB17B15', N'E727978C-F6E1-4FD9-B775-593D82DAE005', N'kem-chong-nang-lam-trang-da-obagi-nuderm-sunfader-spf-15-so-6-5f1e6b476e52c-27072020125103.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'CFE88B0C-E978-499A-80BE-5B6255DDCBE3', N'A0FDD5B5-3B86-4C36-BAC5-B5FFC6433E3A', N'kem-chong-nang-vat-ly-co-mau-obagi-suzanobagimd-physical-defense-tinted-broad-spectrum-spf-50-5f23e5f736d79-31072020163551.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'E84499CA-4429-4C09-AD8A-FD56FE31C3BE', N'3FC7B637-73BB-467E-8FBB-7A0D0663918E', N'kem-chong-nang-vat-ly-obagi-suzanobagimd-physical-defense-broad-spectrum-spf-40-5f23e8d394d61-31072020164803.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'7F265742-4F14-4486-A27E-3D6ACB23E9CF', N'506719F2-8BC3-4480-B945-9C29F3F56649', N'kem-chong-nang-obagi-healthy-skin-protection-spf-35-5f24008aacefd-31072020182914.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'1B418F7B-60EE-4C90-96A4-A0C29BFA7D83', N'D9DF7FDF-9F56-444C-99B0-BC218479F7B0', N'obagi-mineral-sunshield-broad-spectrum-spf-50-5f24036b70863-31072020184131.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'6FD17951-C506-4B06-8244-96EDB482DFE6', N'813961A8-1495-45DC-917A-A6B385B42509', N'kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-warm-85g-5ff2be99155b6-04012021140705.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'A301EF9E-8B26-454E-8770-415466EEE161', N'F1853671-CCF2-469B-B0A2-FF7F72259AEE', N'kem-chong-nang-obagi-nu-derm-sun-shield-matte-broad-spectrum-spf-50-sunscreen-85g-600e6d7e950dd-25012021140430.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'054E4E3C-9D7C-4611-B04E-8542B497B1D5', N'002DEAFF-B827-493D-B7B1-36FA2E4B86EB', N'kem-chong-nang-obagi-sun-shield-matte-broad-spectrum-spf-50-60989afdbe552-10052021093125.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'2F809C6E-A178-488C-A514-15473E2E8F53', N'B5CAE405-4BD9-45B6-9184-3BD97D63C137', N'kem-chong-nang-vat-ly-obagi-nu-derm-physical-uv-broad-spectrum-spf-32-57g-6279ed25c9d6e-10052022114213.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'4E6E5C50-5D45-4308-A509-B2A57365EA6D', N'734569B1-CFEE-4D35-B865-8B3250522CCA', N'kem-chong-nang-obagi-sun-shield-matte-broad-spectrum-spf-50-premium-85g-5ec5e092f0319-21052020085946.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'04AD5A0A-A9EB-487D-BC2E-29EFD9B69917', N'D9DF7FDF-9F56-444C-99B0-BC218479F7B0', N'obagi-mineral-sunshield-broad-spectrum-spf-50-5f24036ba1191-31072020184131.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'23393FE6-431C-4D9C-BFD1-42D59F9C3A19', N'813961A8-1495-45DC-917A-A6B385B42509', N'kem-lot-chong-nang-che-khuyet-diem-obagi-tint-spf-50-warm-85g-5ff2be994ca50-04012021140705.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'D3EBBF73-0CAD-4010-A00A-2BE1D585201D', N'734569B1-CFEE-4D35-B865-8B3250522CCA', N'kem-chong-nang-obagi-sun-shield-matte-broad-spectrum-spf-50-premium-85g-5ec62ea676948-21052020143254.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'C7660DC5-C331-4271-82E6-00A31D5DDDB3', N'39501f03-47d7-4f45-8f05-4562d98d39a9', N'1298c8c4-b6e9-4919-b588-7717fe30adca.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'CEEC28DF-7F7F-44A7-8577-4C432FD35CFD', N'98D2245C-9ED0-460A-9D9F-20C690A8A0B0', N'kem-chong-nang-kiem-soat-dau-la-roche-posay-anthelios-xl-dry-touch-gel-cream-spf-50-uvb-uva-50ml-60dd946fd37b4-01072021170951.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'D2395DB5-30CB-4181-93A7-23FA8CAF555C', N'0FBD86AD-D97D-416E-83D4-7E1FD79013E5', N'kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-634f5f3422a33-19102022092140.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'D455B8A0-803D-427C-82F8-385E7216B46A', N'6E45CA14-CF14-4BF5-A83A-1133D8389BD0', N'kem-chong-nang-la-roche-posay-anthelios-ultra-sensitive-eyes-innovation-tinted-bb-cream-spf-50-50ml-632002869490c-13092022110942.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'07075AAA-1FED-4B43-A136-5ACEF986D310', N'1832108B-1F39-449E-B41D-DDA42839F150', N'kem-chong-nang-cho-da-kho-nhay-cam-la-roche-posay-hydrating-cream-ultra-protection-spf50-50ml-6319916d5312b-08092022135333.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'A3FFC41E-1F90-4383-850D-B909BDEF40D4', N'4A6DCE78-171F-4E82-B088-2B29C2E62B56', N'kem-chong-nang-la-roche-posay-anthelios-invisible-fluid-spf50-50ml-624ac1216c391-04042022165753.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'B4E4CCBA-7238-4E3D-9005-78EBDE85116F', N'40512CC2-47BB-43F5-95F1-454B39F83F15', N'kem-chong-nang-cho-da-kho-nhay-cam-la-roche-posay-anthelios-creme-hydratante-spf50-50ml-629f19960688c-07062022162542.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'28F15709-E6E2-40F5-9AFF-685BB6E33C92', N'9A796C49-C48B-4755-8E23-7D23BE31894C', N'61b9916270ec2-15122021135530.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'9F52EB0B-4B02-4244-AD5A-718D9E511933', N'8100DFCF-0F96-4A13-9137-4558D8CDD82B', N'kem-chong-nang-dang-gel-ho-tro-lam-sang-da-la-roche-posay-uvidea-anthelios-tone-up-rosy-spf50-30ml-601225c303514-28012021094731.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'0AECBE62-E2B0-48F9-BC02-33D3DA3720AC', N'ADB93C84-86BC-4C69-9CC3-3A6CB697F9E2', N'kem-chong-nang-la-roche-posay-anthelios-anti-imperfections-gel-50ml-6167e7c652702-14102021151814.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'A5E44664-9EE2-493E-9416-1E84A0B53528', N'29D52A39-ED9B-46AF-813D-1A56C4720D45', N'kem-chong-nang-co-mau-la-roche-posay-anthelios-xl-tinted-fluid-spf-50-uvb-uva-50ml-6209d89f1aa41-14022022112047.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'8A5DA496-5AD5-4E03-93E8-D3936B00CDB2', N'54CD2CC6-FB3F-440B-8A8A-9904BFBF25BF', N'kem-chong-nang-cho-da-nhay-cam-la-roche-posay-anthelios-invisible-fluid-spf-50-50ml-61c446e515c33-23122021165237.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'58F97093-61AF-4595-A01D-C90F376032A0', N'98D2245C-9ED0-460A-9D9F-20C690A8A0B0', N'kem-chong-nang-kiem-soat-dau-la-roche-posay-anthelios-xl-dry-touch-gel-cream-spf-50-uvb-uva-50ml-60dd946fd8a94-01072021170951.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'0F824BC3-049D-4326-8131-673C39F0A068', N'0FBD86AD-D97D-416E-83D4-7E1FD79013E5', N'kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-634f5f3428e38-19102022092140.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'2BDE62D9-8E9B-44D7-B5B5-C09BA7886231', N'6E45CA14-CF14-4BF5-A83A-1133D8389BD0', N'kem-chong-nang-la-roche-posay-anthelios-ultra-sensitive-eyes-innovation-tinted-bb-cream-spf-50-50ml-63200286c0feb-13092022110942.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'18186966-7FC8-42CD-BABC-908A6188C478', N'1832108B-1F39-449E-B41D-DDA42839F150', N'kem-chong-nang-cho-da-kho-nhay-cam-la-roche-posay-hydrating-cream-ultra-protection-spf50-50ml-6319ce4ed87a5-08092022181318.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'D014B276-CD56-4850-854D-97A611BD6565', N'40512CC2-47BB-43F5-95F1-454B39F83F15', N'kem-chong-nang-cho-da-kho-nhay-cam-la-roche-posay-anthelios-creme-hydratante-spf50-50ml-629f1a690cdb0-07062022162913.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'462B7776-FE9B-4C88-899F-3FDDE9C76F94', N'8100DFCF-0F96-4A13-9137-4558D8CDD82B', N'kem-chong-nang-dang-gel-ho-tro-lam-sang-da-la-roche-posay-uvidea-anthelios-tone-up-rosy-spf50-30ml-601225c30c803-28012021094731.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'A93A3349-168F-4A32-A55B-1AB8AF9FBC65', N'0FBD86AD-D97D-416E-83D4-7E1FD79013E5', N'kem-chong-nang-la-roche-posay-anthelios-clear-skin-spf-60-50ml-634f5f343cb1d-19102022092140.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'F6C1E6D7-A6D9-461A-97C4-5F0F595F6AA1', N'1832108B-1F39-449E-B41D-DDA42839F150', N'kem-chong-nang-cho-da-kho-nhay-cam-la-roche-posay-hydrating-cream-ultra-protection-spf50-50ml-6319ce4edee2f-08092022181318.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'F3CCBBC3-D1E6-4242-AAEA-74F36487F6B5', N'D762DF28-352D-4007-B173-0EDEA5884087', N'gel-rua-mat-cho-nam-kiehl-s-facial-fuel-energizing-face-wash-250ml-62e4a90027037-30072022104400.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'2DF29DBD-EFBA-4E82-A791-97793969974C', N'FAE5AD8A-CBFE-4E7C-A58D-0A23936C8268', N'sua-rua-mat-dat-set-kiehl-s-rare-earth-deep-pore-daily-cleanser-150ml-5f30b58c6e9b0-10082020094844.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'4C00F9A9-4F50-403E-9DA9-AFF443BB0CE1', N'072A6399-E488-4789-96A1-706915900807', N'sua-rua-mat-hoa-cuc-kiehl-s-calendula-deep-cleansing-foaming-face-wash-chai-75ml-5e0ab2ae0c2cf-31122019093006.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'1DB1FD2B-D50A-4D8A-9D25-62E782FECF97', N'63B244C6-DB36-4734-88F7-83B9FEAB36C7', N'sua-rua-mat-hoa-cuc-kiehl-s-calendula-deep-cleansing-foaming-face-wash-30ml-5e0aab6876d15-31122019085904.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'63F7ACBF-DB84-459A-A93E-F54F88BC4261', N'2F8DA53A-95E8-402D-ACC8-B8236D703DE3', N'sua-rua-mat-dua-leo-kiehl-s-cucumber-herbal-conditioning-cleanser-5e1bf08681154-13012020112230.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'50A64437-78EA-48A6-933C-8E3AAB138FCD', N'49BEBE17-0DA7-40AF-809B-1C78F6F94570', N'sua-rua-mat-kiehl-s-dang-gel-blue-herbal-blemish-cleanser-treatment-150ml-5e1c3dc5f2088-13012020165205.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'440317F6-47CD-49F0-9CBC-B07EF32AF835', N'36B2ACE4-010B-4C83-A99F-FEDF972120E1', N'sua-rua-mat-kiehl-s-centella-sensitive-facial-cleanser-250ml-5e1e845c00f67-15012020101748.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'8D81B54A-DDE5-49A4-8536-7BD2C69384B3', N'DDECA477-7F5A-464E-A272-2F993573862C', N'sua-rua-mat-kiehl-s-ultra-facial-oil-free-cleanser-150ml-5e22714c65aa6-18012020094532.png')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'3FD7D2E6-A27D-4B60-AC99-DF1FD7EAA99C', N'A4792FDA-C06A-4AF2-A4FC-B6099791B87F', N'sua-rua-mat-lam-sach-sau-va-sang-da-kiehl-s-clearly-corrective-brightening-exfoliating-cleanser-150ml-610bb4ba105b1-05082021165154.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'435A4956-D689-4BD3-9D0A-C9559A9705C5', N'D762DF28-352D-4007-B173-0EDEA5884087', N'gel-rua-mat-cho-nam-kiehl-s-facial-fuel-energizing-face-wash-250ml-62e4a90039c22-30072022104400.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'53EFCC2A-C21F-40D0-95ED-8702BD24AB43', N'FAE5AD8A-CBFE-4E7C-A58D-0A23936C8268', N'sua-rua-mat-dat-set-kiehl-s-rare-earth-deep-pore-daily-cleanser-150ml-5f30b58cb3060-10082020094844.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'12D2FE27-3A71-4959-BD43-1AD3C531BABB', N'2F8DA53A-95E8-402D-ACC8-B8236D703DE3', N'sua-rua-mat-dua-leo-kiehl-s-cucumber-herbal-conditioning-cleanser-5e1bf08c41911-13012020112236.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'C87C9AA0-BECF-4A61-A25B-7A69B060C300', N'DDECA477-7F5A-464E-A272-2F993573862C', N'sua-rua-mat-kiehl-s-ultra-facial-oil-free-cleanser-150ml-5f363be82a703-14082020142320.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'249222EB-8105-4973-8A59-2B077B5F2F9E', N'FAE5AD8A-CBFE-4E7C-A58D-0A23936C8268', N'sua-rua-mat-dat-set-kiehl-s-rare-earth-deep-pore-daily-cleanser-150ml-5f30b58d0f023-10082020094845.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'5CC9B41D-9F7F-477D-A927-504A9E222502', N'DDECA477-7F5A-464E-A272-2F993573862C', N'sua-rua-mat-kiehl-s-ultra-facial-oil-free-cleanser-150ml-5f363be87c4cd-14082020142320.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'606D1A7A-FC5E-4729-A870-4D5DF083310C', N'B5474AF3-3F6A-4872-BC34-C6B74F5380E1', N'sua-rua-mat-tao-bot-diu-nhe-kiehl-s-ultra-facial-cleanser-150ml-5f30d2f58ec3f-10082020115413.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'FCB5544E-46FC-4590-908B-C181C97CF707', N'FAE5AD8A-CBFE-4E7C-A58D-0A23936C8268', N'sua-rua-mat-dat-set-kiehl-s-rare-earth-deep-pore-daily-cleanser-150ml-5f30b58d3e3b8-10082020094845.jpg')
INSERT [dbo].[PRODUCTIMAGE] ([PRODUCTIMAGEID], [PRODUCTID], [PRODUCTIMAGEURL]) VALUES (N'0045B90C-939E-4F48-88FF-5402768A06BC', N'B5474AF3-3F6A-4872-BC34-C6B74F5380E1', N'sua-rua-mat-tao-bot-diu-nhe-kiehl-s-ultra-facial-cleanser-150ml-5f30d2f5e37b5-10082020115413.jpg')
GO