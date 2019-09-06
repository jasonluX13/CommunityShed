USE [master]
GO
/****** Object:  Database [CommunityShed]    Script Date: 9/6/2019 12:43:08 PM ******/
CREATE DATABASE [CommunityShed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommunityShed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CommunityShed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CommunityShed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommunityShed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommunityShed] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommunityShed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommunityShed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommunityShed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommunityShed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommunityShed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommunityShed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommunityShed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommunityShed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommunityShed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommunityShed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommunityShed] SET RECOVERY FULL 
GO
ALTER DATABASE [CommunityShed] SET  MULTI_USER 
GO
ALTER DATABASE [CommunityShed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommunityShed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommunityShed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommunityShed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommunityShed] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommunityShed', N'ON'
GO
ALTER DATABASE [CommunityShed] SET QUERY_STORE = OFF
GO
USE [CommunityShed]
GO
/****** Object:  Table [dbo].[Community]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommunityName] [nvarchar](30) NOT NULL,
	[Open] [bit] NOT NULL,
	[OwnerId] [int] NOT NULL,
 CONSTRAINT [PK_Community] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunityItems]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunityItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
 CONSTRAINT [PK_Shed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](30) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[Usage] [nvarchar](50) NOT NULL,
	[Warning] [nvarchar](50) NULL,
	[Age] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemApplication]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemApplication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommunityItemId] [int] NOT NULL,
	[BorrowerId] [int] NOT NULL,
	[DateRequested] [datetimeoffset](7) NOT NULL,
	[DateApproved] [datetimeoffset](7) NULL,
	[DateReturned] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_ItemApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonCommunity]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonCommunity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
 CONSTRAINT [PK_PersonCommunity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonRole]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
 CONSTRAINT [PK_PersonRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/6/2019 12:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Community] ON 

INSERT [dbo].[Community] ([Id], [CommunityName], [Open], [OwnerId]) VALUES (1, N'Astoria', 1, 1)
INSERT [dbo].[Community] ([Id], [CommunityName], [Open], [OwnerId]) VALUES (3, N'BethPage', 0, 2)
INSERT [dbo].[Community] ([Id], [CommunityName], [Open], [OwnerId]) VALUES (4, N'Newark', 1, 1)
INSERT [dbo].[Community] ([Id], [CommunityName], [Open], [OwnerId]) VALUES (5, N'LIC', 1, 1)
SET IDENTITY_INSERT [dbo].[Community] OFF
SET IDENTITY_INSERT [dbo].[CommunityItems] ON 

INSERT [dbo].[CommunityItems] ([Id], [ItemId], [CommunityId]) VALUES (2, 1, 1)
INSERT [dbo].[CommunityItems] ([Id], [ItemId], [CommunityId]) VALUES (3, 2, 5)
SET IDENTITY_INSERT [dbo].[CommunityItems] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [ItemName], [OwnerId], [Usage], [Warning], [Age]) VALUES (1, N'Shovel', 1, N'Light', N'None', N'2 Months')
INSERT [dbo].[Item] ([Id], [ItemName], [OwnerId], [Usage], [Warning], [Age]) VALUES (2, N'Lawn Mower', 2, N'None', N'None', N'Brand New')
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[ItemApplication] ON 

INSERT [dbo].[ItemApplication] ([Id], [CommunityItemId], [BorrowerId], [DateRequested], [DateApproved], [DateReturned]) VALUES (3, 2, 2, CAST(N'2019-09-06T11:55:22.1520777-04:00' AS DateTimeOffset), NULL, NULL)
INSERT [dbo].[ItemApplication] ([Id], [CommunityItemId], [BorrowerId], [DateRequested], [DateApproved], [DateReturned]) VALUES (5, 3, 1, CAST(N'2019-09-06T12:28:22.1520777-04:00' AS DateTimeOffset), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ItemApplication] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Mohammed', N'Salam', N'mohammedfsalam@gmail.com', N'$2a$12$3TYpprd9cb/pULJm.vlQw.ZHyAoc7GP30ObFwLDQgMt/e0UcrQ642')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Jason', N'Lu', N'jlu@gmail.com', N'$2a$12$pmOqijarpLKSlWJd4yMfnu6K6f4khOdnR0fXlguInpTPnA3vSBM4y')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Jason', N'John', N'jd@gmail.com', N'$2a$12$6yX6SVhnKs1NAkwE.gNO2ujqkzl4q2v2a8SvtCssyNrme92EM9bga')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[PersonCommunity] ON 

INSERT [dbo].[PersonCommunity] ([Id], [PersonId], [CommunityId]) VALUES (1, 1, 4)
INSERT [dbo].[PersonCommunity] ([Id], [PersonId], [CommunityId]) VALUES (2, 1, 1)
INSERT [dbo].[PersonCommunity] ([Id], [PersonId], [CommunityId]) VALUES (4, 1, 5)
INSERT [dbo].[PersonCommunity] ([Id], [PersonId], [CommunityId]) VALUES (5, 3, 1)
INSERT [dbo].[PersonCommunity] ([Id], [PersonId], [CommunityId]) VALUES (6, 2, 1)
SET IDENTITY_INSERT [dbo].[PersonCommunity] OFF
SET IDENTITY_INSERT [dbo].[PersonRole] ON 

INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (2, 1, 2, 1)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (3, 1, 3, 1)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (4, 1, 4, 1)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (5, 2, 1, 3)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (6, 2, 2, 3)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (7, 2, 3, 3)
INSERT [dbo].[PersonRole] ([Id], [PersonId], [RoleId], [CommunityId]) VALUES (8, 2, 4, 3)
SET IDENTITY_INSERT [dbo].[PersonRole] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Member')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Approver')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Reviewer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Enforcer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Person]    Script Date: 9/6/2019 12:43:08 PM ******/
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [IX_Person] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Community]  WITH CHECK ADD  CONSTRAINT [FK_Community_Person] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Community] CHECK CONSTRAINT [FK_Community_Person]
GO
ALTER TABLE [dbo].[CommunityItems]  WITH CHECK ADD  CONSTRAINT [FK_CommunityItems_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[CommunityItems] CHECK CONSTRAINT [FK_CommunityItems_Community]
GO
ALTER TABLE [dbo].[CommunityItems]  WITH CHECK ADD  CONSTRAINT [FK_CommunityItems_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[CommunityItems] CHECK CONSTRAINT [FK_CommunityItems_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Item] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Item]
GO
ALTER TABLE [dbo].[ItemApplication]  WITH CHECK ADD  CONSTRAINT [FK_ItemApplication_ItemApplication] FOREIGN KEY([CommunityItemId])
REFERENCES [dbo].[CommunityItems] ([Id])
GO
ALTER TABLE [dbo].[ItemApplication] CHECK CONSTRAINT [FK_ItemApplication_ItemApplication]
GO
ALTER TABLE [dbo].[ItemApplication]  WITH CHECK ADD  CONSTRAINT [FK_ItemApplication_Person] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[ItemApplication] CHECK CONSTRAINT [FK_ItemApplication_Person]
GO
ALTER TABLE [dbo].[PersonCommunity]  WITH CHECK ADD  CONSTRAINT [FK_PersonCommunity_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[PersonCommunity] CHECK CONSTRAINT [FK_PersonCommunity_Community]
GO
ALTER TABLE [dbo].[PersonCommunity]  WITH CHECK ADD  CONSTRAINT [FK_PersonCommunity_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[PersonCommunity] CHECK CONSTRAINT [FK_PersonCommunity_Person]
GO
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [FK_PersonRole_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [FK_PersonRole_Community]
GO
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [FK_PersonRole_PersonRole] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [FK_PersonRole_PersonRole]
GO
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [FK_PersonRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [FK_PersonRole_Role]
GO
USE [master]
GO
ALTER DATABASE [CommunityShed] SET  READ_WRITE 
GO
