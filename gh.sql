USE [master]
GO
/****** Object:  Database [18ip12]    Script Date: Пн 21.02.22 0:02:11 ******/
CREATE DATABASE [18ip12]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'18ip12', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\18ip12.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'18ip12_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\18ip12_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [18ip12] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [18ip12].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [18ip12] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [18ip12] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [18ip12] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [18ip12] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [18ip12] SET ARITHABORT OFF 
GO
ALTER DATABASE [18ip12] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [18ip12] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [18ip12] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [18ip12] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [18ip12] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [18ip12] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [18ip12] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [18ip12] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [18ip12] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [18ip12] SET  DISABLE_BROKER 
GO
ALTER DATABASE [18ip12] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [18ip12] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [18ip12] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [18ip12] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [18ip12] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [18ip12] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [18ip12] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [18ip12] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [18ip12] SET  MULTI_USER 
GO
ALTER DATABASE [18ip12] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [18ip12] SET DB_CHAINING OFF 
GO
ALTER DATABASE [18ip12] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [18ip12] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [18ip12] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [18ip12] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'18ip12', N'ON'
GO
ALTER DATABASE [18ip12] SET QUERY_STORE = OFF
GO
USE [18ip12]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[ID_kli] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[ID_kli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zayavka]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zayavka](
	[ID_zaya] [int] NOT NULL,
	[Marchryt_t] [nvarchar](50) NULL,
	[Marshryt_o] [nvarchar](50) NULL,
	[Date_otp] [date] NULL,
	[Date_prib] [date] NULL,
	[Rasstoyanie] [int] NULL,
 CONSTRAINT [PK_Zayavka] PRIMARY KEY CLUSTERED 
(
	[ID_zaya] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakazi]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakazi](
	[ID] [int] NOT NULL,
	[Volume] [float] NULL,
	[ID_dis] [int] NULL,
	[ID_kli] [int] NULL,
	[ID_car] [int] NULL,
	[ID_dri] [int] NULL,
	[ID_zaya] [int] NULL,
	[Status] [int] NULL,
	[Data_prin_zak] [date] NULL,
	[Sum] [float] NULL,
 CONSTRAINT [PK_Zakazi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[pred]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pred]
AS
SELECT        dbo.Zakazi.Data_prin_zak, dbo.Zayavka.ID_zaya, dbo.Zayavka.Marchryt_t, dbo.Zayavka.Marshryt_o, dbo.Klient.Surname
FROM            dbo.Zakazi INNER JOIN
                         dbo.Zayavka ON dbo.Zakazi.ID_zaya = dbo.Zayavka.ID_zaya INNER JOIN
                         dbo.Klient ON dbo.Zakazi.ID_kli = dbo.Klient.ID_kli
GO
/****** Object:  Table [dbo].[Driver]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[ID_dri] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[ID_dri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[ID_car] [int] NOT NULL,
	[Tonnage] [float] NULL,
	[Nomber] [nchar](10) NULL,
	[ID_dri] [int] NULL,
	[Brand] [nvarchar](50) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[ID_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Zakazi.ID, dbo.Car.Nomber, dbo.Car.Brand, dbo.Driver.Surname, dbo.Driver.Call
FROM            dbo.Car INNER JOIN
                         dbo.Zakazi ON dbo.Car.ID_car = dbo.Zakazi.ID_car INNER JOIN
                         dbo.Driver ON dbo.Zakazi.ID_dri = dbo.Driver.ID_dri
GO
/****** Object:  Table [dbo].[Dispetsher]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispetsher](
	[ID_dis] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
	[Passvord] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dispetsher] PRIMARY KEY CLUSTERED 
(
	[ID_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statys]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statys](
	[ID_st] [int] IDENTITY(1,1) NOT NULL,
	[text_st] [nchar](50) NULL,
 CONSTRAINT [PK_Statys] PRIMARY KEY CLUSTERED 
(
	[ID_st] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarif]    Script Date: Пн 21.02.22 0:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarif](
	[ID_tar] [int] NOT NULL,
	[Date_yst] [date] NULL,
	[Price_per_km] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Car] FOREIGN KEY([ID_car])
REFERENCES [dbo].[Car] ([ID_car])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Car]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Dispetsher] FOREIGN KEY([ID_dis])
REFERENCES [dbo].[Dispetsher] ([ID_dis])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Dispetsher]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Driver] FOREIGN KEY([ID_dri])
REFERENCES [dbo].[Driver] ([ID_dri])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Driver]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Klient] FOREIGN KEY([ID_kli])
REFERENCES [dbo].[Klient] ([ID_kli])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Klient]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Statys] FOREIGN KEY([Status])
REFERENCES [dbo].[Statys] ([ID_st])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Statys]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Zakazi_Zayavka] FOREIGN KEY([ID_zaya])
REFERENCES [dbo].[Zayavka] ([ID_zaya])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Zakazi_Zayavka]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Zakazi"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Zayavka"
            Begin Extent = 
               Top = 150
               Left = 273
               Bottom = 280
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Klient"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pred'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pred'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Car"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Driver"
            Begin Extent = 
               Top = 146
               Left = 44
               Bottom = 276
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Zakazi"
            Begin Extent = 
               Top = 16
               Left = 274
               Bottom = 146
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [18ip12] SET  READ_WRITE 
GO
