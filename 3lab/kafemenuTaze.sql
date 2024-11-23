


CREATE TABLE Povar --Повар ФИО- Должность
(
	ID_Povar int not null IDENTITY(1,1)  PRIMARY KEY,
	FIO varchar(100) NOT NULL, --ФИО повар
	Chef_Pos varchar(100) NOT NULL, --Должность повара

	
)

go

CREATE TABLE Salata
(  
    ID_Salat int not null IDENTITY(1,1)  PRIMARY KEY,
	Name_Salat varchar(50)  NOT NULL,--Наименование салата
	price int  NOT NULL,
	cook_method varchar(300) NOT NULL,
	TypeDish varchar(50)  NOT NULL,
	Time_Dish int NOT NULL,
	--Povar_id int not null,
	--FOREIGN KEY (Povar_id) REFERENCES Povar (ID_Povar)

	)
go
Select * from Salata

CREATE TABLE Ingridient(
	ID_Ing int not null IDENTITY(1,1)  PRIMARY KEY,
	Name_Ingrid varchar(50) NOT NULL,
	Ingr_Quan varchar(100)  NOT NULL,
	Ingrid_Mera varchar(100)  NOT NULL,
	prod_supp varchar(100) NOT NULL,
	--Salata_id int,
	--FOREIGN KEY (Salata_id) REFERENCES Salata (ID_Salat)
	)

 
go
CREATE TABLE Ing_Salat(  
	ID_Ing_Salat int not null IDENTITY(1,1)  PRIMARY KEY,
	ID_Ing int not null, 
	ID_Salat int not null, 
	FOREIGN KEY (ID_Ing) REFERENCES Ingridient (ID_Ing),
	FOREIGN KEY (ID_Salat) REFERENCES Salata (ID_Salat)
	)

CREATE TABLE Povar_Salat(
	ID_Povar_Salat int not null IDENTITY(1,1)  PRIMARY KEY,
	ID_Povar int not null,
	ID_Salat int not null,
	FOREIGN KEY (ID_Povar) REFERENCES Povar (ID_Povar),
	FOREIGN KEY (ID_Salat) REFERENCES Salata (ID_Salat)
	)

--Povar
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('Иванов С.Ф.', 'шеф-повар');
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('Петров В.А.', 'ст. помошник');
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('Васильев А.А.', 'зам. шеф. повара');




--Salat
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ( 'Салат «Оливье»', 50, '...', 'Салаты', 20);
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ('Салат «Цезарь»', 65, '...', 'Салаты', 20);
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ( 'Суп «Солянка»', 100, '...', 'Супы', 60);


--Ingridient
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('картофель',500,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('яйца',4,	'шт',	'Колхоз «Светлый путь»');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('мясо',400,	'гр',	'Колхоз «Светлый путь»');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('морковь', 500,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('огурцы', 500,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('яблоки', 200,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('лук', 100,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('соль', 4,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('майонез', 50,	'гр',	'Тюмень-молоко');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('Курица копченая', 500,	'гр',	'Колхоз «Светлый путь»');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('Сухарики «Кириешки»', 100,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('Ветчина', 300,	'гр',	'Колхоз «Светлый путь»');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('Оливки', 100,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('Томатная паста', 50,	'гр',	'ХозТоргОвощи');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('Лимон', 1,	'шт',	'ХозТоргОвощи');


INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(1,1)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(1,2)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(1,3)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(2,1)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(2,2)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(3,2)
INSERT INTO Povar_Salat(ID_Povar, ID_Salat) Values(3,3)

Select * from Povar


INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(1,1)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(1,2)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(1,3)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(2,1)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(2,2)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(3,2)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(3,3)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(3,3)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(4,1)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(4,2)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(4,3)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(5,2)
INSERT INTO Ing_Salat(ID_Ing, ID_Salat) Values(5,3)


--Select* from Ingridient
go


--Лаб3
-- ПРЕДСТАВЛЕНИЕ 


--Список салатов который только готовить шеф повор и которого нету мяса 
CREATE VIEW List_Salat as
Select Name_Salat from Salata where ID_Salat not in (
Select Salata.ID_Salat
from Ing_Salat Left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing
left join Salata on Ing_Salat.ID_Salat = Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
left join Povar on Povar.ID_Povar = Povar_Salat.ID_Povar
WHERE Name_Ingrid = 'мясо' and Chef_Pos != 'шеф-повар' 
group by Salata.ID_Salat);

go

--Select * from List_Salat


--Список ингридиентов и мера который входить в состав Салата «Оливье» или поставщиком является 'ХозТоргОвощи' 
CREATE VIEW List_Ingr as
Select Ingridient.Name_Ingrid, Ingridient.Ingrid_Mera from Ingridient where ID_Ing not in(
Select Ingridient.ID_Ing 
from Ing_Salat left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing 
left join Salata on Ing_Salat.ID_Salat =  Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
Where Name_Salat != 'Салат «Оливье»' and prod_supp !='ХозТоргОвощи'
group by Ingridient.ID_Ing);
go


--Список поворов и должности, который готовить салат оливье или суп солянка и которого должность шеф-повар 
CREATE VIEW List_Povar as
Select Povar.FIO, Povar.Chef_Pos from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != 'Салат «Оливье»' or Name_Salat != 'Суп «Солянка»') and Chef_Pos != 'шеф-повар');
go

--Отобразить горизонтальную и вертикальную проекцию каждого представления или агрегирующий запрос к представлению
CREATE VIEW Gorizontal as
Select * 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
go
--вертикальная  проекция
CREATE VIEW Vertical as
Select Povar.FIO, Povar.Chef_Pos from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != 'Салат «Оливье»' or Name_Salat != 'Суп «Солянка»') and Chef_Pos != 'шеф-повар')
Union ALL
Select Ingridient.Name_Ingrid, Ingridient.Ingrid_Mera from Ingridient where ID_Ing not in(
Select Ingridient.ID_Ing 
from Ing_Salat left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing 
left join Salata on Ing_Salat.ID_Salat =  Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
Where Name_Salat != 'Салат «Оливье»' and prod_supp !='ХозТоргОвощи'
group by Ingridient.ID_Ing);

go

--В Представлении "Список Поваров" добавить отображение еще одного столбца стаж 
Alter table Povar add ctaj varchar(20) null;

go

Alter VIEW List_Povar as
Select Povar.FIO, Povar.Chef_Pos, Povar.ctaj from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != 'Салат «Оливье»' or Name_Salat != 'Суп «Солянка»') and Chef_Pos != 'шеф-повар');

go

--Удалить представление “Список ингридиентов”
DROP VIEW List_Ingr;

go

--Лаба_4
--Создание процедур и функций
 

 --Скалярная функция, возвращать информацию о стоимости салата, которого нет в ингридиентов мясо 

CREATE FUNCTION PriceSalat (@IngName varchar(50))
Returns varchar(250)
as
begin
RETURN convert(varchar(max),(Select Top(1) price from Salata where ID_Salat not in (
Select Salata.ID_Salat
	from Ing_Salat Left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing
	left join Salata on Ing_Salat.ID_Salat = Salata.ID_Salat
	left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
	left join Povar on Povar.ID_Povar = Povar_Salat.ID_Povar
WHERE Name_Ingrid = @IngName
group by Salata.ID_Salat)));
end;
go


--Вызов функции 
Select dbo.PriceSalat('мясо')

go

--Сведения о салате который стоит не меньше 30 не больше 100


CREATE FUNCTION POV_Table(@Price1 int, @Price2 int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT Q1.[Наименования Салата], Q1.[Должность повара], Q1.[время приготовления], Q1.[Стоимость Салата]  FROM 
	(select Salata.Name_Salat as [Наименования Салата], (Povar.FIO + ' ' + Povar.Chef_Pos) as [Должность повара], (Convert(varchar, Salata.Time_Dish) + 'мин' ) as [время приготовления], (convert(varchar, Salata.price) + 'р') as [Стоимость Салата]
	from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
    Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
	where Salata.price between @Price1 and @Price2) as Q1
    
); 

go


--Вызвать табличную функцию
select * from dbo.POV_Table(30,100)
go

-- Хранимая процедура которая будет добавлять новую запись.
CREATE PROCEDURE P1
(   
	--Входящие параметры
	@SalataName Varchar(100),
	@Price int,
	@COOKMETHOD varchar(100),
	@TYPEDISH varchar(100),
	@TIME INT,
	@id_Pov int
) 	
	AS
BEGIN
      
	Declare @idsalat int
	
	--Инструкции, реализующие Ваш алгоритм
    --Обработка входящих параметров
    --Удаление лишних пробелов в начале и в конце текстовой строки
	Set @SalataName = LTRIM(RTRIM(@SalataName));
  
	--Добавляем новую запись
	INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) 
	VALUES( @SalataName, @Price, @COOKMETHOD, @TYPEDISH, @TIME)

	SET @idsalat = (SELECT  MAX(Salata.ID_Salat)
	from Salata);

	insert into Povar_Salat(ID_Povar, ID_Salat) values (@id_Pov, @idsalat)	 
	
end

go

EXEC P1  "Крабовый", 100, "...", "Салаты", 30, 3

drop procedure P1

go

CREATE PROCEDURE P2 (
  @name varchar(100)
  )
	AS 
	BEGIN

	select QQ1.q as [Имя Салата], QQ2.q [Количество ингридиентов], QQ3.q as [Общая стоимость салатов(руб.)], QQ4.q as [средняя время приготовления] from
		((select  'Имя салата - ' +  q2.Name_Salat as "q" from (select Name_Salat from Salata where Salata.Name_Salat = @name) as q2) as QQ1
		cross join
		(select 'количество ингридиентов - ' + convert(varchar,count(q2.ID_Ing)) as"q"  from (select Ing_Salat.ID_Ing from Ing_Salat  where ID_Ing = (Select ID_Salat from Salata where Salata.Name_Salat = @name)) as q2) as QQ2
		cross join
		(select 'Общая стоимость - ' +  convert(varchar,sum(q2.price)) as "q"  from (select price from Salata  where  Salata.Name_Salat = @name ) as q2) as QQ3
		cross join
		(select 'средняя время приготовления - ' + convert(varchar,avg(q2.Time_Dish))  as"q"  from (select Salata.Time_Dish from Salata  where Salata.Name_Salat = @name ) as q2) as QQ4
		cross join
		(select ' ' as q) as QQ5) order by "Имя Салата" desc; --сортировка нужна для расположения итоговой строки последней
	END
go

EXEC P2 @name ='Салат «Оливье»'
go

drop procedure P2

--Лабораторная работа №5 Создание триггеров

CREATE TABLE History 
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);

go


GO

CREATE TRIGGER i_tbingr
ON Ingridient
AFTER INSERT
AS
begin
UPDATE Salata 
set price=price * 0.5 
end
GO

Drop trigger i_tbingr

--Записываем таблицу History данные о обновления
use MenuKafe
go
CREATE TRIGGER Salat_ins_del_updt ON Salata
	after Insert, delete, update
	AS
	begin 

	INSERT INTO History (ProductId, Operation)
    SELECT INSERTED.ID_Salat, ('Добавлен салать ' + INSERTED.Name_Salat + ' цена ' + INSERTED.price)
    FROM INSERTED left join Salata on inserted.ID_Salat = Salata.ID_Salat

	INSERT INTO History (ProductId, Operation)
	SELECT DELETED.ID_Salat, ('Удален салать ' + DELETED.Name_Salat + ' цена ' + DELETED.price)
	FROM DELETED LEFT join Salata on deleted.ID_Salat = Salata.ID_Salat

	INSERT INTO History (ProductId, Operation)
	SELECT INSERTED.ID_Salat, ('обнавлен салать ' + INSERTED.Name_Salat + ' цена ' + INSERTED.price)
	FROM INSERTED left join Salata on inserted.ID_Salat = Salata.ID_Salat
	
	end

	INSERT INTO  Salata(Name_Salat, price, cook_method, TypeDish, Time_Dish)
	VALUES('Салат «Капуста»', 54, '...', 'Салаты', 15)
	
	DELETE FROM Salata where ID_Salat = 1006

	Update Salata Set price = 75 where price = 78

go

Drop trigger Salat_ins_del_updt
 
 go



-- Рекурсивные триггеры 

go

CREATE TRIGGER tingrd
    ON Ingridient
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
		INSERT INTO Salata(price)
		SELECT Ingr_Quan FROM inserted 
    END

	GO
CREATE TRIGGER tsalat
    ON Salata
    FOR INSERT
    AS
    BEGIN 
	INSERT INTO Salata(price)
	SELECT 34
    SET NOCOUNT ON
    END
go

	drop trigger tingrd
	drop trigger tsalat

  go



  --запрета удаления с помощью триггера

  CREATE TRIGGER d_tbPovar1 ON Povar
FOR DELETE
AS
 IF EXISTS (SELECT *
            FROM deleted
            WHERE FIO='Иванов С.Ф.')
  BEGIN 
   PRINT 'ОШИБКА, нельзя удалить этого ПОВАРА'
   ROLLBACK TRANSACTION
  END

 go

 Drop trigger d_tbPovar1
 
 --запретить удаление более чем одной строки
  CREATE TRIGGER d_tbIng ON Ingridient
FOR DELETE
AS
 IF (SELECT count(*) 
   FROM deleted)>1 
 BEGIN
  PRINT 'Нельзя удалять более одной строки'
  ROLLBACK TRANSACTION
 END

 go

 Drop trigger d_tbing

 --При изменение таблицы INGRIDIENT, в таблице Salata столбцу price будет добавлятся 1 рублей
Create trigger i_tIngr
on Ingridient
AFTER update
AS
BEGIN
DECLARE @Salat varchar(10),  @count_Salat_price INT
 set @Salat = (select Name_Salat  from Salata)
set @count_Salat_price = (select sum(price) FROM Salata WHERE Name_Salat = @Salat)
 
set  @count_Salat_price = @count_Salat_price + 1     
    PRINT @count_Salat_price
    print @Salat
 
 INSERT INTO  Salata(price) values (@count_Salat_price)  
  END

  go

   Drop trigger i_tIngr

  --триггер, проверяющий, что в поле «салат» обязательно содержится название имя_салата
Create trigger CheckSalat
on Salata 
for insert 
AS  
begin
 SELECT DISTINCT Name_Salat  
FROM Salata AS s   
WHERE EXISTS  
(SELECT *  FROM Salata AS v  
    WHERE s.Name_Salat = v.Name_Salat)
end

 Drop trigger CheckSalat

go

---- На экран должны выводиться EVENTDATA и SYSTEM_USER.
CREATE TABLE dbo.TableLog                                           
(                                                                    
LogID INT IDENTITY (1, 1) PRIMARY KEY,                               
EventVal NVARCHAR (50) NOT NULL,
EventDate DATETIME NOT NULL,
ChangedBy nvarCHAR (100) NOT NULL
);

go
CREATE TRIGGER trgTablechanges
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
    INSERT INTO dbo.TableLog(EventVal, EventDate, ChangedBy)
    VALUES (EVENTDATA ().value ('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar (100)'), GETDATE (), SYSTEM_USER);         
END;

go

GO



 --Лабораторная работа №6

 --Вставка данных
 CREATE PROCEDURE  Insert_Salat
   (
        --Входящие параметры
        
		@NameSalat varchar(50), 
		@price_salat int,
	    @CookMethod varchar(300),
		@Type_Dish varchar(50),
		@TimeDish int
   )
   AS
   BEGIN
         
		 Declare @idsalat int
        --Инструкции, реализующие Ваш алгоритм 
        --Обработка входящих параметров
        --Удаление лишних пробелов в начале и в конце текстовой строки
        SET @NameSalat = LTRIM(RTRIM(@NameSalat));
        
        --Добавляем новую запись
        INSERT INTO Salata( Name_Salat, price, cook_method, TypeDish, Time_Dish)
                VALUES (@NameSalat, @price_salat, @CookMethod, @Type_Dish, @TimeDish)

		SET @idsalat = (SELECT  Salata.ID_Salat
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing);

        --Возвращаем данные
		select Salata.ID_Salat,  Salata.Name_Salat as [Наименования Салата], (convert(varchar, Salata.price) + 'р') as [Стоимость Салата(руб)], Salata.cook_method as [Способ приготовления], Salata.TypeDish as [Вид блюда], (Convert(varchar, Salata.Time_Dish) + 'мин' ) as [время приготовления]
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing;
		
	END

	drop procedure Insert_Salat

 exec Insert_Salat  'Венегред', 82, '...', 'Салаты', '30'


 go 


 --изменение данных 
 create PROCEDURE update_Salat
   ( --Входящие параметры
        
		@NameSalat varchar(50), 
		@price_salat int
   )
   AS
   BEGIN
        --Инструкции, реализующие Ваш алгоритм 
        --Обработка входящих параметров
        --Удаление лишних пробелов в начале и в конце текстовой строки
        SET @NameSalat = LTRIM(RTRIM(@NameSalat));
        
        --Добавляем новую запись
		Update Salata
		Set price = @price_salat(SELECT  Salata.price
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing)
	END

   GO

 create PROCEDURE Drop_Salat
   ( --Входящие параметры
        
		@NameSalat varchar(50)
   )
   AS
   BEGIN
       
        SET @NameSalat = LTRIM(RTRIM(@NameSalat));
        
		Delete Salata 
        from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing
		where Name_Salat = @NameSalat
	END

   GO

   --представления берем из прошлых заданий

