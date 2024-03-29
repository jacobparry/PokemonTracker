USE [master]
GO
/****** Object:  Database [PokemonTracker]    Script Date: 12/20/2016 6:24:43 PM ******/
CREATE DATABASE [PokemonTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PokemonTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PokemonTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PokemonTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PokemonTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PokemonTracker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PokemonTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PokemonTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PokemonTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PokemonTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PokemonTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PokemonTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [PokemonTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PokemonTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PokemonTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PokemonTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PokemonTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PokemonTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PokemonTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PokemonTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PokemonTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PokemonTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PokemonTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PokemonTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PokemonTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PokemonTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PokemonTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PokemonTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PokemonTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PokemonTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PokemonTracker] SET  MULTI_USER 
GO
ALTER DATABASE [PokemonTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PokemonTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PokemonTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PokemonTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PokemonTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PokemonTracker] SET QUERY_STORE = OFF
GO
USE [PokemonTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PokemonTracker]
GO
/****** Object:  Table [dbo].[PT_Attacks]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_Attacks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[DPS] [float] NOT NULL,
	[Damage] [int] NOT NULL,
	[Seconds] [float] NOT NULL,
	[Energy] [int] NOT NULL,
	[FastMove] [bit] NOT NULL,
 CONSTRAINT [PK_PT_Attacks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_Gym]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_Gym](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[GymLevel] [int] NOT NULL,
	[Location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Gym] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_GymHasPokemon]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_GymHasPokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[GymID] [int] NOT NULL,
	[CP] [int] NOT NULL,
 CONSTRAINT [PK_PT_GymHasPokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_Pokemon]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_Pokemon](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ImagePath] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Pokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_PokemonHasAttack]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_PokemonHasAttack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[AttackID] [int] NOT NULL,
 CONSTRAINT [PK_PT_PokemonHasAttack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_PokemonHasType]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_PokemonHasType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_PT_PokemonHasType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_Team]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_Team](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Team] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_Type]    Script Date: 12/20/2016 6:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_User]    Script Date: 12/20/2016 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_PT_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_UserFavoriteGym]    Script Date: 12/20/2016 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_UserFavoriteGym](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GymID] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserFavoriteGym] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_UserHasCandy]    Script Date: 12/20/2016 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_UserHasCandy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PokemonID] [int] NOT NULL,
	[CandyAmount] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserHasCandy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_UserHasPokemon]    Script Date: 12/20/2016 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_UserHasPokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PokemonID] [int] NOT NULL,
	[CP] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserHasPokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PT_UserPokemonHasAttack]    Script Date: 12/20/2016 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PT_UserPokemonHasAttack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserPokemonID] [int] NOT NULL,
	[AttackID] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserPokemonHasAttack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (1, N'Bulbasaur', N'1.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (2, N'Ivysaur', N'2.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (3, N'Venusaur', N'3.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (4, N'Charmander', N'4.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (5, N'Charmeleon', N'5.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (6, N'Charizard', N'6.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (7, N'Squirtle', N'7.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (8, N'Wartortle', N'8.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (9, N'Blastoise', N'9.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (10, N'Caterpie', N'10.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (11, N'Metapod', N'11.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (12, N'Butterfree', N'12.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (13, N'Weedle', N'13.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (14, N'Kakuna', N'14.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (15, N'Beedrill', N'15.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (16, N'Pidgey', N'16.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (17, N'Pidgeotto', N'17.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (18, N'Pidgeot', N'18.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (19, N'Rattata', N'19.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (20, N'Raticate', N'20.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (21, N'Spearow', N'21.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (22, N'Fearow', N'22.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (23, N'Ekans', N'23.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (24, N'Arbok', N'24.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (25, N'Pikachu', N'25.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (26, N'Raichu', N'26.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (27, N'Sandshrew', N'27.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (28, N'Sandslash', N'28.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (29, N'Nidoran?', N'29.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (30, N'Nidorina', N'30.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (31, N'Nidoqueen', N'31.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (32, N'Nidoran?', N'32.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (33, N'Nidorino', N'33.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (34, N'Nidoking', N'34.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (35, N'Clefairy', N'35.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (36, N'Clefable', N'36.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (37, N'Vulpix', N'37.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (38, N'Ninetales', N'38.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (39, N'Jigglypuff', N'39.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (40, N'Wigglytuff', N'40.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (41, N'Zubat', N'41.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (42, N'Golbat', N'42.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (43, N'Oddish', N'43.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (44, N'Gloom', N'44.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (45, N'Vileplume', N'45.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (46, N'Paras', N'46.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (47, N'Parasect', N'47.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (48, N'Venonat', N'48.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (49, N'Venomoth', N'49.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (50, N'Diglett', N'50.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (51, N'Dugtrio', N'51.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (52, N'Meowth', N'52.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (53, N'Persian', N'53.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (54, N'Psyduck', N'54.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (55, N'Golduck', N'55.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (56, N'Mankey', N'56.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (57, N'Primeape', N'57.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (58, N'Growlithe', N'58.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (59, N'Arcanine', N'59.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (60, N'Poliwag', N'60.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (61, N'Poliwhirl', N'61.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (62, N'Poliwrath', N'62.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (63, N'Abra', N'63.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (64, N'Kadabra', N'64.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (65, N'Alakazam', N'65.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (66, N'Machop', N'66.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (67, N'Machoke', N'67.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (68, N'Machamp', N'68.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (69, N'Bellsprout', N'69.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (70, N'Weepinbell', N'70.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (71, N'Victreebel', N'71.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (72, N'Tentacool', N'72.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (73, N'Tentacruel', N'73.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (74, N'Geodude', N'74.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (75, N'Graveler', N'75.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (76, N'Golem', N'76.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (77, N'Ponyta', N'77.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (78, N'Rapidash', N'78.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (79, N'Slowpoke', N'79.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (80, N'Slowbro', N'80.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (81, N'Magnemite', N'81.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (82, N'Magneton', N'82.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (83, N'Farfetch''d', N'83.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (84, N'Doduo', N'84.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (85, N'Dodrio', N'85.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (86, N'Seel', N'86.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (87, N'Dewgong', N'87.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (88, N'Grimer', N'88.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (89, N'Muk', N'89.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (90, N'Shellder', N'90.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (91, N'Cloyster', N'91.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (92, N'Gastly', N'92.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (93, N'Haunter', N'93.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (94, N'Gengar', N'94.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (95, N'Onix', N'95.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (96, N'Drowzee', N'96.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (97, N'Hypno', N'97.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (98, N'Krabby', N'98.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (99, N'Kingler', N'99.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (100, N'Voltorb', N'100.png')
GO
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (101, N'Electrode', N'101.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (102, N'Exeggcute', N'102.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (103, N'Exeggutor', N'103.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (104, N'Cubone', N'104.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (105, N'Marowak', N'105.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (106, N'Hitmonlee', N'106.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (107, N'Hitmonchan', N'107.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (108, N'Lickitung', N'108.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (109, N'Koffing', N'109.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (110, N'Weezing', N'110.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (111, N'Rhyhorn', N'111.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (112, N'Rhydon', N'112.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (113, N'Chansey', N'113.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (114, N'Tangela', N'114.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (115, N'Kangaskhan', N'115.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (116, N'Horsea', N'116.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (117, N'Seadra', N'117.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (118, N'Goldeen', N'118.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (119, N'Seaking', N'119.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (120, N'Staryu', N'120.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (121, N'Starmie', N'121.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (122, N'Mr. Mime', N'122.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (123, N'Scyther', N'123.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (124, N'Jynx', N'124.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (125, N'Electabuzz', N'125.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (126, N'Magmar', N'126.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (127, N'Pinsir', N'127.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (128, N'Tauros', N'128.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (129, N'Magikarp', N'129.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (130, N'Gyarados', N'130.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (131, N'Lapras', N'131.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (132, N'Ditto', N'132.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (133, N'Eevee', N'133.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (134, N'Vaporeon', N'134.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (135, N'Jolteon', N'135.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (136, N'Flareon', N'136.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (137, N'Porygon', N'137.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (138, N'Omanyte', N'138.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (139, N'Omastar', N'139.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (140, N'Kabuto', N'140.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (141, N'Kabutops', N'141.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (142, N'Aerodactyl', N'142.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (143, N'Snorlax', N'143.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (144, N'Articuno', N'144.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (145, N'Zapdos', N'145.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (146, N'Moltres', N'146.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (147, N'Dratini', N'147.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (148, N'Dragonair', N'148.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (149, N'Dragonite', N'149.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (150, N'Mewtwo', N'150.png')
INSERT [dbo].[PT_Pokemon] ([ID], [Name], [ImagePath]) VALUES (151, N'Mew', N'151.png')
SET IDENTITY_INSERT [dbo].[PT_Type] ON 

INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (1, N'Bug')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (2, N'Dark')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (3, N'Dragon')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (4, N'Electric')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (5, N'Fairy')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (6, N'Fighting')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (7, N'Fire')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (8, N'Ghost')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (9, N'Grass')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (10, N'Ground')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (11, N'Ice')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (12, N'Metal')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (13, N'Normal')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (14, N'Poison')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (15, N'Psychic')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (16, N'Rock')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (17, N'Steel')
INSERT [dbo].[PT_Type] ([ID], [Type]) VALUES (18, N'Water')
SET IDENTITY_INSERT [dbo].[PT_Type] OFF
ALTER TABLE [dbo].[PT_Attacks]  WITH CHECK ADD  CONSTRAINT [FK_PT_Attacks_PT_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PT_Type] ([ID])
GO
ALTER TABLE [dbo].[PT_Attacks] CHECK CONSTRAINT [FK_PT_Attacks_PT_Type]
GO
ALTER TABLE [dbo].[PT_Gym]  WITH CHECK ADD  CONSTRAINT [FK_PT_Gym_PT_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[PT_Team] ([ID])
GO
ALTER TABLE [dbo].[PT_Gym] CHECK CONSTRAINT [FK_PT_Gym_PT_Team]
GO
ALTER TABLE [dbo].[PT_GymHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_GymHasPokemon_PT_Gym] FOREIGN KEY([GymID])
REFERENCES [dbo].[PT_Gym] ([ID])
GO
ALTER TABLE [dbo].[PT_GymHasPokemon] CHECK CONSTRAINT [FK_PT_GymHasPokemon_PT_Gym]
GO
ALTER TABLE [dbo].[PT_GymHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_GymHasPokemon_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_GymHasPokemon] CHECK CONSTRAINT [FK_PT_GymHasPokemon_PT_Pokemon]
GO
ALTER TABLE [dbo].[PT_PokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasAttack_PT_Attacks] FOREIGN KEY([AttackID])
REFERENCES [dbo].[PT_Attacks] ([ID])
GO
ALTER TABLE [dbo].[PT_PokemonHasAttack] CHECK CONSTRAINT [FK_PT_PokemonHasAttack_PT_Attacks]
GO
ALTER TABLE [dbo].[PT_PokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasAttack_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_PokemonHasAttack] CHECK CONSTRAINT [FK_PT_PokemonHasAttack_PT_Pokemon]
GO
ALTER TABLE [dbo].[PT_PokemonHasType]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasType_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_PokemonHasType] CHECK CONSTRAINT [FK_PT_PokemonHasType_PT_Pokemon]
GO
ALTER TABLE [dbo].[PT_PokemonHasType]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasType_PT_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PT_Type] ([ID])
GO
ALTER TABLE [dbo].[PT_PokemonHasType] CHECK CONSTRAINT [FK_PT_PokemonHasType_PT_Type]
GO
ALTER TABLE [dbo].[PT_User]  WITH CHECK ADD  CONSTRAINT [FK_PT_User_PT_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[PT_Team] ([ID])
GO
ALTER TABLE [dbo].[PT_User] CHECK CONSTRAINT [FK_PT_User_PT_Team]
GO
ALTER TABLE [dbo].[PT_UserFavoriteGym]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserFavoriteGym_PT_Gym] FOREIGN KEY([GymID])
REFERENCES [dbo].[PT_Gym] ([ID])
GO
ALTER TABLE [dbo].[PT_UserFavoriteGym] CHECK CONSTRAINT [FK_PT_UserFavoriteGym_PT_Gym]
GO
ALTER TABLE [dbo].[PT_UserFavoriteGym]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserFavoriteGym_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO
ALTER TABLE [dbo].[PT_UserFavoriteGym] CHECK CONSTRAINT [FK_PT_UserFavoriteGym_PT_User]
GO
ALTER TABLE [dbo].[PT_UserHasCandy]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasCandy_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_UserHasCandy] CHECK CONSTRAINT [FK_PT_UserHasCandy_PT_Pokemon]
GO
ALTER TABLE [dbo].[PT_UserHasCandy]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasCandy_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO
ALTER TABLE [dbo].[PT_UserHasCandy] CHECK CONSTRAINT [FK_PT_UserHasCandy_PT_User]
GO
ALTER TABLE [dbo].[PT_UserHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasPokemon_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_UserHasPokemon] CHECK CONSTRAINT [FK_PT_UserHasPokemon_PT_Pokemon]
GO
ALTER TABLE [dbo].[PT_UserHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasPokemon_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO
ALTER TABLE [dbo].[PT_UserHasPokemon] CHECK CONSTRAINT [FK_PT_UserHasPokemon_PT_User]
GO
ALTER TABLE [dbo].[PT_UserPokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_Attacks] FOREIGN KEY([AttackID])
REFERENCES [dbo].[PT_Attacks] ([ID])
GO
ALTER TABLE [dbo].[PT_UserPokemonHasAttack] CHECK CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_Attacks]
GO
ALTER TABLE [dbo].[PT_UserPokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_UserHasPokemon] FOREIGN KEY([UserPokemonID])
REFERENCES [dbo].[PT_UserHasPokemon] ([ID])
GO
ALTER TABLE [dbo].[PT_UserPokemonHasAttack] CHECK CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_UserHasPokemon]
GO
USE [master]
GO
ALTER DATABASE [PokemonTracker] SET  READ_WRITE 
GO
