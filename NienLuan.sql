/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     12/4/2022 10:37:50 AM                        */
/*==============================================================*/
--drop database nienluan
--GO
--create database nienluan
--go
--use nienluan
--go


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
   INVOICESHIPCOST      int         null,
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
   ORDERSTATUSID        nvarchar(64)                  not null,
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
   ORDERSTATUSID        nvarchar(64)                 not null DEFAULT (newid()),
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

