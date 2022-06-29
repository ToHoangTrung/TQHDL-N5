USE [QLTT]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Shop]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Description_Bill] DROP CONSTRAINT [FK_Description_Bill_Product]
GO
ALTER TABLE [dbo].[Description_Bill] DROP CONSTRAINT [FK_Description_Bill_Bill]
GO
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK_Bill_Shop]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [FK_Account_User]
GO
ALTER TABLE [dbo].[_User] DROP CONSTRAINT [FK_User_Shop]
GO
ALTER TABLE [dbo].[_User] DROP CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[_User] DROP CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[_Contract] DROP CONSTRAINT [FK_Contract_User]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shop]') AND type in (N'U'))
DROP TABLE [dbo].[Shop]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Description_Bill]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Description_Bill]') AND type in (N'U'))
DROP TABLE [dbo].[Description_Bill]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
DROP TABLE [dbo].[Cart]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bill]') AND type in (N'U'))
DROP TABLE [dbo].[Bill]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[_User]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_User]') AND type in (N'U'))
DROP TABLE [dbo].[_User]
GO
/****** Object:  Table [dbo].[_Role]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Role]') AND type in (N'U'))
DROP TABLE [dbo].[_Role]
GO
/****** Object:  Table [dbo].[_Contract]    Script Date: 6/29/2022 9:27:42 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Contract]') AND type in (N'U'))
DROP TABLE [dbo].[_Contract]
GO
USE [master]
GO
/****** Object:  Database [QLTT]    Script Date: 6/29/2022 9:27:42 PM ******/
DROP DATABASE [QLTT]
GO
/****** Object:  Database [QLTT]    Script Date: 6/29/2022 9:27:42 PM ******/
CREATE DATABASE [QLTT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTT_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLTT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTT] SET  MULTI_USER 
GO
ALTER DATABASE [QLTT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTT', N'ON'
GO
ALTER DATABASE [QLTT] SET QUERY_STORE = OFF
GO
USE [QLTT]
GO
/****** Object:  Table [dbo].[_Contract]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Contract](
	[ID_contract] [int] NOT NULL,
	[Activity] [int] NULL ,
	[ID_admin] [int] NULL,
	[ID_userShop] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_Role]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Role](
	[ID_role] [int] NOT NULL,
	[RoleName] [varchar](25) NULL,
	[ID_admin] [int] NULL,
	[ID_userShop] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_User]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_User](
	[ID_user] [int] NOT NULL,
	[ID_shop] [int] NULL,
	[ID_ship] [int] NULL,
	[ID_role] [int] NULL,
	[age] [int] NULL,
	[UserName] [varchar](25) NULL,
	[phone] [varchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID_account] [int] NOT NULL,
	[ID_user] [int] NULL,
	[Activity] [int] NULL,
	[pass] [varchar](25) NULL,
	[_role] [int] NULL,
	[username] [varchar](25) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID_bill] [int] NOT NULL,
	[ID_ship] [int] NULL,
	[ID_user] [int] NULL,
	[ID_shop] [int] NULL,
	[Total_count] [int] NULL,
	[Total_money] [int] NULL,
	[activiy] [int] NULL,
	[dateCreate] DATE NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY NONCLUSTERED 
(
	[ID_bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID_product] [int] NOT NULL,
	[ID_user] [int] NOT NULL,
	[countProduct] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC,
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_category] [int] NOT NULL,
	[Title] [varchar](25) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Description_Bill]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description_Bill](
	[ID_bill] [int] NULL,
	[ID_des] [int] NOT NULL,
	[Count_product] [int] NULL,
	[id_product] [int] NULL,
 CONSTRAINT [PK_Description_Bill] PRIMARY KEY CLUSTERED 
(
	[ID_des] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_product] [int] NOT NULL,
	[ID_category] [int] NULL,
	[ID_shop] [int] NULL,
	[ProductName] [varchar](25) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY NONCLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 6/29/2022 9:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID_shop] [int] NOT NULL,
	[ShopAddress] [varchar](25) NULL,
	[ShopName] [varchar](25) NULL,
	[hotline] [varchar](10) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID_shop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([ID_userShop])
REFERENCES [dbo].[_User] ([ID_user])
GO
ALTER TABLE [dbo].[_Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[_User]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[_User] ([ID_user])
GO
ALTER TABLE [dbo].[_User] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[_User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([ID_role])
REFERENCES [dbo].[_Role] ([ID_role])
GO
ALTER TABLE [dbo].[_User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[_User]  WITH CHECK ADD  CONSTRAINT [FK_User_Shop] FOREIGN KEY([ID_shop])
REFERENCES [dbo].[Shop] ([ID_shop])
GO
ALTER TABLE [dbo].[_User] CHECK CONSTRAINT [FK_User_Shop]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[_User] ([ID_user])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Shop] FOREIGN KEY([ID_shop])
REFERENCES [dbo].[Shop] ([ID_shop])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Shop]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Product] ([ID_product])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[_User] ([ID_user])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Description_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Description_Bill_Bill] FOREIGN KEY([ID_bill])
REFERENCES [dbo].[Bill] ([ID_bill])
GO
ALTER TABLE [dbo].[Description_Bill] CHECK CONSTRAINT [FK_Description_Bill_Bill]
GO
ALTER TABLE [dbo].[Description_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Description_Bill_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([ID_product])
GO
ALTER TABLE [dbo].[Description_Bill] CHECK CONSTRAINT [FK_Description_Bill_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ID_category])
REFERENCES [dbo].[Category] ([ID_category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Shop] FOREIGN KEY([ID_shop])
REFERENCES [dbo].[Shop] ([ID_shop])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Shop]
GO
USE [master]
GO
ALTER DATABASE [QLTT] SET  READ_WRITE 
GO
