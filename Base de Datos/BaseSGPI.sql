USE [master]
GO
/****** Object:  Database [SGPI]    Script Date: 25/10/2023 11:56:27 ******/
CREATE DATABASE [SGPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SGPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SGPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SGPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SGPI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SGPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SGPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SGPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SGPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [SGPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SGPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SGPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SGPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SGPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SGPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SGPI] SET  MULTI_USER 
GO
ALTER DATABASE [SGPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SGPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SGPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SGPI] SET QUERY_STORE = ON
GO
ALTER DATABASE [SGPI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SGPI]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Idasig] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
	[grupo] [int] NOT NULL,
	[periodo_acad] [varchar](50) NOT NULL,
	[aula] [varchar](50) NOT NULL,
	[fecha] [date] NOT NULL,
	[Idprog] [int] NOT NULL,
 CONSTRAINT [PK_Asignatura] PRIMARY KEY CLUSTERED 
(
	[Idasig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_asig] UNIQUE NONCLUSTERED 
(
	[Idasig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[Iddoc] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[Iddoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_doc] UNIQUE NONCLUSTERED 
(
	[Iddoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[Idgen] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[Idgen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_gen] UNIQUE NONCLUSTERED 
(
	[Idgen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homologacion]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homologacion](
	[Idhom] [int] IDENTITY(1,1) NOT NULL,
	[Idtipohom] [int] NOT NULL,
	[Idasig] [int] NOT NULL,
	[Iduser] [int] NOT NULL,
	[tipodoc] [int] NOT NULL,
	[documento] [int] NOT NULL,
	[nivelanterior] [int] NOT NULL,
	[asiganterior] [varchar](255) NOT NULL,
	[creditosanterior] [int] NOT NULL,
	[nivelnuevo] [int] NOT NULL,
	[programa] [varchar](255) NOT NULL,
	[asignueva] [varchar](255) NOT NULL,
	[creditosnuevos] [int] NOT NULL,
	[nota] [float] NOT NULL,
 CONSTRAINT [PK_Homologacion] PRIMARY KEY CLUSTERED 
(
	[Idhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_hom] UNIQUE NONCLUSTERED 
(
	[Idhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[Idpay] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[recibo] [varchar](255) NOT NULL,
	[Iduser] [int] NOT NULL,
	[valor] [float] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[Idpay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_pay] UNIQUE NONCLUSTERED 
(
	[Idpay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[Idprog] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Programa] PRIMARY KEY CLUSTERED 
(
	[Idprog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_prog] UNIQUE NONCLUSTERED 
(
	[Idprog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Idrol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_rol] UNIQUE NONCLUSTERED 
(
	[Idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Homologacion]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Homologacion](
	[Idtipohom] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tipo_Homologacion] PRIMARY KEY CLUSTERED 
(
	[Idtipohom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_tipo_hom] UNIQUE NONCLUSTERED 
(
	[Idtipohom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Iduser] [int] NOT NULL,
	[primer_nombre] [varchar](100) NOT NULL,
	[segundo_nombre] [varchar](100) NULL,
	[primer_apellido] [varchar](100) NOT NULL,
	[segundo_apellido] [varchar](100) NULL,
	[num_doc] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[pass] [varchar](100) NOT NULL,
	[documento] [int] NOT NULL,
	[genero] [int] NOT NULL,
	[programa] [int] NOT NULL,
	[rol] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ID_usuer] UNIQUE NONCLUSTERED 
(
	[Iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Programa] FOREIGN KEY([Idprog])
REFERENCES [dbo].[Programa] ([Idprog])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_Asignatura_Programa]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Asignatura] FOREIGN KEY([Idasig])
REFERENCES [dbo].[Asignatura] ([Idasig])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Asignatura]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Tipo_Homologacion] FOREIGN KEY([Idtipohom])
REFERENCES [dbo].[Tipo_Homologacion] ([Idtipohom])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Tipo_Homologacion]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Usuarios] FOREIGN KEY([Iduser])
REFERENCES [dbo].[Usuarios] ([Iduser])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Usuarios]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Usuarios] FOREIGN KEY([Iduser])
REFERENCES [dbo].[Usuarios] ([Iduser])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Documento] FOREIGN KEY([documento])
REFERENCES [dbo].[Documento] ([Iddoc])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Documento]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Genero] FOREIGN KEY([genero])
REFERENCES [dbo].[Genero] ([Idgen])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Genero]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Programa] FOREIGN KEY([programa])
REFERENCES [dbo].[Programa] ([Idprog])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Programa]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([rol])
REFERENCES [dbo].[Rol] ([Idrol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuariosCompletos]    Script Date: 25/10/2023 11:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerUsuariosCompletos]
AS
BEGIN
    SELECT u.Iduser, u.primer_nombre AS PrimerNombre, u.segundo_nombre AS SegundoNombre, 
           u.primer_apellido AS PrimerApellido, u.segundo_apellido AS SegundoApellido, 
           u.num_doc AS NumDoc, u.email AS Email, u.pass AS Pass, 
           d.descripcion AS Documento, g.descripcion AS Genero, 
           p.descripcion AS Programa, r.descripcion AS Rol, u.activo AS Activo
    FROM [SGPI].[dbo].[Usuarios] u
    LEFT JOIN [SGPI].[dbo].[Documento] d ON u.documento = d.Iddoc
    LEFT JOIN [SGPI].[dbo].[Genero] g ON u.genero = g.Idgen
    LEFT JOIN [SGPI].[dbo].[Programa] p ON u.programa = p.Idprog
    LEFT JOIN [SGPI].[dbo].[Rol] r ON u.rol = r.Idrol;
END;

EXEC sp_ObtenerUsuariosCompletos;
GO
USE [master]
GO
ALTER DATABASE [SGPI] SET  READ_WRITE 
GO

INSERT INTO [SGPI].[dbo].[Genero] ([descripcion])
VALUES
('Masculino'),
('Femenino'),
('No binario'),
('Otro'),
('38 tipos de gay y Sebástian');

INSERT INTO [SGPI].[dbo].[Documento] ([descripcion])
VALUES
('DNI'),
('Pasaporte'),
('Cédula'),
('Tarjeta de Identidad'),
('Cédula Extranjera');

INSERT INTO [SGPI].[dbo].[Rol] ([descripcion])
VALUES
('Administrador'),
('Estudiante'),
('Profesor'),
('Personal de Soporte'),
('Invitado');

INSERT INTO [SGPI].[dbo].[Programa] ([descripcion])
VALUES
('Ingeniería Informática'),
('Historia'),
('Física'),
('Ingeniería de Software'),
('Idiomas');

INSERT INTO [SGPI].[dbo].[Usuarios] ([primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [num_doc], [email], [pass], [documento], [genero], [programa], [rol], [activo])
VALUES
('Juan', 'José', 'Pérez', 'López', 12345, 'juan.perez@email.com', 'password123', 1, 1, 1, 1, 1),
('María', 'Isabel', 'Gómez', 'Rodríguez', 67890, 'maria.gomez@email.com', 'claveSegura', 2, 2, 2, 2, 1),
('Pedro', NULL, 'Sánchez', NULL, 54321, 'pedro.sanchez@email.com', 'mipassword', 3, 3, 3, 2, 1),
('Laura', 'María', 'Torres', 'García', 98765, 'laura.torres@email.com', 'contraseña', 4, 4, 4, 1, 1),
('Carlos', 'Andrés', 'Martínez', 'Pérez', 11223, 'carlos.martinez@email.com', 'clave123', 5, 5, 5, 3, 1);

INSERT INTO [SGPI].[dbo].[Asignatura] ([descripcion], [grupo], [periodo_acad], [aula], [fecha], [Idprog])
VALUES
('Matemáticas 101', 1, '2023-01', 'Aula 101', '2023-10-25', 1),
('Historia Universal', 2, '2023-02', 'Aula 102', '2023-10-26', 2),
('Física Avanzada', 1, '2023-01', 'Aula 103', '2023-10-27', 3),
('Programación en C', 3, '2023-03', 'Aula 104', '2023-10-28', 4),
('Inglés Básico', 2, '2023-02', 'Aula 105', '2023-10-29', 5);

INSERT INTO [SGPI].[dbo].[Tipo_Homologacion] ([descripcion])
VALUES
('Homologación de Contenido'),
('Homologación de Créditos'),
('Homologación de Evaluación');

INSERT INTO [SGPI].[dbo].[Homologacion] ([Idtipohom], [Idasig], [Iduser], [tipodoc], [documento], [nivelanterior], [asiganterior], [creditosanterior], [nivelnuevo], [programa], [asignueva], [creditosnuevos], [nota])
VALUES
(1, 1, 1, 1, 12345, 3, 'Cálculo I', 4, 4, 'Ingeniería Informática', 'Cálculo II', 3, 4.5),
(2, 2, 2, 2, 67890, 2, 'Historia Antigua', 3, 3, 'Historia', 'Historia Medieval', 4, 4.0),
(1, 3, 3, 1, 54321, 1, 'Física Clásica', 3, 3, 'Física', 'Física Cuántica', 3, 3.7),
(2, 1, 4, 3, 98765, 4, 'Programación en Python', 4, 2, 'Ingeniería de Software', 'Programación en Java', 4, 4.2),
(1, 2, 5, 1, 11223, 2, 'Inglés Básico', 2, 5, 'Idiomas', 'Inglés Intermedio', 3, 4.8);

INSERT INTO [SGPI].[dbo].[Pagos] ([fecha], [recibo], [Iduser], [valor])
VALUES
('2023-10-25', 'REC-001', 1, 500.00),
('2023-10-26', 'REC-002', 2, 600.00),
('2023-10-27', 'REC-003', 3, 750.00),
('2023-10-28', 'REC-004', 4, 800.00),
('2023-10-29', 'REC-005', 5, 900.00);
