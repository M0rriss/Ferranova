USE [master]
GO
/****** Object:  Database [ferranovabd]    Script Date: 13/11/2023 20:40:42 ******/
CREATE DATABASE [ferranovabd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ferranovabd', FILENAME = N'C:\SQLData\ferranovabd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ferranovabd_log', FILENAME = N'C:\SQLData\ferranovabd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ferranovabd] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ferranovabd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ferranovabd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ferranovabd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ferranovabd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ferranovabd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ferranovabd] SET ARITHABORT OFF 
GO
ALTER DATABASE [ferranovabd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ferranovabd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ferranovabd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ferranovabd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ferranovabd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ferranovabd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ferranovabd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ferranovabd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ferranovabd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ferranovabd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ferranovabd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ferranovabd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ferranovabd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ferranovabd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ferranovabd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ferranovabd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ferranovabd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ferranovabd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ferranovabd] SET  MULTI_USER 
GO
ALTER DATABASE [ferranovabd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ferranovabd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ferranovabd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ferranovabd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ferranovabd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ferranovabd] SET QUERY_STORE = ON
GO
ALTER DATABASE [ferranovabd] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ferranovabd]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[idCargo] [int] IDENTITY(1,1) NOT NULL,
	[descripcionCargo] [nvarchar](50) NULL,
	[codigo] [nvarchar](8) NULL,
	[idEstado] [bit] NOT NULL,
 CONSTRAINT [XPKcargo] PRIMARY KEY CLUSTERED 
(
	[idCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idCargo] [int] NOT NULL,
	[idEstado] [bit] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [XPKempleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[idEstado] [bit] NOT NULL,
	[decripcionEstado] [nvarchar](50) NULL,
 CONSTRAINT [XPKestado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[direccion] [nvarchar](150) NULL,
	[telefono] [nvarchar](12) NULL,
	[fechaNacimiento] [datetime2](6) NULL,
	[correo] [nvarchar](50) NULL,
	[idTipoDocumento] [int] NOT NULL,
	[nroDocumento] [nvarchar](20) NULL,
	[nombreCompleto] [nvarchar](max) NULL,
	[apellidoMaterno] [nvarchar](50) NULL,
 CONSTRAINT [XPKpersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](7) NULL,
	[descripcion] [nvarchar](255) NULL,
	[funcion] [nvarchar](100) NULL,
	[idEstado] [bit] NOT NULL,
 CONSTRAINT [XPKrol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoDocumento]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoDocumento](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [XPKtipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarioAcceso]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioAcceso](
	[idUsuarioAcceso] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](max) NULL,
	[idEmpleado] [int] NOT NULL,
	[changePassword] [bit] NULL,
	[correo] [nvarchar](80) NULL,
	[creaUsuario] [int] NOT NULL,
	[actualizaUsuario] [int] NOT NULL,
	[fechaDeCreacion] [datetime2](6) NOT NULL,
	[fechaDeActulizacion] [datetime2](6) NOT NULL,
	[idEstado] [bit] NOT NULL,
	[idRol] [int] NOT NULL,
	[celularIdentificador] [nvarchar](50) NULL,
 CONSTRAINT [XPKusuarioAcceso] PRIMARY KEY CLUSTERED 
(
	[idUsuarioAcceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VUsuario]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VUsuario]
AS
SELECT        dbo.usuarioAcceso.idUsuarioAcceso, dbo.usuarioAcceso.username, dbo.usuarioAcceso.password, dbo.usuarioAcceso.changePassword, dbo.usuarioAcceso.correo, dbo.usuarioAcceso.idRol, 
                         dbo.usuarioAcceso.celularIdentificador, dbo.usuarioAcceso.idEstado, dbo.usuarioAcceso.creaUsuario, dbo.usuarioAcceso.actualizaUsuario, dbo.usuarioAcceso.fechaDeCreacion, dbo.usuarioAcceso.fechaDeActulizacion, 
                         dbo.persona.nroDocumento, dbo.rol.descripcion, dbo.empleado.idCargo, dbo.persona.nombre, dbo.persona.apellido, dbo.rol.codigo, dbo.rol.funcion,dbo.persona.nombreCompleto,dbo.empleado.idEmpleado,dbo.persona.idPersona
FROM            dbo.cargo INNER JOIN
                         dbo.empleado ON dbo.cargo.idCargo = dbo.empleado.idCargo INNER JOIN
                         dbo.estado ON dbo.cargo.idEstado = dbo.estado.idEstado AND dbo.empleado.idEstado = dbo.estado.idEstado INNER JOIN
                         dbo.persona ON dbo.empleado.idPersona = dbo.persona.idPersona INNER JOIN
                         dbo.rol ON dbo.estado.idEstado = dbo.rol.idEstado INNER JOIN
                         dbo.tipoDocumento ON dbo.persona.idTipoDocumento = dbo.tipoDocumento.idTipoDocumento INNER JOIN
                         dbo.usuarioAcceso ON dbo.empleado.idEmpleado = dbo.usuarioAcceso.idEmpleado AND dbo.estado.idEstado = dbo.usuarioAcceso.idEstado AND dbo.estado.idEstado = dbo.usuarioAcceso.idEstado AND 
                         dbo.rol.idRol = dbo.usuarioAcceso.idRol
GO
/****** Object:  View [dbo].[VEmpleado]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VEmpleado]
as

						 SELECT        dbo.empleado.idEmpleado, dbo.persona.nombre, dbo.persona.apellido, dbo.cargo.descripcionCargo, dbo.empleado.idEstado, dbo.estado.decripcionEstado, dbo.persona.telefono, dbo.persona.fechaNacimiento, 
                         dbo.persona.correo, dbo.persona.nroDocumento
FROM            dbo.empleado INNER JOIN
                         dbo.estado ON dbo.empleado.idEstado = dbo.estado.idEstado INNER JOIN
                         dbo.persona ON dbo.empleado.idPersona = dbo.persona.idPersona INNER JOIN
                         dbo.cargo ON dbo.empleado.idCargo = dbo.cargo.idCargo AND dbo.estado.idEstado = dbo.cargo.idEstado
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idTipoPersona] [int] NOT NULL,
 CONSTRAINT [XPKclientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPersona]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPersona](
	[idTipoPersona] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [XPKtipoPersona] PRIMARY KEY CLUSTERED 
(
	[idTipoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VCliente]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VCliente]
as

						 SELECT        dbo.clientes.idCliente, dbo.persona.nombre, dbo.persona.apellido, dbo.tipoPersona.descripcion, dbo.persona.nroDocumento, dbo.persona.correo, dbo.persona.telefono
FROM            dbo.clientes INNER JOIN
                         dbo.tipoPersona ON dbo.clientes.idTipoPersona = dbo.tipoPersona.idTipoPersona INNER JOIN
                         dbo.persona ON dbo.clientes.idPersona = dbo.persona.idPersona INNER JOIN
                         dbo.tipoDocumento ON dbo.persona.idTipoDocumento = dbo.tipoDocumento.idTipoDocumento
GO
/****** Object:  Table [dbo].[detalleProducto]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleProducto](
	[idDetalleProducto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
 CONSTRAINT [XPKdetalleProducto] PRIMARY KEY CLUSTERED 
(
	[idDetalleProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[idDetalleProducto] [int] NOT NULL,
	[stock] [int] NULL,
	[precio] [money] NULL,
	[nombre] [nvarchar](50) NULL,
	[imagen] [image] NULL,
	[fechaRegistro] [datetime2](7) NULL,
	[idEstado] [bit] NULL,
 CONSTRAINT [XPKproducto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VProducto]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VProducto]
as
SELECT        dbo.producto.idProducto, dbo.producto.nombre, dbo.detalleProducto.descripcion, dbo.producto.stock, dbo.producto.precio, dbo.producto.idEstado
FROM            dbo.detalleProducto INNER JOIN
                         dbo.producto ON dbo.detalleProducto.idDetalleProducto = dbo.producto.idDetalleProducto
GO
/****** Object:  Table [dbo].[metodoPago]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metodoPago](
	[idMetodopago] [int] IDENTITY(1,1) NOT NULL,
	[nombreMetodoPago] [nvarchar](50) NULL,
 CONSTRAINT [XPKmetodoPago] PRIMARY KEY CLUSTERED 
(
	[idMetodopago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaVenta] [datetime2](6) NULL,
	[idTipoComprobante] [int] NOT NULL,
	[idMetodopago] [int] NOT NULL,
	[numeroDocumento] [varchar](50) NULL,
	[total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
 CONSTRAINT [XPKventa] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VVentas]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VVentas]
as
SELECT        dbo.venta.idVenta, dbo.metodoPago.nombreMetodoPago, dbo.venta.costoVenta, dbo.venta.subtotal, dbo.venta.fechaVenta
FROM            dbo.metodoPago INNER JOIN
                         dbo.venta ON dbo.metodoPago.idMetodopago = dbo.venta.idMetodopago
GO
/****** Object:  View [dbo].[VPersona]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VPersona] as
SELECT        dbo.persona.idPersona, dbo.persona.nombre, dbo.persona.apellido, dbo.persona.apellidoMaterno, dbo.persona.direccion, dbo.persona.telefono, dbo.persona.correo, dbo.tipoDocumento.descripcion, dbo.persona.nroDocumento, 
                         dbo.persona.nombreCompleto, dbo.tipoDocumento.idTipoDocumento
FROM            dbo.persona INNER JOIN
                         dbo.tipoDocumento ON dbo.persona.idTipoDocumento = dbo.tipoDocumento.idTipoDocumento
GROUP BY dbo.persona.idPersona, dbo.persona.nombre, dbo.persona.apellido, dbo.persona.apellidoMaterno, dbo.persona.direccion, dbo.persona.telefono, dbo.persona.correo, dbo.tipoDocumento.descripcion, dbo.persona.nroDocumento, 
                         dbo.persona.nombreCompleto, dbo.tipoDocumento.idTipoDocumento
GO
/****** Object:  Table [dbo].[detallePedido]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallePedido](
	[idProducto] [int] NOT NULL,
	[idPedidos] [int] NOT NULL,
	[idDetallePedido] [int] NOT NULL,
 CONSTRAINT [XPKdetallePedido] PRIMARY KEY CLUSTERED 
(
	[idDetallePedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleVenta]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleVenta](
	[idProducto] [int] NOT NULL,
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NOT NULL,
	[descuento] [money] NULL,
	[total] [money] NULL,
	[precio] [money] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [XPKdetalleVenta] PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error](
	[idError] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](100) NULL,
	[controller] [nvarchar](200) NULL,
	[ip] [nvarchar](100) NULL,
	[method] [nvarchar](20) NULL,
	[userAgent] [nvarchar](150) NULL,
	[host] [nvarchar](100) NULL,
	[classComponent] [nvarchar](100) NULL,
	[functionName] [nvarchar](100) NULL,
	[lineNumber] [int] NULL,
	[error] [nvarchar](200) NULL,
	[stackTrace] [nvarchar](200) NULL,
	[status] [smallint] NULL,
	[request] [nvarchar](max) NULL,
	[errorCode] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idUsuarioAcceso] [int] NOT NULL,
 CONSTRAINT [XPKerror] PRIMARY KEY CLUSTERED 
(
	[idError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menuAcceso]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuAcceso](
	[idMenu] [int] NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](200) NULL,
	[icono] [nvarchar](50) NULL,
	[datatarget] [nvarchar](50) NULL,
	[url] [nvarchar](100) NULL,
	[padre] [int] NULL,
	[idEstado] [bit] NOT NULL,
	[fechaCreacion] [datetime2](7) NULL,
	[fechaActualizacion] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menuRol]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuRol](
	[idMenuRol] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[idEstado] [bit] NOT NULL,
	[fechaCreacion] [datetime2](7) NULL,
	[fechaActualizacion] [datetime2](7) NULL,
	[idMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenuRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroDoc]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroDoc](
	[idNumDoc] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NOT NULL,
	[fechaRegistro] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[idPedidos] [int] IDENTITY(1,1) NOT NULL,
	[fechaEntrega] [datetime] NOT NULL,
	[hora] [time](7) NULL,
	[descripcion] [nvarchar](100) NULL,
	[idCliente] [int] NOT NULL,
	[cantidad] [smallint] NULL,
 CONSTRAINT [XPKpedidos] PRIMARY KEY CLUSTERED 
(
	[idPedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[ruc] [nvarchar](15) NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [XPKproveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedorProducto]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedorProducto](
	[idProveedor] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[idProveedorProducto] [int] IDENTITY(1,1) NOT NULL,
	[precioCosto] [money] NULL,
 CONSTRAINT [XPKproveedorProducto] PRIMARY KEY CLUSTERED 
(
	[idProveedorProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sesionUsuario]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sesionUsuario](
	[idSesionUser] [int] IDENTITY(1,1) NOT NULL,
	[ip] [nvarchar](max) NULL,
	[browser] [nvarchar](max) NULL,
	[token] [nvarchar](max) NULL,
	[tokenRefresh] [nvarchar](max) NULL,
	[fechaCreacion] [datetime2](6) NOT NULL,
	[fechaActuzalicion] [datetime2](6) NOT NULL,
	[idUsuarioAcceso] [int] NOT NULL,
 CONSTRAINT [XPKsesionUsuario] PRIMARY KEY CLUSTERED 
(
	[idSesionUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoComprobante]    Script Date: 13/11/2023 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoComprobante](
	[idTipoComprobante] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoComprobante] [nvarchar](50) NULL,
 CONSTRAINT [XPKtipoComprobante] PRIMARY KEY CLUSTERED 
(
	[idTipoComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cargo] ON 

INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (5, N'Administrador', N'ADM', 1)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (9, N'Jefe de Sistemas', N'JSIS', 1)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (10, N'Jefe de Operaciones', N'JOP', 0)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (11, N'Digitador', N'DIG', 1)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (12, N'Contador', N'CON', 0)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (13, N'Empleado', N'EMP', 0)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (14, N'Auxiliar', N'AUX', 1)
INSERT [dbo].[cargo] ([idCargo], [descripcionCargo], [codigo], [idEstado]) VALUES (22, N'Limpieza', N'LIM', 1)
SET IDENTITY_INSERT [dbo].[cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[detalleProducto] ON 

INSERT [dbo].[detalleProducto] ([idDetalleProducto], [descripcion]) VALUES (1, N'Porcelanato en ambientes interiores y exteriores sobre superficies de cemento y concreto')
INSERT [dbo].[detalleProducto] ([idDetalleProducto], [descripcion]) VALUES (2, N'Para instalar ceramicos en interiores y exteriores')
INSERT [dbo].[detalleProducto] ([idDetalleProducto], [descripcion]) VALUES (3, N'Especial para porcelanato y block de vidrio, pegamento con polimeros para superficies rigidas y flexibles')
INSERT [dbo].[detalleProducto] ([idDetalleProducto], [descripcion]) VALUES (4, N'Ideal para instalar mayolicas, ceramicos, porcelanato, marmol')
INSERT [dbo].[detalleProducto] ([idDetalleProducto], [descripcion]) VALUES (1002, NULL)
SET IDENTITY_INSERT [dbo].[detalleProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([idEmpleado], [idCargo], [idEstado], [idPersona]) VALUES (2, 5, 1, 3)
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[error] ON 

INSERT [dbo].[error] ([idError], [url], [controller], [ip], [method], [userAgent], [host], [classComponent], [functionName], [lineNumber], [error], [stackTrace], [status], [request], [errorCode], [idPersona], [idUsuarioAcceso]) VALUES (2, N'/api/Cargo', N'APIWebPage.Controllers.CargoController.Get (APIWebPage)', N'::1', N'GET', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0', N'localhost:7144', N'ClassComponent', N'FuncionName', 0, N'Exception of type ''CommonModel.CustomException'' was thrown.', N'', 1, N'', 0, 3, 6)
SET IDENTITY_INSERT [dbo].[error] OFF
GO
INSERT [dbo].[estado] ([idEstado], [decripcionEstado]) VALUES (0, N'inactivo')
INSERT [dbo].[estado] ([idEstado], [decripcionEstado]) VALUES (1, N'activo')
GO
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (1, N'DashBoard', N'manteniento', N'fa-solid fa-chart-line', NULL, N'mantenimiento/dashboard', NULL, 1, NULL, NULL)
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (2, N'Usuario', N'manteniento usuario', N'fa-solid fa-users', NULL, N'mantenimiento/usuario', NULL, 1, NULL, NULL)
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (3, N'Producto', N'manteniento producto', N'fa-brands fa-product-hunt', NULL, N'mantenimiento/producto', NULL, 1, NULL, NULL)
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (4, N'Ventas', N'manteniento ventas', N'fa-solid fa-basket-shopping', NULL, N'mantenimiento/venta', NULL, 1, NULL, NULL)
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (5, N'Historial Ventas', N'mantenimiento historial', N'fa-solid fa-file-pen', NULL, N'mantenimiento/historial_venta', NULL, 1, NULL, NULL)
INSERT [dbo].[menuAcceso] ([idMenu], [nombre], [descripcion], [icono], [datatarget], [url], [padre], [idEstado], [fechaCreacion], [fechaActualizacion]) VALUES (6, N'Reportes', N'mantenimiento reporte', N'fa-solid fa-receipt', NULL, N'mantenimiento/reporte', NULL, 1, NULL, NULL)
GO
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (2, 1, 1, NULL, NULL, 2)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (3, 1, 1, NULL, NULL, 3)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (4, 1, 1, NULL, NULL, 4)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (5, 1, 1, NULL, NULL, 5)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (6, 1, 1, NULL, NULL, 6)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (7, 6, 1, NULL, NULL, 4)
INSERT [dbo].[menuRol] ([idMenuRol], [idRol], [idEstado], [fechaCreacion], [fechaActualizacion], [idMenu]) VALUES (8, 6, 1, NULL, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[metodoPago] ON 

INSERT [dbo].[metodoPago] ([idMetodopago], [nombreMetodoPago]) VALUES (1, N'Tarjeta de Debito')
INSERT [dbo].[metodoPago] ([idMetodopago], [nombreMetodoPago]) VALUES (2, N'Tarjeta de Credito')
INSERT [dbo].[metodoPago] ([idMetodopago], [nombreMetodoPago]) VALUES (3, N'Al Contado')
INSERT [dbo].[metodoPago] ([idMetodopago], [nombreMetodoPago]) VALUES (4, N'Yape')
SET IDENTITY_INSERT [dbo].[metodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[NumeroDoc] ON 

INSERT [dbo].[NumeroDoc] ([idNumDoc], [ultimoNumero], [fechaRegistro]) VALUES (1, 0, CAST(N'2023-11-04T12:29:57.6100000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[NumeroDoc] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idPersona], [nombre], [apellido], [direccion], [telefono], [fechaNacimiento], [correo], [idTipoDocumento], [nroDocumento], [nombreCompleto], [apellidoMaterno]) VALUES (3, N'mauricio', N'contreras', N'jr pedro galvez', N'982775338', CAST(N'1999-07-09T00:00:00.0000000' AS DateTime2), N'i20260200@continental.edu.pe', 1, N'77416925', NULL, NULL)
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([idProducto], [idDetalleProducto], [stock], [precio], [nombre], [imagen], [fechaRegistro], [idEstado]) VALUES (1, 1, 50, 70.0000, N'Blanco Extrafuerte', NULL, CAST(N'2023-11-02T08:19:42.5100000' AS DateTime2), 1)
INSERT [dbo].[producto] ([idProducto], [idDetalleProducto], [stock], [precio], [nombre], [imagen], [fechaRegistro], [idEstado]) VALUES (2, 2, 50, 60.0000, N'Gris Interiores', NULL, CAST(N'2023-11-02T08:19:42.5100000' AS DateTime2), 1)
INSERT [dbo].[producto] ([idProducto], [idDetalleProducto], [stock], [precio], [nombre], [imagen], [fechaRegistro], [idEstado]) VALUES (3, 3, 50, 65.0000, N'Blanco Flexible', NULL, CAST(N'2023-11-02T08:19:42.5100000' AS DateTime2), 1)
INSERT [dbo].[producto] ([idProducto], [idDetalleProducto], [stock], [precio], [nombre], [imagen], [fechaRegistro], [idEstado]) VALUES (4, 4, 50, 70.0000, N'Gris Extrafuerte', NULL, CAST(N'2023-11-02T08:19:42.5100000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (1, N'ADM', N'Administardor', N'Administrar', 1)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (2, N'JSIS', N'Jefe de Sistemas', N'jefe en sistemas', 1)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (3, N'JOP', N'Jefe de Operaciones', N'jefe de operaciones', 0)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (4, N'DIG', N'Digitador', N'digitador', 1)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (5, N'CON', N'Contador', N'contador', 0)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (6, N'EMP', N'Empleado', N'empleado', 0)
INSERT [dbo].[rol] ([idRol], [codigo], [descripcion], [funcion], [idEstado]) VALUES (7, N'AUX', N'Auxiliar', N'auxiliar', 1)
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoDocumento] ON 

INSERT [dbo].[tipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[tipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (2, N'Carnet de Extranjeria')
INSERT [dbo].[tipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (3, N'Pasaporte')
SET IDENTITY_INSERT [dbo].[tipoDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoPersona] ON 

INSERT [dbo].[tipoPersona] ([idTipoPersona], [descripcion]) VALUES (1, N'Persona Natural')
INSERT [dbo].[tipoPersona] ([idTipoPersona], [descripcion]) VALUES (2, N'Persona Juridica')
SET IDENTITY_INSERT [dbo].[tipoPersona] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarioAcceso] ON 

INSERT [dbo].[usuarioAcceso] ([idUsuarioAcceso], [username], [password], [idEmpleado], [changePassword], [correo], [creaUsuario], [actualizaUsuario], [fechaDeCreacion], [fechaDeActulizacion], [idEstado], [idRol], [celularIdentificador]) VALUES (6, N'admi', N'123456', 2, 0, N'', 1, 1, CAST(N'2023-09-20T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-20T00:00:00.0000000' AS DateTime2), 1, 1, N'')
SET IDENTITY_INSERT [dbo].[usuarioAcceso] OFF
GO
ALTER TABLE [dbo].[NumeroDoc] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[cargo]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[cargo] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [R_2]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([idTipoPersona])
REFERENCES [dbo].[tipoPersona] ([idTipoPersona])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([idPedidos])
REFERENCES [dbo].[pedidos] ([idPedidos])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [R_5]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [R_6]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([idVenta])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [R_7]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([idCargo])
REFERENCES [dbo].[cargo] ([idCargo])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [R_8]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [R_9]
GO
ALTER TABLE [dbo].[error]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[error] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[error]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([idUsuarioAcceso])
REFERENCES [dbo].[usuarioAcceso] ([idUsuarioAcceso])
GO
ALTER TABLE [dbo].[error] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[menuAcceso]  WITH CHECK ADD FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[menuRol]  WITH CHECK ADD FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[menuRol]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[menuAcceso] ([idMenu])
GO
ALTER TABLE [dbo].[menuRol]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [R_13]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [R_14]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([idDetalleProducto])
REFERENCES [dbo].[detalleProducto] ([idDetalleProducto])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[proveedorProducto]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[proveedorProducto] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[proveedorProducto]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[proveedorProducto] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[rol]  WITH CHECK ADD  CONSTRAINT [R_19] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[rol] CHECK CONSTRAINT [R_19]
GO
ALTER TABLE [dbo].[sesionUsuario]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([idUsuarioAcceso])
REFERENCES [dbo].[usuarioAcceso] ([idUsuarioAcceso])
GO
ALTER TABLE [dbo].[sesionUsuario] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[usuarioAcceso]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[usuarioAcceso] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[usuarioAcceso]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[usuarioAcceso] CHECK CONSTRAINT [R_22]
GO
ALTER TABLE [dbo].[usuarioAcceso]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[usuarioAcceso] CHECK CONSTRAINT [R_23]
GO
ALTER TABLE [dbo].[usuarioAcceso]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[usuarioAcceso] CHECK CONSTRAINT [R_24]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarioAcceso] ([idUsuarioAcceso])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [R_25]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [R_26]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([idTipoComprobante])
REFERENCES [dbo].[tipoComprobante] ([idTipoComprobante])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [R_27]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([idMetodopago])
REFERENCES [dbo].[metodoPago] ([idMetodopago])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [R_28]
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
         Begin Table = "cargo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "empleado"
            Begin Extent = 
               Top = 100
               Left = 284
               Bottom = 230
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "estado"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 102
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "persona"
            Begin Extent = 
               Top = 6
               Left = 684
               Bottom = 136
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rol"
            Begin Extent = 
               Top = 133
               Left = 520
               Bottom = 263
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tipoDocumento"
            Begin Extent = 
               Top = 249
               Left = 681
               Bottom = 345
               Right = 866
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "usuarioAcceso"
            Begin Extent = 
               Top = 201
               Left = 53
               Bottom = 331
               Right = 250
            End
            DisplayFlags =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VUsuario'
GO
USE [master]
GO
ALTER DATABASE [ferranovabd] SET  READ_WRITE 
GO
