USE [master]
GO
/****** Object:  Database [ProyectoQueGolazo]    Script Date: 04/10/2014 04:05:41 p.m. ******/
CREATE DATABASE [ProyectoQueGolazo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoQueGolazo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoQueGolazo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoQueGolazo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoQueGolazo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProyectoQueGolazo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoQueGolazo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoQueGolazo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoQueGolazo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoQueGolazo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoQueGolazo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoQueGolazo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoQueGolazo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoQueGolazo] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoQueGolazo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoQueGolazo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoQueGolazo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoQueGolazo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProyectoQueGolazo]
GO
/****** Object:  Table [dbo].[Arbitros]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Arbitros](
	[idArbitro] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[celular] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[matricula] [varchar](20) NULL,
	[idTorneo] [int] NOT NULL,
 CONSTRAINT [PK_Arbitros] PRIMARY KEY CLUSTERED 
(
	[idArbitro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cambios]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cambios](
	[idCambio] [int] IDENTITY(1,1) NOT NULL,
	[idEquipo] [int] NOT NULL,
	[idJugadorEntra] [int] NOT NULL,
	[idJugadorSale] [int] NOT NULL,
	[minuto] [int] NULL,
	[idPartido] [int] NOT NULL,
 CONSTRAINT [PK_Cambios] PRIMARY KEY CLUSTERED 
(
	[idCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Canchas]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canchas](
	[idCancha] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[domicilio] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[idTorneo] [int] NULL,
 CONSTRAINT [PK_Canchas] PRIMARY KEY CLUSTERED 
(
	[idCancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CanchaXEdicion]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanchaXEdicion](
	[idEdicion] [int] NOT NULL,
	[idCancha] [int] NOT NULL,
 CONSTRAINT [PK_CanchaXEdicion] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC,
	[idCancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfiguracionesEdicion]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionesEdicion](
	[jugadores] [bit] NOT NULL,
	[cambiosJugadores] [bit] NOT NULL,
	[tarjetasJugadores] [bit] NOT NULL,
	[golesJugadores] [bit] NOT NULL,
	[asignacionArbitros] [bit] NOT NULL,
	[desempenioArbitros] [bit] NOT NULL,
	[canchaUnica] [bit] NOT NULL,
	[sancionesJugadores] [bit] NOT NULL,
	[idEdicion] [int] NOT NULL,
	[arbitros] [bit] NOT NULL,
	[sanciones] [bit] NOT NULL,
	[jugadorXPartido] [bit] NOT NULL,
	[sancionesEquipos] [bit] NOT NULL,
	[canchas] [bit] NULL,
 CONSTRAINT [PK_ConfiguracionesEdicion] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delegados]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delegados](
	[idDelegado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[domicilio] [varchar](100) NULL,
 CONSTRAINT [PK_Delegados] PRIMARY KEY CLUSTERED 
(
	[idDelegado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ediciones]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ediciones](
	[idEdicion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idTamanioCancha] [int] NOT NULL,
	[idTipoSuperficie] [int] NOT NULL,
	[idEstado] [int] NULL,
	[idTorneo] [int] NOT NULL,
	[puntosGanado] [int] NULL,
	[puntosPerdido] [int] NULL,
	[puntosEmpatado] [int] NULL,
	[idGeneroEdicion] [int] NULL,
 CONSTRAINT [PK_Ediciones] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipos](
	[idEquipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[colorCamisetaPrimario] [varchar](30) NOT NULL,
	[colorCamisetaSecundario] [varchar](30) NOT NULL,
	[directorTecnico] [varchar](80) NULL,
	[idDelegadoPrincipal] [int] NULL,
	[idDelegadoOpcional] [int] NULL,
	[idTorneo] [int] NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipoXEdicion]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipoXEdicion](
	[idEdicion] [int] NOT NULL,
	[idEquipo] [int] NOT NULL,
 CONSTRAINT [PK_EquipoXEdicion] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstadoAmbitos]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoAmbitos](
	[idAmbito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoAmbitos] PRIMARY KEY CLUSTERED 
(
	[idAmbito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_EstadoAmbitos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[idAmbito] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Estados] UNIQUE NONCLUSTERED 
(
	[idAmbito] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fases]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fases](
	[idFase] [int] NOT NULL,
	[idEstado] [int] NULL,
	[idEdicion] [int] NOT NULL,
	[tipoFixture] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Fase] PRIMARY KEY CLUSTERED 
(
	[idFase] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fechas]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fechas](
	[idFecha] [int] NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idFase] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Fechas] PRIMARY KEY CLUSTERED 
(
	[idFecha] ASC,
	[idGrupo] ASC,
	[idFase] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenerosEdicion]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenerosEdicion](
	[idGeneroEdicion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GenerosEdicion] PRIMARY KEY CLUSTERED 
(
	[idGeneroEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Goles]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goles](
	[idGol] [int] IDENTITY(1,1) NOT NULL,
	[minuto] [int] NOT NULL,
	[idJugador] [int] NULL,
	[idEquipo] [int] NULL,
	[idPartido] [int] NOT NULL,
	[idTipoGol] [int] NULL,
 CONSTRAINT [PK_Goles] PRIMARY KEY CLUSTERED 
(
	[idGol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupos](
	[idGrupo] [int] NOT NULL,
	[idFase] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grupos] PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC,
	[idFase] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jugadores](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[dni] [varchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[email] [varchar](50) NULL,
	[facebook] [varchar](50) NULL,
	[sexo] [varchar](50) NOT NULL,
	[tieneFichaMedica] [bit] NOT NULL,
	[idEquipo] [int] NOT NULL,
	[telefono] [varchar](50) NULL,
	[numeroCamiseta] [int] NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Noticias](
	[idNoticia] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[tipoNoticia] [varchar](4) NOT NULL,
	[idEdicion] [int] NOT NULL,
	[descripcion] [varchar](max) NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Noticias] PRIMARY KEY CLUSTERED 
(
	[idNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[idPartido] [int] IDENTITY(1,1) NOT NULL,
	[idFecha] [int] NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idFase] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
	[idEquipoLocal] [int] NULL,
	[idEquipoVisitante] [int] NULL,
	[fecha] [datetime] NULL,
	[idPartidoPosterior] [int] NULL,
	[idEstado] [int] NOT NULL,
	[idArbitro] [int] NULL,
	[idCancha] [int] NULL,
	[golesLocal] [int] NULL,
	[golesVisitante] [int] NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sanciones]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sanciones](
	[idSancion] [int] IDENTITY(1,1) NOT NULL,
	[idEquipo] [int] NOT NULL,
	[idJugador] [int] NULL,
	[motivo] [varchar](200) NULL,
	[idPartido] [int] NULL,
 CONSTRAINT [PK_Sanciones] PRIMARY KEY CLUSTERED 
(
	[idSancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TamaniosCancha]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TamaniosCancha](
	[idTamanioCancha] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantidadJugadores] [int] NOT NULL,
 CONSTRAINT [PK_TamañosCancha] PRIMARY KEY CLUSTERED 
(
	[idTamanioCancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[idTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[idEquipo] [int] NOT NULL,
	[idJugador] [int] NOT NULL,
	[tipoTarjeta] [char](1) NOT NULL,
	[minuto] [int] NULL,
	[idPartido] [int] NOT NULL,
 CONSTRAINT [PK_Tarjetas] PRIMARY KEY CLUSTERED 
(
	[idTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposGol]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposGol](
	[idTipoGol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposGol] PRIMARY KEY CLUSTERED 
(
	[idTipoGol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposSuperficie]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposSuperficie](
	[idTipoSuperficie] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposSuperficie] PRIMARY KEY CLUSTERED 
(
	[idTipoSuperficie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TitularesXPartido]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitularesXPartido](
	[idPartido] [int] NOT NULL,
	[idJugador] [int] NOT NULL,
	[idEquipo] [int] NOT NULL,
 CONSTRAINT [PK_TitularesXPartido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Torneos]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Torneos](
	[idTorneo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[nick] [varchar](100) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[descripcion] [varchar](400) NULL,
 CONSTRAINT [PK_Campeonatos] PRIMARY KEY CLUSTERED 
(
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 04/10/2014 04:05:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[contrasenia] [varchar](200) NOT NULL,
	[esActivo] [bit] NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[codigo] [varchar](200) NULL,
	[codigoRecuperacion] [varchar](200) NULL,
	[emailNuevo] [varchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Usuarios] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Arbitros]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombreCancha_idTorneo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombreCancha_idTorneo] ON [dbo].[Canchas]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_torneo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_torneo] ON [dbo].[Ediciones]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Equipos]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_dni_idEquipo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_dni_idEquipo] ON [dbo].[Jugadores]
(
	[dni] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idEquipo]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idEquipo] ON [dbo].[Jugadores]
(
	[nombre] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nick]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nick] ON [dbo].[Torneos]
(
	[nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre]    Script Date: 04/10/2014 04:05:42 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre] ON [dbo].[Torneos]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arbitros]  WITH CHECK ADD  CONSTRAINT [FK_Arbitros_Torneos] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneos] ([idTorneo])
GO
ALTER TABLE [dbo].[Arbitros] CHECK CONSTRAINT [FK_Arbitros_Torneos]
GO
ALTER TABLE [dbo].[Cambios]  WITH CHECK ADD  CONSTRAINT [FK_Cambios_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Cambios] CHECK CONSTRAINT [FK_Cambios_Equipos]
GO
ALTER TABLE [dbo].[Cambios]  WITH CHECK ADD  CONSTRAINT [FK_Cambios_JugadoresEntra] FOREIGN KEY([idJugadorEntra])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Cambios] CHECK CONSTRAINT [FK_Cambios_JugadoresEntra]
GO
ALTER TABLE [dbo].[Cambios]  WITH CHECK ADD  CONSTRAINT [FK_Cambios_JugadoresSale] FOREIGN KEY([idJugadorSale])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Cambios] CHECK CONSTRAINT [FK_Cambios_JugadoresSale]
GO
ALTER TABLE [dbo].[Cambios]  WITH CHECK ADD  CONSTRAINT [FK_Cambios_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Cambios] CHECK CONSTRAINT [FK_Cambios_Partidos]
GO
ALTER TABLE [dbo].[Canchas]  WITH CHECK ADD  CONSTRAINT [FK_Canchas_Torneos] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneos] ([idTorneo])
GO
ALTER TABLE [dbo].[Canchas] CHECK CONSTRAINT [FK_Canchas_Torneos]
GO
ALTER TABLE [dbo].[CanchaXEdicion]  WITH CHECK ADD  CONSTRAINT [FK_CanchaXEdicion_Canchas] FOREIGN KEY([idCancha])
REFERENCES [dbo].[Canchas] ([idCancha])
GO
ALTER TABLE [dbo].[CanchaXEdicion] CHECK CONSTRAINT [FK_CanchaXEdicion_Canchas]
GO
ALTER TABLE [dbo].[CanchaXEdicion]  WITH CHECK ADD  CONSTRAINT [FK_CanchaXEdicion_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[CanchaXEdicion] CHECK CONSTRAINT [FK_CanchaXEdicion_Ediciones]
GO
ALTER TABLE [dbo].[ConfiguracionesEdicion]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionesEdicion_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[ConfiguracionesEdicion] CHECK CONSTRAINT [FK_ConfiguracionesEdicion_Ediciones]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_Campeonatos] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneos] ([idTorneo])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_Campeonatos]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_Estados]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_GenerosEdicion] FOREIGN KEY([idGeneroEdicion])
REFERENCES [dbo].[GenerosEdicion] ([idGeneroEdicion])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_GenerosEdicion]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_TamañosCancha] FOREIGN KEY([idTamanioCancha])
REFERENCES [dbo].[TamaniosCancha] ([idTamanioCancha])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_TamañosCancha]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_TiposSuperficie] FOREIGN KEY([idTipoSuperficie])
REFERENCES [dbo].[TiposSuperficie] ([idTipoSuperficie])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_TiposSuperficie]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Campeonatos] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneos] ([idTorneo])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Campeonatos]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Delegados] FOREIGN KEY([idDelegadoPrincipal])
REFERENCES [dbo].[Delegados] ([idDelegado])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Delegados]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Delegados1] FOREIGN KEY([idDelegadoOpcional])
REFERENCES [dbo].[Delegados] ([idDelegado])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Delegados1]
GO
ALTER TABLE [dbo].[EquipoXEdicion]  WITH CHECK ADD  CONSTRAINT [FK_EquipoXEdicion_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[EquipoXEdicion] CHECK CONSTRAINT [FK_EquipoXEdicion_Ediciones]
GO
ALTER TABLE [dbo].[EquipoXEdicion]  WITH CHECK ADD  CONSTRAINT [FK_EquipoXEdicion_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[EquipoXEdicion] CHECK CONSTRAINT [FK_EquipoXEdicion_Equipos]
GO
ALTER TABLE [dbo].[Fases]  WITH CHECK ADD  CONSTRAINT [FK_Fases_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[Fases] CHECK CONSTRAINT [FK_Fases_Ediciones]
GO
ALTER TABLE [dbo].[Fases]  WITH CHECK ADD  CONSTRAINT [FK_Fases_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Fases] CHECK CONSTRAINT [FK_Fases_Estados]
GO
ALTER TABLE [dbo].[Fechas]  WITH CHECK ADD  CONSTRAINT [FK_Fechas_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Fechas] CHECK CONSTRAINT [FK_Fechas_Estados]
GO
ALTER TABLE [dbo].[Fechas]  WITH CHECK ADD  CONSTRAINT [FK_Fechas_Grupos] FOREIGN KEY([idGrupo], [idFase], [idEdicion])
REFERENCES [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fechas] CHECK CONSTRAINT [FK_Fechas_Grupos]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Equipos]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Jugadores] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Jugadores]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Partidos]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_TiposGol] FOREIGN KEY([idTipoGol])
REFERENCES [dbo].[TiposGol] ([idTipoGol])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_TiposGol]
GO
ALTER TABLE [dbo].[Grupos]  WITH CHECK ADD  CONSTRAINT [FK_Grupos_Fases] FOREIGN KEY([idFase], [idEdicion])
REFERENCES [dbo].[Fases] ([idFase], [idEdicion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grupos] CHECK CONSTRAINT [FK_Grupos_Fases]
GO
ALTER TABLE [dbo].[Jugadores]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Jugadores] CHECK CONSTRAINT [FK_Jugadores_Equipos]
GO
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD  CONSTRAINT [FK_Noticias_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[Noticias] CHECK CONSTRAINT [FK_Noticias_Ediciones]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Arbitros] FOREIGN KEY([idArbitro])
REFERENCES [dbo].[Arbitros] ([idArbitro])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Arbitros]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Canchas] FOREIGN KEY([idCancha])
REFERENCES [dbo].[Canchas] ([idCancha])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Canchas]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_EquipoLocal] FOREIGN KEY([idEquipoLocal])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_EquipoLocal]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_EquipoVisitante] FOREIGN KEY([idEquipoVisitante])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_EquipoVisitante]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Estados]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Fechas] FOREIGN KEY([idFecha], [idGrupo], [idFase], [idEdicion])
REFERENCES [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Fechas]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Partidos]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Equipos]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Jugadores] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Jugadores]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Partidos]
GO
ALTER TABLE [dbo].[Tarjetas]  WITH CHECK ADD  CONSTRAINT [FK_Tarjetas_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Tarjetas] CHECK CONSTRAINT [FK_Tarjetas_Equipos]
GO
ALTER TABLE [dbo].[Tarjetas]  WITH CHECK ADD  CONSTRAINT [FK_Tarjetas_Jugadores] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Tarjetas] CHECK CONSTRAINT [FK_Tarjetas_Jugadores]
GO
ALTER TABLE [dbo].[Tarjetas]  WITH CHECK ADD  CONSTRAINT [FK_Tarjetas_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Tarjetas] CHECK CONSTRAINT [FK_Tarjetas_Partidos]
GO
ALTER TABLE [dbo].[TitularesXPartido]  WITH CHECK ADD  CONSTRAINT [FK_TitularesXPartido_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[TitularesXPartido] CHECK CONSTRAINT [FK_TitularesXPartido_Equipos]
GO
ALTER TABLE [dbo].[TitularesXPartido]  WITH CHECK ADD  CONSTRAINT [FK_TitularesXPartido_Jugadores] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[TitularesXPartido] CHECK CONSTRAINT [FK_TitularesXPartido_Jugadores]
GO
ALTER TABLE [dbo].[TitularesXPartido]  WITH CHECK ADD  CONSTRAINT [FK_TitularesXPartido_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[TitularesXPartido] CHECK CONSTRAINT [FK_TitularesXPartido_Partidos]
GO
ALTER TABLE [dbo].[Torneos]  WITH CHECK ADD  CONSTRAINT [FK_Campeonatos_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Torneos] CHECK CONSTRAINT [FK_Campeonatos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TiposUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TiposUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TiposUsuario]
GO
USE [master]
GO
ALTER DATABASE [ProyectoQueGolazo] SET  READ_WRITE 
GO
