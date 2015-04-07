USE [master]
GO
/****** Object:  Database [ProyectoQueGolazo]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Arbitros]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Cambios]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Canchas]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[CanchaXEdicion]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[ConfiguracionesEdicion]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[ConfiguracionesVisuales]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Delegados]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Ediciones]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Equipos]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[EquiposXGrupo]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[EquipoXEdicion]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[EstadoAmbitos]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Estados]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Fases]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Fechas]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[GenerosEdicion]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Goles]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Grupos]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Jugadores]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[MotivosSancion]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Noticias]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Partidos]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Sanciones]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TablaPosicionesFinal]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TamaniosCancha]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TiposGol]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TiposSuperficie]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[TitularesXPartido]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Torneos]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  UserDefinedFunction [dbo].[joinTablaDePosiciones]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  UserDefinedFunction [dbo].[joinTablaDePosicionesCompleta]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  View [dbo].[viewEstados]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  View [dbo].[viewTablaPosiciones]    Script Date: 07/04/2015 18:19:27 ******/
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
/****** Object:  View [dbo].[viewTorneosUsuario]    Script Date: 07/04/2015 18:19:27 ******/
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
INSERT [dbo].[ConfiguracionesEdicion] ([jugadores], [cambiosJugadores], [tarjetasJugadores], [golesJugadores], [asignacionArbitros], [desempenioArbitros], [canchaUnica], [sancionesJugadores], [idEdicion], [arbitros], [sanciones], [jugadorXPartido], [sancionesEquipos], [canchas]) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0)
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
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (71, N'Thiago Silva', N'thiago.silva@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (72, N'Darijo Srna', N'darijo.srna@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (73, N'Oribe Peralta', N'oribe.peralta@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (74, N'Samuel Eto''o', N'samuel.etoo@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (75, N'Iker Casillas', N'iker.casillas@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (76, N'Louis van Gaal', N'louis.van.gaal@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (77, N'Arturo Vidal', N'arturo.vidal@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (78, N'Mile Jedinak', N'mile.jedinak@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (79, N'Falcao García', N'falcao.garcia@gmail.com', N'124567', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (80, N'Dimitris Salpingidis', N'dimitris@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (81, N'Yaya Touré', N'yaya@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (82, N'Yasuhito Endo', N'yasuito@gmail.com', N'1234567', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (83, N'Diego Lugano', N'diego.lugano@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (84, N'Álvaro Saborio', N'alvaro@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (85, N'Wayne Rooney', N'rooney@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (87, N'Gianluigi Buffon', N'buffon@gail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (88, N'Gökhan Inler', N'inler@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (89, N'Antonio Valencia', N'valencia@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (90, N'Hugo Lloris', N'lloris@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (91, N'Jerry Bengtson', N'bengston@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (92, N'Lionel Messi', N'lionelmessi@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (93, N'Paula Pedrosa', N'pau@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (94, N'Javad Nekounam', N'javad@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (95, N'Emmanuel Emenike', N'emmanuel@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (96, N'Philipp Lahm ', N'philipp@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (97, N'Cristiano Ronaldo ', N'cristiano@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (98, N'Asamoah Gyan', N'Asamoah@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (99, N'Clint Dempsey', N'ClintDempsey@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (100, N'Kevin De Bruyne', N'kevin@gmail.com', N'123456', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (101, N'Islam Slimani', N'islam@gmail.com', N'12345', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (102, N'Aleksandr Kerzhakov', N'AleksandrKerzhakov@gmail.com', N'1234556', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (103, N'Park Chu-Young', N'ParkChuYoung@gmail.com', N'1234', N'')
SET IDENTITY_INSERT [dbo].[Delegados] OFF
SET IDENTITY_INSERT [dbo].[Ediciones] ON 

INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (4, N'Edicion 1', 1, 1, 14, 87, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (5, N'Mundial Brasil 2014', 9, 1, 2, 88, 3, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Ediciones] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (1, N'River Plate', N'#3f3f3f', N'#31859b', N'Ramón Oliva', 69, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (2, N'Boca Juniors', N'#1f497d', N'#fbd75b', N'Ramón Oliva', 68, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (3, N'Lanús', N'#e36c09', N'#5484ed', N'Ramón Oliva', 67, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (4, N'Belgrano', N'#dc2127', N'#e1e1e1', N'Ramón Oliva', 70, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (5, N'Talleres', N'#5484ed', N'#fbd75b', N'Ramón Oliva', 66, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (7, N'San Lorenzo', N'#5484ed', N'#5484ed', N'Ramón Oliva', 65, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (8, N'Independiente', N'#5484ed', N'#5484ed', N'Ramón Oliva', 64, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (9, N'Estudiantes', N'#5484ed', N'#5484ed', N'Ramón Oliva', 63, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (10, N'Olimpo', N'#5484ed', N'#5484ed', N'Ramón Oliva', 62, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (11, N'Defensa y Justicia', N'#5484ed', N'#5484ed', N'Ramón Oliva', 61, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (12, N'Velez', N'#5484ed', N'#5484ed', N'Ramón Oliva', 60, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (13, N'Racing', N'#5484ed', N'#5484ed', N'Ramón Oliva', 59, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (14, N'Godoy Cruz', N'#5484ed', N'#5484ed', N'Ramón Oliva', 58, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (15, N'Arsenal', N'#5484ed', N'#5484ed', N'Ramón Oliva', 57, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (17, N'Tigre', N'#5484ed', N'#5484ed', N'Ramón Oliva', 56, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (19, N'Independiente Rivadavia', N'#5484ed', N'#5484ed', N'Ramón Oliva', 54, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (21, N'Aldosivi', N'#5484ed', N'#5484ed', N'Ramón Oliva', 53, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (22, N'Brasil', N'#5fa54e', N'#ffde99', N'Luiz Felipe Scolari', 71, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (23, N'Croacia', N'#cb1e31', N'#30445d', N'Nico Kovac', 72, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (24, N'México', N'#5fa54e', N'#cb1e31', N'Miguel Herrera', 73, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (25, N'Camerún', N'#5fa54e', N'#cb1e31', N'Volker Finke', 74, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (26, N'España', N'#cb1e31', N'#ffde99', N'Vicente del Bosque', 75, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (27, N'Holanda', N'#f38725', N'#ffffff', N'Robin van Persie', 76, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (28, N'Chile', N'#cb1e31', N'#30445d', N'Jorge Sampaoli', 77, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (29, N'Australia', N'#ffde99', N'#5fa54e', N'Ange Postecoglou', 78, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (30, N'Colombia', N'#ffde99', N'#ffffff', N'José Pekerman', 79, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (31, N'Grecia', N'#ffffff', N'#0078ad', N'Fernando Santos', 80, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (32, N'Costa de Marfil ', N'#f38725', N'#5fa54e', N'Hervé Renard', 81, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (33, N'Japón', N'#30445d', N'#ffffff', N' Alberto Zaccheroni', 82, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (34, N'Uruguay', N'#0078ad', N'#282629', N'Óscar Washington Tabárez', 83, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (35, N'Costa Rica', N'#cb1e31', N'#30445d', N'Jorge Luis Pinto', 84, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (36, N'Inglaterra', N'#ffffff', N'#cb1e31', N'Roy Hodgson', 85, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (37, N'Italia', N'#30445d', N'#ffffff', N'Cesare Prandelli', 87, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (38, N'Suiza', N'#cb1e31', N'#ffffff', N'Ottmar Hitzfeld', 88, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (39, N'Ecuador', N'#ffde99', N'#30445d', N'Reinaldo Rueda', 89, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (40, N'Francia', N'#30445d', N'#ffffff', N'Didier Deschamps', 90, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (41, N'Honduras', N'#6ea6bf', N'#ffffff', N'Luis Fernando Suárez', 91, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (42, N'Argentina', N'#62c0dc', N'#ffffff', N'Alejandro Sabella', 92, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (43, N'Bosnia', N'#30445d', N'#ffde99', N'Paula Pedrosa', 93, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (44, N'Iran', N'#ffffff', N'#cb1e31', N' Carlos Queiroz', 94, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (45, N'Nigeria', N'#5fa54e', N'#ffffff', N'Stephen Keshi', 95, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (46, N'Alemania', N'#ffffff', N'#282629', N'Joachim Löw', 96, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (47, N'Portugal', N'#cb1e31', N'#5fa54e', N'Paulo Bento', 97, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (48, N'Ghana', N'#ffde99', N'#5fa54e', N'Akwasi Appiah', 98, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (49, N'Estados Unidos', N'#ffffff', N'#30445d', N'Jürgen Klinsmann', 99, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (50, N'Bélgica', N'#282629', N'#ffde99', N'Marc Wilmots', 100, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (51, N'Argelia', N'#5fa54e', N'#ffffff', N'Vahid Halilhodzic', 101, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (52, N'Rusia', N'#cb1e31', N'#30445d', N'Fabio Capello', 102, NULL, 88)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (53, N'Corea del Sur', N'#cb1e31', N'#30445d', N'Hong Myung-Bo', 103, NULL, 88)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (11, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (12, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (13, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (14, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (15, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (17, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (19, 1, 1, 4)
INSERT [dbo].[EquiposXGrupo] ([idEquipo], [idGrupo], [idFase], [idEdicion]) VALUES (21, 1, 1, 4)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 11, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 12, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 13, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 14, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 15, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 17, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 19, NULL, NULL, NULL)
INSERT [dbo].[EquipoXEdicion] ([idEdicion], [idEquipo], [partidosGanados], [partidosPerdidos], [partidosEmpatados]) VALUES (4, 21, NULL, NULL, NULL)
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
INSERT [dbo].[Fases] ([idFase], [idEstado], [idEdicion], [tipoFixture], [cantidadEquipos], [cantidadGrupos]) VALUES (1, 4, 4, N'TCT', NULL, NULL)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (1, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (2, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (3, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (4, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (5, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (6, 1, 1, 4, NULL, 7)
INSERT [dbo].[Fechas] ([idFecha], [idGrupo], [idFase], [idEdicion], [nombre], [idEstado]) VALUES (7, 1, 1, 4, NULL, 7)
SET IDENTITY_INSERT [dbo].[GenerosEdicion] ON 

INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (3, N'Mixto')
SET IDENTITY_INSERT [dbo].[GenerosEdicion] OFF
INSERT [dbo].[Grupos] ([idGrupo], [idFase], [idEdicion], [nombre]) VALUES (1, 1, 4, N'0')
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
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2038, N'Maxi Rodríguez', N'321234908', CAST(0x0000839B00000000 AS DateTime), N'maxi@gmail.com', N'Maxi Rodríguez', N'Masculino', 1, 19, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2039, N'Fernando Gago', N'345678901', CAST(0x0000839B00000000 AS DateTime), N'fernando@gmail.com', N'Fernando Gago', N'Masculino', 1, 19, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2040, N'Juan Carlos Olave', N'362334123', CAST(0x0000841500000000 AS DateTime), N'juan@gmail.com', N'Juan Carlos Olave', N'Masculino', 1, 4, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2041, N'Pablo Heredia', N'362334124', CAST(0x0000839B00000000 AS DateTime), N'pablo@gmail.com', N'Pablo Heredia', N'Masculino', 1, 4, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2042, N'Lucas Acosta', N'362334125', CAST(0x0000839B00000000 AS DateTime), N'lucas@gmail.com', N'Lucas Acosta', N'Masculino', 1, 4, N'3512015399', 35)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2043, N'Pier Barrios', N'362334126', CAST(0x0000839B00000000 AS DateTime), N'pier@gmail.com', N'Pier Barrios', N'Masculino', 1, 4, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2044, N'Federico Álvarez', N'362334127', CAST(0x0000839B00000000 AS DateTime), N'federico@gmail.com', N'Federico Álvarez', N'Masculino', 1, 4, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2045, N'Renzo Saravia', N'362334128', CAST(0x0000839B00000000 AS DateTime), N'renzo@gmail.com', N'Renzo Saravia', N'Masculino', 1, 4, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2046, N'Cristian Lema', N'362334129', CAST(0x0000839B00000000 AS DateTime), N'cristian@gmail.com', N'Cristian Lema', N'Masculino', 1, 4, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2047, N'Nicolás Ferreyra', N'362334130', CAST(0x0000839B00000000 AS DateTime), N'nicolas@gmail.com', N'Nicolás Ferreyra', N'Masculino', 1, 4, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2048, N'Carlos Soto', N'362334131', CAST(0x0000839B00000000 AS DateTime), N'carlos@gmail.com', N'Carlos Soto', N'Masculino', 1, 4, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2049, N'Gastón Turus', N'
362334132', CAST(0x0000839B00000000 AS DateTime), N'gaston@gmail.com', N'Gastón Turus', N'Masculino', 1, 4, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2050, N'Lucas Aveldaño', N'362334132', CAST(0x0000839B00000000 AS DateTime), N'lucas@gmail.com', N'Lucas Aveldaño', N'Masculino', 1, 4, N'3512015399', 37)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2051, N'Marcelo Barovero', N'362334133', CAST(0x0000839B00000000 AS DateTime), N'marcelo@gmail.com', N'Marcelo Barovero', N'Masculino', 1, 1, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2052, N'Nicolás Rodríguez', N'
362334134', CAST(0x0000839B00000000 AS DateTime), N'nicolas@gmail.com', N'Nicolás Rodríguez', N'Masculino', 1, 1, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2054, N'Julio Chiarini', N'362334135', CAST(0x0000839B00000000 AS DateTime), N'julio@gmail.com', N'Julio Chiarini', N'Masculino', 1, 1, N'3512015399', 33)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2057, N'Augusto Batalla', N'362334136', CAST(0x0000839B00000000 AS DateTime), N'augusto@gmail.com', N'Augusto Batalla', N'Masculino', 1, 1, N'3512015399', 42)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2060, N'Jonathan Maidana', N'
362334137', CAST(0x0000839B00000000 AS DateTime), N'jonathan@gmail.com', N'Jonathan Maidana', N'Masculino', 1, 1, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2063, N'Ramiro Funes Mori', N'
362334138', CAST(0x0000839B00000000 AS DateTime), N'ramiro@gmail.com', N'Ramiro Funes Mori', N'Masculino', 1, 1, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2064, N'Bruno Urribarri', N'362334139', CAST(0x0000839B00000000 AS DateTime), N'bruno@gmail.com', N'Bruno Urribarri', N'Masculino', 1, 1, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2065, N'Germán Pezzella', N'362334140', CAST(0x0000839B00000000 AS DateTime), N'german@gmail.com', N'Germán Pezzella', N'Masculino', 1, 1, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2066, N'Leonel Vangioni', N'362334141', CAST(0x0000839B00000000 AS DateTime), N'leonel@gmail.com', N'Leonel Vangioni', N'Masculino', 1, 1, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2067, N'Emanuel Mammana', N'362334142', CAST(0x0000839B00000000 AS DateTime), N'emanuel@gmail.com', N'Emanuel Mammana', N'Masculino', 1, 1, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2068, N'Gabriel Mercado', N'3623341423', CAST(0x0000839B00000000 AS DateTime), N'gabriel@gmail.com', N'Gabriel Mercado', N'Masculino ', 1, 1, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2070, N'Agustín Orion', N'3623341424', CAST(0x0000839B00000000 AS DateTime), N'agustin@gmail.com', N'Agustín Orion', N'Masculino', 1, 2, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2073, N'Daniel Díaz', N'3623341425', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Daniel Díaz', N'Masculino', 1, 2, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2074, N'Fernando Gago', N'3623341426', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Fernando Gago', N'Masculino', 1, 2, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2076, N'Pablo Ledesma', N'3623341427', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Pablo Ledesma', N'Masculino', 1, 2, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2077, N'Emmanuel Gigliotti', N'3623341428', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Emmanuel Gigliotti', N'Masculino', 1, 2, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2079, N'Andrés Chávez', N'3623341429', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Andrés Chávez', N'Masculino', 1, 2, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2080, N'Jonathan Calleri', N'3623341430', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Jonathan Calleri', N'Masculino', 1, 2, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2081, N'Federico Bravo', N'3623341431', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Federico Bravo', N'Masculino', 1, 2, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2083, N'Juan Manuel Martínez', N'3623341432', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Manuel Martínez', N'Masculino', 1, 2, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2084, N'Leonardo Suárez', N'3623341433', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leonardo Suárez', N'Masculino', 1, 2, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2085, N'Gonzalo Castellani', N'
3623341434', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Gonzalo Castellani', N'Masculino', 1, 2, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2086, N'Agustín Marchesín', N'3623341435', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Agustín Marchesín', N'Masculino', 1, 3, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2087, N'Diego Braghieri', N'
3623341436', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Braghieri', N'Masculino', 1, 3, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2088, N'Diego Hernán González', N'3623341437', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Hernán González', N'Masculino', 1, 3, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2089, N'Lautaro Acosta', N'3623341438', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lautaro Acosta', N'Masculino', 1, 3, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2090, N'Santiago Silva', N'3623341439', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Santiago Silva', N'Masculino', 1, 3, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2091, N'Jorge Valdez Chamorro', N'3623341440', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Jorge Valdez Chamorro', N'Masculino', 1, 3, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2092, N'Alejandro Silva González', N'3623341441', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Alejandro Silva González', N'Masculino', 1, 3, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2093, N'Carlos Araujo', N'
3623341442', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Carlos Araujo', N'Masculino', 1, 3, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2094, N'Leandro Somoza', N'3623341443', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Leandro Somoza', N'Masculino', 1, 3, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2095, N'Lucas Melano', N'3623341444', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lucas Melano', N'Masculino', 1, 3, N'3512015399', 26)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2096, N'Oscar Benítez', N'3623341445', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Oscar Benítez', N'Masculino', 1, 3, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2097, N'Leo Franco', N'3623341446', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leo Franco', N'Masculino', 1, 7, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2098, N'Mauro Cetto', N'3623341447', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Mauro Cetto', N'Masculino', 1, 7, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2099, N'Mario Yepes', N'
3623341448', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Mario Yepes', N'Masculino', 1, 7, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2100, N'Gonzalo Prósperi', N'
3623341449', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gonzalo Prósperi', N'Masculino', 1, 7, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2101, N'Matías Mirabaje', N'3623341450', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Matías Mirabaje', N'Masculino', 1, 7, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2102, N'Leandro Navarro', N'3623341451', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro Navarro', N'Masculino', 1, 7, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2104, N'Gonzalo Verón', N'3623341452', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gonzalo Verón', N'Masculino', 1, 7, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2107, N'Facundo Quignon', N'
3623341453', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Facundo Quignon', N'Masculino', 1, 7, N'3512015399', 31)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2108, N'Santiago Magallan', N'3623341454', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Santiago Magallan', N'Masculino', 1, 7, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2109, N'Fabricio Fontanini', N'3623341455', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Fabricio Fontanini', N'Masculino', 1, 7, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2110, N'Nicolás Blandi', N'
3623341457', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Nicolás Blandi', N'Masculino', 1, 7, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2111, N'Daniel Montenegro', N'3623341458', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Daniel Montenegro', N'Masculino', 1, 8, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2112, N'Federico Mancuello', N'3623341459', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Federico Mancuello', N'Masculino', 1, 8, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2113, N'Francisco Pizzini', N'3623341460', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Francisco Pizzini', N'Masculino', 1, 8, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2114, N'Sergio Daniel Escudero', N'3623341461', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sergio Daniel Escudero', N'Masculino', 1, 8, N'3512015399', 34)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2115, N'Cristian Tula', N'3623341462', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Cristian Tula', N'Masculino', 1, 8, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2116, N'Diego Matías Rodríguez', N'3623341463', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Matías Rodríguez', N'Masculino', 1, 8, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2117, N'Julián Velázquez', N'3623341464', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Julián Velázquez', N'Masculino', 1, 8, N'	3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2118, N'Juan Martín Lucero', N'3623341465', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Martín Lucero', N'Masculino', 1, 8, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2119, N'Claudio Riaño', N'3623341466', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com	', N'Claudio Riaño', N'Masculino', 1, 8, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2121, N'Martín Benítez', N'3623341467', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Martín Benítez', N'Masculino', 1, 8, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2122, N'Federico Insúa', N'3623341468', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Federico Insúa', N'Masculino', 1, 8, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2123, N'Leandro Desábato', N'3623341469', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro Desábato', N'Masculino', 1, 9, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2124, N'Guido Carrillo', N'3623341470', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Guido Carrillo', N'Masculino', 1, 9, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2125, N'Román Martínez', N'3623341471	', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Román Martínez', N'Masculino', 1, 9, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2126, N'Patricio Julián Rodríguez', N'3623341472', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Patricio Julián Rodríguez', N'Masculino', 1, 9, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2127, N'Gastón Gil Romero', N'3623341473', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gastón Gil Romero', N'Masculino', 1, 9, N'3512015399', 25)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2128, N'Diego Vera', N'3623341474', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Vera', N'Masculino', 1, 9, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2129, N'Leonardo Jara', N'3623341475', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leonardo Jara', N'Masculino', 1, 9, N'3512015399', 32)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2130, N'Agustín Silva', N'3623341476', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Agustín Silva', N'Masculino', 1, 9, N'3512015399', 31)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2131, N'Israel Damonte', N'3623341477', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Israel Damonte', N'Masculino', 1, 9, N'3512015399', 30)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2132, N'Matías Aguirregaray', N'3623341478', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Matías Aguirregaray', N'Masculino', 1, 9, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2133, N'Juan Manuel Olivera', N'3623341479', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Manuel Olivera', N'Masculino', 1, 9, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2134, N'José Adolfo Valencia', N'3623341480', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'José Adolfo Valencia', N'Masculino', 1, 10, N'3512015399', 20)
GO
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2137, N'Iván Furios', N'3623341481', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Iván Furios', N'Masculino', 1, 10, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2138, N'Nereo Champagne', N'3623341482', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Nereo Champagne', N'Masculino', 1, 10, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2139, N'Adrián Nahuel Martínez', N'3623341483', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Adrián Nahuel Martínez', N'Masculino', 1, 10, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2141, N'Miguel Borja', N'3623341484', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Miguel Borja', N'Masculino', 1, 10, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2142, N'Agustín Vuletich', N'3623341485', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Agustín Vuletich', N'Masculino', 1, 10, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2143, N'Mauricio Cuero', N'3623341486', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Mauricio Cuero', N'Masculino', 1, 10, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2149, N'Juan Ignacio Sills', N'3623341487', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Ignacio Sills', N'Masculino', 1, 10, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2150, N'Gustavo Oberman', N'
3623341488', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gustavo Oberman', N'Masculino', 1, 10, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2151, N'Orlando Gaona Lugo', N'
3623341489', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Orlando Gaona Lugo', N'Masculino', 1, 10, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2152, N'Javier Reina', N'3623341440', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Javier Reina', N'Masculino', 1, 10, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2153, N'Washington Camacho', N'3623341441', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Washington Camacho', N'Masculino', 1, 11, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2154, N'Emir Faccioli', N'3623341442', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Emir Faccioli', N'Masculino', 1, 11, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2155, N'Javier Yacuzzi', N'3623341443', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Javier Yacuzzi', N'Masculino', 1, 11, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2157, N'Emiliano Tellechea', N'3623341444', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Emiliano Tellechea', N'Masculino', 1, 11, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2160, N'Ciro Rius', N'3623341445', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Ciro Rius', N'Masculino', 1, 11, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2161, N'Leandro González', N'3623341446', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro González', N'Masculino', 1, 11, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2162, N'Luciano Vella', N'3623341447', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Luciano Vella', N'Masculino', 1, 11, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2163, N'Carlos Casteglione', N'3623341448', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Carlos Casteglione', N'Masculino', 1, 11, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2164, N'Nicolás Bertocchi', N'3623341449', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Nicolás Bertocchi', N'Masculino', 1, 11, N'3512015399', 27)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2165, N'Pablo Timoteo De Miranda', N'3623341450', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Pablo Timoteo De Miranda', N'Masculino', 1, 11, N'3512015399', 28)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2167, N'Leandro Becerra', N'3623341451', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro Becerra', N'Masculino', 1, 11, N'3512015399', 29)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2168, N'Lucas Pratto', N'3623341452', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lucas Pratto', N'Masculino', 1, 12, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2169, N'Mauro Zárate', N'3623341453', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Mauro Zárate', N'Masculino', 1, 12, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2170, N'Agustín Allione', N'3623341454', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Agustín Allione', N'Masculino', 1, 12, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2171, N'Fabián Cubero', N'3623341455', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Fabián Cubero', N'Masculino', 1, 12, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2172, N'Sebastián Enrique Domínguez', N'3623341456', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Enrique Domínguez', N'Masculino', 1, 12, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2173, N'Lucas Romero', N'3623341457', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lucas Romero', N'Masculino', 1, 12, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2174, N'Sebastián Sosa', N'3623341458', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Sosa', N'Masculino', 1, 12, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2177, N'Emiliano Papa', N'3623341459', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Emiliano Papa', N'Masculino', 1, 12, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2178, N'Milton Caraglio', N'3623341460', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Milton Caraglio', N'Masculino', 1, 12, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2179, N'Alejandro Ariel Cabral', N'3623341461', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Alejandro Ariel Cabral', N'Masculino', 1, 12, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2180, N'Leandro Luis Desábato', N'3623341462', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro Luis Desábato', N'Masculino', 1, 12, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2181, N'Diego Milito', N'3623341463', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Milito', N'Masculino', 1, 13, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2182, N'Ricardo Centurión', N'3623341464', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Ricardo Centurión', N'Masculino', 1, 13, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2183, N'Sebastián Saja', N'3623341465', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Saja', N'Masculino', 1, 13, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2184, N'Gustavo Bou', N'3623341466', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gustavo Bou', N'Masculino', 1, 13, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2185, N'Gabriel Hauche', N'3623341467', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gabriel Hauche', N'Masculino', 1, 13, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2186, N'Iván Pillud', N'3623341468', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Iván Pillud', N'Masculino', 1, 13, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2187, N'Ricardo Gastón Díaz', N'3623341469', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Ricardo Gastón Díaz', N'Masculino', 1, 13, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2188, N'Leandro Grimi', N'3623341470', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Leandro Grimi', N'Masculino', 1, 13, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2189, N'Facundo Castillón', N'3623341471', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Facundo Castillón', N'Masculino', 1, 13, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2190, N'Matías Cahais', N'3623341472', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Matías Cahais', N'Masculino', 1, 13, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2191, N'Diego Villar', N'3623341473', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Villar', N'Masculino', 1, 13, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2192, N'José Luis Fernández', N'3623341474', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'José Luis Fernández', N'Masculino', 1, 14, N'3512015399', 19)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2193, N'Claudio Aquino', N'3623341475', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Claudio Aquino', N'Masculino', 1, 14, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2194, N'Federico Lértora', N'3623341476', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Federico Lértora', N'Masculino', 1, 14, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2195, N'Jaime Ayoví', N'3623341477', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Jaime Ayoví', N'Masculino', 1, 14, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2196, N'Alexis Nicolás Castro', N'3623341478', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Alexis Nicolás Castro', N'Masculino', 1, 14, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2197, N'Sergio López', N'3623341479', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sergio López', N'Masculino', 1, 14, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2198, N'Cristian Andrés García', N'3623341480', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Cristian Andrés García', N'Masculino', 1, 14, N'3512015399', 21)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2199, N'Lucas Ceballos', N'3623341481', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lucas Ceballos', N'Masculino', 1, 14, N'3512015399', 22)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2200, N'Rodrigo Rey', N'3623341482', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Rodrigo Rey', N'Masculino', 1, 14, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2201, N'Rolando García Guerreño', N'3623341483', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Rolando García Guerreño', N'Masculino', 1, 14, N'3512015399', 2)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2202, N'Juan Fernando Garro', N'3623341484', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Fernando Garro', N'Masculino', 1, 14, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2203, N'Alexis Sánchez', N'3623341485', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Alexis Sánchez', N'Masculino', 1, 15, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2204, N'Iván Marcone', N'3623341486', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Iván Marcone', N'Masculino', 1, 15, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2205, N'Emilio Zelaya', N'3623341487', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Emilio Zelaya', N'Masculino', 1, 15, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2206, N'Martín Nervo', N'3623341488', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Martín Nervo', N'Masculino', 1, 15, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2207, N'Hernán Fredes', N'3623341489', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Hernán Fredes', N'Masculino', 1, 15, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2208, N'Nicolás Aguirre', N'3623341490', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Nicolás Aguirre', N'Masculino', 1, 15, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2209, N'Damián Pérez', N'3623341491', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Damián Pérez', N'Masculino', 1, 15, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2210, N'Enzo Prono', N'3623341492', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Enzo Prono', N'Masculino', 1, 15, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2211, N'Federico Freire', N'3623341493', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Federico Freire', N'Masculino', 1, 15, N'3512015399', 15)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2212, N'Sebastián Palacios', N'3623341494', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Palacios', N'Masculino', 1, 15, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2213, N'Alejandro Limia', N'3623341495', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Alejandro Limia', N'Masculino', 1, 15, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2214, N'Matías Pérez García', N'3623341496', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Matías Pérez García', N'Masculino', 1, 17, N'3512015399', 10)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2215, N'Javier Hernán García', N'3623341497', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Javier Hernán García', N'Masculino', 1, 17, N'3512015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2216, N'Lucas Wilchez', N'3623341498', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Lucas Wilchez', N'Masculino', 1, 17, N'3512015399', 24)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2217, N'Sergio Araujo', N'3623341499', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sergio Araujom', N'Masculino', 1, 17, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2218, N'Diego Castaño', N'3623341500', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Diego Castaño', N'Masculino', 1, 17, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2219, N'Gabriel Peñalba', N'3623341501', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Gabriel Peñalba', N'Masculino', 1, 17, N'3512015399', 9)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2220, N'Pablo Vitti', N'3623341402', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Pablo Vitti', N'Masculino', 1, 17, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2221, N'José Sand', N'3623341503', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'José Sand', N'Masculino', 1, 17, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2222, N'Sebastián Rusculleda', N'3623341504', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Rusculleda', N'Masculino', 1, 17, N'3512015399', 14)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2223, N'Juan Carlos Blengio', N'3623341505', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Juan Carlos Blengio', N'Masculino', 1, 17, N'3512015399', 3)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2224, N'Sebastián Rincón', N'3623341506', CAST(0x0000839B00000000 AS DateTime), N'mail@gmail.com', N'Sebastián Rincó', N'Masculino', 1, 17, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2225, N'Manuel Neuer', N'362334656', CAST(0x0000839B00000000 AS DateTime), N'manuel.neuer@gmail.com', N'Manuel Neuer', N'Masculino', 1, 46, N'152015399', 1)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2226, N'Philipp Lahm', N'36233465', CAST(0x0000839B00000000 AS DateTime), N'philipp.lahm@gmail.com', N'Philipp Lahm', N'Masculino', 1, 46, N'3512015399', 16)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2228, N'Jérôme Boateng', N'36233461', CAST(0x0000839B00000000 AS DateTime), N'jerome.boateng@gmail.com', N'Jérôme Boateng', N'Masculino', 1, 46, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2229, N'Mats Hummels', N'36233462', CAST(0x0000839B00000000 AS DateTime), N'mats.hummels@gmail.com', N'Mats Hummels', N'Masculino', 1, 46, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2230, N'Benedikt Howedes', N'36233463', CAST(0x0000839B00000000 AS DateTime), N'benedikt.howedes@gmail.com', N'Benedikt Höwedes', N'Masculino', 1, 46, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2231, N'Christoph Kramer', N'36233464', CAST(0x0000839B00000000 AS DateTime), N'Christoph Kramer', N'christoph.kramer@gmail.com', N'Masculino', 1, 46, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2232, N'Bastian Schweinsteiger', N'36233466', CAST(0x0000839B00000000 AS DateTime), N'bastian.schweinsteiger@gmail.com', N'Bastian Schweinsteiger', N'Masculino', 1, 46, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2233, N'Toni Kroos', N'36233467', CAST(0x0000839B00000000 AS DateTime), N'toni.kroos@gmail.com', N'Toni Kroos', N'Masculino', 1, 46, N'3512015399', 18)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2234, N'Thomas Muller', N'36233468', CAST(0x0000839B00000000 AS DateTime), N'thomas.muller@gmail.com', N'Thomas Müller', N'Masculino', 1, 46, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2235, N'Miroslav Klose', N'36223469', CAST(0x0000839B00000000 AS DateTime), N'miroslav.klose@gmail.com', N'Miroslav Klose', N'Masculino', 1, 46, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2236, N'Mesut Ozil', N'36233470', CAST(0x0000839B00000000 AS DateTime), N'mesut.ozil@gmail.com', N'Mesut Özil', N'Masculino', 1, 46, N'3512015399', 8)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2237, N'Julio Cesar', N'36233471', CAST(0x0000839B00000000 AS DateTime), N'julio.cesar@gmail.com', N'Julio Cesar', N'Masculino', 0, 22, N'3512015399', 12)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2238, N'Maicon', N'36233473', CAST(0x0000839B00000000 AS DateTime), N'maicon@gmail.com', N'Maicon', N'Masculino', 1, 22, N'3512015399', 23)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2239, N'David Luiz', N'36233474', CAST(0x0000839B00000000 AS DateTime), N'david.luiz@gmail.com', N'David Luiz', N'Masculino', 1, 22, N'3512015399', 4)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2240, N'Dante', N'36233475', CAST(0x0000839B00000000 AS DateTime), N'dante@gmail.com', N'Dante', N'Masculino', 1, 22, N'3512015399', 13)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2241, N'Marcelo', N'36233476', CAST(0x0000839B00000000 AS DateTime), N'marcelo@gmail.com', N'Marcelo', N'Masculino', 1, 22, N'3512015399', 6)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2242, N'Fernandinho	', N'36233477', CAST(0x0000839B00000000 AS DateTime), N'Fernandinho	', N'Fernandinho	', N'Masculino', 1, 22, N'3512015399', 5)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2243, N'Luiz Gustavo	', N'36233478', CAST(0x0000839B00000000 AS DateTime), N'luiz.gustavo@gmail.com', N'Luiz Gustavo	', N'Masculino', 1, 22, N'3512015399', 17)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2244, N'Bernard', N'36233479', CAST(0x0000839B00000000 AS DateTime), N'bernard@gmail.com', N'Bernard', N'Masculino', 1, 22, N'3512015399', 20)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2246, N'Oscar', N'36233480', CAST(0x0000839B00000000 AS DateTime), N'oscar@gmail.com', N'Oscar', N'Masculino', 1, 22, N'3512015399', 11)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2247, N'Hulk', N'36233481', CAST(0x0000839B00000000 AS DateTime), N'Hulk', N'Hulk', N'Masculino', 1, 22, N'3512015399', 7)
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono], [numeroCamiseta]) VALUES (2248, N'Fred', N'36233483', CAST(0x0000839B00000000 AS DateTime), N'fred@gmail.com', N'Fred', N'Masculino', 1, 22, N'3512015399', 9)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
SET IDENTITY_INSERT [dbo].[MotivosSancion] ON 

INSERT [dbo].[MotivosSancion] ([idMotivoSancion], [nombre]) VALUES (1, N'Actitud antideportiva')
INSERT [dbo].[MotivosSancion] ([idMotivoSancion], [nombre]) VALUES (2, N'Deuda')
SET IDENTITY_INSERT [dbo].[MotivosSancion] OFF
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (37, 1, 1, 1, 4, 14, 15, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (38, 1, 1, 1, 4, 17, 13, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (39, 1, 1, 1, 4, 11, 12, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (40, 1, 1, 1, 4, 21, 19, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (41, 2, 1, 1, 4, 14, 13, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (42, 2, 1, 1, 4, 15, 12, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (43, 2, 1, 1, 4, 17, 19, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (44, 2, 1, 1, 4, 11, 21, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (45, 3, 1, 1, 4, 14, 12, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (46, 3, 1, 1, 4, 13, 19, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (47, 3, 1, 1, 4, 15, 21, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (48, 3, 1, 1, 4, 17, 11, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (49, 4, 1, 1, 4, 14, 19, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (50, 4, 1, 1, 4, 12, 21, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (51, 4, 1, 1, 4, 13, 11, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (52, 4, 1, 1, 4, 15, 17, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (53, 5, 1, 1, 4, 14, 21, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (54, 5, 1, 1, 4, 19, 11, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (55, 5, 1, 1, 4, 12, 17, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (56, 5, 1, 1, 4, 13, 15, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (57, 6, 1, 1, 4, 14, 11, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (58, 6, 1, 1, 4, 21, 17, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (59, 6, 1, 1, 4, 19, 15, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (60, 6, 1, 1, 4, 12, 13, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (61, 7, 1, 1, 4, 14, 17, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (62, 7, 1, 1, 4, 11, 15, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (63, 7, 1, 1, 4, 21, 13, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Partidos] ([idPartido], [idFecha], [idGrupo], [idFase], [idEdicion], [idEquipoLocal], [idEquipoVisitante], [fecha], [idPartidoPosterior], [idEstado], [idArbitro], [idCancha], [golesLocal], [golesVisitante], [idGanador], [idPerdedor], [empate], [penalesLocal], [penalesVisitante], [huboPenales]) VALUES (64, 7, 1, 1, 4, 19, 12, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (87, N'Torneo Jockey Club', N'jockeyClub', 15, N'Torneo de la Provincia de Córdoba Jockey Club')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (88, N'Mundial', N'mundial', 15, N'')
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
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Arbitros]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombreCancha_idTorneo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombreCancha_idTorneo] ON [dbo].[Canchas]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_torneo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_torneo] ON [dbo].[Ediciones]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idTorneo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idTorneo] ON [dbo].[Equipos]
(
	[nombre] ASC,
	[idTorneo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EstadoAmbitos]    Script Date: 07/04/2015 18:19:28 ******/
ALTER TABLE [dbo].[EstadoAmbitos] ADD  CONSTRAINT [IX_EstadoAmbitos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Estados]    Script Date: 07/04/2015 18:19:28 ******/
ALTER TABLE [dbo].[Estados] ADD  CONSTRAINT [IX_Estados] UNIQUE NONCLUSTERED 
(
	[idAmbito] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_dni_idEquipo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_dni_idEquipo] ON [dbo].[Jugadores]
(
	[dni] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre_idEquipo]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre_idEquipo] ON [dbo].[Jugadores]
(
	[nombre] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nick]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nick] ON [dbo].[Torneos]
(
	[nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_nombre]    Script Date: 07/04/2015 18:19:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_nombre] ON [dbo].[Torneos]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuarios]    Script Date: 07/04/2015 18:19:28 ******/
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
