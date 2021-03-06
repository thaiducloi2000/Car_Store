USE [master]
GO
/****** Object:  Database [Car]    Script Date: 3/27/2021 9:34:43 AM ******/
CREATE DATABASE [Car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Car.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Car_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Car_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Car] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Car] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Car] SET  MULTI_USER 
GO
ALTER DATABASE [Car] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Car] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Car] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Car] SET QUERY_STORE = OFF
GO
USE [Car]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/27/2021 9:34:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[RoleID] [nvarchar](10) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Img] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/27/2021 9:34:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [nvarchar](20) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Total] [float] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PaymentId] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/27/2021 9:34:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [nvarchar](20) NOT NULL,
	[ProId] [nvarchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/27/2021 9:34:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProId] [nvarchar](20) NOT NULL,
	[ProName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[ImgUrl] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'admin1', N'1', N'admin', N'Admin Test 1', CAST(N'1995-12-17' AS Date), N'229 Luy Ban Bich St., Hoa Thanh Ward', N'denton@sbcglobal.net', N'face2.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'admin2', N'2', N'admin', N'Admin Test 2', CAST(N'1997-12-21' AS Date), N'106A Nguyen Dinh Chieu, Dakao Ward, Dist.1', N'iamcal@verizon.net', N'face5.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'admin3', N'3', N'admin', N'Admin Test 3', CAST(N'1999-12-21' AS Date), N'Floor 6, 8 Nguyen Hue, Ben Nghe Ward', N'sthomas@msn.com', N'face6.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'admin4', N'4', N'admin', N'Admin Test 4', CAST(N'1990-12-28' AS Date), N'420 Nguyen An Ninh', N'jaarnial@icloud.com', N'face7.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'user1', N'1', N'user', N'Clara Simon', CAST(N'1990-05-16' AS Date), N'8 Hoang Van Thu Street', N'portscan@optonline.net', N'face19.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'user2', N'2', N'user', N'Ayomide Gibbons', CAST(N'1997-12-25' AS Date), N'114 Nguyen Phi Khanh Street, Tan Dinh Ward, District 1', N'amcuri@me.com', N'face3.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'user3', N'3', N'user', N'Cienna Hurst', CAST(N'1986-12-17' AS Date), N'409 Anderson St', N'mhanoh@gmail.com', N'face8.jpg')
INSERT [dbo].[Account] ([Username], [Password], [RoleID], [Fullname], [DOB], [Address], [Email], [Img]) VALUES (N'user4', N'4', N'user', N'Akshay Roach', CAST(N'1979-02-05' AS Date), N'461 Shelton St', N'alastair@hotmail.com', N'face9.jpg')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Username], [Status], [Total], [Address], [PaymentId]) VALUES (N'70AOL9C4', CAST(N'2019-12-19' AS Date), N'user1', N'Processing', 528010, N'Address Test', N'Visa')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Username], [Status], [Total], [Address], [PaymentId]) VALUES (N'A9YHHNFE', CAST(N'2019-12-19' AS Date), N'user1', N'Delivered', 355425.5, N'Address Test', N'Visa')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Username], [Status], [Total], [Address], [PaymentId]) VALUES (N'O-01', CAST(N'2019-12-15' AS Date), N'user1', N'Processing', 40000, N'Dist. 9, HCMC', N'Paypal')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Username], [Status], [Total], [Address], [PaymentId]) VALUES (N'O-02', CAST(N'2019-12-14' AS Date), N'user2', N'Processing', 12341, N'Dist. 5, HCMC', N'COD')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Username], [Status], [Total], [Address], [PaymentId]) VALUES (N'O-03', CAST(N'2019-12-14' AS Date), N'user3', N'Processing', 46000, N'Dist. 1, HCMC', N'Visa')
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'70AOL9C4', N'Pro-03', 16, N'Delivered')
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'A9YHHNFE', N'Pro-06', 5, N'Delivered')
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'O-01', N'Pro-01', 11, N'Processing')
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'O-01', N'Pro-02', 100, N'Processing')
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'O-02', N'Pro-05', 12, N'Processing')
INSERT [dbo].[OrderDetail] ([OrderId], [ProId], [Quantity], [Status]) VALUES (N'O-03', N'Pro-07', 5, N'Processing1')
GO
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-01', N'Ford GT', 15000, N'Available', N'img/sport1.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Sport', 50)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-02', N'Chervorlet GTR', 25000, N'Available', N'img/sport2.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Sport', 100)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-03', N'Mercedes BenZ R350', 30000, N'Available', N'img/suv3.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'SUV', 84)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-04', N'Lamborghini Urus', 25000, N'Available', N'img/suv4.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'SUV', 20)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-05', N'Ford Ranger', 25000, N'Available', N'img/off_road1.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Off_Road', 56)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-06', N'Ford Everest', 30000, N'Available', N'img/off_road2.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Off_Road', 40)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-07', N'Koenigsegg ', 23000, N'Available', N'img/sup1.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Supper', 98)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-08', N'Hydrogen-powerd super car', 70000, N'Available', N'img/sup2.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Supper', 63)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-10', N'BMW GTR', 55000, N'Available', N'img/sport3.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Sport', 20)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-11', N'Lamborghini Countach', 15000, N'Available', N'img/sport4.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Sport', 30)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-12', N'Ford Mustang GT', 27000, N'Available', N'img/sport5.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Sport', 24)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-13', N'Ford Bronco', 28000, N'Available', N'img/off_road3.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Off_Road', 56)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-14', N'Cherverlet Colorado', 60000, N'Available', N'img/off_road4.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Off_Road', 80)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-15', N'Cherverlet Cororado', 70000, N'Available', N'img/off_road5.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Off_Road', 80)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-16', N'Audi RS Q8', 25000, N'Available', N'img/suv1.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'SUV', 25)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-17', N'Vinfast ', 30000, N'Available', N'img/suv2.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'SUV', 88)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-18', N'Lamborghini-Egoista-LF-3-4-HERO', 70000, N'Available', N'img/sup3.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Supper', 70)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-19', N'Bugatti', 13000, N'Available', N'img/sup4.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Supper', 40)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-20', N'Milan Red supper car', 15000, N'Available', N'img/sup5.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'Supper', 20)
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Status], [ImgUrl], [Description], [CategoryId], [Quantity]) VALUES (N'Pro-21', N'Massterasi', 1500000, N'Available', N'img/suv5.jpg', N'Usage of the Internet is becoming more common due to rapid advance. Usage of the Internet is becoming more common due to rapid advance.', N'SUV', 20)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [Car] SET  READ_WRITE 
GO
