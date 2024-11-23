USE [Институт]
GO

/****** Object:  Table [dbo].[Сотрудники]    Script Date: 26.04.2022 7:49:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Cotrudniki(
	[ФИО] [nchar](30) NULL,
	[возраст] [int] NULL,
	[пол] [nchar](10) NULL,
	[адрес] [nchar](100) NULL,
	[телефон] [nchar](20) NULL,
	[пастпортные данные] [nchar](25) NULL,
	[должность] [nchar](20) NULL
) ON [PRIMARY]
GO



