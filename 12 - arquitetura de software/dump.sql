-- Create DataBase

CREATE DATABASE TRABALHO;

USE TRABALHO;

-- Create Tables

--
-- table GANHADOR
--
CREATE TABLE [dbo].[GANHADOR](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RESTAURANTE_ID] [bigint] NOT NULL,
	[DATA] [date] NOT NULL,
 	CONSTRAINT [PK_GANHADOR] PRIMARY KEY ([ID])
);

--
-- table LOGIN
--
CREATE TABLE [dbo].[LOGIN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](100) NOT NULL,
	[USUARIO] [varchar](100) NOT NULL,
	[SENHA] [varchar](100) NOT NULL,
	[TOKEN] [varchar](100) NULL,
 	CONSTRAINT [PK_LOGIN2] PRIMARY KEY ([ID])
);

--
-- table RESTAURANTE
--
CREATE TABLE [dbo].[RESTAURANTE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](100) NOT NULL,
 	CONSTRAINT [PK_RESTAURANTE] PRIMARY KEY ([ID])
);

--
-- table VOTACAO
--
CREATE TABLE [dbo].[VOTACAO](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LOGIN_ID] [bigint] NOT NULL,
	[RESTAURANTE_ID] [bigint] NOT NULL,
	[DATA] [date] NOT NULL,
 	CONSTRAINT [PK_VOTACAO] PRIMARY KEY ([ID])
);



-- Create Views

--
-- view GANHADORES
--
CREATE VIEW GANHADORES AS
SELECT
	G.ID,
	G.RESTAURANTE_ID,
	R.NOME,
	G.DATA
FROM
	dbo.GANHADOR AS G 
INNER JOIN dbo.RESTAURANTE AS R ON G.RESTAURANTE_ID = R.ID;

--
-- view MAIS_VOTADOS
--
CREATE VIEW MAIS_VOTADOS AS
SELECT        
	TOP (10) 
	G.RESTAURANTE_ID, 
	R.NOME, 
	COUNT(1) AS TOTAL
FROM            
	dbo.GANHADOR AS G 
INNER JOIN dbo.RESTAURANTE AS R ON G.RESTAURANTE_ID = R.ID
GROUP BY 
	G.RESTAURANTE_ID, R.NOME
ORDER BY 
	TOTAL DESC;

--
-- view VOTACOES
--
CREATE VIEW VOTACOES AS
SELECT        
	V.ID,
	V.LOGIN_ID,
	V.RESTAURANTE_ID,
	V.DATA,
	R.NOME AS  RESTAURANTE_NOME,
	L.NOME AS LOGIN_NOME, 
	L.USUARIO 
FROM
	dbo.VOTACAO AS V 
INNER JOIN dbo.RESTAURANTE AS R ON V.RESTAURANTE_ID = R.ID 
INNER JOIN dbo.LOGIN AS L ON V.LOGIN_ID = L.ID;


--
-- INSERTS
--

--
-- Insert LOGIN
--
INSERT INTO [dbo].[LOGIN] ([NOME],[USUARIO],[SENHA]) VALUES ('Administrador', 'adm', 'ykY/a/1F8ME=');
INSERT INTO [dbo].[LOGIN] ([NOME],[USUARIO],[SENHA]) VALUES ('Alan', 'alan', 'ykY/a/1F8ME=');
INSERT INTO [dbo].[LOGIN] ([NOME],[USUARIO],[SENHA]) VALUES ('Carlos', 'carlos', 'ykY/a/1F8ME=');
INSERT INTO [dbo].[LOGIN] ([NOME],[USUARIO],[SENHA]) VALUES ('Daniel', 'daniel', 'ykY/a/1F8ME=');
INSERT INTO [dbo].[LOGIN] ([NOME],[USUARIO],[SENHA]) VALUES ('Renato', 'renato', 'ykY/a/1F8ME=');

--
-- Insert RESTAURANTE
--
INSERT INTO [dbo].[RESTAURANTE] ([NOME]) VALUES ('Sappore');
INSERT INTO [dbo].[RESTAURANTE] ([NOME]) VALUES ('Estoril');
INSERT INTO [dbo].[RESTAURANTE] ([NOME]) VALUES ('Taco Cabanna');
INSERT INTO [dbo].[RESTAURANTE] ([NOME]) VALUES ('Confiança Max (Macarrão)');
INSERT INTO [dbo].[RESTAURANTE] ([NOME]) VALUES ('Restaurante USC');

--
-- Insert VOTACAO
--
INSERT INTO [dbo].[VOTACAO] ([LOGIN_ID], [RESTAURANTE_ID], [DATA]) VALUES (2, 5, '2016-05-25');
INSERT INTO [dbo].[VOTACAO] ([LOGIN_ID], [RESTAURANTE_ID], [DATA]) VALUES (3, 3, '2016-05-25');
INSERT INTO [dbo].[VOTACAO] ([LOGIN_ID], [RESTAURANTE_ID], [DATA]) VALUES (4, 5, '2016-05-25');
INSERT INTO [dbo].[VOTACAO] ([LOGIN_ID], [RESTAURANTE_ID], [DATA]) VALUES (5, 5, '2016-05-25');






















