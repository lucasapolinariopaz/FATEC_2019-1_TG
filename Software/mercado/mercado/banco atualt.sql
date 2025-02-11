/*    ==Parâmetros de Script==

    Versão do Servidor de Origem : SQL Server 2014 (12.0.2269)
    Edição do Mecanismo de Banco de Dados de Origem : Microsoft SQL Server Express Edition
    Tipo do Mecanismo de Banco de Dados de Origem : SQL Server Autônomo

    Versão do Servidor de Destino : SQL Server 2017
    Edição de Mecanismo de Banco de Dados de Destino : Microsoft SQL Server Standard Edition
    Tipo de Mecanismo de Banco de Dados de Destino : SQL Server Autônomo
*/
USE [master]
GO
/****** Object:  Database [mercado_tg]    Script Date: 02/06/2019 18:22:51 ******/
CREATE DATABASE [mercado_tg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mercado_tg', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mercado_tg.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mercado_tg_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mercado_tg_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mercado_tg] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mercado_tg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mercado_tg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mercado_tg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mercado_tg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mercado_tg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mercado_tg] SET ARITHABORT OFF 
GO
ALTER DATABASE [mercado_tg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mercado_tg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mercado_tg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mercado_tg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mercado_tg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mercado_tg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mercado_tg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mercado_tg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mercado_tg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mercado_tg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mercado_tg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mercado_tg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mercado_tg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mercado_tg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mercado_tg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mercado_tg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mercado_tg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mercado_tg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mercado_tg] SET  MULTI_USER 
GO
ALTER DATABASE [mercado_tg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mercado_tg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mercado_tg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mercado_tg] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mercado_tg] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mercado_tg]
GO
/****** Object:  Table [dbo].[abertura]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[abertura](
	[codAber] [int] IDENTITY(1,1) NOT NULL,
	[nomefunc] [varchar](50) NOT NULL,
	[cpffunc] [varchar](50) NOT NULL,
	[dataaber] [varchar](50) NOT NULL,
	[valorabertura] [decimal](18, 2) NOT NULL,
	[estatus] [varchar](3) NOT NULL,
 CONSTRAINT [PK_abertura] PRIMARY KEY CLUSTERED 
(
	[codAber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acesso]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acesso](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[CPF_usuario] [varchar](50) NOT NULL,
	[senha_usuario] [varchar](50) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_acesso] PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[cod_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categ] [varchar](50) NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[cod_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[codigo_cli] [int] IDENTITY(1,1) NOT NULL,
	[nome_cli] [varchar](50) NOT NULL,
	[datanasc_cli] [varchar](50) NOT NULL,
	[telefone_cli] [varchar](20) NOT NULL,
	[celular_cli] [varchar](20) NOT NULL,
	[RG_cli] [varchar](20) NOT NULL,
	[CPF_cli] [varchar](20) NOT NULL,
	[endereco_cli] [varchar](50) NOT NULL,
	[cidade_cli] [varchar](20) NOT NULL,
	[bairro_cli] [varchar](20) NOT NULL,
	[numero_cli] [int] NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[codigo_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[debitoscli]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[debitoscli](
	[cod_debito] [int] IDENTITY(1,1) NOT NULL,
	[valordeb] [decimal](18, 2) NOT NULL,
	[datadeb] [varchar](50) NOT NULL,
	[cod_clideb] [int] NOT NULL,
	[vendacli] [int] NOT NULL,
 CONSTRAINT [PK_debitoscli] PRIMARY KEY CLUSTERED 
(
	[cod_debito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dependentes]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependentes](
	[cod_dependentes] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[parentesco] [varchar](50) NOT NULL,
	[cod_clidp] [int] NOT NULL,
 CONSTRAINT [PK_dependentes] PRIMARY KEY CLUSTERED 
(
	[cod_dependentes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalheVenda]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalheVenda](
	[cdodetalhe] [int] IDENTITY(1,1) NOT NULL,
	[codProdV] [int] NOT NULL,
	[codDetV] [int] NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[descProdV] [varchar](50) NOT NULL,
	[valorUniV] [decimal](18, 2) NOT NULL,
	[unidades] [int] NOT NULL,
	[subValortotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_detalheVenda] PRIMARY KEY CLUSTERED 
(
	[cdodetalhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalheVendatemp]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalheVendatemp](
	[cdodetalhetemp] [int] IDENTITY(1,1) NOT NULL,
	[codProdV] [int] NOT NULL,
	[codDetV] [int] NULL,
	[marca] [varchar](50) NOT NULL,
	[descProdV] [varchar](50) NOT NULL,
	[valorUniV] [decimal](18, 2) NOT NULL,
	[unidades] [int] NOT NULL,
	[subValortotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_detalheVendatemp] PRIMARY KEY CLUSTERED 
(
	[cdodetalhetemp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estoque]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estoque](
	[codigo_prod] [int] IDENTITY(1,1) NOT NULL,
	[codigo_barra] [varchar](50) NOT NULL,
	[descricao_prod] [varchar](50) NOT NULL,
	[categoria_prod] [varchar](50) NOT NULL,
	[marca_prod] [varchar](50) NOT NULL,
	[preco_custo] [decimal](18, 2) NOT NULL,
	[preco_venda] [decimal](18, 2) NOT NULL,
	[estoque_atualprod] [int] NOT NULL,
	[validade_prod] [varchar](50) NULL,
	[codprod_fornec] [int] NOT NULL,
	[data_entrada] [varchar](50) NULL,
	[codprodentrada] [int] NOT NULL,
 CONSTRAINT [PK_estoque] PRIMARY KEY CLUSTERED 
(
	[codigo_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fechamento]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fechamento](
	[codAber] [int] IDENTITY(1,1) NOT NULL,
	[nomefunc] [varchar](50) NOT NULL,
	[cpffunc] [varchar](50) NOT NULL,
	[dataaber] [varchar](50) NOT NULL,
	[valoraberturaf] [decimal](18, 2) NOT NULL,
	[saida] [varchar](200) NULL,
	[valorsaida] [decimal](18, 2) NULL,
	[estatus] [varchar](3) NOT NULL,
 CONSTRAINT [PK_fechamneto] PRIMARY KEY CLUSTERED 
(
	[codAber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fornecedor]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fornecedor](
	[cod_fornecdor] [int] IDENTITY(1,1) NOT NULL,
	[nome_fornecedor] [varchar](50) NOT NULL,
	[CNPJ] [varchar](50) NOT NULL,
	[IE] [varchar](50) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[telefone_fornec] [varchar](50) NOT NULL,
	[celular] [varchar](50) NULL,
 CONSTRAINT [PK_fornecedor] PRIMARY KEY CLUSTERED 
(
	[cod_fornecdor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[cod_marca] [int] IDENTITY(1,1) NOT NULL,
	[nome_marcas] [varchar](50) NOT NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[cod_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notasfiscais]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notasfiscais](
	[idnota] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[imagemnota] [image] NOT NULL,
 CONSTRAINT [PK_notasfiscais] PRIMARY KEY CLUSTERED 
(
	[idnota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produtoentrada]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produtoentrada](
	[codigo_prod] [int] IDENTITY(1,1) NOT NULL,
	[codigo_barra] [varchar](50) NOT NULL,
	[descricao_prod] [varchar](50) NOT NULL,
	[categoria_prod] [varchar](50) NOT NULL,
	[marca_prod] [varchar](50) NOT NULL,
	[preco_custo] [decimal](18, 2) NOT NULL,
	[preco_venda] [decimal](18, 2) NOT NULL,
	[estoque_atualprod] [int] NOT NULL,
	[validade_prod] [varchar](50) NULL,
	[codprod_fornec] [int] NOT NULL,
	[unidades] [int] NOT NULL,
	[data_entrada] [varchar](50) NOT NULL,
 CONSTRAINT [PK_produtoentrada] PRIMARY KEY CLUSTERED 
(
	[codigo_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produtosaida]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produtosaida](
	[cod_prodsaida] [int] IDENTITY(1,1) NOT NULL,
	[quantidade_saida] [int] NULL,
	[cod_prod_entrada] [int] NOT NULL,
	[data_saida] [timestamp] NOT NULL,
	[rank] [int] NOT NULL,
 CONSTRAINT [PK_produtosaida] PRIMARY KEY CLUSTERED 
(
	[cod_prodsaida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 02/06/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[cod_venda] [int] IDENTITY(1,1) NOT NULL,
	[datavenda] [varchar](50) NOT NULL,
	[valTotal] [decimal](18, 2) NOT NULL,
	[forPagamento] [varchar](50) NOT NULL,
	[codcliV] [int] NULL,
	[nomeclienteDep] [varchar](50) NULL,
	[valpago] [decimal](18, 2) NULL,
	[troco] [decimal](18, 2) NULL,
	[desconto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[cod_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[abertura] ON 

INSERT [dbo].[abertura] ([codAber], [nomefunc], [cpffunc], [dataaber], [valorabertura], [estatus]) VALUES (1, N'CESAR ALEXANDRE', N'22358867870', N'02/05/2019', CAST(5000.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[abertura] ([codAber], [nomefunc], [cpffunc], [dataaber], [valorabertura], [estatus]) VALUES (3, N'CESAR ALEXANDRE', N'22358867870', N'02/05/2019', CAST(0.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[abertura] ([codAber], [nomefunc], [cpffunc], [dataaber], [valorabertura], [estatus]) VALUES (1002, N'CESAR ALEXANDRE', N'22358867870', N'12/05/2019', CAST(2.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[abertura] ([codAber], [nomefunc], [cpffunc], [dataaber], [valorabertura], [estatus]) VALUES (1003, N'CESAR ALEXANDRE', N'22358867870', N'12/05/2019', CAST(0.55 AS Decimal(18, 2)), N'OFF')
SET IDENTITY_INSERT [dbo].[abertura] OFF
SET IDENTITY_INSERT [dbo].[acesso] ON 

INSERT [dbo].[acesso] ([cod_usuario], [CPF_usuario], [senha_usuario], [tipo], [nome]) VALUES (3, N'22358867870', N'123', N'ADMINISTRADOR', N'CESAR ALEXANDRE')
SET IDENTITY_INSERT [dbo].[acesso] OFF
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (1, N'ALIMENTOS')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (2, N'CARNES,AVES E PEIXES')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (3, N'BEBIDAS')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (4, N'BEBIDAS ALCOOLICAS')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (5, N'HIIGIENE PESSOAL')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (6, N'PRODUTOS DE LIMPEZA')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (7, N'PADARIA')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (8, N'UTENSILIOS DO LAR')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (1009, N'----------')
INSERT [dbo].[categoria] ([cod_categoria], [categ]) VALUES (1010, N'METAL')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([codigo_cli], [nome_cli], [datanasc_cli], [telefone_cli], [celular_cli], [RG_cli], [CPF_cli], [endereco_cli], [cidade_cli], [bairro_cli], [numero_cli]) VALUES (3, N'CESAR ALEXANDRE', N'1990-02-01', N'4545488', N'878787978', N'548874987', N'48978748978', N'DEDFEFD', N'EFEF', N'VFVFV', 45)
INSERT [dbo].[clientes] ([codigo_cli], [nome_cli], [datanasc_cli], [telefone_cli], [celular_cli], [RG_cli], [CPF_cli], [endereco_cli], [cidade_cli], [bairro_cli], [numero_cli]) VALUES (2, N'CESAR ALEX', N'1990-03-01', N'6767676', N'899898', N'909090', N'90909', N'GHGH', N'GHGH', N'JUJU', 44)
INSERT [dbo].[clientes] ([codigo_cli], [nome_cli], [datanasc_cli], [telefone_cli], [celular_cli], [RG_cli], [CPF_cli], [endereco_cli], [cidade_cli], [bairro_cli], [numero_cli]) VALUES (1, N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', 0)
SET IDENTITY_INSERT [dbo].[clientes] OFF
SET IDENTITY_INSERT [dbo].[debitoscli] ON 

INSERT [dbo].[debitoscli] ([cod_debito], [valordeb], [datadeb], [cod_clideb], [vendacli]) VALUES (1, CAST(8.45 AS Decimal(18, 2)), N'02/06/2019', 2, 12)
SET IDENTITY_INSERT [dbo].[debitoscli] OFF
SET IDENTITY_INSERT [dbo].[dependentes] ON 

INSERT [dbo].[dependentes] ([cod_dependentes], [nome], [parentesco], [cod_clidp]) VALUES (1, N'TESTE JUNIOR', N'FILHO', 2)
INSERT [dbo].[dependentes] ([cod_dependentes], [nome], [parentesco], [cod_clidp]) VALUES (2, N'ANA', N'ESPOSA', 2)
INSERT [dbo].[dependentes] ([cod_dependentes], [nome], [parentesco], [cod_clidp]) VALUES (4, N'TESTE2', N'MAE', 3)
INSERT [dbo].[dependentes] ([cod_dependentes], [nome], [parentesco], [cod_clidp]) VALUES (5, N'PAULA', N'TIA', 3)
SET IDENTITY_INSERT [dbo].[dependentes] OFF
SET IDENTITY_INSERT [dbo].[detalheVenda] ON 

INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (32, 3, 10, N'PANCO', N'OLEO VEGETAL 1 LITRO', CAST(8.45 AS Decimal(18, 2)), 10, CAST(84.50 AS Decimal(18, 2)))
INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (33, 2, 10, N'SOYA', N'OLEO VEGETAL', CAST(8.30 AS Decimal(18, 2)), 3, CAST(24.90 AS Decimal(18, 2)))
INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (34, 1, 10, N'ITAIPAVA', N'CERVEJA GARRAFA 600ML ITAIPAVA', CAST(65.00 AS Decimal(18, 2)), 2, CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (35, 2, 11, N'SOYA', N'OLEO VEGETAL', CAST(8.30 AS Decimal(18, 2)), 3, CAST(24.90 AS Decimal(18, 2)))
INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (36, 1, 11, N'ITAIPAVA', N'CERVEJA GARRAFA 600ML ITAIPAVA', CAST(65.00 AS Decimal(18, 2)), 1, CAST(65.00 AS Decimal(18, 2)))
INSERT [dbo].[detalheVenda] ([cdodetalhe], [codProdV], [codDetV], [marca], [descProdV], [valorUniV], [unidades], [subValortotal]) VALUES (37, 3, 11, N'PANCO', N'OLEO VEGETAL 1 LITRO', CAST(8.45 AS Decimal(18, 2)), 2, CAST(16.90 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[detalheVenda] OFF
SET IDENTITY_INSERT [dbo].[estoque] ON 

INSERT [dbo].[estoque] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [data_entrada], [codprodentrada]) VALUES (1, N'6666666666666', N'CERVEJA GARRAFA 600ML ITAIPAVA', N'BEBIDAS ALCOOLICAS', N'ITAIPAVA', CAST(4.55 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), 24, N'10/10/2019', 2, N'Mar 19 2019 12:00AM', 3)
INSERT [dbo].[estoque] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [data_entrada], [codprodentrada]) VALUES (2, N'7777777777777', N'OLEO VEGETAL', N'ALIMENTOS', N'SOYA', CAST(75.00 AS Decimal(18, 2)), CAST(8.30 AS Decimal(18, 2)), 22, N'10/09/2019', 7, N'20/04/2019', 8)
INSERT [dbo].[estoque] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [data_entrada], [codprodentrada]) VALUES (3, N'5555555555555', N'OLEO VEGETAL 1 LITRO', N'ALIMENTOS', N'PANCO', CAST(6.50 AS Decimal(18, 2)), CAST(8.45 AS Decimal(18, 2)), 23, N'10/02/2019', 5, N'20/04/2019', 9)
SET IDENTITY_INSERT [dbo].[estoque] OFF
SET IDENTITY_INSERT [dbo].[fechamento] ON 

INSERT [dbo].[fechamento] ([codAber], [nomefunc], [cpffunc], [dataaber], [valoraberturaf], [saida], [valorsaida], [estatus]) VALUES (1, N'CESAR ALEXANDRE', N'22358867870', N'02/05/2019', CAST(5000.00 AS Decimal(18, 2)), N'', CAST(0.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[fechamento] ([codAber], [nomefunc], [cpffunc], [dataaber], [valoraberturaf], [saida], [valorsaida], [estatus]) VALUES (2, N'CESAR ALEXANDRE', N'22358867870', N'02/05/2019', CAST(0.00 AS Decimal(18, 2)), N'', CAST(0.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[fechamento] ([codAber], [nomefunc], [cpffunc], [dataaber], [valoraberturaf], [saida], [valorsaida], [estatus]) VALUES (3, N'CESAR ALEXANDRE', N'22358867870', N'12/05/2019', CAST(2.00 AS Decimal(18, 2)), N'', CAST(0.00 AS Decimal(18, 2)), N'OFF')
INSERT [dbo].[fechamento] ([codAber], [nomefunc], [cpffunc], [dataaber], [valoraberturaf], [saida], [valorsaida], [estatus]) VALUES (4, N'CESAR ALEXANDRE', N'22358867870', N'12/05/2019', CAST(0.55 AS Decimal(18, 2)), N'', CAST(0.00 AS Decimal(18, 2)), N'OFF')
SET IDENTITY_INSERT [dbo].[fechamento] OFF
SET IDENTITY_INSERT [dbo].[fornecedor] ON 

INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (1, N'----------', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM', N'NENHUM')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (2, N'SÃO LUIZ', N'12345678901234', N'45632178', N'RUA ONOFRE', N'ITAPETININGA', N'CENTRO', N'SP', N'1532751540', N'15999974852')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (3, N'MARTINS', N'43210987654321', N'95135274', N'RUA FANTASIA', N'ITAPETININGA', N'CENTRO', N'SP', N'1568794521', N'156489751')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (4, N'FANTASIA', N'14785236912345', N'15975365482', N'RUA FANTASIA', N'ITAPE', N'B. NUNCA', N'SP', N'122346587', N'87984659')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (5, N'SSS', N'12345678901111', N'23235454654', N'DDDD', N'FFF', N'GGG', N'SD', N'3434354545', N'565656')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (6, N'BBBNHHNNH', N'74185296312345', N'3243', N'SDSDS', N'2323', N'34343', N'SP', N'4567484674', N'878798')
INSERT [dbo].[fornecedor] ([cod_fornecdor], [nome_fornecedor], [CNPJ], [IE], [endereco], [cidade], [bairro], [estado], [telefone_fornec], [celular]) VALUES (7, N'ASASDS', N'12344678901234', N'2323234234', N'SDSDS', N'SDSFF', N'GFGF', N'SD', N'232323423', N'232324')
SET IDENTITY_INSERT [dbo].[fornecedor] OFF
SET IDENTITY_INSERT [dbo].[marcas] ON 

INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (1, N'----------')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (2, N'BRAHMA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (3, N'SCHIN')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (4, N'KAISER')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (5, N'BOHEMIA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (6, N'BAVARIA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (7, N'ITAIPAVA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (8, N'ANTARCTICA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (9, N'SMIRNOFF')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (10, N'PANCO')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (11, N'SOYA')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (12, N'SKOL')
INSERT [dbo].[marcas] ([cod_marca], [nome_marcas]) VALUES (13, N'SOLARE')
SET IDENTITY_INSERT [dbo].[marcas] OFF
SET IDENTITY_INSERT [dbo].[produtoentrada] ON 

INSERT [dbo].[produtoentrada] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [unidades], [data_entrada]) VALUES (1, N'123456789', N'CERVEJA GARRAFA 600ML ', N'BEBIDAS ALCOOLICAS', N'BRAHMA', CAST(5.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 13, N'10/10/2019', 2, 40, N'Jan  1 1900 12:00AM')
INSERT [dbo].[produtoentrada] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [unidades], [data_entrada]) VALUES (3, N'123456', N'CERVEJA GARRAFA 600ML ITAIPAVA', N'BEBIDAS ALCOOLICAS', N'ITAIPAVA', CAST(44.00 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), 12, N'10/10/2019', 2, 2, N'Mar 19 2019 12:00AM')
INSERT [dbo].[produtoentrada] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [unidades], [data_entrada]) VALUES (8, N'5555555555555', N'OLEO VEGETAL', N'BEBIDAS', N'SOYA', CAST(6.50 AS Decimal(18, 2)), CAST(8.45 AS Decimal(18, 2)), 0, N'10/10/2019', 0, 65, N'20/04/2019')
INSERT [dbo].[produtoentrada] ([codigo_prod], [codigo_barra], [descricao_prod], [categoria_prod], [marca_prod], [preco_custo], [preco_venda], [estoque_atualprod], [validade_prod], [codprod_fornec], [unidades], [data_entrada]) VALUES (9, N'5555555555555', N'OLEO VEGETAL', N'ALIMENTOS', N'SOYA', CAST(6.50 AS Decimal(18, 2)), CAST(8.45 AS Decimal(18, 2)), 65, N'10/02/2019', 4, 3, N'20/04/2019')
SET IDENTITY_INSERT [dbo].[produtoentrada] OFF
SET IDENTITY_INSERT [dbo].[Venda] ON 

INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (1, N'15/05/2019', CAST(25.20 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(30.00 AS Decimal(18, 2)), CAST(4.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (2, N'16/05/2019', CAST(8.30 AS Decimal(18, 2)), N'A PRAZO', 0, N'', CAST(8.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (3, N'16/05/2019', CAST(8.30 AS Decimal(18, 2)), N'CARTÃO', 0, N'', CAST(8.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (4, N'01/06/2019', CAST(228.50 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(230.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (5, N'02/06/2019', CAST(324.20 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(325.00 AS Decimal(18, 2)), CAST(0.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (6, N'02/06/2019', CAST(239.40 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(240.00 AS Decimal(18, 2)), CAST(0.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (7, N'02/06/2019', CAST(555.00 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (8, N'02/06/2019', CAST(555.00 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (9, N'02/06/2019', CAST(55.00 AS Decimal(18, 2)), N'CARTÃO', 0, N'', CAST(55.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (10, N'02/06/2019', CAST(44.00 AS Decimal(18, 2)), N'DINHEIRO', 0, N'', CAST(44.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (11, N'02/06/2019', CAST(106.80 AS Decimal(18, 2)), N'A PRAZO', 0, N'', CAST(106.80 AS Decimal(18, 2)), CAST(-106.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Venda] ([cod_venda], [datavenda], [valTotal], [forPagamento], [codcliV], [nomeclienteDep], [valpago], [troco], [desconto]) VALUES (12, N'02/06/2019', CAST(8.45 AS Decimal(18, 2)), N'DINHEIRO', 2, N'', CAST(0.00 AS Decimal(18, 2)), CAST(-8.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Venda] OFF
ALTER TABLE [dbo].[debitoscli]  WITH CHECK ADD  CONSTRAINT [FK_debitoscli_clientes] FOREIGN KEY([cod_clideb])
REFERENCES [dbo].[clientes] ([codigo_cli])
GO
ALTER TABLE [dbo].[debitoscli] CHECK CONSTRAINT [FK_debitoscli_clientes]
GO
ALTER TABLE [dbo].[debitoscli]  WITH CHECK ADD  CONSTRAINT [FK_debitoscli_Venda] FOREIGN KEY([vendacli])
REFERENCES [dbo].[Venda] ([cod_venda])
GO
ALTER TABLE [dbo].[debitoscli] CHECK CONSTRAINT [FK_debitoscli_Venda]
GO
ALTER TABLE [dbo].[dependentes]  WITH CHECK ADD  CONSTRAINT [FK_dependentes_clientes] FOREIGN KEY([cod_clidp])
REFERENCES [dbo].[clientes] ([codigo_cli])
GO
ALTER TABLE [dbo].[dependentes] CHECK CONSTRAINT [FK_dependentes_clientes]
GO
ALTER TABLE [dbo].[dependentes]  WITH CHECK ADD  CONSTRAINT [FK_dependentes_dependentes] FOREIGN KEY([cod_dependentes])
REFERENCES [dbo].[dependentes] ([cod_dependentes])
GO
ALTER TABLE [dbo].[dependentes] CHECK CONSTRAINT [FK_dependentes_dependentes]
GO
ALTER TABLE [dbo].[detalheVenda]  WITH CHECK ADD  CONSTRAINT [FK_detalheVenda_estoque] FOREIGN KEY([codProdV])
REFERENCES [dbo].[estoque] ([codigo_prod])
GO
ALTER TABLE [dbo].[detalheVenda] CHECK CONSTRAINT [FK_detalheVenda_estoque]
GO
ALTER TABLE [dbo].[estoque]  WITH CHECK ADD  CONSTRAINT [FK_estoque_fornecedor] FOREIGN KEY([codprod_fornec])
REFERENCES [dbo].[fornecedor] ([cod_fornecdor])
GO
ALTER TABLE [dbo].[estoque] CHECK CONSTRAINT [FK_estoque_fornecedor]
GO
USE [master]
GO
ALTER DATABASE [mercado_tg] SET  READ_WRITE 
GO
