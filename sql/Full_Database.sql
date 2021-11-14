USE [master]
GO
/****** Object:  Database [HC_Angular_Workshop]    Script Date: 11/14/2021 8:02:48 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[Schedules]    Script Date: 11/14/2021 8:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Creator] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[TimeStart] [datetime2](7) NOT NULL,
	[TimeEnd] [datetime2](7) NOT NULL,
	[WsUserId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  Table [dbo].[WsUsers]    Script Date: 11/14/2021 8:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WsUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[JobRole] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WsUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211110043535_Construction', N'5.0.11')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'asdfghjklmnbvcxzqwertyuio01', N'SuperUser', N'SuperUser', N'f0c091db-7b5c-4ae0-8804-22611e35f92b')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'asdfghjklmnbvcxzqwertyuio02', N'User', N'User', N'5312e505-0b57-4c37-a896-7117260a0aef')
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Meeting', N'Le Cao', N'2017.3 Release Overview', N'Toorak', CAST(N'2021-11-09T19:31:01.4266667' AS DateTime2), CAST(N'2021-11-09T19:31:01.4266667' AS DateTime2), 1, CAST(N'2021-11-09T19:31:01.4266667' AS DateTime2), N'System', CAST(N'2021-11-09T19:31:01.4266667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Meeting', N'Son Dang', N'Standup', N'Toorak', CAST(N'2021-11-09T19:32:15.3600000' AS DateTime2), CAST(N'2021-11-09T19:32:15.3600000' AS DateTime2), 2, CAST(N'2021-11-09T19:32:15.3600000' AS DateTime2), N'System', CAST(N'2021-11-09T19:32:15.3600000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Review Code', N'Le Nguyen', N'Review Code', N'Liverpool', CAST(N'2021-11-09T19:34:00.1333333' AS DateTime2), CAST(N'2021-11-09T19:34:00.1333333' AS DateTime2), 3, CAST(N'2021-11-09T19:34:00.1333333' AS DateTime2), N'System', CAST(N'2021-11-09T19:34:00.1333333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'Grooming', N'Nhu Nguyen', N'Grooming', N'Manchester', CAST(N'2021-11-09T19:34:53.4800000' AS DateTime2), CAST(N'2021-11-09T19:34:53.4800000' AS DateTime2), 4, CAST(N'2021-11-09T19:34:53.4800000' AS DateTime2), N'System', CAST(N'2021-11-09T19:34:53.4800000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'Standup', N'Nhu Nguyen', N'Grooming', N'Everton', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), 4, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Interview', N'David Beckham', N'Interview', N'Manchester', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), 5, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Testing', N'Minh Tran', N'Testing', N'Manchester', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), 6, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', 1, 0)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Create Task 1', N'Create Task 1', N'New', CAST(N'2021-11-09T19:49:32.5766667' AS DateTime2), N'System', CAST(N'2021-11-09T19:49:32.5766667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Doodle Jump', N'Doodle Jump', N'Progress', CAST(N'2021-11-09T19:51:34.8266667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:01.7133333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Scabble3D', N'Scabble3D', N'Progress', CAST(N'2021-11-09T19:51:46.7066667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:19.7733333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'New Task 1', N'New Task 1', N'Progress', CAST(N'2021-11-09T19:51:55.6266667' AS DateTime2), N'System', CAST(N'2021-11-09T19:54:05.5300000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'ACE Online Done', N'ACE Online Done', N'Done', CAST(N'2021-11-09T19:52:06.8300000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:34.7966667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Scabble3D', N'Scabble3D', N'Done', CAST(N'2021-11-09T19:52:28.0200000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:41.6700000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Relic Hunters Zero', N'Relic Hunters Zero', N'Done', CAST(N'2021-11-09T19:52:40.2900000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:47.0866667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (8, N'Story', N'Story', N'Done', CAST(N'2021-11-09T19:52:47.0466667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:53.6033333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (9, N'New a', N'New a', N'New', CAST(N'2021-11-14T16:26:29.1800000' AS DateTime2), N'System', CAST(N'2021-11-14T16:26:29.1800000' AS DateTime2), N'System', 1, 0)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[WsUsers] ON 

INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Le Cao', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Son Dang', N'PM', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Le Nguyen', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'Nhu Nguyen', N'QC', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'David Beckham', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Minh Tran', N'QC', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Anh Le Xuan', N'QC', CAST(N'2021-11-14T19:21:27.0100000' AS DateTime2), N'System', CAST(N'2021-11-14T19:21:27.0100000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (8, N'Nam Luu', N'Developer', CAST(N'2021-11-14T19:25:20.0766667' AS DateTime2), N'System', CAST(N'2021-11-14T19:25:20.0766667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (9, N'Huy Chenh', N'Developer', CAST(N'2021-11-14T19:28:28.1266667' AS DateTime2), N'System', CAST(N'2021-11-14T19:28:28.1266667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (10, N'B Le', N'QC', CAST(N'2021-11-14T19:33:44.4266667' AS DateTime2), N'System', CAST(N'2021-11-14T19:33:44.4266667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (11, N'C Nguyen', N'Dev', CAST(N'2021-11-14T19:35:31.3866667' AS DateTime2), N'System', CAST(N'2021-11-14T19:35:31.3866667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (12, N'D Nguyen', N'QC', CAST(N'2021-11-14T19:37:56.1100000' AS DateTime2), N'System', CAST(N'2021-11-14T19:37:56.1100000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (13, N'E Le', N'Developer', CAST(N'2021-11-14T19:38:27.9300000' AS DateTime2), N'System', CAST(N'2021-11-14T19:38:27.9300000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (14, N'End Game', N'QC', CAST(N'2021-11-14T19:44:14.7500000' AS DateTime2), N'System', CAST(N'2021-11-14T19:44:14.7500000' AS DateTime2), N'System', 1, 0)
SET IDENTITY_INSERT [dbo].[WsUsers] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/14/2021 8:02:49 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsertTask]    Script Date: 11/14/2021 8:02:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsertUser]    Script Date: 11/14/2021 8:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_InsertUser]
	@FullName NVARCHAR(MAX)
	,@JobRole NVARCHAR(MAX)
	,@CreatedBy NVARCHAR(MAX) = 'System'
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[WsUsers]
	(
		[FullName]
		,[JobRole]		
		,[CreatedDate]
		,[CreatedBy]
		,[ModifiedDate]
		,[ModifiedBy]
		,[IsActive]
		,[IsDeleted]
	) 
	VALUES
	(
		@FullName
		,@JobRole		
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
/****** Object:  StoredProcedure [dbo].[Usp_UpdateTask]    Script Date: 11/14/2021 8:02:49 PM ******/
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
