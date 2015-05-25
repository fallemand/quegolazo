USE [master]
GO
/****** Object:  Database [ProyectoQueGolazo]    Script Date: 25/05/2015 18:14:04 ******/
CREATE DATABASE [ProyectoQueGolazo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoQueGolazo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoQueGolazo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoQueGolazo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ProyectoQueGolazo_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Arbitros]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Cambios]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Canchas]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[CanchaXEdicion]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[CategoriasNoticia]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriasNoticia](
	[idCategoriaNoticia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriasNoticia] PRIMARY KEY CLUSTERED 
(
	[idCategoriaNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConfiguracionesEdicion]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[ConfiguracionesVisuales]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfiguracionesVisuales](
	[idTorneo] [int] NOT NULL,
	[colorDeFondo] [varchar](50) NULL,
	[patronDeFondo] [varchar](250) NULL,
	[estiloPagina] [varchar](50) NULL,
	[colorDestacado] [varchar](150) NULL,
	[colorHeader] [varchar](50) NULL,
	[patronHeader] [varchar](250) NULL,
	[theme] [varchar](250) NULL,
	[bodyClass] [varchar](50) NULL,
 CONSTRAINT [PK_ConfiguracionesVisuales] PRIMARY KEY CLUSTERED 
(
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delegados]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Ediciones]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Equipos]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[EquiposXGrupo]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquiposXGrupo](
	[idEquipo] [int] NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idFase] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
 CONSTRAINT [PK_EquiposXGrupo] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC,
	[idGrupo] ASC,
	[idFase] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipoXEdicion]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[EstadoAmbitos]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Estados]    Script Date: 25/05/2015 18:14:04 ******/
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
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fases]    Script Date: 25/05/2015 18:14:04 ******/
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
	[cantidadEquipos] [int] NULL,
	[cantidadGrupos] [int] NULL,
 CONSTRAINT [PK_Fase] PRIMARY KEY CLUSTERED 
(
	[idFase] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fechas]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[GenerosEdicion]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Goles]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goles](
	[idGol] [int] IDENTITY(1,1) NOT NULL,
	[minuto] [int] NULL,
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
/****** Object:  Table [dbo].[Grupos]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Jugadores]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jugadores](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[dni] [varchar](20) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[email] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[MotivosSancion]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MotivosSancion](
	[idMotivoSancion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MotivosSancion] PRIMARY KEY CLUSTERED 
(
	[idMotivoSancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Noticias](
	[idNoticia] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[idEdicion] [int] NOT NULL,
	[descripcion] [varchar](max) NULL,
	[fecha] [datetime] NOT NULL,
	[idCategoriaNoticia] [int] NOT NULL,
 CONSTRAINT [PK_Noticias] PRIMARY KEY CLUSTERED 
(
	[idNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 25/05/2015 18:14:04 ******/
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
	[huboPenales] [bit] NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sanciones]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sanciones](
	[idSancion] [int] IDENTITY(1,1) NOT NULL,
	[idEdicion] [int] NOT NULL,
	[idFase] [int] NULL,
	[idGrupo] [int] NULL,
	[idFecha] [int] NULL,
	[idPartido] [int] NULL,
	[idEquipo] [int] NOT NULL,
	[idJugador] [int] NULL,
	[fechaSancion] [datetime] NULL,
	[idMotivoSancion] [int] NULL,
	[observacion] [varchar](200) NULL,
	[puntosAQuitar] [int] NULL,
	[cantidadFechasSuspendidas] [int] NULL,
 CONSTRAINT [PK_Sanciones] PRIMARY KEY CLUSTERED 
(
	[idSancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TablaPosicionesFinal]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaPosicionesFinal](
	[posicion] [int] NOT NULL,
	[idEquipo] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
 CONSTRAINT [PK_TablaPosicionesFinal] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC,
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TamaniosCancha]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[TiposGol]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[TiposSuperficie]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[TitularesXPartido]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Torneos]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/05/2015 18:14:04 ******/
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
/****** Object:  UserDefinedFunction [dbo].[joinTablaDePosiciones]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[joinTablaDePosiciones] (@idEdicion int, @idFase int, @idGrupo int)
RETURNS TABLE
AS
RETURN 
(
    SELECT e.nombre AS Equipo, p.idEstado AS idEstadoPartido, p.idGanador, e.idEquipo, 
						p.empate, p.idPerdedor, p.idEquipoLocal, p.golesLocal, p.idEquipoVisitante, 
						p.golesVisitante, ed.puntosGanado, ed.puntosEmpatado, 
                        ed.puntosPerdido, p.idEdicion, e.nombre, p.idFase, p.idGrupo
	FROM (SELECT * FROM Partidos WHERE idEdicion=@idEdicion AND idFase=@idFase AND idGrupo=@idGrupo) AS p INNER JOIN
                         dbo.EquipoXEdicion AS exe ON p.idEdicion = exe.idEdicion INNER JOIN
                         dbo.Equipos AS e ON exe.idEquipo = e.idEquipo INNER JOIN
                         dbo.Ediciones AS ed ON ed.idEdicion = exe.idEdicion
	WHERE (e.idEquipo = p.idEquipoLocal) OR (e.idEquipo = p.idEquipoVisitante)
);













GO
/****** Object:  UserDefinedFunction [dbo].[joinTablaDePosicionesCompleta]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[joinTablaDePosicionesCompleta] (@idEdicion int, @idFase int)
RETURNS TABLE
AS
RETURN 
(
    SELECT e.nombre AS Equipo, p.idEstado AS idEstadoPartido, p.idGanador, e.idEquipo, 
						p.empate, p.idPerdedor, p.idEquipoLocal, p.golesLocal, p.idEquipoVisitante, 
						p.golesVisitante, ed.puntosGanado, ed.puntosEmpatado, 
                        ed.puntosPerdido, p.idEdicion, e.nombre, p.idFase, p.idGrupo
	FROM (SELECT * FROM Partidos WHERE idEdicion=@idEdicion AND idFase=@idFase) AS p INNER JOIN
                         dbo.EquipoXEdicion AS exe ON p.idEdicion = exe.idEdicion INNER JOIN
                         dbo.Equipos AS e ON exe.idEquipo = e.idEquipo INNER JOIN
                         dbo.Ediciones AS ed ON ed.idEdicion = exe.idEdicion
	WHERE (e.idEquipo = p.idEquipoLocal) OR (e.idEquipo = p.idEquipoVisitante)
);













GO
/****** Object:  View [dbo].[viewEstados]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewEstados]
AS
SELECT        ea.idAmbito, ea.nombre AS ambito, e.idEstado, e.nombre AS estado, e.descripcion
FROM            dbo.Estados AS e INNER JOIN
                         dbo.EstadoAmbitos AS ea ON ea.idAmbito = e.idAmbito












GO
/****** Object:  View [dbo].[viewTablaPosiciones]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewTablaPosiciones]
AS
SELECT        e.nombre AS Equipo, p.idEstado AS idEstadoPartido, p.idGanador, e.idEquipo, p.empate, p.idPerdedor, p.idEquipoLocal, p.golesLocal, p.idEquipoVisitante, p.golesVisitante, ed.puntosGanado, ed.puntosEmpatado, 
                         ed.puntosPerdido, p.idEdicion, e.nombre, p.idFase, p.idGrupo
FROM            dbo.Partidos AS p INNER JOIN
                         dbo.EquipoXEdicion AS exe ON p.idEdicion = exe.idEdicion INNER JOIN
                         dbo.Equipos AS e ON exe.idEquipo = e.idEquipo INNER JOIN
                         dbo.Ediciones AS ed ON ed.idEdicion = exe.idEdicion
WHERE        (e.idEquipo = p.idEquipoLocal) OR
                         (e.idEquipo = p.idEquipoVisitante)














GO
/****** Object:  View [dbo].[viewTorneosUsuario]    Script Date: 25/05/2015 18:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewTorneosUsuario]
AS
SELECT        e.idEdicion, e.nombre, e.idTamanioCancha, e.idTipoSuperficie, e.idEstado, e.idTorneo, e.puntosGanado, e.puntosPerdido, e.puntosEmpatado, e.idGeneroEdicion, t.idTorneo AS Expr1, t.nombre AS Expr2, t.nick, 
                         t.idUsuario, t.descripcion, u.idUsuario AS Expr3, u.nombre AS Expr4, u.apellido, u.email, u.contrasenia, u.esActivo, u.idTipoUsuario, u.codigo, u.codigoRecuperacion, u.emailNuevo
FROM            dbo.Ediciones AS e INNER JOIN
                         dbo.Torneos AS t ON e.idTorneo = t.idTorneo INNER JOIN
                         dbo.Usuarios AS u ON t.idUsuario = u.idUsuario
















GO
SET IDENTITY_INSERT [dbo].[Arbitros] ON 

INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (1, N'Héctor Baldassi', N'3512015399', N'hector@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (2, N'Sergio Pezzota', N'3512015399', N'sergio@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (3, N'Néstor Pittana', N'3512015399', N'nestor@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (6, N'Gustavo Rossi', N'3512015399', N'gustavo@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (7, N'Ricardo Casas', N'3512015399', N'ricardo@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (8, N'Pablo Díaz', N'3512015399', N'pablo@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (9, N'Diego Ceballos', N'3512015399', N'diego@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (10, N'Gabriel Favalle', N'3512015399', N'gabriel@gmail.com', N'ABC', 1)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (11, N'Néstor Pittana', N'3512015399', N'nestor@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (12, N'Gustavo Rossi', N'3512015399', N'gustavo@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (13, N'Ricardo Casas', N'3512015399', N'ricardo@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (14, N'Pablo Díaz', N'3512015399', N'pablo@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (15, N'Hector Baldassi', N'3512015399', N'hector@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (16, N'Gabriel Favalle', N'3512015399', N'gabriel@gmail.com', N'ABC', 2)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (17, N'Marco Rodríguez', N'3512015399', N'marco.rodriguez@gmail.com', N'ABC', 1)
SET IDENTITY_INSERT [dbo].[Arbitros] OFF
SET IDENTITY_INSERT [dbo].[Cambios] ON 

INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (1, 4, 2075, 2074, 20, 46)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (2, 13, 3050, 3048, 50, 46)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (3, 12, 3086, 3084, 50, 47)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (4, 1, 2051, 2044, 40, 47)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (5, 54, 4062, 4061, 40, 48)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (6, 54, 4062, 4059, 30, 48)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (7, 7, 3073, 3065, 30, 49)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (8, 15, 5072, 5071, 30, 50)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (9, 15, 5072, 5070, 50, 50)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (10, 4, 2075, 2073, 40, 51)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (11, 1, 2051, 2050, 60, 51)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (12, 12, 3086, 3085, 60, 53)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (13, 2, 2060, 2063, 70, 53)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (14, 7, 3073, 3071, 40, 91)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (15, 3, 3099, 3088, 40, 92)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (16, 7, 3073, 3072, 40, 93)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (17, 7, 3071, 3064, 40, 55)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (18, 15, 5072, 5067, 60, 55)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (19, 54, 4062, 4060, 60, 54)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (20, 9, 3062, 3059, 50, 54)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (21, 4, 2075, 2073, 50, 56)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (22, 8, 3112, 3109, 80, 56)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (23, 2, 2063, 2059, 80, 85)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (24, 2, 2061, 2055, 70, 85)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (25, 8, 3112, 3104, 70, 85)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (26, 9, 3062, 3061, 70, 84)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (27, 1, 2049, 2044, 80, 84)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (28, 4, 2075, 2074, 60, 81)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (29, 54, 4062, 4059, 70, 81)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (30, 7, 3072, 3073, 70, 82)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (31, 15, 5072, 5070, 70, 83)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (32, 13, 3051, 3048, 60, 83)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (35, 4, 2075, 2074, 60, 76)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (36, 7, 3073, 3071, 80, 76)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (37, 15, 5072, 5071, 80, 77)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (38, 12, 3086, 3083, 87, 78)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (39, 2, 2063, 2061, 87, 79)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (40, 8, 3112, 3110, 87, 80)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (41, 8, 3112, 3110, 87, 74)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (42, 4, 2075, 2069, 87, 71)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (43, 9, 3062, 3060, 87, 72)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (44, 1, 2051, 2049, 87, 75)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (45, 13, 3051, 3048, 22, 70)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (46, 1, 2051, 2050, 50, 69)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (47, 1, 2048, 2044, 80, 69)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (48, 2, 2063, 2060, 40, 73)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (49, 2, 2063, 2055, 40, 67)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (50, 4, 2075, 2073, 40, 66)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (51, 9, 3062, 3060, 66, 66)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (52, 4, 2075, 2067, 66, 61)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (53, 2, 2063, 2059, 63, 61)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (54, 1, 2050, 2044, 63, 63)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (55, 8, 3112, 3110, 63, 62)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (56, 9, 3062, 3059, 44, 62)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (57, 7, 3073, 3071, 44, 64)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (58, 12, 3086, 3085, 80, 65)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (59, 54, 4062, 4058, 55, 65)
INSERT [dbo].[Cambios] ([idCambio], [idEquipo], [idJugadorEntra], [idJugadorSale], [minuto], [idPartido]) VALUES (60, 46, 5082, 5084, 58, 157)
SET IDENTITY_INSERT [dbo].[Cambios] OFF
SET IDENTITY_INSERT [dbo].[Canchas] ON 

INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1, N'Complejo Barrio Parque', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2, N'Complejo Don Bosco', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (3, N'Complejo El Águila', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (4, N'Complejo Don Tino', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (9, N'Complejo Barrio Parque', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (10, N'Complejo Don Bosco', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (11, N'Complejo El Águila', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (12, N'Complejo Don Tino', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (13, N'Complejo El Potrero', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (14, N'Complejo Universitario', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (15, N'Complejo Sol de Mayo', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (16, N'Complejo El Único Héroe', N'La Entente 2522', N'3512015399', 2)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1025, N'Complejo El Potrero', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1026, N'Complejo Universitario', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1027, N'Complejo Sol de Mayo', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2028, N'Complejo El Único Héroe', N'La Entente 2522', N'3512015399', 1)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2029, N'Estadio Mineirão', N'Belo Horizonte', N'3512015399', 1)
SET IDENTITY_INSERT [dbo].[Canchas] OFF
SET IDENTITY_INSERT [dbo].[CategoriasNoticia] ON 

INSERT [dbo].[CategoriasNoticia] ([idCategoriaNoticia], [nombre]) VALUES (1, N'Boletín')
INSERT [dbo].[CategoriasNoticia] ([idCategoriaNoticia], [nombre]) VALUES (2, N'Evento')
SET IDENTITY_INSERT [dbo].[CategoriasNoticia] OFF
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1004, 1, 1, 1, 1, 1)
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1005, 1, 1, 1, 1, 1)
INSERT [dbo].[ConfiguracionesVisuales] ([idTorneo], [colorDeFondo], [patronDeFondo], [estiloPagina], [colorDestacado], [colorHeader], [patronHeader], [theme], [bodyClass]) VALUES (1, N'rgb(48, 68, 93)', N'url(/torneo/img/bg-theme/8.png)', N'layout-semiboxed', N'/torneo/css/skins/blue.css', N'rgb(48, 68, 93)', N'url(/torneo/img/bg-theme/8.png)', N'/torneo/css/bootstrap/cyborg.css', N'none')
INSERT [dbo].[ConfiguracionesVisuales] ([idTorneo], [colorDeFondo], [patronDeFondo], [estiloPagina], [colorDestacado], [colorHeader], [patronHeader], [theme], [bodyClass]) VALUES (2, N'rgb(95, 165, 78)', N'url(/torneo/img/bg-theme/c6.png)', N'layout-boxed-margin', N'/torneo/css/skins/green.css', N'rgb(255, 255, 255)', N'url(/torneo/img/bg-theme/19.png)', N'/torneo/css/bootstrap/bootstrap.css', N'none fixed')
SET IDENTITY_INSERT [dbo].[Delegados] ON 

INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (49, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (50, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (51, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (52, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (54, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (55, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (61, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (66, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (104, N'Park Chu-Young', N'ParkChuYoung@gmail.com', N'1234', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (106, N'Aleksandr Kerzhakov', N'AleksandrKerzhakov@gmail.com', N'1234556', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (107, N'Islam Slimani', N'islam@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (108, N'Kevin De Bruyne', N'kevin@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (109, N'Clint Dempsey', N'ClintDempsey@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (110, N'Asamoah Gyan', N'Asamoah@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (111, N'Cristiano Ronaldo ', N'cristiano@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (112, N'Philipp Lahm ', N'philipp@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (113, N'Emmanuel Emenike', N'emmanuel@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (114, N'Javad Nekounam', N'javad@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (115, N'Paula Pedrosa', N'pau@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (116, N'Lionel Messi', N'lionelmessi@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (117, N'Jerry Bengtson', N'bengston@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (118, N'Hugo Lloris', N'lloris@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (119, N'Antonio Valencia', N'valencia@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (120, N'Gökhan Inler', N'inler@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (121, N'Gianluigi Buffon', N'buffon@gail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (122, N'Wayne Rooney', N'rooney@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (123, N'Álvaro Saborio', N'alvaro@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (124, N'Diego Lugano', N'diego.lugano@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (125, N'Yasuhito Endo', N'yasuito@gmail.com', N'1234567', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (126, N'Yaya Touré', N'yaya@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (127, N'Dimitris Salpingidis', N'dimitris@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (128, N'Falcao García', N'falcao.garcia@gmail.com', N'124567', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (129, N'Mile Jedinak', N'mile.jedinak@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (130, N'Arturo Vidal', N'arturo.vidal@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (131, N'Louis van Gaal', N'louis.van.gaal@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (132, N'Iker Casillas', N'iker.casillas@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (133, N'Samuel Eto''o', N'samuel.etoo@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (134, N'Oribe Peralta', N'oribe.peralta@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (135, N'Darijo Srna', N'darijo.srna@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (136, N'Thiago Silva', N'thiago.silva@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (137, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (138, N'Antonio Herrera', N'antonio@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (140, N'Florencia Rojas', N'florencia@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (141, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (142, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (143, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (144, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (145, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (146, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (148, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (149, N'Paula Pedrosa', N'paula@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (150, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (151, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (152, N'Paula Pedrosa', N'paupedrosa@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (153, N'Paula Pedrosa', N'paupedrosa30@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (154, N'Paula Pedrosa', N'paupedrosa30@gmail.com', N'124556', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (155, N'Paula Pedrosa', N'paupedrosa30@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (156, N'Paula Pedrosa', N'paupedrosa30@gmail.com', N'1245', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (157, N'Paula Pedrosa', N'paupedrosa30@gmail.com', N'23452', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (158, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
SET IDENTITY_INSERT [dbo].[Delegados] OFF
SET IDENTITY_INSERT [dbo].[Ediciones] ON 

INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (1, N'Brasil 2014', 9, 1, 14, 1, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (2, N'Sudáfrica 2010', 9, 1, 2, 1, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (1004, N'Clausura 2015', 9, 1, 17, 2, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (1005, N'Apertura 2015', 9, 1, 16, 2, 3, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Ediciones] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (1, N'River Plate', N'#ffffff', N'#cb1e31', N'Marcelo Gallardo', 137, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (2, N'Boca Juniors', N'#1f497d', N'#fbd75b', N'Rodolfo Arruabarrena', 138, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (3, N'Lanús', N'#803f43', N'#ffffff', N'Guillermo Barros Schelotto', 149, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (4, N'Belgrano', N'#62c0dc', N'#282629', N'Ricardo Zielinski', 140, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (7, N'San Lorenzo', N'#30445d', N'#cb1e31', N'Edgardo Bauza', 144, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (8, N'Independiente', N'#cb1e31', N'#cb1e31', N'Jorge Almirón', 145, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (9, N'Estudiantes', N'#cb1e31', N'#cb1e31', N'Gabriel Milito', 148, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (10, N'Olimpo', N'#ffde99', N'#282629', N'Diego Osella', 150, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (12, N'Velez', N'#ffffff', N'#30445d', N'Miguel Ángel Russo', 158, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (13, N'Racing', N'#62c0dc', N'#ffffff', N'Diego Cocca', 146, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (14, N'Godoy Cruz', N'#62c0dc', N'#ffffff', N'Daniel Oldrá', 151, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (15, N'Arsenal', N'#62c0dc', N'#ffffff', N'Roberto "Fito" González', 143, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (17, N'Tigre', N'#30445d', N'#cb1e31', N'Gustavo Alfaro', 142, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (21, N'Aldosivi', N'#ffde99', N'#5fa54e', N'Fernando Quiroz', 141, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (22, N'Brasil', N'#5fa54e', N'#ffde99', N'Luiz Felipe Scolari', 136, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (23, N'Croacia', N'#cb1e31', N'#30445d', N'Nico Kovac', 135, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (24, N'México', N'#5fa54e', N'#cb1e31', N'Miguel Herrera', 134, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (25, N'Camerún', N'#5fa54e', N'#cb1e31', N'Volker Finke', 133, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (26, N'España', N'#cb1e31', N'#ffde99', N'Vicente del Bosque', 132, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (27, N'Holanda', N'#f38725', N'#ffffff', N'Robin van Persie', 131, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (28, N'Chile', N'#cb1e31', N'#30445d', N'Jorge Sampaoli', 130, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (29, N'Australia', N'#ffde99', N'#5fa54e', N'Ange Postecoglou', 129, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (30, N'Colombia', N'#ffde99', N'#ffffff', N'José Pekerman', 128, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (31, N'Grecia', N'#ffffff', N'#0078ad', N'Fernando Santos', 127, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (32, N'Costa de Marfil ', N'#f38725', N'#5fa54e', N'Hervé Renard', 126, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (33, N'Japón', N'#30445d', N'#ffffff', N' Alberto Zaccheroni', 125, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (34, N'Uruguay', N'#0078ad', N'#282629', N'Óscar Washington Tabárez', 124, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (35, N'Costa Rica', N'#cb1e31', N'#30445d', N'Jorge Luis Pinto', 123, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (36, N'Inglaterra', N'#ffffff', N'#cb1e31', N'Roy Hodgson', 122, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (37, N'Italia', N'#30445d', N'#ffffff', N'Cesare Prandelli', 121, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (38, N'Suiza', N'#cb1e31', N'#ffffff', N'Ottmar Hitzfeld', 120, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (39, N'Ecuador', N'#ffde99', N'#30445d', N'Reinaldo Rueda', 119, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (40, N'Francia', N'#30445d', N'#ffffff', N'Didier Deschamps', 118, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (41, N'Honduras', N'#6ea6bf', N'#ffffff', N'Luis Fernando Suárez', 117, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (42, N'Argentina', N'#62c0dc', N'#ffffff', N'Alejandro Sabella', 116, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (43, N'Bosnia', N'#30445d', N'#ffde99', N'Paula Pedrosa', 115, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (44, N'Iran', N'#ffffff', N'#cb1e31', N' Carlos Queiroz', 114, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (45, N'Nigeria', N'#5fa54e', N'#ffffff', N'Stephen Keshi', 113, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (46, N'Alemania', N'#ffffff', N'#282629', N'Joachim Löw', 112, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (47, N'Portugal', N'#cb1e31', N'#5fa54e', N'Paulo Bento', 111, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (48, N'Ghana', N'#ffde99', N'#5fa54e', N'Akwasi Appiah', 110, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (49, N'Estados Unidos', N'#ffffff', N'#30445d', N'Jürgen Klinsmann', 109, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (50, N'Bélgica', N'#282629', N'#ffde99', N'Marc Wilmots', 108, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (51, N'Argelia', N'#5fa54e', N'#ffffff', N'Vahid Halilhodzic', 107, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (52, N'Rusia', N'#cb1e31', N'#30445d', N'Fabio Capello', 106, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (53, N'Corea del Sur', N'#cb1e31', N'#30445d', N'Hong Myung-Bo', 104, NULL, 1)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (54, N'Newell''s', N'#cb1e31', N'#282629', N' Américo Gallego', 152, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (55, N'Defensa y Justicia', N'#5fa54e', N'#ffde99', N'José Oscar Flores', 153, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (56, N'Quilmes', N'#30445d', N'#ffffff', N'Julio César Falcioni', 154, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (57, N'Gimnasia', N'#30445d', N'#ffffff', N'Pedro Troglio', 155, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (58, N'Banfield', N'#5fa54e', N'#ffffff', N'Matías Almeyda', 156, NULL, 2)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (59, N'Colón', N'#282629', N'#cb1e31', N'Javier López', 157, NULL, 2)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (1, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (2, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (3, 1, 1, 1004)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (4, 1, 1, 1004)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (4, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (7, 1, 1, 1004)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (7, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (8, 1, 1, 1004)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (8, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (9, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (12, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (13, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (15, 1, 1, 1005)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (22, 1, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (22, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (23, 1, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (24, 1, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (24, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (25, 1, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (26, 2, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (27, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (27, 2, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (28, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (28, 2, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (29, 2, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (30, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (30, 3, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (31, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (31, 3, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (32, 3, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (33, 3, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (34, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (34, 4, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (35, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (35, 4, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (36, 4, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (37, 4, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (38, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (38, 5, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (39, 5, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (40, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (40, 5, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (41, 5, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (42, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (42, 6, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (43, 6, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (44, 6, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (45, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (45, 6, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (46, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (46, 7, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (47, 7, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (48, 7, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (49, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (49, 7, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (50, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (50, 8, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (51, 1, 2, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (51, 8, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (52, 8, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (53, 8, 1, 1)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (54, 1, 1, 1005)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 22, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 23, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 24, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 25, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 26, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 27, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 28, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 29, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 30, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 31, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 32, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 33, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 34, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 35, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 36, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 37, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 38, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 39, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 40, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 41, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 42, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 43, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 44, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 45, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 46, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 47, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 48, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 49, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 50, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 51, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 52, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1, 53, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1004, 3, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1004, 4, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1004, 7, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1004, 8, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 1, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 2, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 4, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 7, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 8, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 9, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 12, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 13, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 15, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (1005, 54, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] ON 

INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (2, N'Edicion')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (5, N'Fase')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (3, N'Fecha')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (4, N'Partido')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (1, N'Torneo')
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (1, 1, N'Registrado', N'Torneo creado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (2, 2, N'Registrada', N'Edición creada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (3, 5, N'Registrada', N'Fase genérica creada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (4, 5, N'Diagramada', N'Fase creada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (5, 5, N'Iniciada', N'Fase con al menos un partido jugado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (6, 5, N'Finalizada', N'Fase finalizada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (7, 3, N'Diagramada', N'Fecha creada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (8, 3, N'Completa', N'Fecha con todos los partidos jugados')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (9, 3, N'Incompleta', N'Fecha con partidos pendientes de juego')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (10, 4, N'Diagramado', N'Partido creado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (11, 4, N'Programado', N'Partido con fecha asignada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (12, 4, N'Cancelado', N'Partido cancelado  ')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (13, 4, N'Jugado', N'Partido con resultado asignado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (14, 2, N'Configurada', N'Edición con preferencias, equipos y fixture')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (16, 2, N'Iniciada', N'Edición con algún partido jugado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (17, 2, N'Finalizada', N'Edición finalizada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (18, 2, N'Cancelada', N'Edición cancelada  ')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (19, 3, N'Registrada', N'Fecha genérica')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (20, 5, N'Cancelada', N'Fase Cancelada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre], [descripcion]) VALUES (21, 3, N'Cancelada', N'Fecha Cancelado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture], [cantidadEquipos], [cantidadGrupos]) VALUES (1, 6, 1, N'TCT', NULL, NULL)
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture], [cantidadEquipos], [cantidadGrupos]) VALUES (1, 6, 1004, N'TCT', NULL, NULL)
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture], [cantidadEquipos], [cantidadGrupos]) VALUES (1, 4, 1005, N'TCT', NULL, NULL)
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture], [cantidadEquipos], [cantidadGrupos]) VALUES (2, 4, 1, N'ELIM', NULL, NULL)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 1, 1004, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 2, 1, N'Octavos de Final', 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 2, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 3, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 4, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 5, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 6, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 7, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 8, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 1, 1004, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 2, 1, N'Cuartos de Final', 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 2, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 3, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 4, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 5, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 6, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 7, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 8, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 1, 1004, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 2, 1, N'Semifinal', 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 2, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 3, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 4, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 5, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 6, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 7, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 8, 1, 1, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (4, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (4, 1, 2, 1, N'Final', 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (5, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (6, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (7, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (8, 1, 1, 1005, NULL, 8)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (9, 1, 1, 1005, NULL, 7)
SET IDENTITY_INSERT [dbo].[GenerosEdicion] ON 

INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (3, N'Mixto')
SET IDENTITY_INSERT [dbo].[GenerosEdicion] OFF
SET IDENTITY_INSERT [dbo].[Goles] ON 

INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (1, 30, 2075, 4, 46, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (2, 30, 2051, 1, 47, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (3, 60, 2049, 1, 47, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (4, 60, 4062, 54, 48, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (5, 70, 3111, 8, 48, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (6, 50, 5072, 15, 50, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (7, 50, 2075, 4, 51, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (8, 30, 3086, 12, 53, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (9, 50, 2062, 2, 53, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (10, 60, 2061, 2, 53, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (11, 40, 3099, 3, 92, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (12, 50, 3104, 8, 92, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (13, 50, 3073, 7, 93, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (14, 60, 3070, 7, 93, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (15, 60, 3073, 7, 95, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (16, 60, 3112, 8, 96, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (17, 50, 2075, 4, 96, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (18, 90, 2072, 4, 96, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (19, 11, 3073, 7, 55, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (20, 20, 3073, 7, 55, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (21, 30, 3072, 7, 55, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (22, 80, 5072, 15, 55, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (23, 40, 2068, 4, 56, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (24, 50, 2074, 4, 56, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (25, 60, 3112, 8, 56, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (26, 60, 2051, 1, 57, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (27, 40, 2050, 1, 57, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (28, 50, 2062, 2, 85, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (29, 60, 3109, 8, 85, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (30, 80, 3108, 8, 85, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (31, 50, 3062, 9, 84, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (32, 80, 2051, 1, 84, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (33, 80, 3073, 7, 82, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (34, 30, 3076, 12, 82, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (35, 60, 3076, 12, 82, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (36, 60, 5072, 15, 83, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (37, 40, 5071, 15, 83, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (38, 70, 3050, 13, 83, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (39, 80, 3051, 13, 83, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (40, 50, 3048, 13, 83, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (44, 50, 2075, 4, 76, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (45, 60, 2074, 4, 76, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (46, 70, 3072, 7, 76, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (47, 70, 5072, 15, 77, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (48, 40, 5071, 15, 77, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (49, 60, 4062, 54, 77, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (50, 73, 4061, 54, 77, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (51, 73, 2062, 2, 79, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (52, 60, 3051, 13, 79, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (53, 80, 3050, 13, 79, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (54, 50, 2051, 1, 80, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (55, 60, 2051, 1, 80, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (56, 60, 3112, 8, 80, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (57, 60, 2075, 4, 71, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (58, 70, 5072, 15, 71, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (59, 70, 3062, 9, 72, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (60, 60, 3060, 9, 72, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (61, 77, 3072, 7, 72, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (62, 77, 2051, 1, 75, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (63, 90, 2043, 1, 75, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (64, 70, 3051, 13, 75, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (65, 44, 3051, 13, 75, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (66, 66, 2041, 1, 75, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (67, 20, 3051, 13, 70, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (68, 30, 3086, 12, 70, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (69, 33, 2051, 1, 69, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (70, 60, 2046, 1, 69, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (71, 50, 4062, 54, 69, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (72, 55, 4060, 54, 69, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (73, 40, 2062, 2, 73, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (74, 70, 2062, 2, 73, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (75, 78, 4062, 54, 73, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (76, 78, 2062, 2, 67, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (77, 40, 2057, 2, 67, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (78, 90, 5072, 15, 67, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (79, 46, 2074, 4, 66, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (80, 46, 2068, 4, 61, 3)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (81, 70, 2057, 2, 61, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (82, 70, 3062, 9, 62, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (83, 70, 3051, 13, 64, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (84, 80, 3048, 13, 64, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (85, 44, 3072, 7, 64, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (86, 44, 3086, 12, 65, 2)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (87, 76, 4061, 54, 65, 6)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (88, 90, 5093, 22, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (89, 11, 5081, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (90, 22, 5082, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (91, 25, 5080, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (92, 26, 5080, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (93, 29, 5078, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (94, 69, 5084, 46, 157, 4)
INSERT [dbo].[Goles] ([idGol], [minuto], [idJugador], [idEquipo], [idPartido], [idTipoGol]) VALUES (95, 79, 5084, 46, 157, 4)
SET IDENTITY_INSERT [dbo].[Goles] OFF
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 1004, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 1005, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 2, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (2, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (3, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (4, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (5, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (6, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (7, 1, 1, N'0')
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (8, 1, 1, N'0')
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1, N'Javier Mascherano', N'362334651', CAST(0x0000839B00000000 AS DateTime), N'javier@gmail.com', N'Javier Mascherano', N'Masculino', 1, 42, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2, N'Angel Di María', N'362334652', CAST(0x0000839B00000000 AS DateTime), N'angel@gmail.com', N'Angel Di María', N'Masculino', 1, 42, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1002, N'Lionel Messi', N'362334653', CAST(0x0000839B00000000 AS DateTime), N'lionel@gmail.com', N'Lionel Messi', N'Masculino', 1, 42, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1009, N'Sergio Aguero', N'362334654', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Aguero', N'Masculino', 1, 42, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1015, N'Agustín Orión', N'362334655', CAST(0x0000839B00000000 AS DateTime), N'agustin@gmail.com', N'Agustín Orión', N'Masculino', 0, 42, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1016, N'Martín Demichellis', N'362334656', CAST(0x0000839B00000000 AS DateTime), N'martin@gmail.com', N'Martín Demichellis', N'Masculino', 1, 42, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1018, N'Marcos Rojo', N'362334657', CAST(0x0000839B00000000 AS DateTime), N'marcos@gmail.com', N'Marcos Rojo', N'Masculino', 1, 42, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (1019, N'Ezequiel Lavezzi', N'362334658', CAST(0x0000839B00000000 AS DateTime), N'ezequiel@gmail.com', N'Ezequiel Lavezzi', N'Masculino', 0, 42, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2016, N'Lucas Biglia', N'362334659', CAST(0x0000839C00000000 AS DateTime), N'lucas@gmail.com', N'Lucas Biglia', N'Masculino', 0, 42, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2017, N'Gonzalo Higuaín', N'362334650', CAST(0x0000839B00000000 AS DateTime), N'gonzalo@gmail.com', N'Gonzalo Higuaín', N'Masculino', 0, 42, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2018, N'Enzo Perez', N'362334691', CAST(0x0000839B00000000 AS DateTime), N'enzo@gmail.com', N'Enzo Perez', N'Masculino', 0, 42, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2019, N'José Basanta', N'362334692', CAST(0x0000839B00000000 AS DateTime), N'jose@gmail.com', N'José Basanta', N'Masculino', 0, 42, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2027, N'Ezequiel Garay', N'362334621', CAST(0x0000839B00000000 AS DateTime), N'ezequiel@gmail.com', N'Ezequiel Garay', N'Masculino', 1, 42, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2029, N'Augusto Fernández', N'362331234', CAST(0x0000839B00000000 AS DateTime), N'augusto@gmail.com', N'Augusto Fernández', N'Masculino', 1, 42, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2030, N'Pablo Zabaleta', N'362334578', CAST(0x0000839B00000000 AS DateTime), N'pablo@gmail.com', N'Pablo Zabaleta', N'Masculino', 1, 42, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2032, N'Sergio Romero', N'362312458', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Romero', N'Masculino', 1, 42, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2033, N'Ricardo Alvarez', N'312345612', CAST(0x0000839B00000000 AS DateTime), N'ricardo@gmail.com', N'Ricardo Alvarez', N'Masculino', 1, 42, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2036, N'Rodrigo Palacio', N'321345679', CAST(0x0000839B00000000 AS DateTime), N'rodrigo@gmail.com', N'Rodrigo Palacio', N'Masculino', 1, 42, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2037, N'Federico Fernández', N'342346780', CAST(0x0000839B00000000 AS DateTime), N'federico@gmail.com', N'Federico Fernández', N'Masculino', 1, 42, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2038, N'Maxi Rodríguez', N'321234908', CAST(0x0000839B00000000 AS DateTime), N'maxi@gmail.com', N'Maxi Rodríguez', N'Masculino', 1, 42, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2039, N'Fernando Gago', N'345678901', CAST(0x0000839B00000000 AS DateTime), N'fernando@gmail.com', N'Fernando Gago', N'Masculino', 0, 42, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2040, N'Marcelo Barovero', N'32123451', CAST(0x0000839B00000000 AS DateTime), N'marcelo.barovero@gmail.com', N'Marcelo Barovero', N'Masculino', 0, 1, N'4650551', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2041, N'Gabriel Mercado', N'36123451', CAST(0x0000839B00000000 AS DateTime), N'gabriel.mercado@gmail.com', N'Gabriel Mercado', N'Masculino', 1, 1, N'4650551', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2042, N'Jonathan Maidana', N'36123453', CAST(0x0000839B00000000 AS DateTime), N'jonathan.maidana', N'Jonathan Maidana', N'Masculino', 1, 1, N'4650551', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2043, N'Ramiro Funes Mori', N'36123454', CAST(0x0000839B00000000 AS DateTime), N'ramiro.funes.mori@gmail.com', N'Ramiro Funes Mori', N'Masculino', 1, 1, N'4650551', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2044, N'Ariel Rojas', N'36123455', CAST(0x0000839B00000000 AS DateTime), N'ariel.rojas@gmail.com', N'Ariel Rojas', N'Masculino', 1, 1, N'4650551', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2045, N'Camilo Mayada', N'36123456', CAST(0x0000839B00000000 AS DateTime), N'camilo.mayada@gmail.com', N'Camilo Mayada', N'Masculino', 0, 1, N'4650551', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2046, N'Fernando Cavenaghi', N'36123457', CAST(0x0000839B00000000 AS DateTime), N'fernando.cavenaghi@gmail.com', N'Fernando Cavenaghi', N'Masculino', 1, 1, N'4650551', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2048, N'Leonardo Pisculichi', N'36123458', CAST(0x0000839B00000000 AS DateTime), N'leonardo.pisculichi@gmail.com', N'Leonardo Pisculichi', N'Masculino', 1, 1, N'4650551', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2049, N'Leonel Vangioni', N'36123459', CAST(0x0000839B00000000 AS DateTime), N'leonel.vangioni@gmail.com', N'Leonel Vangioni', N'Masculino', 1, 1, N'4650551', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2050, N'Matías Kranevitter', N'36123450', CAST(0x0000839B00000000 AS DateTime), N'matías.kranevitter@gmail.com', N'Matías Kranevitter', N'Femenino', 0, 1, N'4650551', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2051, N'Rodrigo Mora', N'36233451', CAST(0x0000839B00000000 AS DateTime), N'rodrigo.mora@gmail.com', N'Rodrigo Mora', N'Masculino', 1, 1, N'4650551', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2052, N'Agustín Orión', N'36123453', CAST(0x0000839B00000000 AS DateTime), N'agustin.orion@gmail.com', N'Agustín Orión', N'Masculino', 0, 2, N'4650551', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2053, N'Daniel Díaz', N'36123454', CAST(0x0000839B00000000 AS DateTime), N'daniel.diaz@gmai.com', N'Daniel Díaz', N'Masculino', 1, 2, N'4650551', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2054, N'Fabián Monzón', N'36123460', CAST(0x0000839B00000000 AS DateTime), N'fabian.monzon@gmail.com', N'Fabián Monzón', N'Masculino', 1, 2, N'4650551', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2055, N'Gino Peruzzi', N'36233461', CAST(0x0000839B00000000 AS DateTime), N'gino.peruzzi@gmail.com', N'Gino Peruzzi', N'Masculino', 1, 2, N'123456', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2057, N'Fernando Gago', N'36233462', CAST(0x0000839B00000000 AS DateTime), N'fernando.gago@gmail.com', N'Fernando Gago', N'Masculino', 1, 2, N'4650551', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2058, N'Marco Torsiglieri', N'36123463', CAST(0x0000839B00000000 AS DateTime), N'marco.torsiglieri@gmail.com', N'Marco Torsiglieri', N'Masculino', 1, 2, N'4650551', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2059, N'Marcelo Meli', N'36123464', CAST(0x0000839B00000000 AS DateTime), N'marcelo.meli@gmail.com', N'Marcelo Meli', N'Femenino', 0, 2, N'4650551', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2060, N'Nicolás Colazo', N'36123465', CAST(0x0000839B00000000 AS DateTime), N'nicolás.colazo@gmail.com', N'Nicolás Colazo', N'Masculino', 1, 2, N'36123465', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2061, N'Andrés Cuba', N'36123466', CAST(0x0000839B00000000 AS DateTime), N'andres.cuba@gmail.com', N'Andrés Cuba', N'Masculino', 1, 2, N'36123466', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2062, N'Daniel Osvaldo', N'36123467', CAST(0x0000839B00000000 AS DateTime), N'daniel.osvaldo@gmail.com', N'Daniel Osvaldo', N'Femenino', 0, 2, N'36123467', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2063, N'Andrés Chavez', N'36123468', CAST(0x0000839B00000000 AS DateTime), N'andres.chavez@gmail.com', N'Andrés Chavez', N'Masculino', 1, 2, N'36123468', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2064, N'Juan Carlos Olave', N'36123468', CAST(0x0000839B00000000 AS DateTime), N'juan.carlos.olave@gmail.com', N'Juan Carlos Olave', N'Masculino', 0, 4, N'36123468', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2065, N'Pier Barrios', N'36123469', CAST(0x0000839B00000000 AS DateTime), N'pier.barrios@gmail.com', N'Pier Barrios', N'Masculino', 1, 4, N'36123469', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2066, N'Guillermo Farré', N'36123470', CAST(0x0000839B00000000 AS DateTime), N'guillermo.farre@gmail.com', N'Guillermo Farre', N'Masculino', 1, 4, N'36123470', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2067, N'Cristian Lema', N'36123471', CAST(0x0000839B00000000 AS DateTime), N'cristian.lema@gmail,com', N'Cristian Lema', N'Masculino', 1, 4, N'36123471', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2068, N'Lucas Zelarrayán', N'36123472', CAST(0x0000839B00000000 AS DateTime), N'lucas.zelarrayan@gmail.com', N'Lucas Zelarrayán', N'Masculino', 1, 4, N'36123472', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2069, N'Cesar Mansanelli', N'36123473', CAST(0x0000839B00000000 AS DateTime), N'cesar.mansanelli@gmail.com', N'Cesar Mansanelli', N'Masculino', 1, 4, N'36123473', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2070, N'Mauro Obolo', N'36123474', CAST(0x0000839B00000000 AS DateTime), N'mauro.obolog@gmail.com', N'Mauro Obolo', N'Masculino', 1, 4, N'36123474', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2072, N'Lucas Parodi', N'36123475', CAST(0x0000839B00000000 AS DateTime), N'lucas.parodi@gmail.com', N'Lucas Parodi', N'Masculino', 1, 4, N'36123474', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2073, N'Claudio Peréz', N'36123476', CAST(0x0000839B00000000 AS DateTime), N'claudio.perez@gmail.com', N'Claudio Peréz', N'Masculino', 1, 4, N'36123476', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2074, N'Emiliano Rigoni', N'36123477', CAST(0x0000839B00000000 AS DateTime), N'emiliano.rigoni@gmail.com', N'Emiliano Rigoni', N'Masculino', 1, 4, N'36123477', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2075, N'Gastón Turús', N'36123478', CAST(0x0000839B00000000 AS DateTime), N'gaston.turus@gmail.com', N'Gastón Turús', N'Masculino', 1, 4, N'36123478', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3040, N'Diego Saja', N'31123456', CAST(0x0000839B00000000 AS DateTime), N'diego.saja@gmail.com', N'Diego Saja', N'Masculino', 0, 13, N'4650551', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3041, N'Mauricio Lollo', N'31123451', CAST(0x0000839B00000000 AS DateTime), N'mauricio.lollo@gmail.com', N'Mauricio Lollo', N'Masculino', 1, 13, N'4650551', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3042, N'Gustavo Bou', N'31123452', CAST(0x0000839B00000000 AS DateTime), N'gustavo.bou@gmail.com', N'Gustavo Bou', N'Masculino', 1, 13, N'4650551', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3043, N'Luciano Aued', N'31123453', CAST(0x0000839B00000000 AS DateTime), N'luciano.aued@gmail.com', N'Luciano Aued', N'Masculino', 0, 13, N'4650551', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3044, N'Ezequiel Videla', N'31123454', CAST(0x0000839B00000000 AS DateTime), N'ezequiel.videla@gmail.com', N'Ezequiel Videla', N'Masculino', 1, 13, N'4650551', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3045, N'Marcos Acuña', N'31123455', CAST(0x0000839B00000000 AS DateTime), N'marcos.acuña@gmail.com', N'Marcos Acuña', N'Masculino', 1, 13, N'4650551', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3047, N'Iván Pillud', N'31123457', CAST(0x0000839B00000000 AS DateTime), N'ivan.pillud@gmail.com', N'Iván Pillud', N'Masculino', 1, 13, N'4650551', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3048, N'Diego Militto', N'31123458', CAST(0x0000839B00000000 AS DateTime), N'diego.militto@gmail.com', N'Diego Militto', N'Masculino', 1, 13, N'4650551', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3049, N'Yonathan Cabral', N'31123459', CAST(0x0000839B00000000 AS DateTime), N'yonatha.cabral@gmail.com', N'Yonathan Cabral', N'Masculino', 1, 13, N'4650551', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3050, N'Ricardo Díaz', N'31123400', CAST(0x0000839B00000000 AS DateTime), N'ricardo.diaz@gmail.com', N'Ricardo Díaz', N'Masculino', 1, 13, N'4650551', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3051, N'Germán Voboril', N'31123401', CAST(0x0000839B00000000 AS DateTime), N'german.voboril@gmail.com', N'Germán Voboril', N'Masculino', 1, 13, N'46650551', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3052, N'Leándro Desábato', N'31233123', CAST(0x0000839B00000000 AS DateTime), N'leandro.desabato@gmai.com', N'Leándro Desábato', N'Masculino', 0, 9, N'4650551', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3053, N'Ismael Damonte', N'31233124', CAST(0x0000839B00000000 AS DateTime), N'ismael.damonte@gmail.com', N'Ismael Damonte', N'Masculino', 1, 9, N'4650551', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3054, N'Guido Carrillo', N'31233125', CAST(0x0000839B00000000 AS DateTime), N'guido.carrillo@gmail.com', N'Guido Carrillo', N'Masculino', 1, 9, N'4650551', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3055, N'Hilario Navarro', N'31233126', CAST(0x0000839B00000000 AS DateTime), N'hilario.navarro@gmail.com', N'Hilario Navarro', N'Masculino', 1, 9, N'4650551', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3056, N'Matías Aguirregaray', N'31123127', CAST(0x0000839B00000000 AS DateTime), N'matias.aguirregaray@gmail.com', N'Matías Aguirregaray', N'Masculino', 1, 9, N'4650551', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3057, N'Juan Sánchez Miño', N'36121000', CAST(0x0000839B00000000 AS DateTime), N'juan.sanchez.mino@gmai.com', N'Juan Sánchez Miño', N'Masculino', 1, 9, N'4650551', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3058, N'Ezequiel Cerutti', N'36123001', CAST(0x0000839B00000000 AS DateTime), N'ezequiel.cerutti@gmail.com', N'Ezequiel Cerutti', N'Masculino', 1, 9, N'4650551', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3059, N'Leonardo Gil', N'36123002', CAST(0x0000839B00000000 AS DateTime), N'leonardo.gil@gmail.com', N'Leonardo Gil', N'Masculino', 1, 9, N'4650551', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3060, N'Diego Vera', N'36123004', CAST(0x0000839B00000000 AS DateTime), N'diego.vera@gmail.com', N'Diego Vera', N'Masculino', 1, 9, N'36123004', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3061, N'Jonathan Schunke', N'36233006', CAST(0x0000839B00000000 AS DateTime), N'jonathan.schunke@gmail.com', N'Jonathan Schunke', N'Masculino', 1, 9, N'4650551', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3062, N'Luciano Vargas', N'36233007', CAST(0x0000839B00000000 AS DateTime), N'luciano.vargas@gmail.com', N'Luciano Vargas', N'Masculino', 1, 9, N'4650551', 28)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3063, N'Mauro Cetto', N'31123010', CAST(0x0000839B00000000 AS DateTime), N'mauro.cetto@gmail.com', N'Mauro Cetto', N'Masculino', 0, 7, N'4650551', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3064, N'Juan Ignacio Mercier', N'31123011', CAST(0x0000839B00000000 AS DateTime), N'juan.ignacio.mercier@gmail.com', N'Juan Ignacio Mercier', N'Masculino', 1, 7, N'4650551', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3065, N'Matías Caruzzo', N'31123012', CAST(0x0000839B00000000 AS DateTime), N'matias.carruzo@gmail.com', N'Matías Caruzzo', N'Masculino', 1, 7, N'4650551', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3066, N'Julio Buffarini', N'31123013', CAST(0x0000839B00000000 AS DateTime), N'julio.buffarini@gmail.com', N'Julio Buffarini', N'Masculino', 1, 7, N'4650551', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3067, N'Enzo Kalinski', N'36123016', CAST(0x0000839B00000000 AS DateTime), N'enzo.kalinski@gmail.com', N'Enzo Kalinski', N'Masculino', 1, 7, N'4650551', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3068, N'Leandro Romagnoli', N'36123018', CAST(0x0000839B00000000 AS DateTime), N'leandro.romagnoli@gmail.com', N'Leandro Romagnoli', N'Masculino', 1, 7, N'4650551', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3069, N'Sebastián Torrico', N'31123451', CAST(0x0000839B00000000 AS DateTime), N'sebastian.torrico@gmail.com', N'Sebastián Torrico', N'Masculino', 1, 7, N'4650551', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3070, N'Emmanuel Mas', N'31123459', CAST(0x0000839B00000000 AS DateTime), N'emmanuel.mas@gmail.com', N'Emmanuel Mas', N'Masculino', 1, 7, N'4650551', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3071, N'Sebastián Blanco', N'34123651', CAST(0x0000839B00000000 AS DateTime), N'sebastian.blanco@gmail.com', N'Sebastián Blanco', N'Masculino', 1, 7, N'4650551', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3072, N'Mauro Matos', N'34123652', CAST(0x0000839B00000000 AS DateTime), N'mauro.matos@gmail.com', N'Mauro Matos', N'Masculino', 1, 7, N'4650551', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3073, N'Franco Mussis', N'34123653', CAST(0x0000839B00000000 AS DateTime), N'franco.mussis@gmail.com', N'Franco Mussis', N'Masculino', 1, 7, N'4650551', 28)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3074, N'Alán Arregue', N'21123321', CAST(0x0000839B00000000 AS DateTime), N'alan.arregue@gmail.com', N'Alán Arregue', N'Masculino', 0, 12, N'4650551', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3075, N'Emiliano Amor', N'21123322', CAST(0x0000839B00000000 AS DateTime), N'emiliano.amor@gmail.com', N'Emiliano Amor', N'Masculino', 1, 12, N'4650551', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3076, N'Mariano Pavone', N'21123001', CAST(0x0000839B00000000 AS DateTime), N'mariano.pavone@gmail.com', N'Mariano Pavone', N'Masculino', 1, 12, N'4650551', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3077, N'Milton Caraglio', N'21123002', CAST(0x0000839B00000000 AS DateTime), N'milton.caraglio@gmail.com', N'Milton Caraglio', N'Masculino', 1, 12, N'4650551', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3078, N'Jorge Correa', N'21123003', CAST(0x0000839B00000000 AS DateTime), N'jorge.correa@gmail.com', N'Jorge Correa', N'Masculino', 1, 12, N'4650551', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3080, N'Matías Acuña', N'21123004', CAST(0x0000839B00000000 AS DateTime), N'matias.acuña@gmail.com', N'Matías Acuña', N'Masculino', 1, 12, N'4650551', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3081, N'Leonardo Villalba', N'21123006', CAST(0x0000839B00000000 AS DateTime), N'leonardo.villalba@gmail.com', N'Leonardo Villalba', N'Masculino', 1, 12, N'4650551', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3082, N'Lautaro Gianetti', N'21123007', CAST(0x0000839B00000000 AS DateTime), N'lautaro.gianetti@gmail.com', N'Lautaro Gianetti', N'Masculino', 1, 12, N'4650551', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3083, N'Leonardo Rolón', N'21123008', CAST(0x0000839B00000000 AS DateTime), N'leonardo.rolon@gmail.com', N'Leonardo Rolón', N'Masculino', 1, 12, N'4650551', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3084, N'Leandro Desábato', N'21123009', CAST(0x0000839B00000000 AS DateTime), N'leandro.desabato@gmail.com', N'Leandro Desábato', N'Masculino', 1, 12, N'4650551', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3085, N'Lucas Romero', N'21123010', CAST(0x0000839B00000000 AS DateTime), N'lucas.romero@gmail.com', N'Lucas Romero', N'Masculino', 1, 12, N'4650551', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3086, N'Facundo Cardozo', N'21123011', CAST(0x0000839B00000000 AS DateTime), N'facundo.cardozo@gmail.com', N'Facundo Cardozo', N'Masculino', 1, 12, N'4650551', 30)
GO
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3087, N'Fernando Monetti', N'21123013', CAST(0x0000839B00000000 AS DateTime), N'fernando.monetti@gmail.com', N'Fernando Monetti', N'Masculino', 0, 3, N'4650551', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3088, N'Alejandro Silva', N'21123014', CAST(0x0000839B00000000 AS DateTime), N'alejandro.silva@gmail.com', N'Alejandro Silva', N'Masculino', 1, 3, N'4650551', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3089, N'Carlos Araujo', N'21123015', CAST(0x0000839B00000000 AS DateTime), N'caros.araujo@gmail.com', N'Carlos Araujo', N'Masculino', 1, 3, N'4650551', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3091, N'Matías Fitzler', N'21123016', CAST(0x0000839B00000000 AS DateTime), N'matias.fitzler@gmail.com', N'Matías Fitzler', N'Masculino', 1, 3, N'4650551', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3093, N'Maximiliano Vellázquez', N'21123017', CAST(0x0000839B00000000 AS DateTime), N'maximiliano.vellazquez@gmail.com', N'Maximiliano Vellázquez', N'Masculino', 1, 3, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3094, N'Lautaro Acosta', N'21123018', CAST(0x0000839B00000000 AS DateTime), N'lautaro.acosta@gmail.com', N'Lautaro Acosta', N'Masculino', 1, 3, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3095, N'Gustavo Gomez', N'21123019', CAST(0x0000839B00000000 AS DateTime), N'gustavo.gomez@gmail.com', N'Gustavo Gomez', N'Masculino', 1, 3, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3096, N'Nicolás Pasquini', N'12123300', CAST(0x0000839B00000000 AS DateTime), N'nicolas.pasquini@gmail.com', N'Nicolás Pasquini', N'Masculino', 1, 3, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3097, N'Sergio Gonzalez', N'12123301', CAST(0x0000839B00000000 AS DateTime), N'sergio.gonzalez@gmail.com', N'Sergio Gonzalez', N'Masculino', 1, 3, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3098, N'Lucas Melano', N'12123302', CAST(0x0000839B00000000 AS DateTime), N'lucas.melano@gmail.com', N'Lucas Melano', N'Masculino', 1, 3, N'3512015399', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3099, N'Gonzalo Di Renzo', N'12123303', CAST(0x0000839B00000000 AS DateTime), N'gonzalo.di.renzo@gmail.com', N'Gonzalo Di Renzo', N'Masculino', 1, 3, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3100, N'Diego Rodríguez', N'12123304', CAST(0x0000839B00000000 AS DateTime), N'diego.rodriguez@gmail.com', N'Diego Rodríguez', N'Masculino', 0, 8, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3101, N'Cristian Tula', N'12123305', CAST(0x0000839B00000000 AS DateTime), N'cristian.tula@gmail.com', N'Cristian Tula', N'Masculino', 1, 8, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3102, N'Lucas Villalba', N'12123306', CAST(0x0000839B00000000 AS DateTime), N'lucas.villalba', N'Lucas Villalba', N'Masculino', 1, 8, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3103, N'Carlos Bellocq', N'12123307', CAST(0x0000839B00000000 AS DateTime), N'carlos.bellocq@gmail.com', N'Carlos Bellocq', N'Masculino', 1, 8, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3104, N'Federico Mancuello', N'12123308', CAST(0x0000839B00000000 AS DateTime), N'federico.mancuello@gmail.com', N'Federico Mancuello', N'Masculino', 1, 8, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3106, N'Juan Martín Lucero', N'12123309', CAST(0x0000839B00000000 AS DateTime), N'juan.martin.lucero@gmail.com', N'Juan Martín Lucero', N'Masculino', 1, 8, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3107, N'José Adolfo Valencia', N'12123310', CAST(0x0000839B00000000 AS DateTime), N'adolfo.valencia@gmail.com', N'José Adolfo Valencia', N'Masculino', 1, 8, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3108, N'Emiliano Papa', N'12123311', CAST(0x0000839B00000000 AS DateTime), N'emiliano.papa@gmail.com', N'Emiliano Papa', N'Masculino', 1, 8, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3109, N'Alexis Zárate', N'12123312', CAST(0x0000839B00000000 AS DateTime), N'alexis.zarate@gmail.com', N'Alexis Zárate', N'Masculino', 1, 8, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3110, N'Martín Benitez', N'12123313', CAST(0x0000839B00000000 AS DateTime), N'martin.benitez@gmail.com', N'Martín Benitez', N'Masculino', 1, 8, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3111, N'Matías Pisano', N'12123314', CAST(0x0000839B00000000 AS DateTime), N'matias.pisano@gmail.com', N'Matías Pisano', N'Masculino', 1, 8, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3112, N'Claudio Aquino', N'21123044', CAST(0x0000839B00000000 AS DateTime), N'claudio.aquino@gmail.com', N'Claudio Aquino', N'Masculino', 1, 8, N'3512015399', 33)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3113, N'Franco Lazzaroni', N'12321009', CAST(0x0000839B00000000 AS DateTime), N'franco.lazzaroni@gmail.com', N'Franco Lazzaroni', N'Masculino', 0, 59, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3114, N'Lucas Alario', N'12321010', CAST(0x0000839B00000000 AS DateTime), N'lucas.alario@gmail.com', N'Lucas Alario', N'Masculino', 1, 59, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3115, N'Mariano Bíttollo', N'21123400', CAST(0x0000839B00000000 AS DateTime), N'mariano.bittollo@gmail.com', N'Mariano Bíttollo', N'Masculino', 1, 59, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3116, N'Lucas Landa', N'12321400', CAST(0x0000839B00000000 AS DateTime), N'lucas.landa@gmail.com', N'Lucas Landa', N'Masculino', 1, 59, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3117, N'Pablo Cuevas', N'12321401', CAST(0x0000839B00000000 AS DateTime), N'pablo.cuevas@gmail.com', N'Pablo Cuevas', N'Masculino', 1, 59, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3118, N'Emiliano García', N'32123451', CAST(0x0000839B00000000 AS DateTime), N'emiliano.garcia@gmail.com', N'Emiliano García', N'Masculino', 1, 59, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3119, N'Daniel Perez', N'32123452', CAST(0x0000839B00000000 AS DateTime), N'daniel.perez@gmail.com', N'Daniel Perez', N'Masculino', 1, 59, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3120, N'Cristian Guanca', N'32123453', CAST(0x0000839B00000000 AS DateTime), N'cristian.guanca@gmail.com', N'Cristian Guanca', N'Masculino', 1, 59, N'3512015399', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3121, N'Pablo Ledesma', N'32123454', CAST(0x0000839B00000000 AS DateTime), N'pablo.ledesma@gmail.com', N'Pablo Ledesma', N'Masculino', 1, 59, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3122, N'Germán Conti', N'32123455', CAST(0x0000839B00000000 AS DateTime), N'german.conti@gmail.com', N'Germán Conti', N'Masculino', 1, 59, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (3123, N'Andrés Mehring', N'34123543', CAST(0x0000839B00000000 AS DateTime), N'andres.m@gmail.com', N'Andrés Mehring', N'Masculino', 1, 59, N'3512015399', 35)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4040, N' Alcayaga Alejandro', N'34123111', CAST(0x0000839B00000000 AS DateTime), N'alcayaga.alejandro@gmail.com', N' Alcayaga Alejandro', N'Masculino', 0, 58, N'35120153993', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4041, N'Gonzalo Bettini', N'34123112', CAST(0x0000839B00000000 AS DateTime), N'gonzalo.bettini@gmail.com', N'Gonzalo Bettini', N'Masculino', 1, 58, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4042, N'Fabián Noguera', N'34123113', CAST(0x0000839B00000000 AS DateTime), N'fabian.noguera@gmail.com', N'Fabián Noguera', N'Masculino', 1, 58, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4043, N'Emanuel Cechini', N'34123114', CAST(0x0000839B00000000 AS DateTime), N'emanuel.cechini@gmail.com', N'Emanuel Cechini', N'Masculino', 1, 58, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4044, N'Claudio Villagra', N'34123115', CAST(0x0000839B00000000 AS DateTime), N'claudio.villagra@gmail.com', N'Claudio Villagra', N'Masculino', 1, 58, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4045, N'Iván Rossi', N'34123116', CAST(0x0000839B00000000 AS DateTime), N'ivan.rossi@gmail.com', N'Iván Rossi', N'Masculino', 1, 58, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4046, N'Eric Remedo', N'32456333', CAST(0x0000839B00000000 AS DateTime), N'eric.remedo@gmail.com', N'Eric Remedo', N'Masculino', 1, 58, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4047, N'Jorge Rodríguez', N'32456334', CAST(0x0000839B00000000 AS DateTime), N'jorge.rodriguez@gmail.com', N'Jorge Rodríguez', N'Masculino', 1, 58, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4048, N'Federico Sarobe', N'32456335', CAST(0x0000839B00000000 AS DateTime), N'federico.sarobe@gmail.com', N'Federico Sarobe', N'Masculino', 1, 58, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4049, N'Juan Alberto Cuellar', N'32456336', CAST(0x0000839B00000000 AS DateTime), N'juan.alberto.cuellar@gmail.com', N'Juan Alberto Cuellar', N'Masculino', 1, 58, N'3512015399', 35)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4050, N'Enzo Trinidad', N'32456337', CAST(0x0000839B00000000 AS DateTime), N'enzo.trinidad@gmail.com', N'Enzo Trinidad', N'Masculino', 1, 58, N'3512015399', 37)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4051, N'Gastón Corvalán', N'31222123', CAST(0x0000839B00000000 AS DateTime), N'gaston.corvalan@gmail.com', N'Gastón Corvalán', N'Masculino', 0, 54, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4052, N'Marcos Cáceres', N'31222124', CAST(0x0000839B00000000 AS DateTime), N'marcos.caceres@gmail.com', N'Marcos Cáceres', N'Masculino', 1, 54, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4053, N'Victor Lopez', N'31222125', CAST(0x0000839B00000000 AS DateTime), N'victor.lopez@gmail.com', N'Victor Lopez', N'Masculino', 1, 54, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4054, N'Ezequiel Ponce', N'31222126', CAST(0x0000839B00000000 AS DateTime), N'ezequiel.ponce@gmail.com', N'Ezequiel Ponce', N'Masculino', 1, 54, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4056, N'Victor Figueroa', N'31222127', CAST(0x0000839B00000000 AS DateTime), N'victor.figueroa@gmail.com', N'Victor Figueroa', N'Masculino', 1, 54, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4057, N'Mauricio Tevez', N'31222128', CAST(0x0000839B00000000 AS DateTime), N'mauricio.tevez@gmail.com', N'Mauricio Tevez', N'Masculino', 1, 54, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4058, N'Federico Fattori', N'31222129', CAST(0x0000839B00000000 AS DateTime), N'federico.fattori@gmail.com', N'Federico Fattori', N'Masculino', 1, 54, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4059, N'Oscar Ustari', N'31222130', CAST(0x0000839B00000000 AS DateTime), N'oscar.ustari@gmail.com', N'Oscar Ustari', N'Masculino', 1, 54, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4060, N'Martin Tonso', N'31224001', CAST(0x0000839B00000000 AS DateTime), N'martin.tonso@gmail.com', N'Martin Tonso', N'Masculino', 1, 54, N'3512015399', 28)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4061, N'Ignacio Scocco', N'31213001', CAST(0x0000839B00000000 AS DateTime), N'ignacio.scocco@gmail.com', N'Ignacio Scocco', N'Masculino', 1, 54, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4062, N'Franco Escobar', N'31213002', CAST(0x0000839B00000000 AS DateTime), N'franco.escobar@gmail.com', N'Franco Escobar', N'Masculino', 1, 54, N'3512015399', 36)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4063, N'Yair Bonnin', N'31213003', CAST(0x0000839B00000000 AS DateTime), N'yair.bonin@gmail.com', N'Yair Bonnin', N'Masculino', 0, 57, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4064, N'Facundo Oreja', N'31213004', CAST(0x0000839B00000000 AS DateTime), N'facundo.oreja@gmail.com', N'Facundo Oreja', N'Masculino', 1, 57, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4065, N'Pablo Vegetti', N'31213005', CAST(0x0000839B00000000 AS DateTime), N'pablo.vegetti@gmail.com', N'Pablo Vegetti', N'Masculino', 1, 57, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4066, N'Matías García', N'310000001', CAST(0x0000839B00000000 AS DateTime), N'matias.garcia@gmail.com', N'Matías García', N'Masculino', 1, 57, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4067, N'Juan Pablo Pocholo', N'310000002', CAST(0x0000839B00000000 AS DateTime), N'pablo.pocholo@gmail.com', N'Juan Pablo Pocholo', N'Masculino', 1, 57, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4068, N'Walter Bou', N'310000003', CAST(0x0000839B00000000 AS DateTime), N'walter.bou@gmail.com', N'Walter Bou', N'Masculino', 1, 57, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4069, N'Maximiliano Coronel', N'310000004', CAST(0x0000839B00000000 AS DateTime), N'maximiliano.corone@gmail.com', N'Maximiliano Coronel', N'Masculino', 1, 57, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4070, N'Facundo Urquiza', N'300000001', CAST(0x0000839B00000000 AS DateTime), N'facundo.urquiza@gmail.com', N'Facundo Urquiza', N'Masculino', 1, 57, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4071, N'Leandro Contín', N'300000002', CAST(0x0000839B00000000 AS DateTime), N'leandro.contin@gmail.com', N'Leandro Contín', N'Masculino', 1, 57, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4072, N'Alejandro Delgado', N'300000003', CAST(0x0000839B00000000 AS DateTime), N'alejandro.delgado@gmail.com', N'Alejandro Delgado', N'Masculino', 1, 57, N'3512015399', 37)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4073, N'Omar Pouso', N'300000004', CAST(0x0000839B00000000 AS DateTime), N'omar.pouso@gmail.com', N'Omar Pouso', N'Masculino', 1, 57, N'3512015399', 41)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4074, N'Gustavo Noguera', N'30001001', CAST(0x0000839B00000000 AS DateTime), N'gustavo.noguera@gmail.com', N'Gustavo Noguera', N'Masculino', 0, 56, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4075, N'Joel Carli', N'30001002', CAST(0x0000839B00000000 AS DateTime), N'joel.carli@gmail.com', N'Joel Carli', N'Masculino', 1, 56, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4076, N'Carlos Bieler', N'30001003', CAST(0x0000839B00000000 AS DateTime), N'carlos.bieler@gmail.com', N'Carlos Bieler', N'Masculino', 1, 56, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4077, N'Diego buonanotte', N'30001004', CAST(0x0000839B00000000 AS DateTime), N'diego.buonanote@gmail.com', N'Diego buonanotte', N'Masculino', 1, 56, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4078, N'Nicolás Cabrera', N'30001005', CAST(0x0000839B00000000 AS DateTime), N'nicolas.cabrebra@gmail.com', N'Nicolás Cabrera', N'Masculino', 1, 56, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4079, N'Nicolas Lopez', N'30001006', CAST(0x0000839B00000000 AS DateTime), N'nicolas.lopez@gmail.com', N'Nicolas Lopez', N'Masculino', 1, 56, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4080, N'Ruben Ramirez', N'30001007', CAST(0x0000839B00000000 AS DateTime), N'ruben.ramirez@gmail.com', N'Ruben Ramirez', N'Masculino', 1, 56, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4081, N'Fabian Assman', N'30001008', CAST(0x0000839B00000000 AS DateTime), N'fabian.assman@gmail.com', N'Fabian Assman', N'Masculino', 1, 56, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4082, N'Lucas Suarez', N'30001009', CAST(0x0000839B00000000 AS DateTime), N'lucas.suarez@gmail.com', N'Lucas Suarez', N'Masculino', 1, 56, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4083, N'Alan Alegre', N'30001010', CAST(0x0000839B00000000 AS DateTime), N'alan.alegre@gmail.com', N'Alan Alegre', N'Masculino', 1, 56, N'3512015399', 31)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4084, N'Adrian Fernández', N'30001011', CAST(0x0000839B00000000 AS DateTime), N'adrian.fernandez@gmail.com', N'Adrian Fernández', N'Masculino', 1, 56, N'3512015399', 37)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4085, N'Damián Martínez', N'30001012', CAST(0x0000839B00000000 AS DateTime), N'damian.martinez@gmail.com', N'Damián Martínez', N'Masculino', 0, 55, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4086, N'Walter Busse', N'30001013', CAST(0x0000839B00000000 AS DateTime), N'walter.busse@gmail.com', N'Walter Busse', N'Masculino', 1, 55, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4087, N'Ciro Ruis', N'30001014', CAST(0x0000839B00000000 AS DateTime), N'ciro.rius@gmail.com', N'Ciro Ruis', N'Masculino', 1, 55, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4089, N'Facundo Curuchet', N'30001015', CAST(0x0000839B00000000 AS DateTime), N'facundo.curuchet@gmail.com', N'Facundo Curuchet', N'Masculino', 1, 55, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4090, N'Federico Maya', N'30001016', CAST(0x0000839B00000000 AS DateTime), N'federico.maya@gmail.com', N'Federico Maya', N'Masculino', 1, 55, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4091, N'Gonzalo Cabrera', N'30001017', CAST(0x0000839B00000000 AS DateTime), N'gonzalo.cabrera@gmail.com', N'Gonzalo Cabrera', N'Masculino', 1, 55, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4092, N'Gabriel Arias', N'30001018', CAST(0x0000839B00000000 AS DateTime), N'gabriel.arias@gmail.com', N'Gabriel Arias', N'Masculino', 1, 55, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4093, N'Juan Tejera', N'30001019', CAST(0x0000839B00000000 AS DateTime), N'juan.tejera@gmail.com', N'Juan Tejera', N'Masculino', 1, 55, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4094, N'Mariano Barbieri', N'30001020', CAST(0x0000839B00000000 AS DateTime), N'mariano.barbieri@gmail.com', N'Mariano Barbieri', N'Masculino', 1, 55, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4095, N'Carlos Matheu', N'30001021', CAST(0x0000839B00000000 AS DateTime), N'carlos.matheu@gmail.com', N'Carlos Matheu', N'Masculino', 1, 55, N'3512015399', 28)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4096, N'Axel Juarez', N'30001022', CAST(0x0000839B00000000 AS DateTime), N'axel.juarez@gmail.com', N'Axel Juarez', N'Masculino', 1, 55, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4097, N'Ariel Bulasio', N'30001023', CAST(0x0000839B00000000 AS DateTime), N'ariel.bulassio@gmail.com', N'Ariel Bulasio', N'Masculino', 0, 21, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4098, N'Franco Canever', N'30001024', CAST(0x0000839B00000000 AS DateTime), N'franco.canever@gmail.com', N'Franco Canever', N'Masculino', 1, 21, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4099, N'Hernan Lamberti', N'30001025', CAST(0x0000839B00000000 AS DateTime), N'hernan.lamberti@gmail.com', N'Hernan Lamberti', N'Masculino', 1, 21, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4100, N'Federico León', N'30001026', CAST(0x0000839B00000000 AS DateTime), N'federico.leon@gmail.com', N'Federico León', N'Masculino', 1, 21, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4101, N'Jonathan Galván', N'30001027', CAST(0x0000839B00000000 AS DateTime), N'jonathan.galvan@gmail.com', N'Jonathan Galván', N'Masculino', 1, 21, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4103, N'Roger Martínez', N'30001028', CAST(0x0000839B00000000 AS DateTime), N'roger.martinez@gmail.com', N'Roger Martínez', N'Masculino', 1, 21, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4104, N'Leonardo Fredes', N'30001029', CAST(0x0000839B00000000 AS DateTime), N'leonardo.fredes@gmail.com', N'Leonardo Fredes', N'Masculino', 1, 21, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4105, N'Alejandro Capurro', N'30001030', CAST(0x0000839B00000000 AS DateTime), N'alejandro.capurro@gmail.com', N'Alejandro Capurro', N'Masculino', 1, 21, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4106, N'Brian Toro', N'30001031', CAST(0x0000839B00000000 AS DateTime), N'brian.toro@gmail.com', N'Brian Toro', N'Masculino', 1, 21, N'3512015399', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4107, N'Nicolás Miracco', N'30001032', CAST(0x0000839B00000000 AS DateTime), N'nicolas.miracco@gmail.com', N'Nicolás Miracco', N'Masculino', 1, 21, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (4108, N'Carlos Soto', N'30001033', CAST(0x0000839B00000000 AS DateTime), N'carlos.soto@gmail.com', N'Carlos Soto', N'Masculino', 1, 21, N'3512015399', 33)
GO
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5040, N'Erik Godoy', N'39000000', CAST(0x0000839B00000000 AS DateTime), N'erik.godoy@gmail.com', N'Erik Godoy', N'Masculino', 0, 17, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5041, N'Carlos Luna', N'39000001', CAST(0x0000839B00000000 AS DateTime), N'carlos.luna@gmail.com', N'Carlos Luna', N'Masculino', 1, 17, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5042, N'Fernando Lugo', N'39000002', CAST(0x0000839B00000000 AS DateTime), N'fernando.lugo@gmail.com', N'Fernando Lugo', N'Masculino', 1, 17, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5043, N'Alexis Castro', N'39000003', CAST(0x0000839B00000000 AS DateTime), N'alexis.castro@gmail.com', N'Alexis Castro', N'Masculino', 1, 17, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5044, N'Sebastián Rincón', N'39000004', CAST(0x0000839B00000000 AS DateTime), N'sebastian.rincon@gmail.com', N'Sebastián Rincón', N'Masculino', 1, 17, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5045, N'Facundo Sánchez', N'39000005', CAST(0x0000839B00000000 AS DateTime), N'facundo.sanchez@gmail.com', N'Facundo Sánchez', N'Masculino', 1, 17, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5046, N'Mariano Echeverría', N'39000006', CAST(0x0000839B00000000 AS DateTime), N'mariano.echeverria@gmail.com', N'Mariano Echeverría', N'Masculino', 1, 17, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5047, N'Sebastián Silguero', N'39000007', CAST(0x0000839B00000000 AS DateTime), N'sebastian.silguero@gmail.com', N'Sebastián Silguero', N'Masculino', 1, 17, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5048, N'Ignacio Bonadio', N'39000008', CAST(0x0000839B00000000 AS DateTime), N'ignacio.bonadio@gmail.com', N'Ignacio Bonadio', N'Masculino', 1, 17, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5049, N'Nicolás Pantaleone', N'39000009', CAST(0x0000839B00000000 AS DateTime), N'nicolas.pantaleone@gmail.com', N'Nicolás Pantaleone', N'Masculino', 1, 17, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5050, N'José Erick Correa', N'39000010', CAST(0x0000839B00000000 AS DateTime), N'jose.erik.correa@gmail.com', N'José Erick Correa', N'Masculino', 1, 17, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5051, N'Rodrigo Rey', N'39000011', CAST(0x0000839B00000000 AS DateTime), N'rodrigo.rey@gmail.com', N'Rodrigo Rey', N'Masculino', 0, 14, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5052, N'Esteban Burgos', N'39000012', CAST(0x0000839B00000000 AS DateTime), N'esteban.burgos@gmail.com', N'Esteban Burgos', N'Masculino', 1, 14, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5053, N'Daniel González', N'39000013', CAST(0x0000839B00000000 AS DateTime), N'daniel.gonzalez@gmail.com', N'Daniel González', N'Masculino', 1, 14, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5054, N'Juan Fernando Garro', N'39000014', CAST(0x0000839B00000000 AS DateTime), N'juan.fernando.garro@gmail.com', N'Juan Fernando Garro', N'Masculino', 1, 14, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5055, N'Agustín Díaz', N'39000015', CAST(0x0000839B00000000 AS DateTime), N'agustian.diaz@gmail.com', N'Agustín Díaz', N'Masculino', 1, 14, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5056, N'Javier Correa', N'39000016', CAST(0x0000839B00000000 AS DateTime), N'javier.correa@gmail.com', N'Javier Correa', N'Masculino', 1, 14, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5057, N'Ángel González', N'39000017', CAST(0x0000839B00000000 AS DateTime), N'angel.gonzalez@gmail.com', N'Ángel González', N'Masculino', 1, 14, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5058, N'Ezequiel Bonacorso', N'39000018', CAST(0x0000839B00000000 AS DateTime), N'ezequiel.bonacorso@gmail.com', N'Ezequiel Bonacorso', N'Masculino', 1, 14, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5059, N'Juan Manuel Barrera', N'39000019', CAST(0x0000839B00000000 AS DateTime), N'juan.manuel.barrera@gmail.com', N'Juan Manuel Barrera', N'Masculino', 1, 14, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5060, N'Diego Viera', N'39000020', CAST(0x0000839B00000000 AS DateTime), N'diego.viera@gmail.com', N'Diego Viera', N'Masculino', 1, 14, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5061, N'Emanuel García', N'39000021', CAST(0x0000839B00000000 AS DateTime), N'emanuel.garcia@gmail.com', N'Emanuel García', N'Masculino', 1, 14, N'3512015399', 33)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5062, N'Damián Pérez', N'39000022', CAST(0x0000839B00000000 AS DateTime), N'damian.perez@gmail.com', N'Damián Pérez', N'Masculino', 0, 15, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5063, N'José San Román', N'39000030', CAST(0x0000839B00000000 AS DateTime), N'jose.san.roman@gmail.com', N'José San Román', N'Masculino', 0, 15, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5064, N'Jorge Curbello', N'39000031', CAST(0x0000839B00000000 AS DateTime), N'jorge.curbello@gmail.com', N'Jorge Curbello', N'Masculino', 1, 15, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5065, N'Cristian Manuel Chávez', N'39000032', CAST(0x0000839B00000000 AS DateTime), N'cristian.manuel.chavez@gmail.com', N'Cristian Manuel Chávez', N'Masculino', 1, 15, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5066, N'Emilio Zelaya', N'39000033', CAST(0x0000839B00000000 AS DateTime), N'emilio.zelaya@gmail.com', N'Emilio Zelaya', N'Masculino', 1, 15, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5067, N'Lucas Pugh', N'39000034', CAST(0x0000839B00000000 AS DateTime), N'lucas.pugh@gmail.com', N'Lucas Pugh', N'Masculino', 1, 15, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5068, N'Federico Freire', N'39000035', CAST(0x0000839B00000000 AS DateTime), N'federico.freire@gmail.com', N'Federico Freire', N'Masculino', 1, 15, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5069, N'Federico Milo', N'39000036', CAST(0x0000839B00000000 AS DateTime), N'federico.milo@gmail.com', N'Federico Milo', N'Masculino', 1, 15, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5070, N'Iván Vargas', N'39000037', CAST(0x0000839B00000000 AS DateTime), N'ivan.vargas@gmail.com', N'Iván Vargas', N'Masculino', 1, 15, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5071, N'Esteban Andrada', N'39000038', CAST(0x0000839B00000000 AS DateTime), N'esteban.andrada@gmail.com', N'Esteban Andrada', N'Masculino', 1, 15, N'3512015399', 31)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5072, N'Fabián Muñoz', N'39000039', CAST(0x0000839B00000000 AS DateTime), N'fabian.muñoz@gmail.com', N'Fabián Muñoz', N'Masculino', 1, 15, N'3512015399', 39)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5073, N'Manuel Neuer', N'39000000', CAST(0x0000839B00000000 AS DateTime), N'manuel.neuer@gmail.com', N'Manuel Neuer', N'Masculino', 0, 46, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5074, N'Philipp Lahm', N'39000001', CAST(0x0000839B00000000 AS DateTime), N'philipp.lahm@gmail.com', N'Philipp Lahm', N'Masculino', 1, 46, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5075, N'Jerome Boateng', N'39000002', CAST(0x0000839B00000000 AS DateTime), N'jerome.boateng@gmail.com', N'Jerome Boateng', N'Masculino', 1, 46, N'3', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5076, N'Mats Hummels', N'39000003', CAST(0x0000839B00000000 AS DateTime), N'mats.hummels@gmail.com', N'Mats Hummels', N'Masculino', 1, 46, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5077, N'Benedikt Howedes', N'39000005', CAST(0x0000839B00000000 AS DateTime), N'benedikt.howedes@gmail.com', N'Benedikt Howedes', N'Masculino', 1, 46, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5078, N'Sami Khedira', N'39000006', CAST(0x0000839B00000000 AS DateTime), N'sami.khedira@gmail.com', N'Sami Khedira', N'Masculino', 1, 46, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5079, N'Bastian Schweinsteiger', N'39000007', CAST(0x0000839B00000000 AS DateTime), N'bastian.schweinsteiger@gmail.com', N'Bastian Schweinsteiger', N'Masculino', 1, 46, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5080, N'Toni Kroos', N'39000008', CAST(0x0000839B00000000 AS DateTime), N'toni.kroos@gmail.com', N'Toni Kroos', N'Masculino', 1, 46, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5081, N'Tomás Muller', N'39000009', CAST(0x0000839B00000000 AS DateTime), N'tomás.muller@gmail.com', N'Tomás Muller', N'Masculino', 1, 46, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5082, N'Miroslav Klose', N'39000010', CAST(0x0000839B00000000 AS DateTime), N'miroslav.klose@gmail.com', N'Miroslav Klose', N'Masculino', 1, 46, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5083, N'Mesut Ozil', N'39000011', CAST(0x0000839B00000000 AS DateTime), N'mesut.ozil@gmail.com', N'Mesut Ozil', N'Masculino', 1, 46, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5084, N'André Schurrle', N'39000014', CAST(0x0000839B00000000 AS DateTime), N'andré.schurrle@gmail.com', N'André Schurrle', N'Masculino', 1, 46, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5085, N'Julio Cesar', N'39000015', CAST(0x0000839B00000000 AS DateTime), N'julio.cesar@gmail.com', N'Julio Cesar', N'Masculino', 0, 22, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5086, N'Maicon Douglas', N'39000016', CAST(0x0000839B00000000 AS DateTime), N'maicon.douglas@gmail.com', N'Maicon Douglas', N'Masculino', 1, 22, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5087, N'David Luiz', N'39000017', CAST(0x0000839B00000000 AS DateTime), N'David Luiz', N'David Luiz', N'Masculino', 1, 22, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5088, N'Dante Bonfim', N'39000018', CAST(0x0000839B00000000 AS DateTime), N'dante.bonfim@gmail.com', N'Dante Bonfim', N'Masculino', 1, 22, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5089, N'Marcelo Vieira', N'39000019', CAST(0x0000839B00000000 AS DateTime), N'marcela.vieira@gmail.com', N'Marcelo Vieira', N'Masculino', 1, 22, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5090, N'Fernando Luiz ', N'39000020', CAST(0x0000839B00000000 AS DateTime), N'fernando.luiz@gmail.com', N'Fernando Luiz ', N'Masculino', 1, 22, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5091, N'Luis Gustavo', N'39000021', CAST(0x0000839B00000000 AS DateTime), N'luis.gustavo@gmail.com', N'Luis Gustavo', N'Masculino', 1, 22, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5092, N'Bernard', N'39000022', CAST(0x0000839B00000000 AS DateTime), N'bernand@gmail.com', N'Bernard', N'Masculino', 1, 22, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5093, N'Oscar', N'39000023', CAST(0x0000839B00000000 AS DateTime), N'oscar@gmail.com', N'Oscar', N'Masculino', 1, 22, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5094, N'Hulk', N'39000024', CAST(0x0000839B00000000 AS DateTime), N'hulk@gmail.com', N'Hulk', N'Masculino', 1, 22, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5095, N'Fred', N'39000026', CAST(0x0000839B00000000 AS DateTime), N'fred@gmail.com', N'Fred', N'Masculino', 1, 22, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5096, N'Jasper Cillessen', N'39000027', CAST(0x0000839B00000000 AS DateTime), N'Jasper.Cillessen@gmail.com', N'Jasper Cillessen', N'Masculino', 1, 27, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5097, N'Dirk Kuyt', N'39000028', CAST(0x0000839B00000000 AS DateTime), N'dirk.kuyt@gmail.com', N'Dirk Kuyt', N'Masculino', 0, 27, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5098, N'Stefan De Vrij', N'39000029', CAST(0x0000839B00000000 AS DateTime), N'stefan.deVrij@gmail.com', N'Stefan De Vrij', N'Masculino', 1, 27, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5099, N'Ron Vlaar', N'39000030', CAST(0x0000839B00000000 AS DateTime), N'ron.vlaar@gmail.om', N'Ron Vlaar', N'Masculino', 1, 27, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5100, N'Bruno Martins Indi', N'39000031', CAST(0x0000839B00000000 AS DateTime), N'bruno.martins.indi@gmail.com', N'Bruno Martins Indi', N'Masculino', 1, 27, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5101, N'Daley Blind', N'39000032', CAST(0x0000839B00000000 AS DateTime), N'daley.blind@gmail.com', N'Daley Blind', N'Masculino', 1, 27, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5102, N'Georginio Wijnaldum', N'39000034', CAST(0x0000839B00000000 AS DateTime), N'georginio.wijnaldum@gmail.com', N'Georginio Wijnaldum', N'Masculino', 1, 27, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5104, N'Nigel de Jong', N'39000035', CAST(0x0000839B00000000 AS DateTime), N'nigel.de.jong@gmail.com', N'Nigel de Jong', N'Masculino', 1, 27, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5105, N'Wesley Sneijder', N'39000036', CAST(0x0000839B00000000 AS DateTime), N'wesley.sneijder@gmail.com', N'Wesley Sneijder', N'Masculino', 1, 27, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5106, N'Robin van Persie ', N'39000037', CAST(0x0000839B00000000 AS DateTime), N'robin.van.persie@gmail.com', N'Robin van Persie ', N'Masculino', 1, 27, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5107, N'Arjen Robben', N'39000038', CAST(0x0000839B00000000 AS DateTime), N'arjen.robben@gmail.com', N'Arjen Robben', N'Masculino', 1, 27, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5109, N'Emanuel Bilbao', N'39000050', CAST(0x0000839B00000000 AS DateTime), N'emanuel.bilbao@gmail.com', N'Emanuel Bilbao', N'Masculino', 1, 10, N'3512015399', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5110, N'Adrián Martinez', N'39000051', CAST(0x0000839B00000000 AS DateTime), N'Adrián.Martinez@gmail.com', N'Adrián Martinez', N'Masculino', 0, 10, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5111, N'Cristian Villanueva', N'39000052', CAST(0x0000839B00000000 AS DateTime), N'cristian.Villanueva@gmail.com', N' Cristian Villanueva', N'Masculino', 0, 10, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5112, N'David Vega', N'39000053', CAST(0x0000839B00000000 AS DateTime), N'jorge.curbello@gmail.com', N'David Vega', N'Masculino', 1, 10, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5113, N'Lucas Orozco', N'39000054', CAST(0x0000839B00000000 AS DateTime), N'cristian.manuel.chavez@gmail.com', N'Lucas Orozco', N'Masculino', 1, 10, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5114, N'Juan Manuel Cobo', N'39000055', CAST(0x0000839B00000000 AS DateTime), N'emilio.zelaya@gmail.com', N'Juan Manuel Cobo', N'Masculino', 1, 10, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5115, N'Marcelo Vidal', N'39000056', CAST(0x0000839B00000000 AS DateTime), N'lucas.pugh@gmail.com', N' Marcelo Vidal', N'Masculino', 1, 10, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5116, N'Diego Sosa', N'39000057', CAST(0x0000839B00000000 AS DateTime), N'federico.freire@gmail.com', N'Diego Sosa', N'Masculino', 0, 10, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5117, N'Nicolás Royón', N'39000058', CAST(0x0000839B00000000 AS DateTime), N'federico.milo@gmail.com', N'Nicolás Royón', N'Masculino', 1, 10, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5118, N'Joel David Acosta', N'39000059', CAST(0x0000839B00000000 AS DateTime), N'ivan.vargas@gmail.com', N'Joel David Acosta', N'Masculino', 1, 10, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (5119, N'Javier Soñer', N'39000060', CAST(0x0000839B00000000 AS DateTime), N'esteban.andrada@gmail.com', N'Javier Soñer', N'Masculino', 1, 10, N'3512015399', 30)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
SET IDENTITY_INSERT [dbo].[MotivosSancion] ON 

INSERT [dbo].[MotivosSancion] ([idMotivoSancion], [nombre]) VALUES (1, N'Actitud antideportiva')
INSERT [dbo].[MotivosSancion] ([idMotivoSancion], [nombre]) VALUES (2, N'Deuda')
SET IDENTITY_INSERT [dbo].[MotivosSancion] OFF
SET IDENTITY_INSERT [dbo].[Noticias] ON 

INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (1, N'Driussi no, Mora sí', 1004, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">El pibe es el único de los titulares del último superclásico que quedó fuera de la lista de concentrados para recibir el jueves a Cruzeiro. Aunque llegan con lo justo, Gallardo convocó al uruguayo y a los afectados por lo ocurrido en la Bombonera. También regresan Teo y Mercado.</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px; font-family: arial, helvetica, clean, sans-serif;"><p style="padding: 0px; margin-bottom: 10px;">Marcelo Gallardo cuenta con varios jugadores que todavía no tienen presencia asegurada para recibir el jueves a Cruzeiro, pero igualmente los incluyó en la lista de concentrados y los esperará hasta último momento. El caso más importante es el de Rodrigo Mora, quien lleva dos días sin entrenarse a la par de sus compañeros por un problema en la rodilla, pero igualmente entró en la nómina de 19 convocados.</p><p style="padding: 0px; margin-bottom: 10px;">Con respecto a los que habían sido concentrados para visitar a Boca, las únicas modificaciones en la lista son los ingresos de Gabriel Mercado y Teo Gutiérrez, quienes ya purgaron sus suspensiones y serán titular, y la salida de Sebastián Driussi, quien estuvo internado hasta el lunes por un virus y tendrá para dos semanas de recuperación. Ponzio, Funes Mori y el resto de los afectados por lo que ocurrió en la Bombonera también quedarán concentrados.</p><p style="padding: 0px; margin-bottom: 10px;"><span _mce_style="text-decoration: underline;" style="padding: 0px; margin: 0px; text-decoration: underline;">La lista completa: </span>Marcelo Barovero, Julio Chiarini; Gabriel Mercado, Germán Pezzella, Ramiro Funes Mori, Jonatan Maidana, Emanuel Mammana, Leonel Vangioni; Carlos Sánchez, Camilo Mayada, Ariel Rojas, Matías Kranevitter, Leonardo Ponzio, Leonardo Pisculichi, Gonzalo Martínez; Fernando Cavenaghi, Teófilo Gutiérrez, Rodrigo Mora y Lucas Boyé.</p></div>', CAST(0x0000A49D0103293B AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (2, N'Los que hicieron esto no son de Boca', 1004, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Angelici contó que el Panadero Napolitano, autor material de la agresión al plantel de River, pertenece a una agrupación opositora aunque no le consta que sea barra. "Pediremos la expulsión como socios del club de todos los implicados", avisó.</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px; font-family: arial, helvetica, clean, sans-serif;"><p style="padding: 0px; margin-bottom: 10px;">La reveladora filmación, en donde se observa cómo una persona desde la tribuna rocía con ese gas tóxico la manga donde estaban los jugadores de River, permitió identificar a los autores materiales del hecho. Y Daniel Angelici, sin nombrarlo a Adrián Napolitano (alias el Panadero), se refirió al episodio y a las consecuencias que tendrían todos los implicados. "Que nosotros sepamos no es barra. Sí hace mucho que está en el club. Esta persona pertenece a una agrupación opositora. Una agrupación que estuvo con Mauricio en la primera gestión y luego se transformó en opositora de él y lógicamente ahora también a mí. Digón ya salió a decir que esa persona ya no pertenece a su agrupación. No así el que viene acompañando atrás. Pero bueno, una vez que tengamos todos los datos vamos a poder comunicárselo al verdadero hincha de Boca. Porque los que hicieron esto no son de Boca. Por su culpa fuimos expulsados de la Copa. Es la primera vez en la historia que Boca es descalificado de un torneo internacional", se quejó.</p><p style="padding: 0px; margin-bottom: 10px;">Sobre los barrabravas en el fútbol en general y en Boca en particular, opinó: "Nadie los quiere. Yo no conozco a ningún dirigente que los quiera. No le aportan nada al club. Pero tampoco nadie hace nada para erradicarlos. Para hacerlo se necesita la ayuda del Estado. ¿Cómo se hizo en Inglaterra para acabar con ellos? Fue el Estado que decidió erradicar a los violentos". Sobre los barras de su club, comentó: "Hace tiempo que tienen carnet y pagan la cuota. Cuando Di Zeo estuvo privado de la libertad, el club le dio de baja como socio por falta de pago. Cuando salió, le dijimos que no lo íbamos a reincorporar. Pero el juez entendió que si él venía y pagaba lo que debía, debíamos devolverle el carnet de socio. Así te pasa con las distintas cartas documento que te llegan de los barras. No podés tener a una persona con derecho de admisión sin un motivo. Cuando Mauro Martín quedó detenido, le dimos de baja. Estuvo un año y medio en la cárcel, luego salió absuelto. ¿Cómo hago yo para mantener el derecho de admisión? Porque ese derecho roza rápido con la discriminación. Tenés que tener antecedentes. Entonces, es el Estado el que lo tiene que hacer".</p><p style="padding: 0px; margin-bottom: 10px;">Sobre las medidas que puede tomar el club con relación a los implicados en el atentado a los jugadores de River, avisó: "Iniciaremos los trámites para pedir la expulsión del club como socios. Sólo los puede echar la Asamblea de Representantes de Socios".</p></div>', CAST(0x0000A49D010380EB AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (3, N'En la AFA me dijeron que tenía que arreglar con la barra', 1004, N'<div class="galera" style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-family: arial, helvetica, clean, sans-serif; font-size: 13px; line-height: 16.0030002593994px;"><h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px;">Javier Cantero, ex presidente del Rojo, recordó cómo fue su lucha contra los violentos: "No tuve acompañamiento. Un presidente salió a apoyarme y lo destrozaron. Para el resto yo era un loco".</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px;"><p style="padding: 0px; margin-bottom: 10px;">Hay dos cosas que marcaron a fuego la gestión de Javier Cantero como presidente de Independiente: el descenso del club a la B Nacional y la pelea con la barra. Más allá del fracaso que tuvo en lo deportivo, la lucha que emprendió ante los violentos tampoco llegó a buen puerto. Para él, no haber logrado el objetivo se debió, en parte, a la falta de ayuda. No sólo del Estado sino del resto de los clubes del fútbol argentino. "Me faltó acompañamiento. En la AFA me dijeron: ''Hay que arreglar con la barra, esto no es un country''. Salió Quique Lombardi, presidente de Estudiantes, a apoyarme públicamente y lo destrozaron. El resto pensó que se levantarían otros también en favor mío. Yo le pedí que no diera más la cara por mí porque iba a ser peor para él. Para el resto yo era un loco", contó en Rock &amp; Pop.</p><p style="padding: 0px; margin-bottom: 10px;">El ex mandatario del Rojo recordó la guerra que tuvo con Bebote y Cía. comparado con el atentado que hubo en el superclásico copero contra los jugadores de River. "Lamento lo que pasó el otro día. Lo vi por tele y no lo podía creer. A mí me pasó también, que suspendieron un partido porque tiraron bombas a la cancha (contra Belgrano en el Libertadores). No alcanza con las decisiones de los dirigentes. Se necesita del resto de la sociedad, de los policías y de los demás hinchas. Yo no fracasé. Podría haber acordado algunas cosas, como darle plata a la Policía. Quizá no me hubiera ido tan mal para los ojos de afuera, pero yo no podría mirar más a los ojos a mis hijos. Nosotros llegamos al club con la bandera antiviolencia, lo intenté y nos quedó el mote de fracasados. Pero otros no fracasaron porque no tuvieron huevos para intentarlo. Igual, en la calle, la gente me lo reconoce", afirmó.</p><p style="padding: 0px; margin-bottom: 10px;">Para Cantero, el problema no son sólo los barras. "Se carga mucho las tintas sobre la barra, que es un componente gravísimo, pero también están los dirigentes y la Policía. Por ejemplo, un día me vendieron 950 efectivos para un operativo policial, los conté con un escribano y eran sólo 650. De visitante los clubes nos llevamos un porcentaje de las entradas. Puse escribanos en los accesos de las canchas visitantes y me di cuenta que los clubes locales nos estaban robando. El día que fui a la AFA a presentar el detalle de lo que había ocurrido me llamó Grondona y me reprochó: ''¿Qué hacés? Esto no es así... Tenés que hacerles lo mismo a ellos cuando vayan a tu cancha''. Los barras son feos y malos, pero no son los únicos".</p><p style="padding: 0px; margin-bottom: 10px;">Pese a lo difícil que parece erradicar a los violentos del fútbol por el contexto, Cantero no lo ve como algo imposible. "Cuando dicen que no hay solución, digo que nosotros, que éramos unos pobres cuatro de copas, estuvimos dos años y medio en el club y no les dimos nada a los barras, ni dinero, ni entradas, ni viajes, nada. Y lo pudimos hacer. ¿Cómo no lo van a poder hacer los otros clubes? Tendría que ser una política de Estado y todos llevarlo adelante. Los políticos que tomen esto en cuenta seguramente van a obtener un rédito político porque el hincha común, si hacen algo, se los va a agradecer".</p><div><br></div></div></div>', CAST(0x0000A49D0103D315 AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (4, N'¡Una buena, Vasco!', 1005, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Recuperado de la distensión ligamentaria en su rodilla, Erbes volvió a trabajar a la par de sus compañeros y podría reaparecer el domingo contra Aldosivi. El Pichi vuelve justo para cubrir la partida de Cubas con la Selección Sub 20.</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px; font-family: arial, helvetica, clean, sans-serif;"><p style="padding: 0px; margin-bottom: 10px;">Mientras la realidad extrafutbolística de Boca sigue creciendo entre declaraciones cruzadas, investigaciones y muchas versiones sobre lo que ocurrió el jueves pasado en la Bombonera, Arruabarrena debe juntar la tropa y empezar a pensar en cómo seguir. En ese marco, la práctica de este martes tuvo una buena: Cristian Erbes volvió a entrenarse a la par de sus compañeros.</p><p style="padding: 0px; margin-bottom: 10px;">El Pichi había sufrido una distensión del ligamento de la rodilla izquierda en el partido contra Montevideo Wanderers en Uruguay, que lo mantuvo alejado de las canchas durante más de un mes, incluyendo la serie de choques contra River.</p><p style="padding: 0px; margin-bottom: 10px;">Gran noticia para el Vasco, ya que Cubas partió recientemente con la Selección Sub 20 para empezar la preparación del Mundial de la categoría, y Erbes significa un alta de lujo teniendo en cuenta que, hasta la lesión, para Arruabarrena era titular indicutido. ¿Reaparecerá contra Aldosivi?</p></div>', CAST(0x0000A49D010462FE AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (5, N'¿Qué tiene Cruzeiro?', 1005, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Perdió a sus principales figuras y de visitante es muy cauteloso. Este año no logró encontrar una línea de juego. Sus puntos altos son el arquero Fabio y el delantero Damiao. Lo analiza un editor de Hoje em Dia, de Belo Horizonte.</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px; font-family: arial, helvetica, clean, sans-serif;"><p style="padding: 0px; margin-bottom: 10px;">Este Cruzeiro que se enfrentará a River Plate tiene poco o nada del equipo que ganó el Brasileira en 2013 y 2014. Después del título del año pasado, las principales figuras se negociaron: Everton Ribeiro, Ricardo Goulart, Lucas Silva y Marcelo Moreno, sin contar a Nilton y a Egidio.</p><p style="padding: 0px; margin-bottom: 10px;">Además, hay jugadores importantes que se lesionaron, como el defensor Dede y el delantero Julio Baptista. Luego llegaron muchos refuerzos de peso, especialmente el armador uruguayo De Arrascaeta y el delantero Leandro Damiao, que son actualmente los principales nombres junto al portero Fabio. Pero estamos en mayo y el Zeiro todavía no se pudo encontrar como equipo. Hay veces que los jugadores no entran en conexión y falta dinámica de juego. El partido contra el San Pablo, que le valió la clasificación a cuartos de final, fue atípico y el mejor del año. Si el equipo consigue mantener ese nivel, puede tener alguna chance contra River. De lo contrario, no habrá manera.</p><p style="padding: 0px; margin-bottom: 10px;">Un detalle es que en la Copa el equipo juega con demasiada cautela, casi como un invitado que hace todo más fácil para el rival. Es una actitud que tiene que cambiar: sería un suicidio a renunciar a atacar a River en el Monumental.</p></div>', CAST(0x0000A49D0104A02F AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (6, N'No da pistas', 1005, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Independiente realizó su entrenamiento matutino en el predio de Villa Domínico, pero Jorge Almirón sólo dispuso trabajos tácticos y de definición, por lo que aún no paró el equipo que jugará el clásico ante Racing.</h1><div class="cuerpo" style="padding: 0px; margin: 0px 0px 20px; color: rgb(51, 51, 51); font-size: 14px; line-height: 19px; font-family: arial, helvetica, clean, sans-serif;"><p style="padding: 0px; margin-bottom: 10px;">Es la semana más importante del semestre. Al condimento especial del clásico ante Racing, Independiente le suma la posibilidad de renacer como equipo y volver a ser el de las primeras fechas, dándole algo de aire a Jorge Almirón al frente del plantel. Además, el envión anímico sería importante, dejando atrás una racha de seis encuentros sin victorias.</p><p style="padding: 0px; margin-bottom: 10px;">En vistas de ello, en el predio de Villa Domínico, el Rojo se entrenó este martes bajo una permanente llovizna. El plantel realizó principalmente tareas físicas con pelota y movimientos tácticos. Sobre el final de la práctica, el DT dispuso un trabajo de definición, una de las falencias más destacadas de los últimos encuentros. El grupo se retiró sin dar declaraciones y volverá a verse las caras este miércoles por la mañana también en Domínico.</p><p style="padding: 0px; margin-bottom: 10px;">En cuanto al posible equipo que enfrentará a la Academia, Almirón no dio pistas pero podrá contar con Víctor Cuesta (remplazaría a Emanuel Aguilera) y con los recuperados Claudio Riaño y Gustavo Toledo.</p></div>', CAST(0x0000A49D0104FE05 AS DateTime), 1)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (7, N'Final Champinons', 1005, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Mora estuvo con hielo en la rodilla y no se entrenó por segundo día consecutivo, pero el jugador confía en poder jugar el jueves contra Cruzeiro y Gallardo lo incluyó entre los concentrados. Vuelven Teo y Mercado. ¿Quién va por Driussi?</h1>', CAST(0x0000A49D010549F2 AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (8, N'Tercera Fecha', 1005, N'<span style="color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">El sabor raro en la boca por no haber pasado de ronda en la cancha, como todos querían en River, y de los violentos episodios que se vivieron en la Bombonera, empiezan a quedar atrás de la expectativa por recibir el jueves a Cruzeiro, por los cuartos de final de la Copa. Y aunque algunos jugadores llegan con lo justo desde lo físico, ninguno quiere quedarse afuera. Por segundo día consecutivo, Rodrigo Mora no se entrenó a la par de sus compañeros pero el uruguayo está decidido a jugar.</span>', CAST(0x0000A49D010564E0 AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (9, N'Cuarta Fecha', 1005, N'<p style="padding: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">Más allá de esto, es un hecho el regreso de Mercado al lateral derecho en lugar de Mammana, y como a Teo le dieron una sola fecha y evolucionó muy bien de su ¿desgarro?, el colombiano también estará entre los 11. El que no estará es Driussi, afectado por un síndrome meníngeo. Y para reemplazarlo hay varios candidatos. ¿El Pity se retrasa para hacer la banda o ingresa Rojas? Define Gallardo el miércoles.</p><p style="padding: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">¿Serán estos? Barovero; Mercado, Maidana, Funes Mori, Vangioni; Sánchez, Ponzio, Kranevitter, Pity Martínez o Rojas; Mora y Teo Gutiérrez</p>', CAST(0x0000A49D01057EC1 AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (10, N'Final Apertura', 1005, N'<span style="color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">Trabajos con un kinesiólogo y hielo en su rodilla izquierda, todavía inflamada, fueron los únicos movimientos de Mora en una práctica que estuvo centrada en ejercicios físicos y de definición para el resto del plantel. Gallardo sabe que es el mejor de River en el semestre y por eso lo cuida. Lo va a esperar hasta el finel pero ya lo incluyó en la lista de concentrados. Por otro lado, aunque ya se entrenan con normalidad, Ponzio y Funes Mori serán evaluados de cerca hasta último momento, teniendo en cuenta que fueron los más afectados por lo que pasó en la Bombonera.</span>', CAST(0x0000A49D01059DD4 AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (11, N'Final Clausura', 1004, N'<h1 style="padding: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 15px; font-weight: bold; color: rgb(51, 51, 51); line-height: 20px; font-family: arial, helvetica, clean, sans-serif;">Mora estuvo con hielo en la rodilla y no se entrenó por segundo día consecutivo, pero el jugador confía en poder jugar el jueves contra Cruzeiro y Gallardo lo incluyó entre los concentrados. Vuelven Teo y Mercado. ¿Quién va por Driussi?</h1>', CAST(0x0000A49D0105BF07 AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (12, N'Cuarta Fecha', 1004, N'<p style="padding: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">El sabor raro en la boca por no haber pasado de ronda en la cancha, como todos querían en River, y de los violentos episodios que se vivieron en la Bombonera, empiezan a quedar atrás de la expectativa por recibir el jueves a Cruzeiro, por los cuartos de final de la Copa. Y aunque algunos jugadores llegan con lo justo desde lo físico, ninguno quiere quedarse afuera. Por segundo día consecutivo, Rodrigo Mora no se entrenó a la par de sus compañeros pero el uruguayo está decidido a jugar.</p><p style="padding: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">Trabajos con un kinesiólogo y hielo en su rodilla izquierda, todavía inflamada, fueron los únicos movimientos de Mora en una práctica que estuvo centrada en ejercicios físicos y de definición para el resto del plantel. Gallardo sabe que es el mejor de River en el semestre y por eso lo cuida. Lo va a esperar hasta el finel pero ya lo incluyó en la lista de concentrados. Por otro lado, aunque ya se entrenan con normalidad, Ponzio y Funes Mori serán evaluados de cerca hasta último momento, teniendo en cuenta que fueron los más afectados por lo que pasó en la Bombonera.</p>', CAST(0x0000A49D0105DB3E AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (13, N'Quinta Fecha', 1004, N'<b>A<span style="color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; line-height: 20px;">ngelici contó que el Panadero Napolitano, autor material d</span></b><span style="color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-weight: bold; line-height: 20px;">e la agresión al plantel de River, pertenece a una agrupación opositora aunque no le consta que sea barra. "Pediremos la expulsión como socios del club de todos los implicados", avisó.</span>', CAST(0x0000A49D010604AA AS DateTime), 2)
INSERT [dbo].[Noticias] ([idNoticia], [titulo], [idEdicion], [descripcion], [fecha], [idCategoriaNoticia]) VALUES (14, N'Semifinal', 1004, N'<span style="color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif; font-size: 14px; line-height: 19px;">Sobre las medidas que puede tomar el club con relación a los implicados en el atentado a los jugadores de River, avisó: "Iniciaremos los trámites para pedir la expulsión del club como socios. Sólo los puede echar la Asamblea de Representantes de Socios".</span>', CAST(0x0000A49D0106275F AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Noticias] OFF
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (46, 1, 1, 1, 1005, 4, 13, CAST(0x0000A48F00FE0F10 AS DateTime), NULL, 13, 16, 16, 1, 0, 4, 13, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (47, 1, 1, 1, 1005, 12, 1, CAST(0x0000A49300FE5560 AS DateTime), NULL, 13, 13, 13, 0, 2, 1, 12, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (48, 1, 1, 1, 1005, 54, 8, CAST(0x0000A49200FEE200 AS DateTime), NULL, 13, 14, 15, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (49, 1, 1, 1, 1005, 7, 2, CAST(0x0000A49000FF6EA0 AS DateTime), NULL, 13, 15, 12, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (50, 1, 1, 1, 1005, 15, 9, CAST(0x0000A49100FFB4F0 AS DateTime), NULL, 13, 15, 15, 1, 0, 15, 9, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (51, 2, 1, 1, 1005, 4, 1, CAST(0x0000A49000FFFB40 AS DateTime), NULL, 13, 16, 16, 1, 0, 4, 1, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (52, 2, 1, 1, 1005, 13, 8, CAST(0x0000A49100FFFB40 AS DateTime), NULL, 13, 16, 16, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (53, 2, 1, 1, 1005, 12, 2, CAST(0x0000A49101004190 AS DateTime), NULL, 13, 14, 15, 1, 2, 2, 12, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (54, 2, 1, 1, 1005, 54, 9, CAST(0x0000A491010087E0 AS DateTime), NULL, 13, 15, 16, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (55, 2, 1, 1, 1005, 7, 15, CAST(0x0000A491010087E0 AS DateTime), NULL, 13, 16, 15, 3, 1, 7, 15, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (56, 3, 1, 1, 1005, 4, 8, CAST(0x0000A49E010087E0 AS DateTime), NULL, 13, 15, 15, 2, 1, 4, 8, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (57, 3, 1, 1, 1005, 1, 2, CAST(0x0000A4A00100CE30 AS DateTime), NULL, 13, 15, 16, 2, 0, 1, 2, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (58, 3, 1, 1, 1005, 13, 9, CAST(0x0000A4920107AC00 AS DateTime), NULL, 13, 16, 13, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (59, 3, 1, 1, 1005, 12, 15, CAST(0x0000A4A00107AC00 AS DateTime), NULL, 13, 16, 14, 3, 1, 12, 15, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (60, 3, 1, 1, 1005, 54, 7, CAST(0x0000A49F0107AC00 AS DateTime), NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (61, 4, 1, 1, 1005, 4, 2, CAST(0x0000A49F0107AC00 AS DateTime), NULL, 13, 16, 16, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (62, 4, 1, 1, 1005, 8, 9, CAST(0x0000A4990107F250 AS DateTime), NULL, 13, 16, 16, 0, 1, 9, 8, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (63, 4, 1, 1, 1005, 1, 15, CAST(0x0000A49F0107F250 AS DateTime), NULL, 13, 15, 15, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (64, 4, 1, 1, 1005, 13, 7, CAST(0x0000A4990107F250 AS DateTime), NULL, 13, 16, 12, 2, 1, 13, 7, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (65, 4, 1, 1, 1005, 12, 54, CAST(0x0000A49F010838A0 AS DateTime), NULL, 13, 15, 11, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (66, 5, 1, 1, 1005, 4, 9, CAST(0x0000A48D010838A0 AS DateTime), NULL, 13, 15, 13, 1, 0, 4, 9, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (67, 5, 1, 1, 1005, 2, 15, CAST(0x0000A48C010838A0 AS DateTime), NULL, 13, 11, 11, 2, 1, 2, 15, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (68, 5, 1, 1, 1005, 8, 7, CAST(0x0000A48D01087EF0 AS DateTime), NULL, 13, 12, 10, 3, 0, 8, 7, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (69, 5, 1, 1, 1005, 1, 54, CAST(0x0000A48D01297470 AS DateTime), NULL, 13, 16, 13, 2, 2, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (70, 5, 1, 1, 1005, 13, 12, CAST(0x0000A48C01087EF0 AS DateTime), NULL, 13, 16, 13, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (71, 6, 1, 1, 1005, 4, 15, CAST(0x0000A49301499700 AS DateTime), NULL, 13, 11, 11, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (72, 6, 1, 1, 1005, 9, 7, CAST(0x0000A494011102A0 AS DateTime), NULL, 13, 13, 11, 2, 1, 9, 7, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (73, 6, 1, 1, 1005, 2, 54, CAST(0x0000A494011102A0 AS DateTime), NULL, 13, 14, 12, 2, 1, 2, 54, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (74, 6, 1, 1, 1005, 8, 12, CAST(0x0000A493010FE960 AS DateTime), NULL, 13, 16, 16, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (75, 6, 1, 1, 1005, 1, 13, CAST(0x0000A493011148F0 AS DateTime), NULL, 13, 15, 11, 3, 2, 1, 13, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (76, 7, 1, 1, 1005, 4, 7, CAST(0x0000A49A010DB6E0 AS DateTime), NULL, 13, 16, 16, 2, 1, 4, 7, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (77, 7, 1, 1, 1005, 15, 54, CAST(0x0000A49B0128A180 AS DateTime), NULL, 13, 15, 15, 2, 2, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (78, 7, 1, 1, 1005, 9, 12, CAST(0x0000A49B010E89D0 AS DateTime), NULL, 13, 14, 9, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (79, 7, 1, 1, 1005, 2, 13, CAST(0x0000A49B010E89D0 AS DateTime), NULL, 13, 12, 12, 1, 2, 13, 2, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (80, 7, 1, 1, 1005, 8, 1, CAST(0x0000A49B010F1670 AS DateTime), NULL, 13, 11, 11, 1, 2, 1, 8, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (81, 8, 1, 1, 1005, 4, 54, CAST(0x0000A4A2012B60A0 AS DateTime), NULL, 13, 13, 13, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (82, 8, 1, 1, 1005, 7, 12, CAST(0x0000A4A100E6B680 AS DateTime), NULL, 13, 11, 10, 1, 2, 12, 7, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (83, 8, 1, 1, 1005, 15, 13, CAST(0x0000A4A1014AF690 AS DateTime), NULL, 13, 14, 14, 2, 3, 13, 15, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (84, 8, 1, 1, 1005, 9, 1, CAST(0x0000A4A20109DE80 AS DateTime), NULL, 13, 15, 15, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (85, 8, 1, 1, 1005, 2, 8, CAST(0x0000A4A101391C40 AS DateTime), NULL, 13, 16, 16, 1, 2, 8, 2, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (86, 9, 1, 1, 1005, 4, 12, CAST(0x0000A4A600E81610 AS DateTime), NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (87, 9, 1, 1, 1005, 54, 13, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (88, 9, 1, 1, 1005, 7, 1, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (89, 9, 1, 1, 1005, 15, 8, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (90, 9, 1, 1, 1005, 9, 2, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (91, 1, 1, 1, 1004, 7, 4, CAST(0x0000A49001015AD0 AS DateTime), NULL, 13, 15, 16, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (92, 1, 1, 1, 1004, 3, 8, CAST(0x0000A49101015AD0 AS DateTime), NULL, 13, 16, 16, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (93, 2, 1, 1, 1004, 7, 8, CAST(0x0000A4970101A120 AS DateTime), NULL, 13, 16, 16, 2, 0, 7, 8, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (94, 2, 1, 1, 1004, 4, 3, CAST(0x0000A4920101E770 AS DateTime), NULL, 13, 15, 15, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (95, 3, 1, 1, 1004, 7, 3, CAST(0x0000A4920101E770 AS DateTime), NULL, 13, 15, 15, 1, 0, 7, 3, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (96, 3, 1, 1, 1004, 8, 4, CAST(0x0000A4910101E770 AS DateTime), NULL, 13, 15, 16, 1, 2, 4, 8, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (97, 1, 1, 1, 1, 22, 25, CAST(0x0000A34C01213710 AS DateTime), NULL, 13, NULL, NULL, 4, 1, 22, 25, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (98, 1, 1, 1, 1, 24, 23, CAST(0x0000A35301217D60 AS DateTime), NULL, 13, NULL, NULL, 3, 1, 24, 23, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (99, 2, 1, 1, 1, 22, 23, CAST(0x0000A3480121C3B0 AS DateTime), NULL, 13, NULL, NULL, 3, 1, 22, 23, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (100, 2, 1, 1, 1, 25, 24, CAST(0x0000A3490121C3B0 AS DateTime), NULL, 13, NULL, NULL, 0, 1, 24, 25, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (101, 3, 1, 1, 1, 22, 24, CAST(0x0000A34D01220A00 AS DateTime), NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (102, 3, 1, 1, 1, 23, 25, CAST(0x0000A34E01225050 AS DateTime), NULL, 13, NULL, NULL, 4, 0, 23, 25, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (103, 1, 2, 1, 1, 27, 29, CAST(0x0000A34E012BA6F0 AS DateTime), NULL, 13, NULL, NULL, 3, 2, 27, 29, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (104, 1, 2, 1, 1, 28, 26, CAST(0x0000A34E012BA6F0 AS DateTime), NULL, 13, NULL, NULL, 2, 0, 28, 26, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (105, 2, 2, 1, 1, 27, 26, CAST(0x0000A4B6012C3390 AS DateTime), NULL, 13, NULL, NULL, 5, 1, 27, 26, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (106, 2, 2, 1, 1, 29, 28, CAST(0x0000A349012C3390 AS DateTime), NULL, 13, NULL, NULL, 1, 3, 28, 29, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (107, 3, 2, 1, 1, 27, 28, NULL, NULL, 13, NULL, NULL, 2, 0, 27, 28, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (108, 3, 2, 1, 1, 26, 29, NULL, NULL, 13, NULL, NULL, 3, 0, 26, 29, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (109, 1, 3, 1, 1, 30, 33, NULL, NULL, 13, NULL, NULL, 4, 1, 30, 33, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (110, 1, 3, 1, 1, 31, 32, NULL, NULL, 13, NULL, NULL, 2, 1, 31, 32, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (111, 2, 3, 1, 1, 30, 32, NULL, NULL, 13, NULL, NULL, 2, 1, 30, 32, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (112, 2, 3, 1, 1, 33, 31, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (113, 3, 3, 1, 1, 30, 31, NULL, NULL, 13, NULL, NULL, 3, 0, 30, 31, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (114, 3, 3, 1, 1, 32, 33, NULL, NULL, 13, NULL, NULL, 2, 1, 32, 33, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (115, 1, 4, 1, 1, 35, 36, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (116, 1, 4, 1, 1, 34, 37, NULL, NULL, 13, NULL, NULL, 1, 0, 34, 37, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (117, 2, 4, 1, 1, 35, 37, NULL, NULL, 13, NULL, NULL, 1, 0, 35, 37, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (118, 2, 4, 1, 1, 36, 34, NULL, NULL, 13, NULL, NULL, 1, 2, 34, 36, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (119, 3, 4, 1, 1, 35, 34, NULL, NULL, 13, NULL, NULL, 3, 1, 35, 34, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (120, 3, 4, 1, 1, 37, 36, NULL, NULL, 13, NULL, NULL, 2, 1, 37, 36, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (121, 1, 5, 1, 1, 40, 41, NULL, NULL, 13, NULL, NULL, 3, 0, 40, 41, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (122, 1, 5, 1, 1, 38, 39, NULL, NULL, 13, NULL, NULL, 2, 1, 38, 39, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (123, 2, 5, 1, 1, 40, 39, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (124, 2, 5, 1, 1, 41, 38, NULL, NULL, 13, NULL, NULL, 0, 3, 38, 41, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (125, 3, 5, 1, 1, 40, 38, NULL, NULL, 13, NULL, NULL, 5, 2, 40, 38, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (126, 3, 5, 1, 1, 39, 41, NULL, NULL, 13, NULL, NULL, 2, 1, 39, 41, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (127, 1, 6, 1, 1, 42, 44, NULL, NULL, 13, NULL, NULL, 1, 0, 42, 44, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (128, 1, 6, 1, 1, 45, 43, NULL, NULL, 13, NULL, NULL, 1, 0, 45, 43, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (129, 2, 6, 1, 1, 42, 43, NULL, NULL, 13, NULL, NULL, 2, 1, 42, 43, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (130, 2, 6, 1, 1, 44, 45, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (131, 3, 6, 1, 1, 42, 45, NULL, NULL, 13, NULL, NULL, 3, 2, 42, 45, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (132, 3, 6, 1, 1, 43, 44, NULL, NULL, 13, NULL, NULL, 3, 1, 43, 44, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (133, 1, 7, 1, 1, 46, 48, NULL, NULL, 13, NULL, NULL, 2, 2, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (134, 1, 7, 1, 1, 49, 47, NULL, NULL, 13, NULL, NULL, 2, 2, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (135, 2, 7, 1, 1, 46, 47, NULL, NULL, 13, NULL, NULL, 4, 0, 46, 47, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (136, 2, 7, 1, 1, 48, 49, NULL, NULL, 13, NULL, NULL, 1, 2, 49, 48, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (137, 3, 7, 1, 1, 46, 49, NULL, NULL, 13, NULL, NULL, 1, 0, 46, 49, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (138, 3, 7, 1, 1, 47, 48, NULL, NULL, 13, NULL, NULL, 2, 1, 47, 48, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (139, 1, 8, 1, 1, 50, 53, NULL, NULL, 13, NULL, NULL, 1, 0, 50, 53, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (140, 1, 8, 1, 1, 51, 52, NULL, NULL, 13, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (141, 2, 8, 1, 1, 50, 52, NULL, NULL, 13, NULL, NULL, 1, 0, 50, 52, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (142, 2, 8, 1, 1, 53, 51, NULL, NULL, 13, NULL, NULL, 2, 4, 51, 53, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (143, 3, 8, 1, 1, 50, 51, NULL, NULL, 13, NULL, NULL, 2, 1, 50, 51, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (144, 3, 8, 1, 1, 52, 53, NULL, NULL, 13, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 0)
GO
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (145, 1, 1, 2, 1, 22, 28, CAST(0x0000A358012D9320 AS DateTime), 153, 13, NULL, NULL, 1, 1, 22, 28, 0, 3, 2, 1)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (146, 1, 1, 2, 1, 30, 34, CAST(0x0000A358012D9320 AS DateTime), 153, 13, NULL, NULL, 2, 0, 30, 34, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (147, 1, 1, 2, 1, 40, 45, CAST(0x0000A35A012DD970 AS DateTime), 154, 13, NULL, NULL, 2, 0, 40, 45, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (148, 1, 1, 2, 1, 46, 51, CAST(0x0000A35A012DD970 AS DateTime), 154, 13, NULL, NULL, 2, 1, 46, 51, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (149, 1, 1, 2, 1, 24, 27, CAST(0x0000A359012E1FC0 AS DateTime), 155, 13, NULL, NULL, 1, 2, 27, 24, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (150, 1, 1, 2, 1, 35, 31, CAST(0x0000A359012E1FC0 AS DateTime), 155, 13, NULL, NULL, 1, 1, 35, 31, 0, 5, 3, 1)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (151, 1, 1, 2, 1, 42, 38, CAST(0x0000A33D012E6610 AS DateTime), 156, 13, NULL, NULL, 1, 0, 42, 38, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (152, 1, 1, 2, 1, 49, 50, CAST(0x0000A35B012E6610 AS DateTime), 156, 13, NULL, NULL, 1, 2, 50, 49, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (153, 2, 1, 2, 1, 22, 30, CAST(0x0000A35E012EAC60 AS DateTime), 157, 13, NULL, NULL, 2, 1, 22, 30, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (154, 2, 1, 2, 1, 40, 46, CAST(0x0000A35E012EAC60 AS DateTime), 157, 13, NULL, NULL, 0, 1, 46, 40, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (155, 2, 1, 2, 1, 27, 35, CAST(0x0000A35F012EF2B0 AS DateTime), 158, 13, NULL, NULL, 0, 0, 27, 35, 0, 4, 3, 1)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (156, 2, 1, 2, 1, 42, 50, CAST(0x0000A35F012EF2B0 AS DateTime), 158, 13, NULL, NULL, 1, 0, 42, 50, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (157, 3, 1, 2, 1, 22, 46, CAST(0x0000A362011826C0 AS DateTime), 159, 13, 17, 2029, 1, 7, 46, 22, 0, NULL, NULL, 0)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (158, 3, 1, 2, 1, 27, 42, CAST(0x0000A3630107AC00 AS DateTime), 159, 13, 17, 2029, 0, 0, 42, 27, 0, 2, 4, 1)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (159, 4, 1, 2, 1, 46, 42, CAST(0x0000A36701278840 AS DateTime), 0, 11, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (160, 4, 1, 2, 1, 22, 27, CAST(0x0000A3680127CE90 AS DateTime), 0, 11, 17, 2029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Partidos] OFF
INSERT [dbo].[TablaPosicionesFinal] ([posicion], [idEquipo], [idEdicion]) VALUES (3, 3, 1004)
INSERT [dbo].[TablaPosicionesFinal] ([posicion], [idEquipo], [idEdicion]) VALUES (2, 4, 1004)
INSERT [dbo].[TablaPosicionesFinal] ([posicion], [idEquipo], [idEdicion]) VALUES (1, 7, 1004)
INSERT [dbo].[TablaPosicionesFinal] ([posicion], [idEquipo], [idEdicion]) VALUES (4, 8, 1004)
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

INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (1, 4, 2075, N'A', 30, 46)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (2, 4, 2074, N'A', 50, 46)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (3, 13, 3050, N'R', 50, 46)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (4, 12, 3086, N'R', 50, 47)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (5, 12, 3083, N'A', 30, 47)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (6, 54, 4062, N'A', 30, 48)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (7, 54, 4060, N'A', 50, 48)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (8, 8, 3112, N'A', 70, 48)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (9, 15, 5072, N'A', 70, 50)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (10, 4, 2075, N'A', 70, 51)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (11, 4, 2074, N'A', 50, 51)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (12, 1, 2051, N'A', 50, 51)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (13, 12, 3086, N'A', 50, 53)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (14, 12, 3084, N'A', 50, 53)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (15, 2, 2063, N'A', 50, 53)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (16, 7, 3073, N'A', 40, 91)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (17, 7, 3071, N'A', 60, 91)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (18, 4, 2075, N'R', 60, 91)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (19, 3, 3099, N'R', 60, 92)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (20, 3, 3098, N'A', 60, 92)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (21, 7, 3073, N'A', 60, 93)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (22, 7, 3073, N'A', 33, 55)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (23, 7, 3072, N'A', 50, 55)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (24, 15, 5071, N'R', 50, 55)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (25, 54, 4062, N'A', 60, 54)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (26, 4, 2075, N'A', 60, 56)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (27, 2, 2063, N'A', 60, 85)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (28, 2, 2060, N'R', 70, 85)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (29, 8, 3110, N'A', 80, 85)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (30, 9, 3062, N'A', 80, 84)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (31, 4, 2075, N'A', 80, 81)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (32, 4, 2069, N'A', 50, 81)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (33, 7, 3073, N'A', 50, 82)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (34, 15, 5072, N'A', 50, 83)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (35, 13, 3050, N'A', 50, 83)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (39, 4, 2075, N'A', 50, 76)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (40, 4, 2074, N'A', 70, 76)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (41, 7, 3073, N'R', 30, 76)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (42, 15, 5072, N'R', 30, 77)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (43, 15, 5067, N'A', 50, 77)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (44, 9, 3062, N'A', 50, 78)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (45, 2, 2063, N'A', 50, 79)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (46, 8, 3112, N'A', 50, 80)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (47, 8, 3112, N'A', 50, 74)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (48, 12, 3086, N'A', 80, 74)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (49, 4, 2075, N'A', 80, 71)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (50, 15, 5072, N'A', 90, 71)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (51, 9, 3062, N'R', 90, 72)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (52, 1, 2050, N'A', 90, 75)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (53, 13, 3051, N'A', 40, 70)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (54, 13, 3048, N'A', 22, 70)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (55, 1, 2045, N'A', 50, 69)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (56, 2, 2063, N'A', 30, 73)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (57, 2, 2058, N'A', 60, 73)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (58, 54, 4058, N'A', 55, 73)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (59, 4, 2075, N'A', 55, 66)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (60, 4, 2074, N'A', 70, 66)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (61, 9, 3060, N'A', 70, 66)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (62, 2, 2057, N'A', 70, 61)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (63, 2, 2060, N'A', 80, 61)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (64, 1, 2051, N'A', 80, 63)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (65, 8, 3112, N'A', 80, 62)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (66, 13, 3051, N'A', 80, 64)
INSERT [dbo].[Tarjetas] ([idTarjeta], [idEquipo], [idJugador], [tipoTarjeta], [minuto], [idPartido]) VALUES (67, 12, 3086, N'A', 80, 65)
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
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (46, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (47, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (48, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (49, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3061, 9)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (50, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (51, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (52, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (53, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4060, 54)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (54, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (55, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (56, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (57, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (58, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3083, 12)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (59, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (60, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (61, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (62, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5069, 15)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (63, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (64, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (65, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (66, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (67, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3070, 7)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (68, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (69, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (70, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (71, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3069, 7)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (72, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (73, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (74, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (75, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (76, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4056, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4057, 54)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (77, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (78, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (79, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (80, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4051, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4052, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4053, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4054, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4056, 54)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4057, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4058, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4059, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4060, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4061, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (81, 4062, 54)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (82, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3040, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3041, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3042, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3043, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3044, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3045, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3047, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3048, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3049, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3050, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 3051, 13)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5062, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5063, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5064, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5065, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5066, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5067, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5068, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5069, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5070, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5071, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (83, 5072, 15)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2040, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2041, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2042, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2043, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2044, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2045, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2046, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2048, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2049, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2050, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 2051, 1)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3052, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3053, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3054, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3055, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3056, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3057, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3058, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3059, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3060, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3061, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (84, 3062, 9)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2052, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2053, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2054, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2055, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2057, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2058, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2059, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2060, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2061, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2062, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 2063, 2)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (85, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2067, 4)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3074, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3075, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3076, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3077, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3078, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3080, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3081, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3082, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3083, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3084, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3085, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (86, 3086, 12)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (91, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3087, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3088, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3089, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3091, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3093, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3094, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3095, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3096, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3097, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3098, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3099, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (92, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (93, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3087, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3088, 3)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3089, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3091, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3093, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3094, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3095, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3096, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3097, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3098, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (94, 3099, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3063, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3064, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3065, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3066, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3067, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3068, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3069, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3070, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3071, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3072, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3073, 7)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3087, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3088, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3089, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3091, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3093, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3094, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3095, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3096, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3097, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3098, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (95, 3099, 3)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2064, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2065, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2066, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2067, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2068, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2069, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2070, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2072, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2073, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2074, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 2075, 4)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3100, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3101, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3102, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3103, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3104, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3106, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3107, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3108, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3109, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3110, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3111, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (96, 3112, 8)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (127, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (129, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1009, 42)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (131, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (151, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (156, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5073, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5074, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5075, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5076, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5077, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5078, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5079, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5080, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5081, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5082, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5083, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5084, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5085, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5086, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5087, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5088, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5089, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5090, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5091, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5092, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5093, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5094, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (157, 5095, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2036, 42)
GO
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5096, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5097, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5098, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5099, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5100, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5101, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5102, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5104, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5105, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5106, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (158, 5107, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1002, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1009, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1015, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 1019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2016, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2017, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2018, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2019, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2027, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2029, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2030, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2032, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2033, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2036, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2037, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2038, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 2039, 42)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5073, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5074, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5075, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5076, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5077, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5078, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5079, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5080, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5081, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5082, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5083, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (159, 5084, 46)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5085, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5086, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5087, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5088, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5089, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5090, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5091, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5092, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5093, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5094, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5095, 22)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5096, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5097, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5098, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5099, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5100, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5101, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5102, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5104, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5105, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5106, 27)
INSERT [dbo].[TitularesXPartido] ([idPartido], [idJugador], [idEquipo]) VALUES (160, 5107, 27)
SET IDENTITY_INSERT [dbo].[Torneos] ON 

INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (1, N'Mundial', N'mundial', 15, N'Este torneo es el mundial')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (2, N'Torneo Primera División', N'afa', 15, N'Torneo primera división')
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
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Arbitros]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombreCancha_idTorneo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombreCancha_idTorneo] ON [dbo].[Canchas]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_torneo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_torneo] ON [dbo].[Ediciones]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Equipos]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EstadoAmbitos]    Script Date: 25/05/2015 18:14:05 ******/
ALTER TABLE [dbo].[EstadoAmbitos] ADD  CONSTRAINT [IX_EstadoAmbitos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Estados]    Script Date: 25/05/2015 18:14:05 ******/
ALTER TABLE [dbo].[Estados] ADD  CONSTRAINT [IX_Estados] UNIQUE NONCLUSTERED 
(
	[idAmbito] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_dni_idEquipo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_dni_idEquipo] ON [dbo].[Jugadores]
(
	[dni] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idEquipo]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idEquipo] ON [dbo].[Jugadores]
(
	[nombre] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nick]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nick] ON [dbo].[Torneos]
(
	[nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre]    Script Date: 25/05/2015 18:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre] ON [dbo].[Torneos]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuarios]    Script Date: 25/05/2015 18:14:05 ******/
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConfiguracionesEdicion] CHECK CONSTRAINT [FK_ConfiguracionesEdicion_Ediciones]
GO
ALTER TABLE [dbo].[ConfiguracionesVisuales]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionesVisuales_Torneos] FOREIGN KEY([idTorneo])
REFERENCES [dbo].[Torneos] ([idTorneo])
GO
ALTER TABLE [dbo].[ConfiguracionesVisuales] CHECK CONSTRAINT [FK_ConfiguracionesVisuales_Torneos]
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
ALTER TABLE [dbo].[EquiposXGrupo]  WITH CHECK ADD  CONSTRAINT [FK_EquiposXGrupo_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[EquiposXGrupo] CHECK CONSTRAINT [FK_EquiposXGrupo_Equipos]
GO
ALTER TABLE [dbo].[EquiposXGrupo]  WITH CHECK ADD  CONSTRAINT [FK_EquiposXGrupo_Grupos] FOREIGN KEY([idGrupo], [idFase], [idEdicion])
REFERENCES [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EquiposXGrupo] CHECK CONSTRAINT [FK_EquiposXGrupo_Grupos]
GO
ALTER TABLE [dbo].[EquipoXEdicion]  WITH CHECK ADD  CONSTRAINT [FK_EquipoXEdicion_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD  CONSTRAINT [FK_Noticias_CategoriasNoticia] FOREIGN KEY([idCategoriaNoticia])
REFERENCES [dbo].[CategoriasNoticia] ([idCategoriaNoticia])
GO
ALTER TABLE [dbo].[Noticias] CHECK CONSTRAINT [FK_Noticias_CategoriasNoticia]
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
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Fechas] FOREIGN KEY([idFecha], [idGrupo], [idFase], [idEdicion])
REFERENCES [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Fechas]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Jugadores] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugadores] ([idJugador])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Jugadores]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_MotivosSancion] FOREIGN KEY([idMotivoSancion])
REFERENCES [dbo].[MotivosSancion] ([idMotivoSancion])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_MotivosSancion]
GO
ALTER TABLE [dbo].[Sanciones]  WITH CHECK ADD  CONSTRAINT [FK_Sanciones_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO
ALTER TABLE [dbo].[Sanciones] CHECK CONSTRAINT [FK_Sanciones_Partidos]
GO
ALTER TABLE [dbo].[TablaPosicionesFinal]  WITH CHECK ADD  CONSTRAINT [FK_TablaPosicionesFinal_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[TablaPosicionesFinal] CHECK CONSTRAINT [FK_TablaPosicionesFinal_Ediciones]
GO
ALTER TABLE [dbo].[TablaPosicionesFinal]  WITH CHECK ADD  CONSTRAINT [FK_TablaPosicionesFinal_Equipos] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[TablaPosicionesFinal] CHECK CONSTRAINT [FK_TablaPosicionesFinal_Equipos]
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[24] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 144
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ea"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 102
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEstados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEstados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[26] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 139
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "exe"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 163
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 209
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ed"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 273
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 44
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTablaPosiciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2235
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTablaPosiciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTablaPosiciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 136
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTorneosUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTorneosUsuario'
GO
USE [master]
GO
ALTER DATABASE [ProyectoQueGolazo] SET  READ_WRITE 
GO
