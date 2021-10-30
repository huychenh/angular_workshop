USE [master]
GO
/****** Object:  Database [HC_Angular_Workshop]    Script Date: 10/30/2021 6:13:04 PM ******/
CREATE DATABASE [HC_Angular_Workshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HC_Angular_Workshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HC_Angular_Workshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HC_Angular_Workshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HC_Angular_Workshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HC_Angular_Workshop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HC_Angular_Workshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HC_Angular_Workshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HC_Angular_Workshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HC_Angular_Workshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HC_Angular_Workshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HC_Angular_Workshop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HC_Angular_Workshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET RECOVERY FULL 
GO
ALTER DATABASE [HC_Angular_Workshop] SET  MULTI_USER 
GO
ALTER DATABASE [HC_Angular_Workshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HC_Angular_Workshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HC_Angular_Workshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HC_Angular_Workshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HC_Angular_Workshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HC_Angular_Workshop] SET QUERY_STORE = OFF
GO
USE [HC_Angular_Workshop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/30/2021 6:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/30/2021 6:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/30/2021 6:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/30/2021 6:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/30/2021 6:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
	[Token] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211027165427_Initialize', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211027170525_UpdateCode20211028.001', N'5.0.11')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'asdfghjklmnbvcxzqwertyuio01', N'SuperUser', N'SuperUser', N'8676d3fc-cce8-4e98-9d09-11433612059f')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'asdfghjklmnbvcxzqwertyuio02', N'User', N'User', N'd61b04c1-02d3-4b12-9dcc-cc63df091e61')
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Create Task 1.1', N'Create Task 1.1', N'Done', CAST(N'2021-10-28T01:02:27.3004512' AS DateTime2), N'System', CAST(N'2021-10-30T16:09:06.6873681' AS DateTime2), N'system', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'HuyTest', N'HuyTest', N'Progress', CAST(N'2021-10-28T01:02:52.0936420' AS DateTime2), N'System', CAST(N'2021-10-30T18:11:01.3366667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Create Task 3', N'Create Task 3', N'Progress', CAST(N'2021-10-28T01:03:04.9706233' AS DateTime2), N'System', CAST(N'2021-10-30T17:43:23.6522653' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'New Task 1', N'New Task 1', N'Done', CAST(N'2021-10-28T10:33:48.2333333' AS DateTime2), N'HC', CAST(N'2021-10-28T10:33:48.2333333' AS DateTime2), N'HC', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'New Task 5', N'New Task 5', N'Progress', CAST(N'2021-10-28T10:34:03.2900000' AS DateTime2), N'HC', CAST(N'2021-10-30T17:43:30.7324054' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1002, N'Task 2021-10-29.001', N'Task 2021-10-29.001', N'New', CAST(N'2021-10-29T10:11:49.1233333' AS DateTime2), N'Ad', CAST(N'2021-10-30T17:41:45.2767526' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1003, N'Task 2021-10-29.002', N'Task 2021-10-29.002', N'New', CAST(N'2021-10-29T10:12:05.0900000' AS DateTime2), N'Ad', CAST(N'2021-10-30T17:41:54.6476961' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1004, N'Task 2021-10-29.003', N'Task 2021-10-29.003', N'Progress', CAST(N'2021-10-29T10:12:18.2466667' AS DateTime2), N'Ad', CAST(N'2021-10-30T17:43:36.0943653' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1005, N'Task 2021-10-29.004', N'Task 2021-10-29.004', N'New', CAST(N'2021-10-29T10:12:31.6300000' AS DateTime2), N'Ad', CAST(N'2021-10-30T16:43:06.2140768' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1017, N'Reading books', N'Reading books', N'Done', CAST(N'2021-10-29T18:46:27.8166667' AS DateTime2), N'System', CAST(N'2021-10-30T11:57:51.5900000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1018, N'hghjghjghj', N'ghjghjghj', N'Done', CAST(N'2021-10-29T20:47:26.7566667' AS DateTime2), N'System', CAST(N'2021-10-29T20:47:26.7566667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1019, N'a1', N'a1 - Progress', N'Progress', CAST(N'2021-10-30T11:30:31.9300000' AS DateTime2), N'System', CAST(N'2021-10-30T16:18:11.2920538' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1020, N'hjh', N'hjhj', N'New', CAST(N'2021-10-30T12:09:50.1100000' AS DateTime2), N'System', CAST(N'2021-10-30T16:41:29.0936072' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1021, N'jk', N'jkjk', N'New', CAST(N'2021-10-30T12:09:55.1800000' AS DateTime2), N'System', CAST(N'2021-10-30T16:38:51.4112319' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1022, N'f', N'f', N'New', CAST(N'2021-10-30T14:53:51.8200000' AS DateTime2), N'System', CAST(N'2021-10-30T16:32:13.5692411' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1023, N'a', N'a - Progress', N'Progress', CAST(N'2021-10-30T16:43:22.3700000' AS DateTime2), N'System', CAST(N'2021-10-30T16:45:44.9701607' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1024, N'a1', N'a1 - Progress', N'Progress', CAST(N'2021-10-30T16:47:28.6800000' AS DateTime2), N'System', CAST(N'2021-10-30T16:48:24.5474669' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1025, N'a1', N'a1 - Progress', N'New', CAST(N'2021-10-30T17:26:47.6066667' AS DateTime2), N'System', CAST(N'2021-10-30T17:42:02.4353727' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1026, N'a2', N'a2 - Done', N'Done', CAST(N'2021-10-30T17:26:51.6666667' AS DateTime2), N'System', CAST(N'2021-10-30T17:27:23.8033333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1027, N'a3', N'a3', N'Progress', CAST(N'2021-10-30T17:26:56.8500000' AS DateTime2), N'System', CAST(N'2021-10-30T17:28:17.2536470' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1028, N'Implement Angular workshop', N'Implement Angular workshop', N'Progress', CAST(N'2021-10-30T17:42:34.0900000' AS DateTime2), N'System', CAST(N'2021-10-30T17:44:40.7933333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1029, N'Implement React workshop ', N'Implement React workshop ', N'Progress', CAST(N'2021-10-30T17:42:49.2233333' AS DateTime2), N'System', CAST(N'2021-10-30T17:43:57.4100000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1030, N'Unit testing for Angular', N'Unit testing for Angular', N'New', CAST(N'2021-10-30T17:43:01.2066667' AS DateTime2), N'System', CAST(N'2021-10-30T17:43:01.2066667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1031, N'Unit testing for React', N'Unit testing for React', N'New', CAST(N'2021-10-30T17:43:10.7500000' AS DateTime2), N'System', CAST(N'2021-10-30T17:43:10.7500000' AS DateTime2), N'System', 1, 0)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/30/2021 6:13:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertTask]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_InsertTask]
	@Title NVARCHAR(MAX)
	,@Description NVARCHAR(MAX)	
	,@Status NVARCHAR(100) = 'New'	
	,@CreatedBy NVARCHAR(MAX) = 'System'	
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[Tasks]
	(
		[Title]
		,[Description]
		,[Status]
		,[CreatedDate]
		,[CreatedBy]
		,[ModifiedDate]
		,[ModifiedBy]
		,[IsActive]
		,[IsDeleted]) 
	VALUES
	(
		@Title
		,@Description
		,@Status
		,GETDATE()
		,@CreatedBy
		,GETDATE()
		,@CreatedBy
		,1
		,0
	)

	SELECT @Id = @@IDENTITY
END
	
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateTask]    Script Date: 10/30/2021 6:13:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_UpdateTask]
	@Id INT
	,@Title NVARCHAR(MAX)
	,@Description NVARCHAR(MAX)
	,@Status NVARCHAR(100) = 'New'	
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[Tasks]
	SET [Title] = @Title
		,[Description] = @Description	
		,[Status] = @Status
		,[ModifiedDate] = GETDATE()
		,[ModifiedBy] = @ModifiedBy
		,[IsActive] = @IsActive
		,[IsDeleted] = @IsDeleted
	WHERE [Id] = @Id
END
GO
USE [master]
GO
ALTER DATABASE [HC_Angular_Workshop] SET  READ_WRITE 
GO
