USE [master]
GO
/****** Object:  Database [quiz_system]    Script Date: 7.12.2014 17:11:45 ******/
CREATE DATABASE [quiz_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quiz_system', FILENAME = N'C:\Program Files (x86)\Parallels\Plesk\Databases\MSSQL\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\quiz_system.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quiz_system_log', FILENAME = N'C:\Program Files (x86)\Parallels\Plesk\Databases\MSSQL\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\quiz_system_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quiz_system] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quiz_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quiz_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quiz_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quiz_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quiz_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quiz_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [quiz_system] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quiz_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quiz_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quiz_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quiz_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quiz_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quiz_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quiz_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quiz_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quiz_system] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quiz_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quiz_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quiz_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quiz_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quiz_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quiz_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quiz_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quiz_system] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quiz_system] SET  MULTI_USER 
GO
ALTER DATABASE [quiz_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quiz_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quiz_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quiz_system] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [quiz_system]
GO
/****** Object:  User [ius_quiz]    Script Date: 7.12.2014 17:11:47 ******/
CREATE USER [ius_quiz] FOR LOGIN [ius_quiz] WITH DEFAULT_SCHEMA=[ius_quiz]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ius_quiz]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ius_quiz]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ius_quiz]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ius_quiz]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ius_quiz]
GO
/****** Object:  Schema [ius_quiz]    Script Date: 7.12.2014 17:11:47 ******/
CREATE SCHEMA [ius_quiz]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 7.12.2014 17:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Surname] [nvarchar](100) NULL,
	[EMail] [nvarchar](255) NULL,
	[Password] [nchar](50) NULL,
	[Auth_Token] [nvarchar](50) NULL,
	[LastLogin] [date] NULL,
	[ActivationCode] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Options]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuesionID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[TrueAnswer] [bit] NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[Question] [nvarchar](255) NULL,
	[Difficulty] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizResults]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
	[QuizDate] [date] NULL,
	[Achievement] [int] NULL,
	[NCorrectAnswers] [int] NULL,
	[NWrongAnswers] [int] NULL,
	[NEmptyAnswers] [int] NULL,
 CONSTRAINT [PK_QuizResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizzes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Time] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7.12.2014 17:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteTitle] [nvarchar](250) NULL,
	[SiteUrl] [nvarchar](250) NULL,
	[Description] [nvarchar](255) NULL,
	[Keywords] [nvarchar](255) NULL,
	[MailServer] [varchar](250) NULL,
	[MailAddress] [varchar](250) NULL,
	[MailSMTPUsername] [varchar](250) NULL,
	[MailSMTPPass] [varchar](250) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [quiz_system] SET  READ_WRITE 
GO
