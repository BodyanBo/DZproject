USE [master]
GO
/****** Object:  Database [djangoBanks]    Script Date: 04.11.2019 12:12:54 ******/
CREATE DATABASE [djangoBanks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'djangoBanks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\djangoBanks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'djangoBanks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\djangoBanks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [djangoBanks] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [djangoBanks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [djangoBanks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [djangoBanks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [djangoBanks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [djangoBanks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [djangoBanks] SET ARITHABORT OFF 
GO
ALTER DATABASE [djangoBanks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [djangoBanks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [djangoBanks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [djangoBanks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [djangoBanks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [djangoBanks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [djangoBanks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [djangoBanks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [djangoBanks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [djangoBanks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [djangoBanks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [djangoBanks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [djangoBanks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [djangoBanks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [djangoBanks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [djangoBanks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [djangoBanks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [djangoBanks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [djangoBanks] SET  MULTI_USER 
GO
ALTER DATABASE [djangoBanks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [djangoBanks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [djangoBanks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [djangoBanks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [djangoBanks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [djangoBanks] SET QUERY_STORE = OFF
GO
USE [djangoBanks]
GO
/****** Object:  User [test]    Script Date: 04.11.2019 12:12:54 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[assets_id] [int] IDENTITY(1,1) NOT NULL,
	[month] [date] NOT NULL,
	[value] [int] NULL,
	[office_id] [int] NULL,
	[indicator_id] [int] NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[assets_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city_region]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city_region](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[region_id] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_city_region] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicatorNames]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicatorNames](
	[indicator__name_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](18) NOT NULL,
 CONSTRAINT [PK_IndicatorNames] PRIMARY KEY CLUSTERED 
(
	[indicator__name_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_IndicatorNames] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicators]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicators](
	[indicator_id] [int] IDENTITY(1,1) NOT NULL,
	[indicator_name_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_Indicators] PRIMARY KEY CLUSTERED 
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[office_id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[office_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 04.11.2019 12:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[region_id] [int] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Region] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_Indicators] FOREIGN KEY([indicator_id])
REFERENCES [dbo].[Indicators] ([indicator_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_Indicators]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_Office] FOREIGN KEY([office_id])
REFERENCES [dbo].[Office] ([office_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_Office]
GO
ALTER TABLE [dbo].[city_region]  WITH CHECK ADD  CONSTRAINT [FK_city_region_Region] FOREIGN KEY([region_id])
REFERENCES [dbo].[Region] ([region_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[city_region] CHECK CONSTRAINT [FK_city_region_Region]
GO
ALTER TABLE [dbo].[Indicators]  WITH CHECK ADD  CONSTRAINT [FK_Indicators_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Indicators] CHECK CONSTRAINT [FK_Indicators_Categories]
GO
ALTER TABLE [dbo].[Indicators]  WITH CHECK ADD  CONSTRAINT [FK_Indicators_IndicatorNames] FOREIGN KEY([indicator_name_id])
REFERENCES [dbo].[IndicatorNames] ([indicator__name_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Indicators] CHECK CONSTRAINT [FK_Indicators_IndicatorNames]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_city_region] FOREIGN KEY([city_id])
REFERENCES [dbo].[city_region] ([city_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_city_region]
GO
USE [master]
GO
ALTER DATABASE [djangoBanks] SET  READ_WRITE 
GO
