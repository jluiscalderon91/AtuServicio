/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2269)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [AtuServicioDB]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE DATABASE [AtuServicioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AtuServicioDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AtuServicioDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AtuServicioDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AtuServicioDB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AtuServicioDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AtuServicioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AtuServicioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AtuServicioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AtuServicioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AtuServicioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AtuServicioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AtuServicioDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AtuServicioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AtuServicioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AtuServicioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AtuServicioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AtuServicioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AtuServicioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AtuServicioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AtuServicioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AtuServicioDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AtuServicioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AtuServicioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AtuServicioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AtuServicioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AtuServicioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AtuServicioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AtuServicioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AtuServicioDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AtuServicioDB] SET  MULTI_USER 
GO
ALTER DATABASE [AtuServicioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AtuServicioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AtuServicioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AtuServicioDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AtuServicioDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AtuServicioDB]
GO
/****** Object:  Schema [Cliente]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [Cliente]
GO
/****** Object:  Schema [ControlPanel]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [ControlPanel]
GO
/****** Object:  Schema [Payment]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [Payment]
GO
/****** Object:  Schema [Proveedor]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [Proveedor]
GO
/****** Object:  Schema [Requirement]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [Requirement]
GO
/****** Object:  Schema [Service]    Script Date: 19/11/2019 1:56:45 p. m. ******/
CREATE SCHEMA [Service]
GO
/****** Object:  Table [Cliente].[Customer]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cliente].[Customer](
	[iCustomer_Id] [int] IDENTITY(1,1) NOT NULL,
	[iUserid] [int] NOT NULL,
	[iTypeCustomerid] [int] NOT NULL,
	[vCode] [varchar](50) NULL,
	[vName] [varchar](300) NULL,
	[vAddress] [varchar](200) NULL,
	[vEmail] [varchar](100) NULL,
	[iDocumentTypeid] [int] NOT NULL,
	[vDocumentNumber] [varchar](100) NULL,
	[vPhone] [varchar](100) NULL,
	[vCellPhone] [varchar](10) NULL,
	[Foto] [varbinary](max) NULL,
	[iQualification] [int] NULL,
	[iStatus] [int] NOT NULL,
	[iInsertUser_Id] [int] NOT NULL,
	[dInsertDate] [datetime] NOT NULL,
	[iUpdateUser_Id] [int] NULL,
	[dUpdateDate] [datetime] NULL,
	[bDisponibility] [bit] NOT NULL,
	[vContacto] [varchar](1000) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[iCustomer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[permission]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[permission](
	[iPermissionid] [int] IDENTITY(1,1) NOT NULL,
	[vName] [nvarchar](256) NULL,
	[vNormalizedname] [nvarchar](max) NULL,
	[iCategory] [int] NULL,
	[iReferenceid] [int] NULL,
	[iOrder] [int] NULL,
	[vValue] [nvarchar](max) NULL,
	[vDescription] [nvarchar](256) NULL,
	[vConcurrencystamp] [nvarchar](max) NULL,
	[iApptype] [int] NOT NULL,
	[iInsertuserid] [int] NOT NULL,
	[dInsertdate] [datetime2](7) NOT NULL,
	[vInsertip] [nvarchar](max) NULL,
	[iUpdateuserid] [int] NULL,
	[dUpdatedate] [datetime2](7) NULL,
	[vUpdateip] [nvarchar](max) NULL,
 CONSTRAINT [PK_permission] PRIMARY KEY CLUSTERED 
(
	[iPermissionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[role]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[role](
	[iRoleid] [int] IDENTITY(1,1) NOT NULL,
	[vName] [nvarchar](256) NOT NULL,
	[vNormalizedname] [nvarchar](256) NULL,
	[vConcurrencystamp] [nvarchar](max) NULL,
	[iApptype] [int] NOT NULL,
	[iInsertuserid] [int] NOT NULL,
	[dInsertdate] [datetime2](7) NOT NULL,
	[vInsertip] [nvarchar](max) NULL,
	[iUpdateuserid] [int] NULL,
	[dUpdatedate] [datetime2](7) NULL,
	[vUpdateip] [nvarchar](max) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[iRoleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[RolePermissions]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[RolePermissions](
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[systemparameter]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[systemparameter](
	[iParameter_id] [int] NOT NULL,
	[iGroupid] [int] NOT NULL,
	[vDescription] [nvarchar](max) NULL,
	[vCode] [nvarchar](max) NULL,
	[vValue] [nvarchar](max) NULL,
	[iReferenceid] [int] NULL,
	[iOrder] [int] NULL,
	[bVisible] [bit] NOT NULL,
	[iStatus] [int] NOT NULL,
	[iInsertuserid] [int] NOT NULL,
	[dInsertdate] [datetime2](7) NOT NULL,
	[vInsertip] [nvarchar](max) NULL,
	[iUpdateuserid] [int] NULL,
	[dUpdatedate] [datetime2](7) NULL,
	[vUpdateip] [nvarchar](max) NULL,
 CONSTRAINT [PK_systemparameter] PRIMARY KEY CLUSTERED 
(
	[iParameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[user]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[user](
	[iUserid] [int] IDENTITY(1,1) NOT NULL,
	[vName] [nvarchar](max) NULL,
	[vSurname] [nvarchar](max) NULL,
	[vUsername] [nvarchar](256) NOT NULL,
	[vPassword] [nvarchar](256) NULL,
	[vEmail] [nvarchar](200) NULL,
	[vNormalizedusername] [nvarchar](256) NULL,
	[vSecuritystamp] [nvarchar](max) NULL,
	[vConcurrencystamp] [nvarchar](max) NULL,
	[iApptype] [int] NOT NULL,
	[bPasswordchange] [bit] NOT NULL,
	[iStatus] [int] NOT NULL,
	[iInsertuserid] [int] NOT NULL,
	[dInsertdate] [datetime2](7) NOT NULL,
	[vInsertip] [nvarchar](1) NULL,
	[iUpdateuserid] [int] NULL,
	[dUpdatedate] [datetime2](7) NULL,
	[vUpdateip] [nvarchar](max) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[iUserid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[UserLogin]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[UserLogin](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[ProviderId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ControlPanel].[userrole]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ControlPanel].[userrole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[iuserroleid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_userrole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Payment].[Payment]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Payment].[Payment](
	[iPayment_Id] [int] IDENTITY(1,1) NOT NULL,
	[iRequirement_Id] [int] NOT NULL,
	[vPaymentCode] [varchar](20) NULL,
	[dPaymentDate] [datetime] NULL,
	[mPriceSale] [decimal](18, 2) NOT NULL,
	[iPaymentType] [int] NULL,
	[vTransaction] [varchar](100) NULL,
	[iInsertUser_Id] [int] NOT NULL,
	[dInsertDate] [datetime] NOT NULL,
	[iUpdateUser_Id] [int] NULL,
	[dUpdateDate] [datetime] NULL,
	[iStatus] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[iPayment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Requirement].[Requirement]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Requirement].[Requirement](
	[iRequirement_Id] [int] IDENTITY(1,1) NOT NULL,
	[iService_Id] [int] NULL,
	[vRequirementCode] [varchar](20) NULL,
	[dRequestDate] [datetime] NULL,
	[vAddressFrom] [varchar](200) NULL,
	[vAddressDelivery] [varchar](200) NULL,
	[vDetalle] [varchar](500) NULL,
	[iInsertUser_Id] [int] NOT NULL,
	[dInsertDate] [datetime] NOT NULL,
	[iUpdateUser_Id] [int] NULL,
	[dUpdateDate] [datetime] NULL,
	[iStatus] [int] NOT NULL,
 CONSTRAINT [PK_Requirement] PRIMARY KEY CLUSTERED 
(
	[iRequirement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[Comments]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[Comments](
	[iComments_Id] [int] IDENTITY(1,1) NOT NULL,
	[iService_Id] [int] NOT NULL,
	[vComments] [varchar](max) NULL,
	[iStatus] [int] NOT NULL,
	[iInsertuser_id] [int] NOT NULL,
	[dInsertdate] [datetime] NOT NULL,
	[iUpdateuser_id] [int] NULL,
	[dUpdatedate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[iComments_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Service].[Service]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[Service](
	[iService_Id] [int] IDENTITY(1,1) NOT NULL,
	[iCustomer_Id] [int] NOT NULL,
	[iCategoryid] [int] NOT NULL,
	[vCode] [varchar](50) NOT NULL,
	[vName] [varchar](100) NOT NULL,
	[vDescription] [varchar](max) NULL,
	[mPriceSale] [decimal](18, 2) NOT NULL,
	[vPathAttachment] [varchar](200) NULL,
	[iQualification] [int] NULL,
	[iInsertUser_Id] [int] NOT NULL,
	[dInsertDate] [datetime] NOT NULL,
	[iUpdateUser_Id] [int] NULL,
	[dUpdateDate] [datetime] NULL,
	[iStatus] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[iService_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [Cliente].[Customer] ON 
GO
INSERT [Cliente].[Customer] ([iCustomer_Id], [iUserid], [iTypeCustomerid], [vCode], [vName], [vAddress], [vEmail], [iDocumentTypeid], [vDocumentNumber], [vPhone], [vCellPhone], [Foto], [iQualification], [iStatus], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [bDisponibility], [vContacto]) VALUES (2, 5, 112, N'111870320040817844146', N'JOSE LUIS CALDERON', N'DSFSDFSDFSF', N'CHINOSURF.20@GMAIL.COM', 121, N'234234324', N'234234', N'234234234', NULL, NULL, 1, 5, CAST(N'2019-10-18T22:42:08.157' AS DateTime), NULL, NULL, 0, N'')
GO
INSERT [Cliente].[Customer] ([iCustomer_Id], [iUserid], [iTypeCustomerid], [vCode], [vName], [vAddress], [vEmail], [iDocumentTypeid], [vDocumentNumber], [vPhone], [vCellPhone], [Foto], [iQualification], [iStatus], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [bDisponibility], [vContacto]) VALUES (41, 44, 113, N'10218693341103155', N'JOSE LUIS C. JIMENEZ', N'JR. ACUARIO 925', N'SOPORTESSSDEPERU@GMAIL.COM', 121, N'234324324', N'994221027', N'', NULL, NULL, 1, 44, CAST(N'2019-10-21T20:31:58.453' AS DateTime), NULL, NULL, 0, N'')
GO
SET IDENTITY_INSERT [Cliente].[Customer] OFF
GO
SET IDENTITY_INSERT [ControlPanel].[permission] ON 
GO
INSERT [ControlPanel].[permission] ([iPermissionid], [vName], [vNormalizedname], [iCategory], [iReferenceid], [iOrder], [vValue], [vDescription], [vConcurrencystamp], [iApptype], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (1, N'MENU DE TIPOS SERVICIOS', N'MENU DE TIPOS SERVICIOS', NULL, NULL, 1, N'~/Customer/Index', NULL, NULL, 101, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [ControlPanel].[permission] OFF
GO
SET IDENTITY_INSERT [ControlPanel].[role] ON 
GO
INSERT [ControlPanel].[role] ([iRoleid], [vName], [vNormalizedname], [vConcurrencystamp], [iApptype], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (111, N'ADMINISTRATOR', NULL, NULL, 101, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[role] ([iRoleid], [vName], [vNormalizedname], [vConcurrencystamp], [iApptype], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (112, N'CLIENTE', NULL, NULL, 101, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[role] ([iRoleid], [vName], [vNormalizedname], [vConcurrencystamp], [iApptype], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (113, N'PROVEEDOR DE SERVICIO', NULL, NULL, 101, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [ControlPanel].[role] OFF
GO
INSERT [ControlPanel].[RolePermissions] ([RoleId], [PermissionId]) VALUES (111, 1)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (100, 0, N'TIPO DE APLICACION', N'APP_GROUP', N'APP_GROUP', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (101, 100, N'APLICACION WEB', N'WEB', N'WEB', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (102, 100, N'APLICACION MOVIL', N'MOVILE', N'MOVILE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (103, 100, N'SERVICIOS WEB', N'SERVICES', N'SERVICES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (110, 0, N'TIPOS DE USUARIOS', N'USER_TYPE', N'USER_TYPE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (111, 110, N'CLIENTE', N'CLIENT', N'CLIENT', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (112, 110, N'PROVEEDOR DE SERVICIO', N'SERVICE_PROVIDER', N'SERVICE_PROVIDER', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (113, 110, N'ADMINISTRADOR', N'ADMINISTRATOR', N'ADMINISTRATOR', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (120, 0, N'TIPO DE DOCUMENTO', N'TYPE_DOCUMENT', N'TYPE_DOCUMENT', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (121, 120, N'DNI', N'DOCUMENTO_NACIONAL_DE_IDENTIDAD', N'DOCUMENTO_NACIONAL_DE_IDENTIDAD', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (122, 120, N'CARNET DE ESTRANJERIA', N'CARNET_DE_EXTRANJERIA', N'CARNET_DE_EXTRANJERIA', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (123, 120, N'RUC', N'REGISTRO_UNICO_DE_CONTRIBUYENTES', N'REGISTRO_UNICO_DE_CONTRIBUYENTES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (124, 120, N'PASAPORTE', N'PASAPORTE', N'PASAPORTE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (130, 0, N'TIPO DE AUTENTICACION', N'TYPE_AUTENTICATION', N'TYPE_AUTENTICATION', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (131, 130, N'APLICACION', N'APLICATION', N'APLICATION', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (132, 130, N'GOOGLE CHROME', N'GOOGLE_CHROME', N'GOOGLE_CHROME', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (133, 130, N'FACEBOOK', N'FACEBOOK', N'FACEBOOK', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (200, 0, N'CATEGORIAS DE SERVICIOS', N'SERVICE_CATEGORY', N'SERVICE_CATEGORY', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (201, 200, N'SERVICIOS PARA EL HOGAR', N'HOME_SERVICE', N'HOME_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (202, 200, N'SERVICIOS DE CARPINTERIA Y MELAMINA', N'CARPENTER_MELAMINE_SERVICE', N'CARPENTER_MELAMINE_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (203, 200, N'SERVICIOS DE CATERING', N'CATERING_SERVICE', N'CATERING_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (204, 200, N'SERVICIOS DE CERRAJERIA', N'LOCKSHOP_SERVICE', N'LOCKSHOP_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (205, 200, N'SERVICIOS DE ALBAÑILERIA Y CONTRUCCION', N'CONSTRUCTION_SERVICE', N'CONSTRUCTION_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (206, 200, N'SERVICIOS ELECTRICOS', N'ELECTRICAL_SERVICE', N'ELECTRICAL_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (207, 200, N'SERVICIOS DE ORGANIZACION DE EVENTOS', N'EVENT_PLANNER_SERVICE', N'EVENT_PLANNER_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (208, 200, N'SERVICIOS DE GASFITERIA', N'GASFITERIA_SERVICE', N'GASFITERIA_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (209, 200, N'SERVICIOS DE REMOLQUES Y GRUAS', N'TRAILERS_CRANES_SERVICES', N'TRAILERS_CRANES_SERVICES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (210, 200, N'SERVICIOS DE GARDINERIA', N'GARDENING_SERVICE', N'GARDENING_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (211, 200, N'SERVICIOS DE BELLEZA, ESTÉTICA Y OTROS ', N'BEAUTY_AESTHETIC_OTHER_SERVICES', N'BEAUTY_AESTHETIC_OTHER_SERVICES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (212, 200, N'SERVICIOS MECANICOS Y AUTOMOTRIZ ', N'MECHANICAL_AUTOMOTIVE_SERVICE', N'MECHANICAL_AUTOMOTIVE_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (213, 200, N'SERVICIOS  MEDICOS', N'MEDICAL_SERVICES', N'MEDICAL_SERVICES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (214, 200, N'SERVICIOS DE MOVILIDAD ESCOLAR', N'SCHOOL_MOVILITY_SERVICIOS', N'SCHOOL_MOVILITY_SERVICIOS', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (215, 200, N'SERVICIOS DE MUDANZA', N'MOVING_SERVICES', N'MOVING_SERVICES', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (216, 200, N'SERVICIOS DE GUARDERIA', N'BABYCARE_SERVICE', N'BABYCARE_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (217, 200, N'SERVICIOS DE FOTOGRAFIA Y VIDEO ', N'PHOTOGRAPHY_VIDEO_SERVICE', N'PHOTOGRAPHY_VIDEO_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (218, 200, N'SERVICIOS DE PINTURA Y ACABADOS', N'PAINT_FINISHES_SERVICE', N'PAINT_FINISHES_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (219, 200, N'SERVICIOS ACADEMICOS Y COACH', N'ACADEMIC_COACH_SERVICE', N'ACADEMIC_COACH_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (220, 200, N'SERVICIOS TECNOLOGICOS', N'TECHNOLOGICAL_SERVICE', N'TECHNOLOGICAL_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (221, 200, N'SERVICIOS DE SASTRERIA', N'TAILORING_SERVICE', N'TAILORING_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (222, 200, N'SERVICIOS ARTISTICOS Y ENTRETENIMIENTO', N'ARTISTIC_AND_ENTERTAINMENT_SERVICE', N'ARTISTIC_AND_ENTERTAINMENT_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (223, 200, N'SERVICIOS DE SOLDADURA', N'WELDING_SERVICE', N'WELDING_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (224, 200, N'SERVICIOS TECNICOS Y DE REPARACION', N'TECHNICAL_REPAIR_SERVICE', N'TECHNICAL_REPAIR_SERVICE', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[systemparameter] ([iParameter_id], [iGroupid], [vDescription], [vCode], [vValue], [iReferenceid], [iOrder], [bVisible], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (225, 200, N'TRAINERS', N'TRAINERS', N'TRAINERS', NULL, NULL, 1, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [ControlPanel].[user] ON 
GO
INSERT [ControlPanel].[user] ([iUserid], [vName], [vSurname], [vUsername], [vPassword], [vEmail], [vNormalizedusername], [vSecuritystamp], [vConcurrencystamp], [iApptype], [bPasswordchange], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (3, N'JOSE LUIS', N'CALDERON JIMENEZ', N'ADMIN', N'ADMIN', NULL, N'JOSE LUIS CALDERON JIMENEZ', NULL, NULL, 101, 0, 1, 1, CAST(N'2019-10-16T17:34:46.0070000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[user] ([iUserid], [vName], [vSurname], [vUsername], [vPassword], [vEmail], [vNormalizedusername], [vSecuritystamp], [vConcurrencystamp], [iApptype], [bPasswordchange], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (5, N'JOSE LUIS', N'JOSE LUIS CALDERON', N'111870320040817844146', N'111870320040817844146', N'chinosurf.20@gmail.com', N'JOSE LUIS CALDERON', NULL, NULL, 101, 0, 1, 1, CAST(N'2019-10-18T22:42:08.0670000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
INSERT [ControlPanel].[user] ([iUserid], [vName], [vSurname], [vUsername], [vPassword], [vEmail], [vNormalizedusername], [vSecuritystamp], [vConcurrencystamp], [iApptype], [bPasswordchange], [iStatus], [iInsertuserid], [dInsertdate], [vInsertip], [iUpdateuserid], [dUpdatedate], [vUpdateip]) VALUES (44, N'JOSE', N'C. JIMENEZ', N'10218693341103155', N'10218693341103155', N'chinosurf_20@hotmail.com', N'JOSE LUIS C. JIMENEZ', NULL, NULL, 101, 0, 1, 1, CAST(N'2019-10-21T20:31:58.4000000' AS DateTime2), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [ControlPanel].[user] OFF
GO
INSERT [ControlPanel].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [ProviderId], [UserId]) VALUES (N'APLICATION', N'12345678', NULL, 131, 3)
GO
INSERT [ControlPanel].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [ProviderId], [UserId]) VALUES (N'FACEBOOK', N'10218693341103155', NULL, 133, 44)
GO
INSERT [ControlPanel].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [ProviderId], [UserId]) VALUES (N'GOOGLE CHROME', N'111870320040817844146', NULL, 132, 5)
GO
SET IDENTITY_INSERT [ControlPanel].[userrole] ON 
GO
INSERT [ControlPanel].[userrole] ([UserId], [RoleId], [iuserroleid]) VALUES (3, 111, 3)
GO
INSERT [ControlPanel].[userrole] ([UserId], [RoleId], [iuserroleid]) VALUES (5, 112, 5)
GO
INSERT [ControlPanel].[userrole] ([UserId], [RoleId], [iuserroleid]) VALUES (44, 113, 44)
GO
SET IDENTITY_INSERT [ControlPanel].[userrole] OFF
GO
SET IDENTITY_INSERT [Payment].[Payment] ON 
GO
INSERT [Payment].[Payment] ([iPayment_Id], [iRequirement_Id], [vPaymentCode], [dPaymentDate], [mPriceSale], [iPaymentType], [vTransaction], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (9, 10, NULL, NULL, CAST(50.00 AS Decimal(18, 2)), NULL, NULL, 5, CAST(N'2019-10-28T21:09:57.943' AS DateTime), NULL, NULL, 1)
GO
INSERT [Payment].[Payment] ([iPayment_Id], [iRequirement_Id], [vPaymentCode], [dPaymentDate], [mPriceSale], [iPaymentType], [vTransaction], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (10, 11, NULL, NULL, CAST(50.00 AS Decimal(18, 2)), NULL, NULL, 5, CAST(N'2019-10-28T21:16:01.747' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [Payment].[Payment] OFF
GO
SET IDENTITY_INSERT [Requirement].[Requirement] ON 
GO
INSERT [Requirement].[Requirement] ([iRequirement_Id], [iService_Id], [vRequirementCode], [dRequestDate], [vAddressFrom], [vAddressDelivery], [vDetalle], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (10, 2, N'', CAST(N'2019-10-30T00:00:00.000' AS DateTime), NULL, N'AV IZAGUIRRE', N'SOLICITO SEÑORA PARA LIMPIAR CASA DE 2 PISOS', 5, CAST(N'2019-10-28T21:09:57.943' AS DateTime), NULL, NULL, 1)
GO
INSERT [Requirement].[Requirement] ([iRequirement_Id], [iService_Id], [vRequirementCode], [dRequestDate], [vAddressFrom], [vAddressDelivery], [vDetalle], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (11, 2, N'', CAST(N'2019-10-28T00:00:00.000' AS DateTime), NULL, N'LIMPIEZA DE CASA', N'SADLASDSAD', 5, CAST(N'2019-10-28T21:16:01.727' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [Requirement].[Requirement] OFF
GO
SET IDENTITY_INSERT [Service].[Service] ON 
GO
INSERT [Service].[Service] ([iService_Id], [iCustomer_Id], [iCategoryid], [vCode], [vName], [vDescription], [mPriceSale], [vPathAttachment], [iQualification], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (2, 2, 201, N'H000001', N'LIMPIEZA DE CASA', N'- Ofresco Servicio de Limpieza de casa', CAST(50.00 AS Decimal(18, 2)), NULL, 5, 1, CAST(N'2019-10-21T17:10:59.313' AS DateTime), NULL, NULL, 1)
GO
INSERT [Service].[Service] ([iService_Id], [iCustomer_Id], [iCategoryid], [vCode], [vName], [vDescription], [mPriceSale], [vPathAttachment], [iQualification], [iInsertUser_Id], [dInsertDate], [iUpdateUser_Id], [dUpdateDate], [iStatus]) VALUES (6, 41, 213, N'M00001', N'SERVICIO DE ODONTOLOGIA A DOMICILIO', N'- OFRECEMOS SERVICIO DE CURACIONES ', CAST(100.00 AS Decimal(18, 2)), NULL, NULL, 1, CAST(N'2019-10-21T20:33:18.123' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [Service].[Service] OFF
GO
ALTER TABLE [Cliente].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_user] FOREIGN KEY([iUserid])
REFERENCES [ControlPanel].[user] ([iUserid])
GO
ALTER TABLE [Cliente].[Customer] CHECK CONSTRAINT [FK_Customer_user]
GO
ALTER TABLE [ControlPanel].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [ControlPanel].[permission] ([iPermissionid])
ON DELETE CASCADE
GO
ALTER TABLE [ControlPanel].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_permission_PermissionId]
GO
ALTER TABLE [ControlPanel].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_user_UserId] FOREIGN KEY([UserId])
REFERENCES [ControlPanel].[user] ([iUserid])
ON DELETE CASCADE
GO
ALTER TABLE [ControlPanel].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_user_UserId]
GO
ALTER TABLE [ControlPanel].[userrole]  WITH CHECK ADD  CONSTRAINT [FK_userrole_role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [ControlPanel].[role] ([iRoleid])
ON DELETE CASCADE
GO
ALTER TABLE [ControlPanel].[userrole] CHECK CONSTRAINT [FK_userrole_role_RoleId]
GO
ALTER TABLE [ControlPanel].[userrole]  WITH CHECK ADD  CONSTRAINT [FK_userrole_user_UserId] FOREIGN KEY([UserId])
REFERENCES [ControlPanel].[user] ([iUserid])
ON DELETE CASCADE
GO
ALTER TABLE [ControlPanel].[userrole] CHECK CONSTRAINT [FK_userrole_user_UserId]
GO
ALTER TABLE [Payment].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Requirement] FOREIGN KEY([iRequirement_Id])
REFERENCES [Requirement].[Requirement] ([iRequirement_Id])
GO
ALTER TABLE [Payment].[Payment] CHECK CONSTRAINT [FK_Payment_Requirement]
GO
ALTER TABLE [Requirement].[Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Requirement_Service] FOREIGN KEY([iService_Id])
REFERENCES [Service].[Service] ([iService_Id])
GO
ALTER TABLE [Requirement].[Requirement] CHECK CONSTRAINT [FK_Requirement_Service]
GO
ALTER TABLE [Service].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Service] FOREIGN KEY([iService_Id])
REFERENCES [Service].[Service] ([iService_Id])
GO
ALTER TABLE [Service].[Comments] CHECK CONSTRAINT [FK_Comments_Service]
GO
ALTER TABLE [Service].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Customer] FOREIGN KEY([iCustomer_Id])
REFERENCES [Cliente].[Customer] ([iCustomer_Id])
GO
ALTER TABLE [Service].[Service] CHECK CONSTRAINT [FK_Service_Customer]
GO
/****** Object:  StoredProcedure [Cliente].[usp_GetCustomer]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cliente].[usp_GetCustomer](
@vCodeUser varchar(100)
)
AS
BEGIN

 SELECT * FROM [Cliente].[Customer] WHERE vCode = @vCodeUser

END
GO
/****** Object:  StoredProcedure [Cliente].[usp_SaveLoginCustomer]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cliente].[usp_SaveLoginCustomer](
@VFirstNameAuth varchar(500),
@VLastNameAuth varchar(500), 
@Id_Auth varchar(100),
@VNameCompleteAuth varchar(500),
@iTypeAPP int ,
@VTypeAuth int,
@VAddress varchar(500),
@VEmailAuth varchar(500),
@ITypeDocument int,
@VDocumentNumber varchar(20),
@VPhone varchar(20),
@VCellPhone varchar(20),
@vImageAuth varchar(500),
@VContacto varchar(500),
@ITypeCustomerid int
)
AS
BEGIN

DECLARE @iUserid int
DECLARE @LoginProvider VARCHAR(100)

INSERT INTO [ControlPanel].[user]
           ([vName]
           ,[vSurname]
           ,[vUsername]
           ,[vPassword]
		   ,[vEmail]
           ,[vNormalizedusername]
           ,[vSecuritystamp]
           ,[vConcurrencystamp]
           ,[iApptype]
           ,[bPasswordchange]
           ,[iStatus]
           ,[iInsertuserid]
           ,[dInsertdate]
           ,[vInsertip]
           ,[iUpdateuserid]
           ,[dUpdatedate]
           ,[vUpdateip])
     VALUES
           (@VFirstNameAuth
           ,@VLastNameAuth
           ,@Id_Auth
           ,@Id_Auth
		   ,@VEmailAuth
           ,@VNameCompleteAuth
           ,NULL
           ,NULL
           ,@iTypeAPP
           ,0
           ,1
           ,1
           ,getdate()
           ,NULL
           ,NULL
           ,NULL
           ,NULL)

	SET @iUserid = @@IDENTITY
	SET @LoginProvider = (SELECT CASE WHEN @VTypeAuth = 131 THEN 'APLICATION'
							  WHEN @VTypeAuth = 132 THEN 'GOOGLE CHROME'
							  WHEN @VTypeAuth = 133 THEN 'FACEBOOK' ELSE '' END)

	INSERT INTO [ControlPanel].[UserLogin]
           ([LoginProvider]
           ,[ProviderKey]
           ,[ProviderDisplayName]
           ,[ProviderId]
           ,[UserId])
     VALUES
           (@LoginProvider
           ,@Id_Auth
           ,NULL
           ,@VTypeAuth
           ,@iUserid)

     INSERT INTO [ControlPanel].[userrole]
           ([UserId]
           ,[RoleId])
      VALUES
           (@iUserid,
            @ITypeCustomerid)

	 INSERT INTO [Cliente].[Customer]
           ([iUserid]
           ,[iTypeCustomerid]
           ,[vCode]
           ,[vName]
           ,[vAddress]
           ,[vEmail]
           ,[iDocumentTypeid]
           ,[vDocumentNumber]
           ,[vPhone]
           ,[vCellPhone]
           ,[Foto]
           ,[iQualification]
           ,[iStatus]
           ,[iInsertUser_Id]
           ,[dInsertDate]
           ,[iUpdateUser_Id]
           ,[dUpdateDate]
           ,[bDisponibility]
           ,[vContacto])
     VALUES
           (@iUserid
           ,@ITypeCustomerid
           ,@Id_Auth
           ,@VNameCompleteAuth
           ,@VAddress
           ,@VEmailAuth
           ,@ITypeDocument
           ,@VDocumentNumber
           ,@VPhone
           ,@VCellPhone
           ,NULL
           ,NULL
           ,1
           ,@iUserid
           ,GETDATE()
           ,NULL
           ,NULL
           ,0
           ,@VContacto)

END
GO
/****** Object:  StoredProcedure [Requirement].[usp_SaveRequirement]    Script Date: 19/11/2019 1:56:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Requirement].[usp_SaveRequirement](
@IServiceid int,
@MPriceService decimal (18,2),
@DRequirementDate datetime,
@VDireccionFrom varchar(500), 
@VDireccionDeliver varchar(500),
@VDetailRequirement varchar(500),
@user varchar(100)
)
AS
BEGIN

DECLARE @iUserid int
DECLARE @IRequirementId int
DECLARE @Correlative int
DECLARE @vCode varchar(50)

SELECT @iUserid = iUserid FROM [ControlPanel].[user] WHERE vUsername = @user
SET @Correlative = (Select TOP 1 iRequirement_Id from [Requirement].[Requirement] ORDER BY iRequirement_Id DESC)
SET @vCode = 'REQ' + (RIGHT('00000' + Ltrim(Rtrim(@Correlative+1)),5))

INSERT INTO [Requirement].[Requirement]
           ([iService_Id]
           ,[vRequirementCode]
           ,[dRequestDate]
           ,[vAddressFrom]
           ,[vAddressDelivery]
           ,[vDetalle]
           ,[iInsertUser_Id]
           ,[dInsertDate]
           ,[iUpdateUser_Id]
           ,[dUpdateDate]
           ,[iStatus])
     VALUES
           (@IServiceid
           ,@vCode
           ,@DRequirementDate
           ,@VDireccionFrom
           ,@VDireccionDeliver
           ,@VDetailRequirement
           ,@iUserid
           --,GETDATE()
		   ,DATEADD(hour, 3,GETDATE())
           ,NULL
           ,NULL
           ,1)

	SET @IRequirementId = @@IDENTITY
	
	 INSERT INTO [Payment].[Payment]
           ([iRequirement_Id]
           ,[vPaymentCode]
           ,[dPaymentDate]
           ,[mPriceSale]
           ,[iPaymentType]
           ,[vTransaction]
           ,[iInsertUser_Id]
           ,[dInsertDate]
           ,[iUpdateUser_Id]
           ,[dUpdateDate]
           ,[iStatus])
     VALUES
           (@IRequirementId
           ,NULL
           ,NULL
           ,@MPriceService
           ,NULL
           ,NULL
           ,@iUserid
           --,GETDATE()
		   ,DATEADD(hour, 3,GETDATE())
           ,NULL
           ,NULL
           ,1)

END
GO
CREATE PROCEDURE [Requirement].[usp_UpdateRequirementStatus](
@iRequirementId int,
@iStatus int,
@iUserId int
)
AS
BEGIN

UPDATE [Requirement].[Requirement] set iStatus = @iStatus,dUpdateDate = getdate(),iUpdateUser_Id = @iUserId WHERE iRequirement_Id = @iRequirementId

END
GO
USE [master]
GO
ALTER DATABASE [AtuServicioDB] SET  READ_WRITE 
GO


--select * from [ControlPanel].[userrole]
--select * from [ControlPanel].[role]

--select * from [controlpanel].[permission]
--select * from [controlpanel].[RolePermissions]

--EXEC sp_rename 'controlpanel.permission.iCate/**/ry', 'iCategory', 'COLUMN';

--select p.* from [controlpanel].[user] u 
--inner join [ControlPanel].[userrole] ur on u.iUserid= ur.UserId
--inner join [ControlPanel].[role] r on ur.Roleid = r.iRoleid
--inner join [controlpanel].[RolePermissions] rp on r.iRoleid = rp.RoleId
--inner join [controlpanel].[permission] p on p.iPermissionid = rp.PermissionId 