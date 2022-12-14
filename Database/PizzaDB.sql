USE [master]
GO
/****** Object:  Database [PizzaDB]    Script Date: 01/14/2020 11:55:09 ******/
CREATE DATABASE [PizzaDB] ON  PRIMARY 
( NAME = N'PizzaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PizzaDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PizzaDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PizzaDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PizzaDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PizzaDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PizzaDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PizzaDB] SET ARITHABORT OFF
GO
ALTER DATABASE [PizzaDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [PizzaDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PizzaDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PizzaDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PizzaDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PizzaDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PizzaDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PizzaDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PizzaDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PizzaDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PizzaDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [PizzaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PizzaDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PizzaDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PizzaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PizzaDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PizzaDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PizzaDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PizzaDB] SET  READ_WRITE
GO
ALTER DATABASE [PizzaDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PizzaDB] SET  MULTI_USER
GO
ALTER DATABASE [PizzaDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PizzaDB] SET DB_CHAINING OFF
GO
USE [PizzaDB]
GO
/****** Object:  Table [dbo].[PizzaMaster]    Script Date: 01/14/2020 11:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PizzaMaster](
	[PizzaMasterId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[PizzaName] [varchar](200) NULL,
	[PizzaDescription] [varchar](500) NULL,
	[Price] [int] NULL,
	[PizzaImagePath] [varchar](200) NULL,
	[PizzaStatus] [varchar](50) NULL,
	[Discount] [int] NULL,
	[Tax] [int] NULL,
 CONSTRAINT [PK_PizzaMaster] PRIMARY KEY CLUSTERED 
(
	[PizzaMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 For Active 0 For Deactive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PizzaMaster', @level2type=N'COLUMN',@level2name=N'PizzaStatus'
GO
SET IDENTITY_INSERT [dbo].[PizzaMaster] ON
INSERT [dbo].[PizzaMaster] ([PizzaMasterId], [Category], [PizzaName], [PizzaDescription], [Price], [PizzaImagePath], [PizzaStatus], [Discount], [Tax]) VALUES (1, N'Veg', N'Indian Pizza', N'No 1 Pizza', 300, N'Images/403431319p1.jpeg', N'Active', 5, 5)
INSERT [dbo].[PizzaMaster] ([PizzaMasterId], [Category], [PizzaName], [PizzaDescription], [Price], [PizzaImagePath], [PizzaStatus], [Discount], [Tax]) VALUES (2, N'Non-Veg', N'American', N'Good', 599, N'Images/592584891p3.jpg', N'Active', 3, 12)
SET IDENTITY_INSERT [dbo].[PizzaMaster] OFF
/****** Object:  Table [dbo].[FeedbackMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedbackMaster](
	[FeedbackMasterId] [int] IDENTITY(1,1) NOT NULL,
	[Feedback] [varchar](100) NULL,
	[LinkToCustomerId] [int] NULL,
 CONSTRAINT [PK_FeedbackMaster] PRIMARY KEY CLUSTERED 
(
	[FeedbackMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackMaster] ON
INSERT [dbo].[FeedbackMaster] ([FeedbackMasterId], [Feedback], [LinkToCustomerId]) VALUES (7, N'Best System', 1)
SET IDENTITY_INSERT [dbo].[FeedbackMaster] OFF
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[CustomerMasterId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Gender] [bit] NULL,
	[MobileNumber] [varchar](10) NULL,
	[EmailId] [varchar](150) NULL,
	[Address] [varchar](500) NULL,
	[LinkToCityMasterId] [int] NULL,
	[Pincode] [varchar](8) NULL,
	[Password] [varchar](100) NULL,
 CONSTRAINT [PK_CustomerMaster] PRIMARY KEY CLUSTERED 
(
	[CustomerMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 For Male And 0 For Female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerMaster', @level2type=N'COLUMN',@level2name=N'Gender'
GO
SET IDENTITY_INSERT [dbo].[CustomerMaster] ON
INSERT [dbo].[CustomerMaster] ([CustomerMasterId], [CustomerName], [Gender], [MobileNumber], [EmailId], [Address], [LinkToCityMasterId], [Pincode], [Password]) VALUES (1, N'Mayur A', 1, N'9913145632', N'customer@gmail.com', N'Surat, Gujrat', 1, N'123456', N'customer')
SET IDENTITY_INSERT [dbo].[CustomerMaster] OFF
/****** Object:  Table [dbo].[CityMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CityMasterId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NULL,
 CONSTRAINT [PK_CityMaster] PRIMARY KEY CLUSTERED 
(
	[CityMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CityMaster] ON
INSERT [dbo].[CityMaster] ([CityMasterId], [CityName]) VALUES (1, N'Surat')
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryMasterId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[VegNonVeg] [varchar](20) NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 For Veg 0 For Non Veg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryMaster', @level2type=N'COLUMN',@level2name=N'VegNonVeg'
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON
INSERT [dbo].[CategoryMaster] ([CategoryMasterId], [CategoryName], [VegNonVeg]) VALUES (1, N'American', N'Veg')
INSERT [dbo].[CategoryMaster] ([CategoryMasterId], [CategoryName], [VegNonVeg]) VALUES (2, N'Italin', N'Non-Veg')
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
/****** Object:  Table [dbo].[BillMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillMaster](
	[BillMasterId] [int] IDENTITY(1,1) NOT NULL,
	[LinkToCustomerMasterId] [int] NULL,
	[LinkToPizzaMasterId] [int] NULL,
	[BillDate] [varchar](50) NULL,
	[BillDiscount] [float] NULL,
	[Tax] [float] NULL,
	[Status] [varchar](50) NULL,
	[TotalAmount] [varchar](10) NULL,
	[qty] [int] NULL,
 CONSTRAINT [PK_BillMaster] PRIMARY KEY CLUSTERED 
(
	[BillMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BillMaster] ON
INSERT [dbo].[BillMaster] ([BillMasterId], [LinkToCustomerMasterId], [LinkToPizzaMasterId], [BillDate], [BillDiscount], [Tax], [Status], [TotalAmount], [qty]) VALUES (1, 1, 1, N'14/01/2020', 5, 5, N'Processing', N'598', 2)
INSERT [dbo].[BillMaster] ([BillMasterId], [LinkToCustomerMasterId], [LinkToPizzaMasterId], [BillDate], [BillDiscount], [Tax], [Status], [TotalAmount], [qty]) VALUES (2, 1, 2, N'14/01/2020', 3, 12, N'Completed', N'651', 1)
SET IDENTITY_INSERT [dbo].[BillMaster] OFF
/****** Object:  Table [dbo].[AdminMaster]    Script Date: 01/14/2020 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminMaster](
	[AdminMasterEmailId] [varchar](50) NOT NULL,
	[AdminMasterPassword] [varchar](50) NULL,
 CONSTRAINT [PK_AdminMaster] PRIMARY KEY CLUSTERED 
(
	[AdminMasterEmailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AdminMaster] ([AdminMasterEmailId], [AdminMasterPassword]) VALUES (N'admin@gmail.com', N'admin')
