


ДАННЫЙ ФАЙЛ ИСПОЛЬЗОВАЛСЯ ДЛЯ ОТЛАДКИ И ТЕСТИРОВКИ БД

--SELECT * FROM authors;
/*
SELECT * FROM titles;
--SELECT * FROM titleauthor;
--SELECT * FROM sales;
GO

ALTER TABLE [dbo].[titles] ADD number_title int NULL;
GO
SELECT * FROM titles;
GO
ALTER TABLE [dbo].[titles] DROP COLUMN number_title;
GO
*/

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

BACKUP DATABASE udb_Маслов_Михаил_Кабирович
TO DISK = 'D:\test1\udb_Маслов_Михаил_Кабирович.bak';

--INSERT INTO authors SELECT * FROM authors_UT;
	

/*
EXEC sp_configure;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
*/
/*
INSERT INTO authors(au_id, au_lname, au_fname, phone, address, city, state, zip, contract)
VALUES ('123-12-1234', 'Понамарев', 'Вячеслав', '89121234567', 'ул. Вишневая д.12, кв.31', 'Екатеринбург', 'РФ', '12345', 1);
GO

INSERT INTO titles(title_id, title, pub_id, price, advance, ytd_sales, notes, pubdate)
VALUES ('СP1234', 'Базы данных в Delphi 7. Самоучитель', '4321', 112.20, 5000, 15, 'Содержит краткое
описание средств разработки приложений для баз данных', '23.12.02');
GO

INSERT INTO titleauthor(au_id, title_id, au_ord, royaltyper)
VALUES ('123-12-1234', 'СP1234', '1', 100);
GO

INSERT INTO sales(stor_id, ord_num, ord_date, qty, payterms, title_id)
VALUES ('6380', 'N914008', '30.12.03', 20, 'безналично', 'СP1234');

INSERT INTO sales(stor_id, ord_num, ord_date, qty, payterms, title_id)
VALUES ('6380', 'A2976', '02.03.04', 30, 'наличными', 'СP1234');
GO
*/
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
