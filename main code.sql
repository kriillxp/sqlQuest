-- Используем базу master для выполнения команд создания новой базы
USE [master]
GO
-- Создание базы данных udb_Маслов Михаил Кабирович
CREATE DATABASE [udb_Маслов Михаил Кабирович]
 CONTAINMENT = NONE
 ON  PRIMARY 
-- Основной файл данных
( NAME = N'file_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\file_1' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
-- Дополнительный файл данных
( NAME = N'file_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\file_2' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
-- Файл журнала транзакций
( NAME = N'transact', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\transact' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
 -- Лог-файл для базы данных
( NAME = N'udb_Маслов Михаил Кабирович_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\udb_Маслов Михаил Кабирович_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
-- Установка уровня совместимости базы данных
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET COMPATIBILITY_LEVEL = 160
GO
-- Включение полнотекстового поиска, если он установлен
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [udb_Маслов Михаил Кабирович].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
-- Установка различных параметров базы данных (например, управление триггерами, уровнем изоляции и т.д.)
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ARITHABORT OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET  DISABLE_BROKER 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET  MULTI_USER 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET DB_CHAINING OFF 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET QUERY_STORE = ON
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [udb_Маслов Михаил Кабирович]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 27.03.2025 3:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Создание таблицы authors с первичным ключом
CREATE TABLE [dbo].[authors](
	[au_id] [varchar](11) NOT NULL, -- Идентификатор автора
	[au_lname] [varchar](40) NOT NULL, -- Фамилия автора
	[au_fname] [varchar](20) NOT NULL, -- Имя автора
	[phone] [char](12) NOT NULL, -- Телефон
	[address] [varchar](40) NULL, -- Адрес
	[city] [varchar](20) NULL, -- Город
	[state] [char](2) NULL, -- Регион
	[zip] [varchar](5) NULL, -- Почтовый индекс
	[contract] [char](2) NOT NULL, -- Контракт
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[au_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 27.03.2025 3:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Создание таблицы sales
CREATE TABLE [dbo].[sales](
	[stor_id] [char](4) NOT NULL,-- Идентификатор магазина
	[ord_num] [varchar](20) NOT NULL,-- Номер заказа
	[ord_date] [datetime] NOT NULL,-- Дата заказа
	[qty] [smallint] NOT NULL,-- Количество
	[payterms] [varchar](12) NULL,-- Условия оплаты
	[title_id] [char](6) NOT NULL,-- Идентификатор книги
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[stor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titleauthor]    Script Date: 27.03.2025 3:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titleauthor](
	[au_id] [varchar](11) NOT NULL,
	[title_id] [char](6) NOT NULL,
	[au_ord] [tinyint] NULL,
	[royaltyper] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 27.03.2025 3:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles](
	[title_id] [char](6) NOT NULL,
	[title] [varchar](80) NOT NULL,
	[type] [char](12) NOT NULL,
	[pub_id] [char](4) NULL,
	[price] [money] NULL,
	[advance] [money] NULL,
	[ytd_sales] [int] NULL,
	[notes] [varchar](200) NULL,
	[pubdate] [datetime] NOT NULL,
 CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Создание связей между таблицами через внешние ключи
ALTER TABLE [dbo].[authors] ADD  CONSTRAINT [DF_authors_au_id]  DEFAULT ('[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]') FOR [au_id]
GO
ALTER TABLE [dbo].[authors] ADD  CONSTRAINT [DF_authors_phone]  DEFAULT ('UNKNOWN') FOR [phone]
GO
ALTER TABLE [dbo].[authors] ADD  CONSTRAINT [DF_authors_zip]  DEFAULT ('[0-9][0-9][0-9][0-9][0-9]') FOR [zip]
GO
ALTER TABLE [dbo].[authors] ADD  CONSTRAINT [DF_authors_contract]  DEFAULT ('[0-1]') FOR [contract]
GO
ALTER TABLE [dbo].[sales] ADD  CONSTRAINT [DF_sales_title_id]  DEFAULT ('(titles(title_id))') FOR [title_id]
GO
ALTER TABLE [dbo].[titleauthor] ADD  CONSTRAINT [DF_titleauthor_au_id]  DEFAULT ('authors(au_id)') FOR [au_id]
GO
ALTER TABLE [dbo].[titleauthor] ADD  CONSTRAINT [DF_titleauthor_title_id]  DEFAULT ('(titles(title_id))') FOR [title_id]
GO
ALTER TABLE [dbo].[titles] ADD  CONSTRAINT [DF_titles_title_id]  DEFAULT ('[A-Z][A-Z][0-9][0-9][0-9][0-9]') FOR [title_id]
GO
ALTER TABLE [dbo].[titles] ADD  CONSTRAINT [DF_titles_type]  DEFAULT ('UNDECIDED') FOR [type]
GO
ALTER TABLE [dbo].[titles] ADD  CONSTRAINT [DF_titles_pubdate]  DEFAULT (getdate()) FOR [pubdate]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [FK_sales_titles] FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [FK_sales_titles]
GO
ALTER TABLE [dbo].[titleauthor]  WITH CHECK ADD  CONSTRAINT [FK_titleauthor_authors] FOREIGN KEY([au_id])
REFERENCES [dbo].[authors] ([au_id])
GO
ALTER TABLE [dbo].[titleauthor] CHECK CONSTRAINT [FK_titleauthor_authors]
GO
ALTER TABLE [dbo].[titleauthor]  WITH CHECK ADD  CONSTRAINT [FK_titleauthor_titles] FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[titleauthor] CHECK CONSTRAINT [FK_titleauthor_titles]
GO
ALTER TABLE [dbo].[authors]  WITH CHECK ADD  CONSTRAINT [CK_authors] CHECK  (([au_id] like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[authors] CHECK CONSTRAINT [CK_authors]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ограничение формата au_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'authors', @level2type=N'CONSTRAINT',@level2name=N'CK_authors'
GO
USE [master]
GO
ALTER DATABASE [udb_Маслов Михаил Кабирович] SET  READ_WRITE 
GO
--
--
--

--
--КР Индивид. задание 2 вариант
ALTER TABLE [dbo].[titles] ADD number_title int NULL;
GO
SELECT * FROM titles;
GO
ALTER TABLE [dbo].[titles] DROP COLUMN number_title;
GO
--
-- Контрольные вопросы
--1. Как узнать в каком файле хранятся системные таблицы и представления пользовательской базы?
SELECT name, physical_name, type_desc  
FROM sys.master_files  
WHERE database_id = DB_ID('udb_Маслов Михаил Кабирович');
--2. Как посмотреть/изменить параметры конфигурации сервера, опции базы в диалоге и операторами Transact-SQL?
EXEC sp_configure;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

/*    INSERT  table  authors */
INSERT authors VALUES('111-00-0004', 'Alex', 'Smit', '223 226-2295', '589 5 Street', 'SanFrancisco', 'UT', '94113', 0);
INSERT authors VALUES('409-56-7008', 'Bennet', 'Abraham', '415 658-9932', 	'6223 Bateman St.', 'Berkeley', 'CA', '94705', 1);
INSERT authors VALUES('213-46-8915', 'Green', 'Marjorie', '415 986-7020', '309 63rd St. #411', 'Oakland', 'CA', '94618', 1);
INSERT authors VALUES('238-95-7766', 'Carson', 'Cheryl', '415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1);
INSERT authors VALUES('111-00-0001', 'Bob', 'Smit', '223 226-8884', '589 Darwin Ln', 'Berkeley', 'CA', '94111', 1);
INSERT authors VALUES('998-72-3567', 'Ringer', 'Albert', '801 826-0752',  '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT authors VALUES('899-46-2035', 'Ringer', 'Anne', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT authors VALUES('111-00-0002', 'Sergey', 'Karatigin', '223 226-2294','Tverskaiy', 'Chicago', 'OR', '94112', 1);
INSERT authors VALUES('722-51-5454', 'DeFrance', 'Michel', '219 547-9982', '3 Balding Pl.', 'Gary', 'IN', '46403', 1);
INSERT authors VALUES('807-91-6654', 'Panteley', 'Sylvia', '301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1);
INSERT authors VALUES('893-72-1158', 'McBadden', 'Heather', '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0);
INSERT authors VALUES('724-08-9931', 'Stringer', 'Dirk', '415 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0);
INSERT authors VALUES('274-80-9391', 'Straight', 'Dean', '415 834-2919', '5420 College Av.', 'Oakland', 'CA', '94609', 1);
INSERT authors VALUES('756-30-7391', 'Karsen', 'Livia', '415 534-9219', '5720 McAuley St.', 'Oakland', 'CA', '94609', 1);
INSERT authors VALUES('724-80-9391', 'MacFeather', 'Stearns', '415 354-7128', '44 Upland Hts.', 'Oakland', 'CA', '94612', 1);
INSERT authors VALUES('427-17-2319', 'Dull', 'Ann', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT authors VALUES('672-71-3249', 'Yokomoto', 'Akiko', '415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595', 1);
INSERT authors VALUES('267-41-2394', 'O''Leary', 'Michael', '408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', '95128', 1);
INSERT authors VALUES('472-27-2349', 'Gringlesby', 'Burt', '707 938-6445', 'PO Box 792', 'Covelo', 'CA', '95428', 3);
INSERT authors VALUES('527-72-3246', 'Greene', 'Morningstar', '615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215', 0);
INSERT authors VALUES('172-32-1176', 'White', 'Johnson', '408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', 1);
INSERT authors VALUES('712-45-1867', 'del Castillo', 'Innes', '615 996-8275', 	'2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', 1);
INSERT authors VALUES('846-92-7186', 'Hunter', 'Sheryl', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT authors VALUES('486-29-1786', 'Locksley', 'Charlene', '415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', '94130', 1);
INSERT authors VALUES('648-92-1872', 'Blotchet-Halls', 'Reginald', '503 745-6402','55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', 1);
INSERT authors VALUES('341-22-1782', 'Smith', 'Meander', '913 843-0462', '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0);




/* INSERT  table titles */

INSERT titles VALUES ('PC1111', 'Popular Computer', 'popular_comp', '1389', $20.00, $8000.00, 10, 4095, 'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', 06/12/94)
INSERT titles VALUES ('PC8888', 'Secrets of Silicon Valley', 'popular_comp', '1389', $20.00, $8000.00, 10, 4095, 'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', 06/12/94)
INSERT titles VALUES ('BU1032', 'The Busy Executive''s Database Guide', 'business', '1389', $19.99, $5000.00, 10, 4095, 'An overview of available database systems with emphasis on common business applications. Illustrated.', 06/12/91)
INSERT titles VALUES ('PS7777', 'Emotional Security: A New Algorithm', 'psychology', '0736', $7.99, $4000.00, 10, 3336, 'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.', 06/12/91)
INSERT titles VALUES ('PS3333', 'Prolonged Data Deprivation: Four Case Studies', 'psychology', '0736', $19.99, $2000.00, 10, 4072, 'What happens when the data runs dry? Searching evaluations of information-shortage effects.', 06/12/91)
INSERT titles VALUES ('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets', 'business', '1389', $11.95, $5000.00, 10, 3876, 'Helpful hints on how to use your electronic resources to the best advantage.', 06/09/91)
INSERT titles VALUES ('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', '0877', $19.99, $0.00, 12, 2032, 'Favorite recipes for quick, easy, and elegant meals.', 06/09/91)
INSERT titles VALUES ('TC7777', 'Sushi, Anyone?', 'trad_cook', '0877', $14.99, $8000.00, 10, 4095, 'Detailed instructions on how to make authentic Japanese sushi in your spare time.', 06/12/91)
INSERT titles VALUES ('TC4203', 'Fifty Years in Buckingham Palace Kitchens', 'trad_cook', '0877', $11.95, $4000.00, 14, 15096, 'More anecdotes from the Queens favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.', 06/12/91)
INSERT titles VALUES ('PC1035', 'But Is It User Friendly?', 'popular_comp', '1389', $22.95, $7000.00, 16, 8780, 'A survey of software for the naive user, focusing on the friendliness of each.', 06/30/91)
INSERT titles VALUES('BU2075', 'You Can Combat Computer Stress!', 'business', '0736', $2.99, $10125.00, 24, 18722, 'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.', 06/30/91)
INSERT titles VALUES('PS2095', 'Is Anger the Enemy?', 'psychology', '0736', $10.95, $2275.00, 12, 2045, 'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.', 06/15/91)
INSERT titles VALUES('PS2106', 'Life Without Fear', 'psychology', '0736', $7.00, $6000.00, 10, 111, 'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.', 10/05/91)
INSERT titles VALUES('MC3021', 'The Gourmet Microwave', 'mod_cook', '0877', $2.99, $15000.00, 24, 22246, 'Traditional French gourmet recipes adapted for modern microwave cooking.', 06/18/91)
INSERT titles VALUES('TC3219', 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', 'trad_cook', '0877', $20.95, $7000.00, 10, 375, 'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.', 10/21/91)
INSERT titles (title_id, title, pub_id) VALUES('MC3026', 'The Psychology of Computer Cooking', '0877')
INSERT titles VALUES ('BU7832', 'Straight Talk About Computers', 'business', '1389', $19.99, $5000.00, 10, 4095, 'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.', 06/22/91)
INSERT titles VALUES('PS1372', 'Computer Phobic AND Non-Phobic Individuals: Behavior Variations', 'psychology', '0877', $21.59, $7000.00, 10, 375, 'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.', 10/21/91)
INSERT titles (title_id, title, type, pub_id, notes) VALUES('PC9999', 'Net Etiquette', 'popular_comp', '1389', 'A must-read for computer conferencing.')
--INSERT titles VALUES ('PC8888', 'Secrets of Silicon Valley', 'popular_comp', '1389', $20.00, $8000.00, 10, 4095, 'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', 06/12/94) дубль

/*  INSERT  table  titleauthor  */

--INSERT titleauthor VALUES('111-00-0004', 'PC2222', 1, 100)
INSERT titleauthor VALUES('409-56-7008', 'BU1032', 1, 60)
INSERT titleauthor VALUES('486-29-1786', 'PS7777', 1, 100)
INSERT titleauthor VALUES('486-29-1786', 'PC9999', 1, 100)
INSERT titleauthor VALUES('712-45-1867', 'MC2222', 1, 100)
INSERT titleauthor VALUES('172-32-1176', 'PS3333', 1, 100)
INSERT titleauthor VALUES('213-46-8915', 'BU1032', 2, 40)
INSERT titleauthor VALUES('238-95-7766', 'PC1035', 1, 100)
INSERT titleauthor VALUES('213-46-8915', 'BU2075', 1, 100)
--INSERT titleauthor VALUES('998-72-3567', 'PS2091', 1, 50) несущ книга
--INSERT titleauthor VALUES('899-46-2035', 'PS2091', 2, 50) несущ книга
INSERT titleauthor VALUES('998-72-3567', 'PS2106', 1, 100)
INSERT titleauthor VALUES('722-51-5454', 'MC3021', 1, 75)
INSERT titleauthor VALUES('899-46-2035', 'MC3021', 2, 25)
--INSERT titleauthor VALUES('807-91-6654', 'TC3218', 1, 100) несущ книга
INSERT titleauthor VALUES('274-80-9391', 'BU7832', 1, 100)
INSERT titleauthor VALUES('427-17-2319', 'PC8888', 1, 50)
INSERT titleauthor VALUES('846-92-7186', 'PC8888', 2, 50)
INSERT titleauthor VALUES('756-30-7391', 'PS1372', 1, 75)
INSERT titleauthor VALUES('724-80-9391', 'PS1372', 2, 25)
INSERT titleauthor VALUES('724-80-9391', 'BU1111', 1, 60)
INSERT titleauthor VALUES('267-41-2394', 'BU1111', 2, 40)
INSERT titleauthor VALUES('672-71-3249', 'TC7777', 1, 40)
INSERT titleauthor VALUES('267-41-2394', 'TC7777', 2, 30)
INSERT titleauthor VALUES('472-27-2349', 'TC7777', 3, 30)
INSERT titleauthor VALUES('648-92-1872', 'TC4203', 1, 100)

/*  INSERT  table  sales */
-- несущ книги
/*
INSERT sales VALUES('7066', 'QA7442.3', 09/13/94, 75, 'ON invoice','PS2091')
INSERT sales VALUES('7067', 'D4482', 09/14/94, 10, 'Net 60','PS2091')
INSERT sales VALUES('7131', 'N914008', 09/14/94, 20, 'Net 30','PS2091')
*/
INSERT sales VALUES('7131', 'N914014', 09/14/94, 25, 'Net 30','MC3021')
INSERT sales VALUES('8042', '423LL922', 09/14/94, 15, 'ON invoice','MC3021')
INSERT sales VALUES('8042', '423LL930', 09/14/94, 10, 'ON invoice','BU1032')
--INSERT sales VALUES('6380', '722a', 09/13/94, 3, 'Net 60','PS2091') несущ книга
INSERT sales VALUES('6380', '6871', 09/14/94, 5, 'Net 60','BU1032')
INSERT sales VALUES('8042','P723', 03/11/93, 25, 'Net 30', 'BU1111')
INSERT sales VALUES('7896','X999', 02/21/93, 35, 'ON invoice', 'BU2075')
INSERT sales VALUES('7896','QQ2299', 10/28/93, 15, 'Net 60', 'BU7832')
INSERT sales VALUES('7896','TQ456', 12/12/93, 10, 'Net 60', 'MC2222')
INSERT sales VALUES('8042','QA879.1', 5/22/93, 30, 'Net 30', 'PC1035')
INSERT sales VALUES('7066','A2976', 5/24/93, 50, 'Net 30', 'PC8888')
INSERT sales VALUES('7131','P3087a', 5/29/93, 20, 'Net 60', 'PS1372')
INSERT sales VALUES('7131','P3087a', 5/29/93, 25, 'Net 60', 'PS2106')
INSERT sales VALUES('7131','P3087a', 5/29/93, 15, 'Net 60', 'PS3333')
INSERT sales VALUES('7131','P3087a', 5/29/93, 25, 'Net 60', 'PS7777')
--INSERT sales VALUES('7067','P2121', 6/15/92, 40, 'Net 30', 'TC3218') несущ книга
INSERT sales VALUES('7067','P2121', 6/15/92, 20, 'Net 30', 'TC4203')
INSERT sales VALUES('7067','P2121', 6/15/92, 20, 'Net 30', 'TC7777')

/*
1 ошибка - не было ; в конце строк
2 ошибка - в 4 строке 'CA, '94111' не было знака ', (не закрытое обозначение строки)
3 ошибка - пропустил royality titles, сделал
4 ошибка varchar to datetime выходило за диапазон, вводим данные через datetime напрямую
5 ошибка - строка дублирует, удалил т.к данные полностью идентичны
6 ошибка - к автору с id 111-00-0004 привязывает несуществующую книгу с id PC2222
7, 8 ошибки - к автору с 998-72-3567, 998-72-3567 привязывает несуществующую книгу с id PS2091
9 ошибка - снова несущ книга
10 ошибки - аналогично 4 ошибке, строки
11 ошибка несущ книга
*/


-- использовалось для отладки
/*
DECLARE @value int;

SET @value = 0; -- 0 для просмотра базы, 1 - для ее очистки

if @value = 1
	BEGIN
		DELETE FROM authors
		DELETE FROM titles
		DELETE FROM titleauthor
		DELETE FROM sales
		DROP TABLE authors_UT;
	END
GO
*/
--бэкап базы
/*
BACKUP DATABASE udb_Маслов_Михаил_Кабирович
TO DISK = 'D:\test1\udb_Маслов_Михаил_Кабирович.bak';
*/
--вывод 4х таблиц
/*
SELECT * FROM authors;
GO
SELECT * FROM titles;
GO
SELECT * FROM titleauthor;
GO
SELECT * FROM sales;
GO
SELECT * FROM authors_UT;
GO
*/
--копирование части авторов
SELECT * INTO authors_UT FROM authors WHERE state = 'UT';
GO
DELETE FROM authors WHERE state = 'UT';
GO
INSERT INTO authors SELECT * FROM authors_UT;
GO

--представление из таблиц
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.titles.title_id AS Expr2, dbo.authors.au_id
FROM            dbo.authors INNER JOIN
                         dbo.titleauthor ON dbo.authors.au_id = dbo.titleauthor.au_id INNER JOIN
                         dbo.titles ON dbo.titleauthor.title_id = dbo.titles.title_id INNER JOIN
                         dbo.sales ON dbo.titles.title_id = dbo.sales.title_id
GO
