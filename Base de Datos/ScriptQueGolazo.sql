USE [master]
GO
/****** Object:  Database [ProyectoQueGolazo]    Script Date: 21/10/2014 07:02:00 p.m. ******/
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
/****** Object:  Table [dbo].[Arbitros]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Cambios]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Canchas]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[CanchaXEdicion]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[ConfiguracionesEdicion]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Delegados]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Ediciones]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Equipos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[EquipoXEdicion]    Script Date: 21/10/2014 07:02:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipoXEdicion](
	[idEdicion] [int] NOT NULL,
	[idEquipo] [int] NOT NULL,
	[partidosGanados] [int] NULL,
	[partidosPerdidos] [int] NULL,
	[partidosEmpatados] [int] NULL,
 CONSTRAINT [PK_EquipoXEdicion] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstadoAmbitos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fases]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Fechas]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[GenerosEdicion]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Goles]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Grupos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Jugadores]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Noticias]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Partidos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
	[idGanador] [int] NULL,
	[idPerdedor] [int] NULL,
	[empate] [bit] NULL,
	[penalesLocal] [int] NULL,
	[penalesVisitante] [int] NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sanciones]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[TamaniosCancha]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[TiposGol]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[TiposSuperficie]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[TitularesXPartido]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Torneos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/10/2014 07:02:01 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Arbitros] ON 

INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (1, N'Héctor Baldassi', N'3512015399', N'hector@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (2, N'Sergio Pezzota', N'3512015399', N'sergio@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (3, N'Néstor Pittana', N'3512015399', N'nestor@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (6, N'Gustavo Rossi', N'3512015399', N'gustavo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (7, N'Ricardo Casas', N'3512015399', N'ricardo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (8, N'Pablo Díaz', N'3512015399', N'pablo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (9, N'Diego Ceballos', N'3512015399', N'diego@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (10, N'Gabriel Favalle', N'3512015399', N'gabriel@gmail.com', N'ABC', 87)
SET IDENTITY_INSERT [dbo].[Arbitros] OFF
SET IDENTITY_INSERT [dbo].[Canchas] ON 

INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1, N'Complejo Barrio Parque', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2, N'Complejo Don Bosco', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (3, N'Complejo El Águila', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (4, N'Complejo Don Tino', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1025, N'Complejo El Potrero', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1026, N'Complejo Universitario', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1027, N'Complejo Sol de Mayo', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2028, N'Complejo El Único Héroe', N'La Entente 2522', N'3512015399', 87)
SET IDENTITY_INSERT [dbo].[Canchas] OFF
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (0, 0, 0, 0, 1, 1, 0, 0, 14, 1, 0, 0, 0, 0)
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Delegados] ON 

INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (49, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (50, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (51, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (52, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (53, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (54, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (55, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (56, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (57, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (58, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (59, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (60, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (61, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (62, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (63, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (64, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (65, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (66, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (67, N'Paula Pedrosa', N'paula@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (68, N'Antonio Herrera', N'antonio@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (69, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (70, N'Florencia Rojas', N'florencia@gmail.com', N'3512015399', N'La Entente 2522')
SET IDENTITY_INSERT [dbo].[Delegados] OFF
SET IDENTITY_INSERT [dbo].[Ediciones] ON 

INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (14, N'Jockey 2014', 1, 1, 14, 87, 3, 0, 1, 2)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (15, N'Jockey 2013', 1, 1, 14, 87, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (19, N'Barrio Parque 2014', 1, 1, 2, 88, 3, 0, 1, 2)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (20, N'Barrio Parque 2013', 1, 1, 2, 88, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (23, N'Universitario 2014', 1, 1, 2, 89, 3, 0, 1, 3)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (24, N'Universitario 2013', 9, 1, 2, 89, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (25, N'Liga Juvenil 2014', 1, 1, 2, 98, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (26, N'Liga Juvenil 2013', 1, 1, 2, 98, 3, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Ediciones] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (1, N'Almirante Brown', N'#3f3f3f', N'#31859b', N'Ramón Oliva', 69, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (2, N'General Paz Junior', N'#1f497d', N'#fbd75b', N'Ramón Oliva', 68, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (3, N'Unión', N'#e36c09', N'#5484ed', N'Ramón Oliva', 67, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (4, N'Belgrano', N'#dc2127', N'#e1e1e1', N'Ramón Oliva', 70, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (5, N'Talleres', N'#5484ed', N'#fbd75b', N'Ramón Oliva', 66, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (7, N'Defensores Unidos', N'#5484ed', N'#5484ed', N'Ramón Oliva', 65, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (8, N'All Boys', N'#5484ed', N'#5484ed', N'Ramón Oliva', 64, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (9, N'Avellaneda', N'#5484ed', N'#5484ed', N'Ramón Oliva', 63, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (10, N'Bella Vista', N'#5484ed', N'#5484ed', N'Ramón Oliva', 62, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (11, N'San Vicente', N'#5484ed', N'#5484ed', N'Ramón Oliva', 61, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (12, N'Carlos Paz', N'#5484ed', N'#5484ed', N'Ramón Oliva', 60, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (13, N'Racing', N'#5484ed', N'#5484ed', N'Ramón Oliva', 59, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (14, N'Independiente', N'#5484ed', N'#5484ed', N'Ramón Oliva', 58, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (15, N'Peñarol', N'#5484ed', N'#5484ed', N'Ramón Oliva', 57, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (17, N'Atlético Tucumán', N'#5484ed', N'#5484ed', N'Ramón Oliva', 56, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (18, N'Juventud Antoniana', N'#5484ed', N'#5484ed', N'Ramón Oliva', 55, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (19, N'Independiente Rivadavia', N'#5484ed', N'#5484ed', N'Ramón Oliva', 54, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (21, N'Aldosivi', N'#5484ed', N'#5484ed', N'Ramón Oliva', 53, NULL, 87)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (14, 11, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (14, 15, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (14, 17, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (14, 18, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 8, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 10, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 11, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 12, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 13, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 14, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 17, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (15, 18, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] ON 

INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (2, N'Edicion')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (5, N'Fase')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (3, N'Fecha')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (4, N'Partido')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (1, N'Torneo')
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (1, 1, N'Registrado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (14, 2, N'Configurada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (2, 2, N'Registrada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (8, 3, N'Completa')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (7, 3, N'Diagramada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (9, 3, N'Incompleta')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (12, 4, N'Cancelado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (10, 4, N'Diagramado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (13, 4, N'Jugado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (11, 4, N'Programado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (6, 5, N'Cerrada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (4, 5, N'Diagramada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (5, 5, N'En Juego')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (3, 5, N'Registrada')
SET IDENTITY_INSERT [dbo].[Estados] OFF
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture]) VALUES (1, 4, 14, N'Todos contra todos')
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture]) VALUES (1, 4, 15, N'Eliminatorio')
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (0, 1, 1, 15, N'', 1)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 1, 14, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 1, 14, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 1, 14, NULL, 9)
SET IDENTITY_INSERT [dbo].[GenerosEdicion] ON 

INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (3, N'Mixto')
SET IDENTITY_INSERT [dbo].[GenerosEdicion] OFF
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 14, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 15, N'0')
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1, N'Javier Mascherano', N'362334651', CAST(0x0000839B00000000 AS DateTime), N'javier@gmail.com', N'Javier Mascherano', N'Masculino', 1, 21, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2, N'Angel Di María', N'362334652', CAST(0x0000839B00000000 AS DateTime), N'angel@gmail.com', N'Angel Di María', N'Masculino', 1, 21, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1002, N'Lionel Messi', N'362334653', CAST(0x0000839B00000000 AS DateTime), N'lionel@gmail.com', N'Lionel Messi', N'Masculino', 1, 21, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1009, N'Sergio Aguero', N'362334654', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Aguero', N'Masculino', 1, 21, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1015, N'Agustín Orión', N'362334655', CAST(0x0000839B00000000 AS DateTime), N'agustin@gmail.com', N'Agustín Orión', N'Masculino', 0, 21, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1016, N'Martín Demichellis', N'362334656', CAST(0x0000839B00000000 AS DateTime), N'martin@gmail.com', N'Martín Demichellis', N'Masculino', 1, 21, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1018, N'Marcos Rojo', N'362334657', CAST(0x0000839B00000000 AS DateTime), N'marcos@gmail.com', N'Marcos Rojo', N'Masculino', 1, 21, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1019, N'Ezequiel Lavezzi', N'362334658', CAST(0x0000839B00000000 AS DateTime), N'ezequiel@gmail.com', N'Ezequiel Lavezzi', N'Masculino', 0, 21, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2016, N'Lucas Biglia', N'362334659', CAST(0x0000839C00000000 AS DateTime), N'lucas@gmail.com', N'Lucas Biglia', N'Masculino', 0, 21, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2017, N'Gonzalo Higuaín', N'362334650', CAST(0x0000839B00000000 AS DateTime), N'gonzalo@gmail.com', N'Gonzalo Higuaín', N'Masculino', 0, 21, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2018, N'Enzo Perez', N'362334691', CAST(0x0000839B00000000 AS DateTime), N'enzo@gmail.com', N'Enzo Perez', N'Masculino', 0, 19, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2019, N'José Basanta', N'362334692', CAST(0x0000839B00000000 AS DateTime), N'jose@gmail.com', N'José Basanta', N'Masculino', 0, 19, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2027, N'Ezequiel Garay', N'362334621', CAST(0x0000839B00000000 AS DateTime), N'ezequiel@gmail.com', N'Ezequiel Garay', N'Masculino', 1, 19, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2029, N'Augusto Fernández', N'362331234', CAST(0x0000839B00000000 AS DateTime), N'augusto@gmail.com', N'Augusto Fernández', N'Masculino', 1, 19, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2030, N'Pablo Zabaleta', N'362334578', CAST(0x0000839B00000000 AS DateTime), N'pablo@gmail.com', N'Pablo Zabaleta', N'Masculino', 1, 19, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2032, N'Sergio Romero', N'362312458', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Romero', N'Masculino', 1, 19, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2033, N'Ricardo Alvarez', N'312345612', CAST(0x0000839B00000000 AS DateTime), N'ricardo@gmail.com', N'Ricardo Alvarez', N'Masculino', 1, 19, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2036, N'Rodrigo Palacio', N'321345679', CAST(0x0000839B00000000 AS DateTime), N'rodrigo@gmail.com', N'Rodrigo Palacio', N'Masculino', 1, 19, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2037, N'Federico Fernández', N'342346780', CAST(0x0000839B00000000 AS DateTime), N'federico@gmail.com', N'Federico Fernández', N'Masculino', 1, 19, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2038, N'Maxi Rodríguez', N'321234908', CAST(0x0000839B00000000 AS DateTime), N'maxi@gmail.com', N'Maxi Rodríguez', N'Femenino', 1, 19, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2039, N'Fernando Gago', N'345678901', CAST(0x0000839B00000000 AS DateTime), N'fernando@gmail.com', N'Fernando Gago', N'Masculino', 1, 19, N'3512015399', 5)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (1, 1, 1, 1, 14, 18, 15, NULL, NULL, 13, NULL, NULL, 3, 0, 18, 15, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (2, 1, 1, 1, 14, 11, 17, NULL, NULL, 13, NULL, NULL, 1, 2, 17, 11, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (3, 2, 1, 1, 14, 18, 17, NULL, NULL, 13, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (4, 2, 1, 1, 14, 15, 11, NULL, NULL, 13, NULL, NULL, 4, 1, 15, 11, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (5, 3, 1, 1, 14, 18, 11, NULL, NULL, 13, NULL, NULL, 2, 0, 18, 11, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (6, 3, 1, 1, 14, 17, 15, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (8, 0, 1, 1, 15, 18, 17, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (9, 0, 1, 1, 15, 14, 12, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (10, 0, 1, 1, 15, 13, 11, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante]) VALUES (11, 0, 1, 1, 15, 8, 10, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Partidos] OFF
SET IDENTITY_INSERT [dbo].[TamaniosCancha] ON 

INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (1, N'Fútbol 5', 5)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (2, N'Fútbol 6', 6)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (4, N'Fútbol 7', 7)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (6, N'Fútbol 8', 8)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (7, N'Fútbol 9', 9)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (8, N'Fútbol 10', 10)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (9, N'Fútbol 11', 11)
SET IDENTITY_INSERT [dbo].[TamaniosCancha] OFF
SET IDENTITY_INSERT [dbo].[Tarjetas] ON 

INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (3, 18, 1, N'A', 26, 1)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (4, 11, 1, N'A', 12, 2)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (5, 11, 2, N'A', 35, 2)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (7, 11, 1, N'R', 45, 2)
SET IDENTITY_INSERT [dbo].[Tarjetas] OFF
SET IDENTITY_INSERT [dbo].[TiposGol] ON 

INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (1, N'No Definido')
INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (2, N'Penal')
INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (3, N'Tiro Libre')
INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (4, N'Jugada')
INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (5, N'En Contra')
INSERT [dbo].[TiposGol] ([idTipoGol], [nombre]) VALUES (6, N'Cabeza')
SET IDENTITY_INSERT [dbo].[TiposGol] OFF
SET IDENTITY_INSERT [dbo].[TiposSuperficie] ON 

INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (1, N'Césped Natural')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (2, N'Césped Sintético')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (3, N'Tierra')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (4, N'Futsal')
SET IDENTITY_INSERT [dbo].[TiposSuperficie] OFF
SET IDENTITY_INSERT [dbo].[TiposUsuario] ON 

INSERT [dbo].[TiposUsuario] ([idTipoUsuario], [nombre]) VALUES (1, N'Cliente')
SET IDENTITY_INSERT [dbo].[TiposUsuario] OFF
SET IDENTITY_INSERT [dbo].[Torneos] ON 

INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (87, N'Torneo Jockey Club', N'jockeyClub', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (88, N'Torneo Barrio Parque ', N'barrioParque', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (89, N'Torneo Universitario', N'universitario', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (98, N'Torneo Liga Juvenil', N'ligaJuvenil', 15, N'Torneo de la Provincia de Córdoba')
SET IDENTITY_INSERT [dbo].[Torneos] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (6, N'Antonio', N'Herrera', N'antonioherrera990@gmail.com', N'YgBhAG4AYQBuAGEAeQBlAG4AYwBoAHUAZgBlAA==', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (11, N'Florencia', N'Rojas', N'flor.rojas91@hotmail.com', N'MQAyADMANAA1ADYA', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (13, N'Paulita', N'Pedrosa', N'paulita2070@hotmail.com', N'YgBhAG4AYQBuAGEAeQBlAG4AYwBoAHUAZgBlAA==', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (14, N'Facundo', N'Allemand', N'facualle@hotmail.com', N'YgBvAGQAZQBnAGEAcwA=', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (15, N'Administrador', N'Administrador', N'administrador@gmail.com', N'YQBkAG0AaQBuAGkAcwB0AHIAYQBkAG8AcgA=', 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Arbitros]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombreCancha_idTorneo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombreCancha_idTorneo] ON [dbo].[Canchas]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_torneo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_torneo] ON [dbo].[Ediciones]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Equipos]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EstadoAmbitos]    Script Date: 21/10/2014 07:02:01 p.m. ******/
ALTER TABLE [dbo].[EstadoAmbitos] ADD  CONSTRAINT [IX_EstadoAmbitos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Estados]    Script Date: 21/10/2014 07:02:01 p.m. ******/
ALTER TABLE [dbo].[Estados] ADD  CONSTRAINT [IX_Estados] UNIQUE NONCLUSTERED 
(
	[idAmbito] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_dni_idEquipo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_dni_idEquipo] ON [dbo].[Jugadores]
(
	[dni] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idEquipo]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idEquipo] ON [dbo].[Jugadores]
(
	[nombre] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nick]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nick] ON [dbo].[Torneos]
(
	[nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre]    Script Date: 21/10/2014 07:02:01 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre] ON [dbo].[Torneos]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuarios]    Script Date: 21/10/2014 07:02:01 p.m. ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [IX_Usuarios] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
