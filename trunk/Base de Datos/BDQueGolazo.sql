USE [master]
GO
/****** Object:  Database [QUEGOLAZO]    Script Date: 03/06/2014 07:42:14 p.m. ******/
CREATE DATABASE [QUEGOLAZO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUEGOLAZO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QUEGOLAZO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QUEGOLAZO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QUEGOLAZO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QUEGOLAZO] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUEGOLAZO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUEGOLAZO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QUEGOLAZO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUEGOLAZO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUEGOLAZO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QUEGOLAZO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUEGOLAZO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUEGOLAZO] SET  MULTI_USER 
GO
ALTER DATABASE [QUEGOLAZO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUEGOLAZO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUEGOLAZO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUEGOLAZO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QUEGOLAZO]
GO
/****** Object:  Table [dbo].[Campeonatos]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Campeonatos](
	[idCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[idTamañoCancha] [int] NOT NULL,
	[descripcion] [varchar](300) NULL,
	[idSuperficieDeCancha] [int] NULL,
	[cantidadMaximaJugadores] [int] NOT NULL,
	[idTipoFixture] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[sistemaPuntuacion] [nvarchar](500) NULL,
 CONSTRAINT [PK_Campeonatos] PRIMARY KEY CLUSTERED 
(
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delegados]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delegados](
	[idDelegado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[email] [varchar](90) NULL,
	[telefono] [varchar](15) NOT NULL,
	[domicilio] [varchar](120) NULL,
	[idEquipo] [int] NOT NULL,
 CONSTRAINT [PK_DelegadosDeEquipos] PRIMARY KEY CLUSTERED 
(
	[idDelegado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipos](
	[idEquipo] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[urlLogo] [varchar](300) NULL,
	[colorDeCamisetaPrimario] [varchar](10) NULL,
	[colorDeCamisetaSecundario] [varchar](10) NULL,
	[directorTecnico] [varchar](50) NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipoXCampeonato]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipoXCampeonato](
	[idEquipo] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[partidosGanados] [int] NULL,
	[partidosPerdidos] [int] NULL,
	[partidosEmpatados] [int] NULL,
	[golesAFavor] [int] NULL,
	[golesContra] [int] NULL,
 CONSTRAINT [PK_EquipoXCampeonato] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estados]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ambito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosCampeonatos] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fechas]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fechas](
	[idFecha] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
 CONSTRAINT [PK_Fechas] PRIMARY KEY CLUSTERED 
(
	[idFecha] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[idPartido] [int] NOT NULL,
	[idFecha] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[idEquipoLocal] [int] NULL,
	[idEquipoVisitante] [int] NULL,
	[golesLocal] [int] NULL,
	[golesVisitante] [int] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idFecha] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuperficiesDeCancha]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SuperficiesDeCancha](
	[idSuperficieDeCancha] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SuperficiesDeCancha] PRIMARY KEY CLUSTERED 
(
	[idSuperficieDeCancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TamañosCancha]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TamañosCancha](
	[idTamañoCancha] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[cantidadDeJugadores] [int] NOT NULL,
 CONSTRAINT [PK_TamañosCancha] PRIMARY KEY CLUSTERED 
(
	[idTamañoCancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposFixture]    Script Date: 03/06/2014 07:42:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposFixture](
	[idTipoFixture] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposFixture] PRIMARY KEY CLUSTERED 
(
	[idTipoFixture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Campeonatos] ON 

INSERT [dbo].[Campeonatos] ([idCampeonato], [nombre], [urlLogo], [idTamañoCancha], [descripcion], [idSuperficieDeCancha], [cantidadMaximaJugadores], [idTipoFixture], [idEstado], [sistemaPuntuacion]) VALUES (1, N'Clausura', N'http://futebolalemao.ig.com.br/wp-content/uploads/2009/08/bundesliga.jpg', 1, N'hola', 1, 9, 2, 1, N'G:3 E:1 P:0')
INSERT [dbo].[Campeonatos] ([idCampeonato], [nombre], [urlLogo], [idTamañoCancha], [descripcion], [idSuperficieDeCancha], [cantidadMaximaJugadores], [idTipoFixture], [idEstado], [sistemaPuntuacion]) VALUES (2, N'Apertura', N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS-DsGNH94MOa_MpeD8NgC7ZsSku2M9b87ug0e42psO3fvFY3mkWg', 1, N'hola', 1, 9, 1, 2, N'G:3 E:1 P:0')
INSERT [dbo].[Campeonatos] ([idCampeonato], [nombre], [urlLogo], [idTamañoCancha], [descripcion], [idSuperficieDeCancha], [cantidadMaximaJugadores], [idTipoFixture], [idEstado], [sistemaPuntuacion]) VALUES (3, N'Liga salteña', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRSB1JrEzY_5maOnD9Z-NhXEGByAiTvRZN3ot4cG2lOsrVQIOZq', 1, N'hola', 1, 9, 1, 1, N'G:3 E:1 P:0')
INSERT [dbo].[Campeonatos] ([idCampeonato], [nombre], [urlLogo], [idTamañoCancha], [descripcion], [idSuperficieDeCancha], [cantidadMaximaJugadores], [idTipoFixture], [idEstado], [sistemaPuntuacion]) VALUES (5, N'Liga Cordobesa', N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTSrRY92G-Z0wK9ag0uKE9GikzgLGEfyHCnwwZ5eFEVi694rHTnCg', 1, N'hola', 1, 9, 1, 1, N'G:3 E:1 P:0')
SET IDENTITY_INSERT [dbo].[Campeonatos] OFF
SET IDENTITY_INSERT [dbo].[Delegados] ON 

INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (1, N'hola', N'paupedrosa30@gmail.com', N'03514650551', N'hola', 1)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (2, N'llll', N'paupedrosa30@gmail.com', N'03514650551', N'lll', 2)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (3, N'pau', N'paupedrosa30@gmail.com', N'03514650551', N'laksalksslaks', 3)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (4, N'Loca', N'antonioh@gmail.com', N'123213212', N'', 7)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (5, N'ASSAAS', N'antonioh@gmail.com', N'1221313212', N'', 8)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (6, N'ASD', N'antonioh@gmail.com', N'2131231212', N'', 9)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (7, N'ASDASDASD', N'antonioh@gmail.com', N'12313212', N'', 10)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio], [idEquipo]) VALUES (8, N'ASAS', N'antonioh@gmail.com', N'21312312', N'', 11)
SET IDENTITY_INSERT [dbo].[Delegados] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (1, 2, N'Boca', N'http://www.google.com', N'#ff0080', N'#000000', N'Bianchi')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (2, 2, N'Estudiantes', N'http://www.lospii.com', N'#ff0080', N'#000000', N'Maradona')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (3, 2, N'Gimnasia', N'http://www.lospii.com', N'#ff0080', N'#000000', N'Merlo')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (4, 2, N'Peñarol', N'http://www.google.com', N'#ff0080', N'#000000', N'Ramon Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (5, 2, N'Quimsa', N'http://www.google.com', N'#ff0080', N'#000000', N'Guardiola')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (6, 2, N'Independiente', N'http://www.google.com', N'#ff0080', N'#000000', N'Camoranessi')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (7, 2, N'River', N'', N'#ff0080', N'#000000', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (8, 1, N'Almirante Brown', N'', N'#000000', N'#ff8000', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (9, 1, N'Defensa y Justicia', N'', N'#000000', N'#ff0080', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (10, 1, N'Banfield', N'', N'#ff0080', N'#000000', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (11, 1, N'Independiente', N'', N'#000000', N'#400080', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (12, 1, N'Juventud Antoniana', NULL, N'#400080', N'#400080', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (14, 1, N'Juventus', NULL, N'#400080', N'#000000', N'Jesus Diaz')
INSERT [dbo].[Equipos] ([idEquipo], [idCampeonato], [nombre], [urlLogo], [colorDeCamisetaPrimario], [colorDeCamisetaSecundario], [directorTecnico]) VALUES (16, 1, N'Los nulos', NULL, N'#400080', N'#000000', N'Jesus Diaz')
SET IDENTITY_INSERT [dbo].[Equipos] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (1, N'REGISTRADO', N'CAMPEONATO')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (2, N'DIAGRAMADO', N'CAMPEONATO')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (3, N'PROGRAMADA', N'FECHA')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (4, N'INCOMPLETA', N'FECHA')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (5, N'COMPLETA', N'FECHA')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (6, N'JUGADO', N'PARTIDO')
INSERT [dbo].[Estados] ([idEstado], [nombre], [ambito]) VALUES (7, N'NO_JUGADO', N'PARTIDO')
SET IDENTITY_INSERT [dbo].[Estados] OFF
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (1, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (2, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (3, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (4, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (5, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (6, 2)
INSERT [dbo].[Fechas] ([idFecha], [idCampeonato]) VALUES (7, 2)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 1, 2, 7, 3, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 2, 2, 7, 1, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 3, 2, 7, NULL, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 4, 2, 7, 2, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 5, 2, 7, 4, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 6, 2, 7, 5, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (1, 7, 2, 7, 6, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 1, 2, 6, 1, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 2, 2, 3, NULL, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 3, 2, 1, 2, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 4, 2, NULL, 4, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 5, 2, 2, 5, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 6, 2, 4, 6, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (2, 7, 2, 5, 3, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 1, 2, 5, NULL, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 2, 2, 6, 2, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 3, 2, 3, 4, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 4, 2, 1, 5, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 5, 2, NULL, 6, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 6, 2, 2, 3, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (3, 7, 2, 4, 1, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 1, 2, 4, 2, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 2, 2, 5, 4, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 3, 2, 6, 5, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 4, 2, 3, 6, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 5, 2, 1, 3, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 6, 2, NULL, 1, NULL, NULL, 7)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idCampeonato], [idEquipoLocal], [idEquipoVisitante], [golesLocal], [golesVisitante], [idEstado]) VALUES (4, 7, 2, 2, NULL, NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[SuperficiesDeCancha] ON 

INSERT [dbo].[SuperficiesDeCancha] ([idSuperficieDeCancha], [nombre]) VALUES (1, N'Césped Natural')
INSERT [dbo].[SuperficiesDeCancha] ([idSuperficieDeCancha], [nombre]) VALUES (2, N'Césped Sintético')
INSERT [dbo].[SuperficiesDeCancha] ([idSuperficieDeCancha], [nombre]) VALUES (3, N'Tierra')
INSERT [dbo].[SuperficiesDeCancha] ([idSuperficieDeCancha], [nombre]) VALUES (4, N'Futsal')
SET IDENTITY_INSERT [dbo].[SuperficiesDeCancha] OFF
SET IDENTITY_INSERT [dbo].[TamañosCancha] ON 

INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (1, N'Fútbol 5', 5)
INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (2, N'Fútbol 7', 7)
INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (3, N'Fútbol 8', 8)
INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (4, N'Fútbol 9', 9)
INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (5, N'Fútbol 10', 10)
INSERT [dbo].[TamañosCancha] ([idTamañoCancha], [nombre], [cantidadDeJugadores]) VALUES (6, N'Fútbol 11', 11)
SET IDENTITY_INSERT [dbo].[TamañosCancha] OFF
SET IDENTITY_INSERT [dbo].[TiposFixture] ON 

INSERT [dbo].[TiposFixture] ([idTipoFixture], [nombre]) VALUES (1, N'Ida')
INSERT [dbo].[TiposFixture] ([idTipoFixture], [nombre]) VALUES (2, N'Ida y Vuelta')
SET IDENTITY_INSERT [dbo].[TiposFixture] OFF
ALTER TABLE [dbo].[Campeonatos]  WITH CHECK ADD  CONSTRAINT [FK_Campeonatos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Campeonatos] CHECK CONSTRAINT [FK_Campeonatos_Estados]
GO
ALTER TABLE [dbo].[Campeonatos]  WITH CHECK ADD  CONSTRAINT [FK_Campeonatos_SuperficiesDeCancha] FOREIGN KEY([idSuperficieDeCancha])
REFERENCES [dbo].[SuperficiesDeCancha] ([idSuperficieDeCancha])
GO
ALTER TABLE [dbo].[Campeonatos] CHECK CONSTRAINT [FK_Campeonatos_SuperficiesDeCancha]
GO
ALTER TABLE [dbo].[Campeonatos]  WITH CHECK ADD  CONSTRAINT [FK_Campeonatos_TamañosCancha] FOREIGN KEY([idTamañoCancha])
REFERENCES [dbo].[TamañosCancha] ([idTamañoCancha])
GO
ALTER TABLE [dbo].[Campeonatos] CHECK CONSTRAINT [FK_Campeonatos_TamañosCancha]
GO
ALTER TABLE [dbo].[Campeonatos]  WITH CHECK ADD  CONSTRAINT [FK_Campeonatos_TiposFixture] FOREIGN KEY([idTipoFixture])
REFERENCES [dbo].[TiposFixture] ([idTipoFixture])
GO
ALTER TABLE [dbo].[Campeonatos] CHECK CONSTRAINT [FK_Campeonatos_TiposFixture]
GO
ALTER TABLE [dbo].[Delegados]  WITH CHECK ADD  CONSTRAINT [FK_Delegados_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Delegados] CHECK CONSTRAINT [FK_Delegados_Equipos]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Campeonatos] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonatos] ([idCampeonato])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Campeonatos]
GO
ALTER TABLE [dbo].[EquipoXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_EquipoXCampeonato_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonatos] ([idCampeonato])
GO
ALTER TABLE [dbo].[EquipoXCampeonato] CHECK CONSTRAINT [FK_EquipoXCampeonato_Campeonato]
GO
ALTER TABLE [dbo].[EquipoXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_EquipoXCampeonato_Equipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[EquipoXCampeonato] CHECK CONSTRAINT [FK_EquipoXCampeonato_Equipo]
GO
ALTER TABLE [dbo].[Fechas]  WITH CHECK ADD  CONSTRAINT [FK_Fechas_Campeonatos] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonatos] ([idCampeonato])
GO
ALTER TABLE [dbo].[Fechas] CHECK CONSTRAINT [FK_Fechas_Campeonatos]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Equipos] FOREIGN KEY([idEquipoLocal])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Equipos]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Equipos1] FOREIGN KEY([idEquipoVisitante])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Equipos1]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Fechas] FOREIGN KEY([idFecha], [idCampeonato])
REFERENCES [dbo].[Fechas] ([idFecha], [idCampeonato])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Fechas]
GO
USE [master]
GO
ALTER DATABASE [QUEGOLAZO] SET  READ_WRITE 
GO
