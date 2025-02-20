USE [master]
GO
/****** Object:  Database [lumberYard]    Script Date: 9/26/2024 3:44:40 PM ******/
CREATE DATABASE [lumberYard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lumberYard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lumberYard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lumberYard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lumberYard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [lumberYard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lumberYard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lumberYard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lumberYard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lumberYard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lumberYard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lumberYard] SET ARITHABORT OFF 
GO
ALTER DATABASE [lumberYard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lumberYard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lumberYard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lumberYard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lumberYard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lumberYard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lumberYard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lumberYard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lumberYard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lumberYard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lumberYard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lumberYard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lumberYard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lumberYard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lumberYard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lumberYard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lumberYard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lumberYard] SET RECOVERY FULL 
GO
ALTER DATABASE [lumberYard] SET  MULTI_USER 
GO
ALTER DATABASE [lumberYard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lumberYard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lumberYard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lumberYard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lumberYard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lumberYard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'lumberYard', N'ON'
GO
ALTER DATABASE [lumberYard] SET QUERY_STORE = OFF
GO
USE [lumberYard]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_Num] [nchar](10) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[City] [nchar](20) NOT NULL,
	[Zip] [nchar](5) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Wood1_ID] [int] NULL,
	[Wood1_Price] [smallmoney] NULL,
	[Amout_Wood1] [int] NULL,
	[Wood2_ID] [int] NULL,
	[Wood2_Price] [smallmoney] NULL,
	[Amout_Wood2] [int] NULL,
	[Wood3_ID] [int] NULL,
	[Wood3_Price] [smallmoney] NULL,
	[Amout_Wood3] [int] NULL,
	[Wood4_ID] [int] NULL,
	[Wood4Price] [smallmoney] NULL,
	[Amount_Wood4] [int] NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Job_ID] [int] IDENTITY(1,1) NOT NULL,
	[Job] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lumber_Yard]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lumber_Yard](
	[Yard_ID] [int] IDENTITY(1,1) NOT NULL,
	[Housing_Units] [int] NOT NULL,
	[Income] [money] NOT NULL,
	[Inventory_ID] [int] NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Owner_ID] [int] NOT NULL,
	[Forklift_ID] [int] NOT NULL,
	[Num_Forlifts] [int] NOT NULL,
 CONSTRAINT [PK_LumberYard] PRIMARY KEY CLUSTERED 
(
	[Yard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[People_ID] [int] IDENTITY(1,1) NOT NULL,
	[Phone_Number] [nchar](12) NOT NULL,
	[First_Name] [nchar](15) NOT NULL,
	[Middle_Initial] [nchar](1) NULL,
	[Last_Name] [nchar](15) NOT NULL,
	[Jobs_ID] [int] NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Pay] [smallmoney] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[People_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Receipt_Num] [int] IDENTITY(1,1) NOT NULL,
	[Receipt_Date] [date] NOT NULL,
	[Wood_ID] [int] NOT NULL,
	[tax] [smallmoney] NOT NULL,
	[Total_Price] [smallmoney] NOT NULL,
	[Buyer_ID] [int] NOT NULL,
	[Yard_ID] [int] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[Receipt_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[Transport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Transport] [nchar](20) NOT NULL,
	[Fuel] [nchar](10) NOT NULL,
	[Cost_Fuel] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED 
(
	[Transport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wood]    Script Date: 9/26/2024 3:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wood](
	[Wood_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Wood] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Wood] PRIMARY KEY CLUSTERED 
(
	[Wood_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (1, N'1234      ', N'MN', N'Winona              ', N'55987')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (2, N'4321      ', N'MN', N'Winona              ', N'55987')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (3, N'2468      ', N'MO', N'Jefferson City      ', N'63755')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (4, N'1123      ', N'MN', N'Winona              ', N'55987')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (5, N'9876      ', N'MN', N'Winona              ', N'55987')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (6, N'7654      ', N'MO', N'Jefferson City      ', N'63755')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (7, N'1357      ', N'MO', N'Jefferson City      ', N'63755')
INSERT [dbo].[Address] ([Address_ID], [Address_Num], [State], [City], [Zip]) VALUES (8, N'7654      ', N'MN', N'Winona              ', N'55987')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Inventory_ID], [Wood1_ID], [Wood1_Price], [Amout_Wood1], [Wood2_ID], [Wood2_Price], [Amout_Wood2], [Wood3_ID], [Wood3_Price], [Amout_Wood3], [Wood4_ID], [Wood4Price], [Amount_Wood4]) VALUES (1, 2, 5.5000, 425, 3, 7.2000, 400, 4, 4.0000, 500, NULL, NULL, NULL)
INSERT [dbo].[Inventory] ([Inventory_ID], [Wood1_ID], [Wood1_Price], [Amout_Wood1], [Wood2_ID], [Wood2_Price], [Amout_Wood2], [Wood3_ID], [Wood3_Price], [Amout_Wood3], [Wood4_ID], [Wood4Price], [Amount_Wood4]) VALUES (2, 2, 6.0000, 300, 3, 6.6000, 425, 4, 4.3000, 250, 6, 9.5000, 200)
INSERT [dbo].[Inventory] ([Inventory_ID], [Wood1_ID], [Wood1_Price], [Amout_Wood1], [Wood2_ID], [Wood2_Price], [Amout_Wood2], [Wood3_ID], [Wood3_Price], [Amout_Wood3], [Wood4_ID], [Wood4Price], [Amount_Wood4]) VALUES (4, 2, 4.7000, 600, 4, 3.8000, 700, 5, 6.2000, 350, 7, 15.0000, 225)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Job_ID], [Job]) VALUES (1, N'Owner               ')
INSERT [dbo].[Jobs] ([Job_ID], [Job]) VALUES (2, N'Customer            ')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Lumber_Yard] ON 

INSERT [dbo].[Lumber_Yard] ([Yard_ID], [Housing_Units], [Income], [Inventory_ID], [Address_ID], [Owner_ID], [Forklift_ID], [Num_Forlifts]) VALUES (2, 2, 200000.0000, 1, 1, 1, 2, 5)
INSERT [dbo].[Lumber_Yard] ([Yard_ID], [Housing_Units], [Income], [Inventory_ID], [Address_ID], [Owner_ID], [Forklift_ID], [Num_Forlifts]) VALUES (3, 1, 150000.0000, 2, 2, 3, 1, 10)
INSERT [dbo].[Lumber_Yard] ([Yard_ID], [Housing_Units], [Income], [Inventory_ID], [Address_ID], [Owner_ID], [Forklift_ID], [Num_Forlifts]) VALUES (4, 3, 214000.0000, 4, 3, 4, 3, 7)
SET IDENTITY_INSERT [dbo].[Lumber_Yard] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (1, N'123-456-789 ', N'Bob            ', N'E', N'Rogers         ', 1, 4, 80000.0000)
INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (3, N'987-654-321 ', N'John           ', N'K', N'Smith          ', 1, 5, 60000.0000)
INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (4, N'019-283-746 ', N'Cameron        ', N'B', N'Ver Hey        ', 1, 6, 100000.0000)
INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (6, N'112-358-132 ', N'Bill           ', N'T', N'White          ', 2, 7, NULL)
INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (7, N'098-765-432 ', N'James          ', N'R', N'Black          ', 2, 8, NULL)
INSERT [dbo].[People] ([People_ID], [Phone_Number], [First_Name], [Middle_Initial], [Last_Name], [Jobs_ID], [Address_ID], [Pay]) VALUES (8, N'468-101-214 ', N'Tom            ', N'V', N'Smith          ', 2, 5, NULL)
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (1, CAST(N'2021-03-14' AS Date), 7, 12.0000, 300.0000, 6, 4)
INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (2, CAST(N'2024-07-25' AS Date), 6, 20.0000, 350.0000, 7, 3)
INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (3, CAST(N'2023-11-30' AS Date), 3, 10.0000, 60.0000, 7, 2)
INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (5, CAST(N'2023-05-05' AS Date), 2, 15.0000, 200.0000, 8, 3)
INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (6, CAST(N'2022-08-15' AS Date), 5, 22.0000, 400.0000, 6, 4)
INSERT [dbo].[Receipt] ([Receipt_Num], [Receipt_Date], [Wood_ID], [tax], [Total_Price], [Buyer_ID], [Yard_ID]) VALUES (9, CAST(N'2024-01-24' AS Date), 4, 14.0000, 375.0000, 6, 4)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
SET IDENTITY_INSERT [dbo].[Transport] ON 

INSERT [dbo].[Transport] ([Transport_ID], [Type_Transport], [Fuel], [Cost_Fuel]) VALUES (1, N'small forklift      ', N'gasoline  ', 2.4500)
INSERT [dbo].[Transport] ([Transport_ID], [Type_Transport], [Fuel], [Cost_Fuel]) VALUES (2, N'medium forlift      ', N'diesel    ', 3.0000)
INSERT [dbo].[Transport] ([Transport_ID], [Type_Transport], [Fuel], [Cost_Fuel]) VALUES (3, N'large forlift       ', N'diesel    ', 3.0000)
SET IDENTITY_INSERT [dbo].[Transport] OFF
GO
SET IDENTITY_INSERT [dbo].[Wood] ON 

INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (2, N'Oak       ')
INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (3, N'Maple     ')
INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (4, N'Pine      ')
INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (5, N'Cherry    ')
INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (6, N'Walnut    ')
INSERT [dbo].[Wood] ([Wood_ID], [Type_Wood]) VALUES (7, N'Mahogany  ')
SET IDENTITY_INSERT [dbo].[Wood] OFF
GO
USE [master]
GO
ALTER DATABASE [lumberYard] SET  READ_WRITE 
GO
