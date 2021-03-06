USE [master]
GO

/****** Object:  Database [HC_Angular_Workshop]    Script Date: 12/11/2021 7:42:45 AM ******/
CREATE DATABASE [HC_Angular_Workshop]
GO

USE [HC_Angular_Workshop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/11/2021 7:42:45 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/11/2021 7:42:45 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2021 7:42:45 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2021 7:42:45 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[Schedules]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[Tasks]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  Table [dbo].[WsUsers]    Script Date: 12/11/2021 7:42:46 AM ******/
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87a57ec8-1662-4100-b92d-ac132020ff7a', N'asdfghjklmnbvcxzqwertyuio02')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e64bca1f-f7fb-4ed9-87ba-c7d417ab8998', N'asdfghjklmnbvcxzqwertyuio02')
INSERT [dbo].[AspNetUsers] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Role], [Token], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'87a57ec8-1662-4100-b92d-ac132020ff7a', CAST(N'2021-11-29T20:33:35.2773642' AS DateTime2), N'test', CAST(N'2021-11-29T20:33:35.2775167' AS DateTime2), N'test', NULL, NULL, N'test', N'TEST', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELph3TwCa4aL35Hn37ESa/BpQI4rQ2ArAWmCA8wyJRqUV//mf0fXBap5EjCWmvr5tA==', N'ITS2PSYERK5RR7QTEPVPBV5RAW2LOPJZ', N'4221c1dc-de2a-45a5-9433-b8fb695da6dd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Role], [Token], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e64bca1f-f7fb-4ed9-87ba-c7d417ab8998', CAST(N'2021-12-09T10:25:08.3104510' AS DateTime2), N'huy.chenhchi', CAST(N'2021-12-09T10:25:08.3106698' AS DateTime2), N'huy.chenhchi', NULL, NULL, N'huy.chenhchi', N'HUY.CHENHCHI', N'huy.chenhchi@nashtechglobal.com', N'HUY.CHENHCHI@NASHTECHGLOBAL.COM', 0, N'AQAAAAEAACcQAAAAEOp+l8pr6moZzzM/LLyCJ68L+mS6ehGh6KwTfZQTpxCbb8PxJqk/F+doK6PW7dNK6g==', N'FSQYHR7KJSHQ63DNHHKGUEMJMQDMQ5VV', N'f0ba6c7d-dcce-4aff-b70f-eef8ab86a60d', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Meeting', N'Le Cao', N'2017.3 Release Overview', N'Toorak', CAST(N'2021-11-30T19:00:00.0000000' AS DateTime2), CAST(N'2021-12-01T19:00:00.0000000' AS DateTime2), 1, CAST(N'2021-11-09T19:31:01.4266667' AS DateTime2), N'System', CAST(N'2021-12-10T21:00:34.4102139' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Meeting', N'Son Dang', N'Standup', N'Toorak', CAST(N'2021-11-09T19:30:00.0000000' AS DateTime2), CAST(N'2021-11-09T20:00:00.0000000' AS DateTime2), 2, CAST(N'2021-11-09T19:32:15.3600000' AS DateTime2), N'System', CAST(N'2021-12-10T09:51:08.1193498' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Review Code', N'Le Nguyen', N'Review Code', N'Liverpool', CAST(N'2021-11-09T20:00:00.0000000' AS DateTime2), CAST(N'2021-11-09T20:30:00.0000000' AS DateTime2), 3, CAST(N'2021-11-09T19:34:00.1333333' AS DateTime2), N'System', CAST(N'2021-12-10T10:13:48.9300127' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'Grooming', N'Nhu Nguyen', N'Grooming', N'Manchester', CAST(N'2021-11-09T21:00:00.0000000' AS DateTime2), CAST(N'2021-11-09T21:30:00.0000000' AS DateTime2), 4, CAST(N'2021-11-09T19:34:53.4800000' AS DateTime2), N'System', CAST(N'2021-12-10T10:09:18.1687095' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'Standup', N'Nhu Nguyen', N'Grooming', N'Everton', CAST(N'2021-11-09T22:30:00.0200000' AS DateTime2), CAST(N'2021-11-09T23:00:00.0000000' AS DateTime2), 4, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-12-10T10:09:18.1687126' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Interview', N'David Beckham', N'Interview', N'Manchester', CAST(N'2021-11-09T07:00:00.0000000' AS DateTime2), CAST(N'2021-11-30T08:00:00.0000000' AS DateTime2), 5, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-12-10T21:00:22.8524810' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Testing', N'Minh Tran', N'Testing', N'Manchester', CAST(N'2021-11-09T08:00:00.0000000' AS DateTime2), CAST(N'2021-11-09T09:00:00.0000000' AS DateTime2), 6, CAST(N'2021-11-09T19:35:32.0200000' AS DateTime2), N'System', CAST(N'2021-12-10T10:09:16.1984660' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (8, N'Test', N'Test', N'Test', N'Manchester', CAST(N'2021-11-21T20:15:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:45:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:08:48.0500000' AS DateTime2), N'System', CAST(N'2021-11-22T08:00:21.7171806' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (9, N'Test 1', N'Test 1', N'Test 1', N'Liverpool', CAST(N'2021-11-23T20:30:00.0000000' AS DateTime2), CAST(N'2021-11-23T20:45:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:10:49.9200000' AS DateTime2), N'System', CAST(N'2021-11-22T08:00:15.7228832' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (10, N'Test 2', N'Test 2', N'Test 2', N'Manchester', CAST(N'2021-11-21T20:12:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:12:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:13:58.6733333' AS DateTime2), N'System', CAST(N'2021-11-22T08:00:12.6089603' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (11, N'Test 3', N'Test 3', N'Test 3', N'VN', CAST(N'2021-11-21T20:30:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:50:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:14:53.2133333' AS DateTime2), N'System', CAST(N'2021-11-22T08:00:09.3694378' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (12, N'sdf', N'sdf', N'sdf', N'sdf', CAST(N'2021-11-21T20:17:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:17:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:17:27.3500000' AS DateTime2), N'System', CAST(N'2021-11-22T08:00:06.1821246' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (13, N'hj', N'ghjghj', N'ghjghj', N'ghjghj', CAST(N'2021-11-21T20:17:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:17:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:17:41.7133333' AS DateTime2), N'System', CAST(N'2021-11-22T07:59:56.3605276' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (14, N'fgh', N'ghj', N'hjk', N'dfg', CAST(N'2021-11-21T20:18:00.0000000' AS DateTime2), CAST(N'2021-11-21T20:18:00.0000000' AS DateTime2), 1, CAST(N'2021-11-21T20:18:29.2500000' AS DateTime2), N'System', CAST(N'2021-11-22T07:59:42.7782290' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (15, N'Testing', N'Mr A', N'Testing', N'Manchester', CAST(N'2021-11-22T10:00:00.0000000' AS DateTime2), CAST(N'2021-11-22T11:00:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:01:18.4200000' AS DateTime2), N'System', CAST(N'2021-12-10T21:00:31.5629909' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (16, N'A11', N'B11', N'D11', N'E', CAST(N'2021-11-22T16:00:00.0000000' AS DateTime2), CAST(N'2021-11-22T17:00:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:12:28.5900000' AS DateTime2), N'System', CAST(N'2021-11-22T08:15:08.5401328' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (17, N'B Test', N'B Test', N'B Test', N'Liverpool', CAST(N'2021-11-22T11:00:00.0000000' AS DateTime2), CAST(N'2021-11-22T12:00:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:28:32.0300000' AS DateTime2), N'System', CAST(N'2021-11-22T09:58:27.3600000' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (18, N'sdf', N'sdf', N'sdf', N'sdf', CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:59:07.0300000' AS DateTime2), N'System', CAST(N'2021-11-22T09:49:17.2687988' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (19, N'hjk', N'hjk', N'hjk', N'hjk', CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:59:25.3900000' AS DateTime2), N'System', CAST(N'2021-11-22T09:49:13.1928045' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (20, N'asd', N'asd', N'asd', N'asd', CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), CAST(N'2021-11-22T08:59:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T08:59:42.6666667' AS DateTime2), N'System', CAST(N'2021-11-22T09:49:08.3285986' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (21, N'sd', N'sd', N'sd', N'sd', CAST(N'2021-11-22T09:01:00.0000000' AS DateTime2), CAST(N'2021-11-22T09:01:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T09:01:44.3066667' AS DateTime2), N'System', CAST(N'2021-11-22T09:49:00.6797997' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (22, N'fgf', N'gfdg', N'fgdfg', N'fdgdfg', CAST(N'2021-11-22T09:02:00.0000000' AS DateTime2), CAST(N'2021-11-22T09:02:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T09:03:06.6633333' AS DateTime2), N'System', CAST(N'2021-11-22T09:47:32.8205901' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (23, N'asd23', N'asd23', N'asd23', N'asd', CAST(N'2021-11-22T23:00:00.0000000' AS DateTime2), CAST(N'2021-11-22T23:59:00.0000000' AS DateTime2), 1, CAST(N'2021-11-22T09:58:38.5633333' AS DateTime2), N'System', CAST(N'2021-11-22T09:59:18.2161032' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (24, N'hjk', N'hjkhjk', N'hjkhjk', N'hjkhjk', CAST(N'2021-11-23T08:50:00.0000000' AS DateTime2), CAST(N'2021-11-23T10:50:00.0000000' AS DateTime2), 18, CAST(N'2021-11-23T08:51:04.5500000' AS DateTime2), N'System', CAST(N'2021-11-23T08:53:08.8270018' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (25, N'jhl', N'jkl', N'jkljkl', N'jkljkl', CAST(N'2021-11-23T10:00:00.0000000' AS DateTime2), CAST(N'2021-11-23T11:45:00.0000000' AS DateTime2), 18, CAST(N'2021-11-23T08:53:31.1833333' AS DateTime2), N'System', CAST(N'2021-11-23T08:57:50.8661136' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (26, N'Duong Dai Meeting', N'Duong Dai', N'Duong Dai', N'Chelsea', CAST(N'2021-11-23T11:00:00.0000000' AS DateTime2), CAST(N'2021-11-23T11:30:00.0000000' AS DateTime2), 16, CAST(N'2021-11-23T08:54:32.8466667' AS DateTime2), N'System', CAST(N'2021-12-10T10:08:59.1780957' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (27, N'Binh Le Title', N'Binh Le', N'Binh Le Description', N'Any where', CAST(N'2021-11-23T20:00:00.0000000' AS DateTime2), CAST(N'2021-11-23T21:00:00.0000000' AS DateTime2), 10, CAST(N'2021-11-23T08:55:28.0766667' AS DateTime2), N'System', CAST(N'2021-11-23T08:55:44.9658078' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (28, N'dfg', N'dfg', N'dfg', N'dfg', CAST(N'2021-11-23T08:55:00.0000000' AS DateTime2), CAST(N'2021-11-23T08:55:00.0000000' AS DateTime2), 10, CAST(N'2021-11-23T08:55:52.0533333' AS DateTime2), N'System', CAST(N'2021-12-10T10:08:54.4829864' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (29, N'ghj', N'ghj', N'ghj', N'ghjghj', CAST(N'2021-11-23T08:57:00.0000000' AS DateTime2), CAST(N'2021-11-23T08:57:00.0000000' AS DateTime2), 18, CAST(N'2021-11-23T08:57:58.8300000' AS DateTime2), N'System', CAST(N'2021-11-26T20:31:09.6042964' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (30, N'Interview', N'son Dang', N'Interview', N'My Dinh', CAST(N'2021-11-23T14:00:00.0000000' AS DateTime2), CAST(N'2021-11-23T16:00:00.0000000' AS DateTime2), 2, CAST(N'2021-11-23T08:58:52.7433333' AS DateTime2), N'System', CAST(N'2021-12-10T09:51:09.9411176' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (31, N'a1', N'a1', N'a1', N'a', CAST(N'2021-11-23T09:15:00.0000000' AS DateTime2), CAST(N'2021-11-23T09:15:00.0000000' AS DateTime2), 19, CAST(N'2021-11-23T09:15:40.4933333' AS DateTime2), N'System', CAST(N'2021-12-10T10:07:04.0357776' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (32, N'Test 1', N'Huy Chenh', N'Test 1', N'VN', CAST(N'2021-11-26T21:00:00.0000000' AS DateTime2), CAST(N'2021-11-26T22:30:00.0000000' AS DateTime2), 18, CAST(N'2021-11-26T20:27:58.6533333' AS DateTime2), N'System', CAST(N'2021-12-10T10:06:33.3683267' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (33, N'Test 3', N'Huy Chenh', N'Test 3', N'Manchester', CAST(N'2021-11-26T21:00:00.0000000' AS DateTime2), CAST(N'2021-11-26T23:00:00.0000000' AS DateTime2), 18, CAST(N'2021-11-26T20:28:53.1266667' AS DateTime2), N'System', CAST(N'2021-11-26T20:31:06.4201130' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (34, N'Test 2', N'Huy Chenh', N'Test 2', N'Liverpool', CAST(N'2021-11-26T21:00:00.0000000' AS DateTime2), CAST(N'2021-11-26T22:30:00.0000000' AS DateTime2), 18, CAST(N'2021-11-26T20:30:31.0966667' AS DateTime2), N'System', CAST(N'2021-11-26T20:31:00.6533861' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (35, N'Daily Meeting', N'huy.chenhchi', N'Daily Meeting', N'Liverpool', CAST(N'2021-12-10T10:00:00.0000000' AS DateTime2), CAST(N'2021-12-10T11:00:00.0000000' AS DateTime2), 23, CAST(N'2021-12-10T08:01:43.5933333' AS DateTime2), N'System', CAST(N'2021-12-10T10:05:54.0931152' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (36, N'Daily Meeting', N'Huy Chenh', N'Daily Meeting', N'Liverpool', CAST(N'2021-12-10T11:00:00.0000000' AS DateTime2), CAST(N'2021-12-10T12:00:00.0000000' AS DateTime2), 28, CAST(N'2021-12-10T10:10:58.7666667' AS DateTime2), N'huy.chenhchi', CAST(N'2021-12-10T10:13:30.7996983' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (37, N'Interview', N'Huy Chenh', N'Interview', N'Manchester', CAST(N'2021-12-10T13:00:00.0000000' AS DateTime2), CAST(N'2021-12-10T15:00:00.0000000' AS DateTime2), 28, CAST(N'2021-12-10T10:11:47.9933333' AS DateTime2), N'huy.chenhchi', CAST(N'2021-12-10T21:00:29.4922245' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (38, N'Grooming', N'Nam Cao', N'Grooming', N'Liverpool', CAST(N'2021-12-10T15:00:00.0000000' AS DateTime2), CAST(N'2021-12-10T17:00:00.0000000' AS DateTime2), 1, CAST(N'2021-12-10T10:17:18.1666667' AS DateTime2), N'test', CAST(N'2021-12-10T21:00:27.1878111' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (39, N'Schedule 1 - Duong Dai', N'', N'Schedule 1 - Duong Dai', N'My Dinh', CAST(N'2021-12-10T21:30:00.0000000' AS DateTime2), CAST(N'2021-12-10T21:50:00.0000000' AS DateTime2), 16, CAST(N'2021-12-10T21:09:29.7066667' AS DateTime2), N'test', CAST(N'2021-12-10T21:18:24.7643253' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (40, N'Schedule Duong', N'', N'Schedule Duong', N'Ha Long', CAST(N'2021-12-10T21:30:00.0000000' AS DateTime2), CAST(N'2021-12-10T21:50:00.0000000' AS DateTime2), 16, CAST(N'2021-12-10T21:18:58.9700000' AS DateTime2), N'test', CAST(N'2021-12-10T21:20:38.1445932' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (41, N'Schedule 1 - Le Cao', N'B Le', N'Schedule 1 - Le Cao - B Le', N'Ha Noi', CAST(N'2021-12-10T21:20:00.0000000' AS DateTime2), CAST(N'2021-12-10T21:20:00.0000000' AS DateTime2), 10, CAST(N'2021-12-10T21:21:08.9700000' AS DateTime2), N'test', CAST(N'2021-12-11T06:50:07.3266667' AS DateTime2), N'test', 1, 0)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (42, N'Schedule Duong Dai', N'Duong Dai', N'Schedule Duong Dai - ', N'Ha Noi', CAST(N'2021-12-11T08:00:00.0000000' AS DateTime2), CAST(N'2021-12-11T09:30:00.0000000' AS DateTime2), 16, CAST(N'2021-12-11T06:50:45.6900000' AS DateTime2), N'test', CAST(N'2021-12-11T06:51:53.5610473' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (43, N'Grooming', N'CR7', N'Grooming', N'Madrid', CAST(N'2021-12-11T08:30:00.0000000' AS DateTime2), CAST(N'2021-12-11T10:30:00.0000000' AS DateTime2), 29, CAST(N'2021-12-11T07:21:13.5833333' AS DateTime2), N'test', CAST(N'2021-12-11T07:21:36.0200000' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[Schedules] ([Id], [Title], [Creator], [Description], [Location], [TimeStart], [TimeEnd], [WsUserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (44, N'Interview', N'CR7', N'Interview', N'London', CAST(N'2021-12-11T09:00:00.0000000' AS DateTime2), CAST(N'2021-12-11T10:00:00.0000000' AS DateTime2), 29, CAST(N'2021-12-11T07:22:11.5366667' AS DateTime2), N'test', CAST(N'2021-12-11T07:22:47.7176319' AS DateTime2), N'test', 0, 1)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Create Task 1', N'Create Task 1', N'New', CAST(N'2021-11-09T19:49:32.5766667' AS DateTime2), N'System', CAST(N'2021-11-09T19:49:32.5766667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Doodle Jump', N'Doodle Jump', N'Progress', CAST(N'2021-11-09T19:51:34.8266667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:01.7133333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Scabble3D', N'Scabble3D', N'Progress', CAST(N'2021-11-09T19:51:46.7066667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:19.7733333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'New Task 2022', N'New Task 2022', N'Progress', CAST(N'2021-11-09T19:51:55.6266667' AS DateTime2), N'System', CAST(N'2021-12-11T07:15:11.5700000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'ACE Online Done', N'ACE Online Done', N'Done', CAST(N'2021-11-09T19:52:06.8300000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:34.7966667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Scabble3D', N'Scabble3D', N'Done', CAST(N'2021-11-09T19:52:28.0200000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:41.6700000' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Relic Hunters Zero', N'Relic Hunters Zero', N'Done', CAST(N'2021-11-09T19:52:40.2900000' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:47.0866667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (8, N'Story', N'Story', N'Done', CAST(N'2021-11-09T19:52:47.0466667' AS DateTime2), N'System', CAST(N'2021-11-09T19:53:53.6033333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (36, N'Task 1', N'Task 1 - Progress - Done', N'Done', CAST(N'2021-12-11T07:13:39.9566667' AS DateTime2), N'System', CAST(N'2021-12-11T07:14:07.7166667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (37, N'Task 2', N'Task 2 - New', N'New', CAST(N'2021-12-11T07:14:24.8300000' AS DateTime2), N'System', CAST(N'2021-12-11T07:14:38.8973470' AS DateTime2), N'System', 0, 1)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[WsUsers] ON 

INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (1, N'Le Cao', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (2, N'Son Dang', N'PM', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-12-10T09:50:57.6048272' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (3, N'Le Nguyen', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-12-10T10:13:48.9162837' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (4, N'Nhu Nguyen', N'QC', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-12-10T10:09:18.1520768' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (5, N'David Beckham', N'Developer', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:55.3153488' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (6, N'Minh Tran', N'QC', CAST(N'2021-11-09T19:23:35.7533333' AS DateTime2), N'System', CAST(N'2021-12-10T10:09:16.1427652' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (7, N'Anh Le Xuan', N'QC', CAST(N'2021-11-14T19:21:27.0100000' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:50.4614886' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (8, N'Nam Luu', N'Developer', CAST(N'2021-11-14T19:25:20.0766667' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:44.9203702' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (9, N'Huy Chenh', N'Developer', CAST(N'2021-11-14T19:28:28.1266667' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:47.3794437' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (10, N'B Le', N'QC', CAST(N'2021-11-14T19:33:44.4266667' AS DateTime2), N'System', CAST(N'2021-11-14T19:33:44.4266667' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (11, N'C Nguyen', N'Dev', CAST(N'2021-11-14T19:35:31.3866667' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:38.0594267' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (12, N'D Nguyen', N'QC', CAST(N'2021-11-14T19:37:56.1100000' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:40.8797098' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (13, N'E Le', N'Developer', CAST(N'2021-11-14T19:38:27.9300000' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:02.4560933' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (14, N'End Game', N'QC', CAST(N'2021-11-14T19:44:14.7500000' AS DateTime2), N'System', CAST(N'2021-11-15T19:45:23.4473339' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (15, N'A', N'Nguyen', CAST(N'2021-11-15T19:46:19.3233333' AS DateTime2), N'System', CAST(N'2021-11-15T19:46:31.5461061' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (16, N'Duong Dai', N'Developer', CAST(N'2021-11-15T19:52:53.0366667' AS DateTime2), N'System', CAST(N'2021-11-15T20:40:45.5233333' AS DateTime2), N'System', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (17, N'Anh Cao', N'Developer', CAST(N'2021-11-15T20:30:31.9400000' AS DateTime2), N'System', CAST(N'2021-11-15T20:39:37.6625599' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (18, N'A Le B', N'Developer', CAST(N'2021-11-16T20:00:00.3300000' AS DateTime2), N'System', CAST(N'2021-12-10T09:10:27.1989134' AS DateTime2), N'huy.chenhchi', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (19, N'a1', N'a1', CAST(N'2021-11-23T09:15:29.3566667' AS DateTime2), N'System', CAST(N'2021-11-23T09:16:22.6015728' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (20, N'test', N'test', CAST(N'2021-11-26T11:20:49.1366667' AS DateTime2), N'System', CAST(N'2021-11-26T11:36:04.4841055' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (21, N'Test01', N'Test01', CAST(N'2021-11-26T11:38:04.5800000' AS DateTime2), N'System', CAST(N'2021-11-26T11:38:56.2417377' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (22, N'A Test1', N'QC 1', CAST(N'2021-11-26T11:42:34.0300000' AS DateTime2), N'System', CAST(N'2021-11-26T11:49:41.8258289' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (23, N'Phuong Nguyen Cong', N'Developer', CAST(N'2021-12-10T07:59:30.7700000' AS DateTime2), N'System', CAST(N'2021-12-10T08:02:15.9245029' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (24, N'a', N'Developer', CAST(N'2021-12-10T08:24:54.7000000' AS DateTime2), N'System', CAST(N'2021-12-10T08:25:02.1140548' AS DateTime2), N'', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (25, N'B', N'Developer', CAST(N'2021-12-10T08:31:59.8333333' AS DateTime2), N'System', CAST(N'2021-12-10T08:32:05.2289102' AS DateTime2), N'', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (26, N'C', N'QC', CAST(N'2021-12-10T08:37:38.5566667' AS DateTime2), N'System', CAST(N'2021-12-10T08:38:08.6293616' AS DateTime2), N'System', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (27, N'Huy Test - Test updated', N'QC', CAST(N'2021-12-10T09:33:14.1500000' AS DateTime2), N'huy.chenhchi', CAST(N'2021-12-10T09:34:26.1737690' AS DateTime2), N'test', 0, 1)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (28, N'E Nguyen Le', N'Developer', CAST(N'2021-12-10T10:09:43.5433333' AS DateTime2), N'huy.chenhchi', CAST(N'2021-12-10T10:09:43.5433333' AS DateTime2), N'huy.chenhchi', 1, 0)
INSERT [dbo].[WsUsers] ([Id], [Fullname], [JobRole], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive], [IsDeleted]) VALUES (29, N'CR7', N'PM', CAST(N'2021-12-11T07:19:16.1600000' AS DateTime2), N'test', CAST(N'2021-12-11T07:22:47.5056973' AS DateTime2), N'test', 0, 1)
SET IDENTITY_INSERT [dbo].[WsUsers] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/11/2021 7:42:46 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsertSchedule]    Script Date: 12/11/2021 7:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_InsertSchedule]	
	@Title NVARCHAR(MAX)
	,@Creator NVARCHAR(MAX)
	,@Description NVARCHAR(MAX) 
	,@Location NVARCHAR(MAX)
	,@TimeStart DATETIME
	,@TimeEnd DATETIME
	,@WsUserId INT	
	,@CreatedBy NVARCHAR(MAX) = 'System'
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[Schedules]
	(
      [Title]
      ,[Creator]
      ,[Description]
      ,[Location]
      ,[TimeStart]
      ,[TimeEnd]
      ,[WsUserId]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[IsActive]
      ,[IsDeleted]
	) 
	VALUES
	(
		@Title
		,@Creator
		,@Description
		,@Location
		,@TimeStart
		,@TimeEnd
		,@WsUserId
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
/****** Object:  StoredProcedure [dbo].[Usp_InsertTask]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsertUser]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_UpdateSchedule]    Script Date: 12/11/2021 7:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_UpdateSchedule]
	@Id INT
	,@Title NVARCHAR(MAX)
	,@Creator NVARCHAR(MAX)
	,@Description NVARCHAR(MAX) 
	,@Location NVARCHAR(MAX)
	,@TimeStart DATETIME
	,@TimeEnd DATETIME
	,@WsUserId INT
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[Schedules]
	SET [Title] = @Title
		,[Creator] = @Creator
		,[Description] = @Description
		,[Location] = @Location
		,[TimeStart] = @TimeStart
		,[TimeEnd] = @TimeEnd
		,[WsUserId] = @WsUserId
		,[ModifiedDate] = GETDATE()
		,[ModifiedBy] = @ModifiedBy
		,[IsActive] = @IsActive
		,[IsDeleted] = @IsDeleted
	WHERE [Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateTask]    Script Date: 12/11/2021 7:42:46 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_UpdateUser]    Script Date: 12/11/2021 7:42:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_UpdateUser]
	@Id INT
	,@FullName NVARCHAR(MAX)
	,@JobRole NVARCHAR(MAX)	
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[WsUsers]
	SET [Fullname] = @FullName
		,[JobRole] = @JobRole
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
