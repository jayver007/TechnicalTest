/****** Object:  Database [sqldb-shifts2-qa]    Script Date: 3/03/2024 4:07:44 p. m. ******/
CREATE DATABASE [sqldb-shifts2-qa]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [sqldb-shifts2-qa] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ARITHABORT OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET  MULTI_USER 
GO
ALTER DATABASE [sqldb-shifts2-qa] SET ENCRYPTION ON
GO
ALTER DATABASE [sqldb-shifts2-qa] SET QUERY_STORE = ON
GO
ALTER DATABASE [sqldb-shifts2-qa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  DatabaseScopedCredential [https://sqlauditcenqjoi6i34n66wi.blob.core.windows.net/sqldbauditlogs]    Script Date: 3/03/2024 4:07:44 p. m. ******/
CREATE DATABASE SCOPED CREDENTIAL [https://sqlauditcenqjoi6i34n66wi.blob.core.windows.net/sqldbauditlogs] WITH IDENTITY = N'SHARED ACCESS SIGNATURE'
GO
/****** Object:  Table [dbo].[Buyers]    Script Date: 3/03/2024 4:07:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Buyers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarBuyerStateHistory]    Script Date: 3/03/2024 4:07:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarBuyerStateHistory](
	[CarBuyerId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_CarBuyerStateHistory] PRIMARY KEY CLUSTERED 
(
	[CarBuyerId] ASC,
	[StateId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/03/2024 4:07:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarYear] [int] NOT NULL,
	[Make] [nvarchar](200) NOT NULL,
	[Model] [nvarchar](200) NOT NULL,
	[SubModel] [nvarchar](200) NOT NULL,
	[ZipCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarsBuyers]    Script Date: 3/03/2024 4:07:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsBuyers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[BuyerId] [int] NOT NULL,
	[Current] [bit] NOT NULL,
	[Quote] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CarsBuyers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 3/03/2024 4:07:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buyers] ON 

INSERT [dbo].[Buyers] ([Id], [Name], [LastName]) VALUES (1, N'John', N'Doe')
INSERT [dbo].[Buyers] ([Id], [Name], [LastName]) VALUES (2, N'Alice', N'Smith')
INSERT [dbo].[Buyers] ([Id], [Name], [LastName]) VALUES (3, N'Michael', N'Johnson')
INSERT [dbo].[Buyers] ([Id], [Name], [LastName]) VALUES (4, N'Emily', N'Brown')
SET IDENTITY_INSERT [dbo].[Buyers] OFF
GO
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (3, 1, CAST(N'2023-01-01T08:30:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (3, 2, CAST(N'2023-01-02T10:15:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (3, 3, CAST(N'2023-02-03T14:45:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (3, 4, CAST(N'2023-02-04T09:00:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (5, 1, CAST(N'2023-01-01T08:30:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (5, 2, CAST(N'2023-01-02T10:15:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (8, 1, CAST(N'2024-03-03T14:45:00.000' AS DateTime))
INSERT [dbo].[CarBuyerStateHistory] ([CarBuyerId], [StateId], [CreatedAt]) VALUES (8, 2, CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [CarYear], [Make], [Model], [SubModel], [ZipCode]) VALUES (1, 2018, N'Toyota', N'Camry', N'LE', N'12345')
INSERT [dbo].[Cars] ([Id], [CarYear], [Make], [Model], [SubModel], [ZipCode]) VALUES (2, 2020, N'Honda', N'Accord', N'EX', N'54321')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[CarsBuyers] ON 

INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (1, 1, 1, 0, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (2, 1, 2, 0, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (3, 1, 3, 1, CAST(60000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (4, 1, 4, 0, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (5, 2, 1, 0, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (6, 2, 2, 0, CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (7, 2, 3, 0, CAST(80000.00 AS Decimal(18, 2)))
INSERT [dbo].[CarsBuyers] ([Id], [CarId], [BuyerId], [Current], [Quote]) VALUES (8, 2, 4, 1, CAST(85000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CarsBuyers] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([Id], [Name]) VALUES (1, N'Pending')
INSERT [dbo].[States] ([Id], [Name]) VALUES (2, N'Acceptance')
INSERT [dbo].[States] ([Id], [Name]) VALUES (3, N'Accepted')
INSERT [dbo].[States] ([Id], [Name]) VALUES (4, N'Picked Up')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
/****** Object:  Index [IX_CarBuyerStateHistory_StateId]    Script Date: 3/03/2024 4:07:49 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CarBuyerStateHistory_StateId] ON [dbo].[CarBuyerStateHistory]
(
	[StateId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarsBuyers_BuyerId]    Script Date: 3/03/2024 4:07:49 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CarsBuyers_BuyerId] ON [dbo].[CarsBuyers]
(
	[BuyerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarsBuyers_CarId]    Script Date: 3/03/2024 4:07:49 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CarsBuyers_CarId] ON [dbo].[CarsBuyers]
(
	[CarId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarBuyerStateHistory]  WITH CHECK ADD  CONSTRAINT [FK_CarBuyerStateHistory_CarsBuyers_CarBuyerId] FOREIGN KEY([CarBuyerId])
REFERENCES [dbo].[CarsBuyers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarBuyerStateHistory] CHECK CONSTRAINT [FK_CarBuyerStateHistory_CarsBuyers_CarBuyerId]
GO
ALTER TABLE [dbo].[CarBuyerStateHistory]  WITH CHECK ADD  CONSTRAINT [FK_CarBuyerStateHistory_States_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarBuyerStateHistory] CHECK CONSTRAINT [FK_CarBuyerStateHistory_States_StateId]
GO
ALTER TABLE [dbo].[CarsBuyers]  WITH CHECK ADD  CONSTRAINT [FK_CarsBuyers_Buyers_BuyerId] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[Buyers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsBuyers] CHECK CONSTRAINT [FK_CarsBuyers_Buyers_BuyerId]
GO
ALTER TABLE [dbo].[CarsBuyers]  WITH CHECK ADD  CONSTRAINT [FK_CarsBuyers_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsBuyers] CHECK CONSTRAINT [FK_CarsBuyers_Cars_CarId]
GO
ALTER DATABASE [sqldb-shifts2-qa] SET  READ_WRITE 
GO
