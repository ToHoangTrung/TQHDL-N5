Drop database QLTT
CREATE DATABASE QLTT
go
use QLTT
/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product (
   ID_product            int                  not null,
   ID_category           int                  null,
   ID_shop               int                  null,
   ProductName                  varchar(25)          null,
   price                 int                  null,
   quantity              int                  null,
   constraint PK_Product primary key nonclustered (id_product)
)
go

/*==============================================================*/
/* Table: Bill                                               */
/*==============================================================*/
create table Bill (
   ID_bill               int                  not null,
   ID_ship               int                  null,
   ID_user               int                  null,
   ID_shop               int                  null,
   Total_count           int                  null,
   Total_money           int                  null,
   activiy               int                  null,
   constraint PK_Bill primary key nonclustered (id_bill)
)
go

/*==============================================================*/
/* Table: Description_Bill                                       */
/*==============================================================*/
create table Description_Bill (
   ID_bill               int                null,
   ID_des                int                not null,
   Count_product         int                null,
   id_product            int                null,
   constraint PK_Description_Bill primary key (id_des)
)

go

/*==============================================================*/
/* Table: Shop                                       */
/*==============================================================*/
create table Shop (
   ID_shop               int                not null,
   ShopAddress               varchar(25)        null,
   ShopName                  varchar(25)        null,
   hotline               varchar(10)        null,
   constraint PK_Shop primary key (ID_shop)
)

go

/*==============================================================*/
/* Table: User                                       */
/*==============================================================*/
create table _User (
   ID_user               int                not null,
   ID_shop               int                null,
   ID_ship               int                null,
   ID_role               int                null,
   age                   int                null,
   UserName                  varchar(25)        null,
   phone                 varchar(10)        null,
   constraint PK_User primary key (ID_user)
)

go

/*==============================================================*/
/* Table: Account                                       */
/*==============================================================*/
create table Account (
   ID_account            int                not null,
   ID_user               int                null,
   Activity              int                null,
   pass                  varchar(25)        null,
   _role                  int                null,
   username              varchar(25)        null,
   constraint PK_Account primary key (ID_account)
)

go

/*==============================================================*/
/* Table: Contract                                       */
/*==============================================================*/
create table _Contract (
   ID_contract           int                not null,
   Activity              int                null,
   ID_admin              int                null,
   ID_userShop           int                null,
   constraint PK_Contract primary key (ID_contract)
)

go

/*==============================================================*/
/* Table: Role                                       */
/*==============================================================*/
create table _Role (
   ID_role           int                 not null,
   RoleName              varchar(25)         null,
   ID_admin              int                null,
   ID_userShop           int                null,
   constraint PK_Role primary key (ID_role)
)

go

/*==============================================================*/
/* Table: Cart                                       */
/*==============================================================*/
create table Cart (
   ID_product           int                not null,
   ID_user              int                not null,
   countProduct                int                null,
   constraint PK_Cart primary key (ID_product, ID_user)
)

go

/*==============================================================*/
/* Table: Category                                       */
/*==============================================================*/
create table Category (
   ID_category           int                not null,
   Title                 varchar(25)        null,
   constraint PK_Category primary key (ID_category)
)

go


alter table Product
   add constraint FK_Product_Category  foreign key (ID_category)
      references Category  (ID_category)
go

alter table Product
   add constraint FK_Product_Shop  foreign key (ID_shop)
      references Shop  (ID_shop)
go

alter table _User
   add constraint FK_User_Shop  foreign key (ID_shop)
      references Shop  (ID_shop)
go

alter table _User
   add constraint FK_User_Role  foreign key (ID_role)
      references _Role  (ID_role)
go

alter table Bill
   add constraint FK_Bill_Shop  foreign key (ID_shop)
      references Shop  (ID_shop)
go

alter table _User
   add constraint FK_Bill_User  foreign key (ID_user)
      references _User  (ID_user)
go

alter table Description_Bill
   add constraint FK_Description_Bill_Bill foreign key (ID_bill)
      references Bill (ID_Bill)
go

alter table Description_Bill
   add constraint FK_Description_Bill_Product foreign key (ID_product)
      references Product (ID_product)
go

alter table Account
   add constraint FK_Account_User foreign key (ID_user)
      references _User (ID_user)
go

alter table _Contract
   add constraint FK_Contract_User foreign key (ID_userShop)
      references _User (ID_User)
go

alter table Cart
   add constraint FK_Cart_Product foreign key (ID_product)
      references Product (ID_product)
go

alter table Cart
   add constraint FK_Cart_User foreign key (ID_user)
      references _User (ID_User)
go
