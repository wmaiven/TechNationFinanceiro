USE [master]
GO
/****** Object:  Database [TechNationFinanceiroDB]    Script Date: 08/07/2024 16:10:57 ******/
CREATE DATABASE [TechNationFinanceiroDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechNationFinanceiroDB', FILENAME = N'/var/opt/mssql/data/TechNationFinanceiroDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechNationFinanceiroDB_log', FILENAME = N'/var/opt/mssql/data/TechNationFinanceiroDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechNationFinanceiroDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechNationFinanceiroDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET  MULTI_USER 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechNationFinanceiroDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechNationFinanceiroDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechNationFinanceiroDB', N'ON'
GO
ALTER DATABASE [TechNationFinanceiroDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechNationFinanceiroDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechNationFinanceiroDB]
GO
/****** Object:  Table [dbo].[NotasFiscais]    Script Date: 08/07/2024 16:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotasFiscais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomePagador] [nvarchar](100) NULL,
	[NumeroIdentificacao] [nvarchar](50) NULL,
	[DataEmissao] [date] NULL,
	[DataCobranca] [date] NULL,
	[DataPagamento] [date] NULL,
	[Valor] [decimal](18, 2) NULL,
	[DocumentoFiscal] [nvarchar](255) NULL,
	[DocumentoBoleto] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08/07/2024 16:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/07/2024 16:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[NotasFiscais] ON 

INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1051, N'Cliente A', N'NF001', CAST(N'2023-01-15' AS Date), CAST(N'2023-01-20' AS Date), CAST(N'2023-01-25' AS Date), CAST(1500.00 AS Decimal(18, 2)), N'NF001-DOC', N'NF001-BOLETO', N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1052, N'Cliente B', N'NF002', CAST(N'2023-02-20' AS Date), CAST(N'2023-02-25' AS Date), NULL, CAST(2000.00 AS Decimal(18, 2)), N'NF002-DOC', NULL, N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1053, N'Cliente C', N'NF003', CAST(N'2023-03-10' AS Date), CAST(N'2023-03-15' AS Date), NULL, CAST(1800.00 AS Decimal(18, 2)), N'NF003-DOC', NULL, N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1054, N'Cliente D', N'NF004', CAST(N'2023-04-05' AS Date), CAST(N'2023-04-10' AS Date), CAST(N'2023-04-12' AS Date), CAST(2200.00 AS Decimal(18, 2)), N'NF004-DOC', N'NF004-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1055, N'Cliente E', N'NF005', CAST(N'2023-05-18' AS Date), CAST(N'2023-05-23' AS Date), NULL, CAST(1900.00 AS Decimal(18, 2)), N'NF005-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1056, N'Cliente F', N'NF006', CAST(N'2023-06-22' AS Date), CAST(N'2023-06-27' AS Date), CAST(N'2023-06-30' AS Date), CAST(2500.00 AS Decimal(18, 2)), N'NF006-DOC', N'NF006-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1057, N'Cliente G', N'NF007', CAST(N'2023-07-12' AS Date), CAST(N'2023-07-17' AS Date), NULL, CAST(1700.00 AS Decimal(18, 2)), N'NF007-DOC', NULL, N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1058, N'Cliente H', N'NF008', CAST(N'2023-08-08' AS Date), CAST(N'2023-08-13' AS Date), CAST(N'2023-08-15' AS Date), CAST(2100.00 AS Decimal(18, 2)), N'NF008-DOC', N'NF008-BOLETO', N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1059, N'Cliente I', N'NF009', CAST(N'2023-09-25' AS Date), CAST(N'2023-09-30' AS Date), NULL, CAST(2400.00 AS Decimal(18, 2)), N'NF009-DOC', NULL, N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1060, N'Cliente J', N'NF010', CAST(N'2023-10-14' AS Date), CAST(N'2023-10-19' AS Date), CAST(N'2023-10-22' AS Date), CAST(2600.00 AS Decimal(18, 2)), N'NF010-DOC', N'NF010-BOLETO', N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1061, N'Cliente K', N'NF011', CAST(N'2023-11-03' AS Date), CAST(N'2023-11-08' AS Date), NULL, CAST(2300.00 AS Decimal(18, 2)), N'NF011-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1062, N'Cliente L', N'NF012', CAST(N'2023-12-09' AS Date), CAST(N'2023-12-14' AS Date), CAST(N'2023-12-18' AS Date), CAST(2800.00 AS Decimal(18, 2)), N'NF012-DOC', N'NF012-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1063, N'Cliente M', N'NF013', CAST(N'2024-01-22' AS Date), CAST(N'2024-01-27' AS Date), NULL, CAST(1950.00 AS Decimal(18, 2)), N'NF013-DOC', NULL, N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1064, N'Cliente N', N'NF014', CAST(N'2024-02-11' AS Date), CAST(N'2024-02-16' AS Date), CAST(N'2024-02-20' AS Date), CAST(2250.00 AS Decimal(18, 2)), N'NF014-DOC', N'NF014-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1065, N'Cliente O', N'NF015', CAST(N'2024-03-08' AS Date), CAST(N'2024-03-13' AS Date), NULL, CAST(1850.00 AS Decimal(18, 2)), N'NF015-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1066, N'Cliente P', N'NF016', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-24' AS Date), CAST(N'2024-04-28' AS Date), CAST(2650.00 AS Decimal(18, 2)), N'NF016-DOC', N'NF016-BOLETO', N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1067, N'Cliente Q', N'NF017', CAST(N'2024-05-27' AS Date), CAST(N'2024-06-01' AS Date), NULL, CAST(2750.00 AS Decimal(18, 2)), N'NF017-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1068, N'Cliente R', N'NF018', CAST(N'2024-06-14' AS Date), CAST(N'2024-06-19' AS Date), CAST(N'2024-06-22' AS Date), CAST(2950.00 AS Decimal(18, 2)), N'NF018-DOC', N'NF018-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1069, N'Cliente S', N'NF019', CAST(N'2024-07-03' AS Date), CAST(N'2024-07-08' AS Date), NULL, CAST(2050.00 AS Decimal(18, 2)), N'NF019-DOC', NULL, N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1070, N'Cliente T', N'NF020', CAST(N'2024-08-05' AS Date), CAST(N'2024-08-10' AS Date), CAST(N'2024-08-15' AS Date), CAST(2350.00 AS Decimal(18, 2)), N'NF020-DOC', N'NF020-BOLETO', N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1071, N'Cliente U', N'NF021', CAST(N'2024-09-11' AS Date), CAST(N'2024-09-16' AS Date), NULL, CAST(2150.00 AS Decimal(18, 2)), N'NF021-DOC', NULL, N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1072, N'Cliente V', N'NF022', CAST(N'2024-10-07' AS Date), CAST(N'2024-10-12' AS Date), CAST(N'2024-10-15' AS Date), CAST(2550.00 AS Decimal(18, 2)), N'NF022-DOC', N'NF022-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1073, N'Cliente W', N'NF023', CAST(N'2024-11-20' AS Date), CAST(N'2024-11-25' AS Date), NULL, CAST(2250.00 AS Decimal(18, 2)), N'NF023-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1074, N'Cliente X', N'NF024', CAST(N'2024-12-16' AS Date), CAST(N'2024-12-21' AS Date), CAST(N'2024-12-25' AS Date), CAST(3050.00 AS Decimal(18, 2)), N'NF024-DOC', N'NF024-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1075, N'Cliente Y', N'NF025', CAST(N'2025-01-08' AS Date), CAST(N'2025-01-13' AS Date), NULL, CAST(1950.00 AS Decimal(18, 2)), N'NF025-DOC', NULL, N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1076, N'Cliente Z', N'NF026', CAST(N'2025-02-14' AS Date), CAST(N'2025-02-19' AS Date), CAST(N'2025-02-22' AS Date), CAST(2750.00 AS Decimal(18, 2)), N'NF026-DOC', N'NF026-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1077, N'Cliente AA', N'NF027', CAST(N'2025-03-07' AS Date), CAST(N'2025-03-12' AS Date), NULL, CAST(1850.00 AS Decimal(18, 2)), N'NF027-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1078, N'Cliente BB', N'NF028', CAST(N'2025-04-23' AS Date), CAST(N'2025-04-28' AS Date), CAST(N'2025-05-02' AS Date), CAST(2650.00 AS Decimal(18, 2)), N'NF028-DOC', N'NF028-BOLETO', N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1079, N'Cliente CC', N'NF029', CAST(N'2025-05-19' AS Date), CAST(N'2025-05-24' AS Date), NULL, CAST(2750.00 AS Decimal(18, 2)), N'NF029-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1080, N'Cliente DD', N'NF030', CAST(N'2025-06-11' AS Date), CAST(N'2025-06-16' AS Date), CAST(N'2025-06-20' AS Date), CAST(2950.00 AS Decimal(18, 2)), N'NF030-DOC', N'NF030-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1081, N'Cliente EE', N'NF031', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), NULL, CAST(2050.00 AS Decimal(18, 2)), N'NF031-DOC', NULL, N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1082, N'Cliente FF', N'NF032', CAST(N'2025-08-22' AS Date), CAST(N'2025-08-27' AS Date), CAST(N'2025-08-30' AS Date), CAST(2350.00 AS Decimal(18, 2)), N'NF032-DOC', N'NF032-BOLETO', N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1083, N'Cliente GG', N'NF033', CAST(N'2025-09-17' AS Date), CAST(N'2025-09-22' AS Date), NULL, CAST(2150.00 AS Decimal(18, 2)), N'NF033-DOC', NULL, N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1084, N'Cliente HH', N'NF034', CAST(N'2025-10-03' AS Date), CAST(N'2025-10-08' AS Date), CAST(N'2025-10-12' AS Date), CAST(2550.00 AS Decimal(18, 2)), N'NF034-DOC', N'NF034-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1085, N'Cliente II', N'NF035', CAST(N'2025-11-14' AS Date), CAST(N'2025-11-19' AS Date), NULL, CAST(2250.00 AS Decimal(18, 2)), N'NF035-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1086, N'Cliente JJ', N'NF036', CAST(N'2025-12-09' AS Date), CAST(N'2025-12-14' AS Date), CAST(N'2025-12-18' AS Date), CAST(3050.00 AS Decimal(18, 2)), N'NF036-DOC', N'NF036-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1087, N'Cliente KK', N'NF037', CAST(N'2026-01-22' AS Date), CAST(N'2026-01-27' AS Date), NULL, CAST(1950.00 AS Decimal(18, 2)), N'NF037-DOC', NULL, N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1088, N'Cliente LL', N'NF038', CAST(N'2026-02-11' AS Date), CAST(N'2026-02-16' AS Date), CAST(N'2026-02-20' AS Date), CAST(2250.00 AS Decimal(18, 2)), N'NF038-DOC', N'NF038-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1089, N'Cliente MM', N'NF039', CAST(N'2026-03-08' AS Date), CAST(N'2026-03-13' AS Date), NULL, CAST(1850.00 AS Decimal(18, 2)), N'NF039-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1090, N'Cliente NN', N'NF040', CAST(N'2026-04-19' AS Date), CAST(N'2026-04-24' AS Date), CAST(N'2026-04-28' AS Date), CAST(2650.00 AS Decimal(18, 2)), N'NF040-DOC', N'NF040-BOLETO', N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1091, N'Cliente OO', N'NF041', CAST(N'2026-05-27' AS Date), CAST(N'2026-06-01' AS Date), NULL, CAST(2750.00 AS Decimal(18, 2)), N'NF041-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1092, N'Cliente PP', N'NF042', CAST(N'2026-06-14' AS Date), CAST(N'2026-06-19' AS Date), CAST(N'2026-06-22' AS Date), CAST(2950.00 AS Decimal(18, 2)), N'NF042-DOC', N'NF042-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1093, N'Cliente QQ', N'NF043', CAST(N'2026-07-03' AS Date), CAST(N'2026-07-08' AS Date), NULL, CAST(2050.00 AS Decimal(18, 2)), N'NF043-DOC', NULL, N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1094, N'Cliente RR', N'NF044', CAST(N'2026-08-05' AS Date), CAST(N'2026-08-10' AS Date), CAST(N'2026-08-15' AS Date), CAST(2350.00 AS Decimal(18, 2)), N'NF044-DOC', N'NF044-BOLETO', N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1095, N'Cliente SS', N'NF045', CAST(N'2026-09-11' AS Date), CAST(N'2026-09-16' AS Date), NULL, CAST(2150.00 AS Decimal(18, 2)), N'NF045-DOC', NULL, N'Pagamento em Atraso')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1096, N'Cliente TT', N'NF046', CAST(N'2026-10-07' AS Date), CAST(N'2026-10-12' AS Date), CAST(N'2026-10-15' AS Date), CAST(2550.00 AS Decimal(18, 2)), N'NF046-DOC', N'NF046-BOLETO', N'Cobrança Realizada')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1097, N'Cliente UU', N'NF047', CAST(N'2026-11-20' AS Date), CAST(N'2026-11-25' AS Date), NULL, CAST(2250.00 AS Decimal(18, 2)), N'NF047-DOC', NULL, N'Emitida')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1098, N'Cliente VV', N'NF048', CAST(N'2026-12-16' AS Date), CAST(N'2026-12-21' AS Date), CAST(N'2026-12-25' AS Date), CAST(3050.00 AS Decimal(18, 2)), N'NF048-DOC', N'NF048-BOLETO', N'Pagamento Realizado')
INSERT [dbo].[NotasFiscais] ([Id], [NomePagador], [NumeroIdentificacao], [DataEmissao], [DataCobranca], [DataPagamento], [Valor], [DocumentoFiscal], [DocumentoBoleto], [Status]) VALUES (1099, N'CLIENTE WESLLEY', N'NF00213', CAST(N'2024-07-07' AS Date), CAST(N'2024-07-07' AS Date), CAST(N'2024-07-07' AS Date), CAST(1232.00 AS Decimal(18, 2)), N'NF001-DOC', N'NF001-BOLETO', N'Emitida')
SET IDENTITY_INSERT [dbo].[NotasFiscais] OFF
GO
INSERT [dbo].[User] ([Id], [Username], [Password]) VALUES (N'f84477c9-4c7d-4d1f-878b-ae048e8a1372', N'admin', N'senha123')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1, N'admin', N'senha123')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (newid()) FOR [Id]
GO
USE [master]
GO
ALTER DATABASE [TechNationFinanceiroDB] SET  READ_WRITE 
GO
