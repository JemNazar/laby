
--Создание таблиц базы	
	--Должности
	create table Rang
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --Код
		Name varchar(100) not null, --Название должности
		PayValue decimal(18,2) , --Оклад
		Duty varchar(255), --Обязности
		Must varchar(255), --Требования
	)
	go
	--Служащие
	create table Person
	( 
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		FirstName varchar(50) not null, --Фамилия
		LastName varchar(50) not null, --Имя 
		MiddleName varchar(50), --Отчество
		BDay datetime, --дата рождения
		Sex bit, -- пол, 0 - М, 1 - Ж
		Address varchar(100), --Адрес
		Number varchar(50), --Номер телефона
		Passport varchar(100) unique, --Серия и номер паспорта кем выдан
		Rang int default 1, --Должность номер ID из таблицы Rang
		CHECK (Number like '+7%' AND LEN(Number)=12),
		CHECK (Sex = 1 OR Sex = 0),
		CHECK (Rang >= 1),
		FOREIGN KEY (Rang) REFERENCES Rang (ID)
		ON DELETE SET DEFAULT
	)
	go
	--Типы работ
	create table TypeOfWorks
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		Name varchar(100), --название
		Description varchar(255), --Описание
		Prise decimal(18,2), --цена
	)
	go
	--Материалы
	create table Material
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		Name varchar(100), --Навзвание
		Box varchar(100), --Упаковка 
		Description varchar(255), --Описание
		Prise decimal(18,2), --цена
		CHECK (Prise >= 0)
	)
	go
	--Используемые материалы как отдельная таблица
	create table UseMaterial
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		ToWID int not null, --код вида работ
		MID int not null, --код материала
		CHECK (ToWID >= 1),
		CHECK (MID >= 1),
		FOREIGN KEY (ToWID) REFERENCES TypeOfWorks (ID)
			ON DELETE CASCADE,
		FOREIGN KEY (MID) REFERENCES Material (ID)
			ON DELETE CASCADE
	)
	go
	--Бригады
	create table Brigade
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		Name varchar(255) NOT NULL unique, --Название бригады
	)
	--Служащие в бригадах
	create table PersonInBrigade
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		BID int not null, --код бригады
		PID int not null, --код солужащего
		CHECK (BID >= 1),
		CHECK (PID >= 1),
		FOREIGN KEY (BID) REFERENCES Brigade (ID)
			ON DELETE CASCADE,
		FOREIGN KEY (PID) REFERENCES Person (ID)
			ON DELETE CASCADE
	)
	--Заказчики
	create table Customer
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		Name varchar(255) unique not null, --Имя/Название
		Address varchar(255), --Адрес
		Number varchar(50), --Номер телефона
		CHECK (Number like '+7%' AND LEN(Number)=12)
	)
	--Работы
	create table Works
	(
		ID int not null IDENTITY(1,1)  PRIMARY KEY, --код
		ToWID int not null, --код вида работ
		BID int, --код бригады
		Prise decimal(18,2), --Цена
		SDATE Date, --Дата начала
		EDATE Date, --Дата конца
		CID int, --код заказчика
		IsDone Bit default 0, --Отметка о завершении
		IsPay Bit default 0, --Отметка об оплате
		CHECK (BID >= 1),
		CHECK (ToWID >= 1),
		CHECK (Prise >= 0),
		CHECK (IsDone = 0 OR IsDone = 1),
		CHECK (IsPay = 0 OR IsPay = 1),
		CHECK (EDATE >= SDATE),
		FOREIGN KEY (BID) REFERENCES Brigade (ID)
			ON DELETE SET NULL,
		FOREIGN KEY (CID) REFERENCES Customer (ID)
			ON DELETE cascade,
		FOREIGN KEY (ToWID) REFERENCES TypeOfWorks (ID)
			ON DELETE NO ACTION
	)

--Заполнение данными
	--Rang 
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Стажер',0,'Обучение','В зависимости от желаемой должности');
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Директор',65000,'Руководить','Отчитываться перед учередителями');
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Бригадир',40000,'Руководить бригадой','Починение указаниям руководства');
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Строитель',30000,'Выполнение поставленных работ','Подчиняться указаниям бригадира');
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Бухгалтер',25000,'Ведение бухгалтерского учета','Работа с электронными документами');
	INSERT INTO Rang (Name,PayValue,Duty,Must) 
	values ('Водитель',20000,'Развоз рабочих','Водительские права');
	--Person
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Иван','Петров','Аркадьевич',1985-10-21, 0,'+79978255699','1234567890',1);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Дмитрий','Баширов','Павлович',1981-05-10, 0,'+79963211698','1234567891',1);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Эммануил ','Гедеонович ','Виторган',1971-03-10, 0,'+79964567855','8244569891',2);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Виктор','Иванов','Иванович',1980-01-01, 0,'+79963211699','7234567990',3);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Борис','Бритва','Игнатьев',1968-11-06, 0,'+79933312679','1239999890',3);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Игорь','Федоров','Андреевич',1997-02-29, 0,'+79964787899','5245557890',4);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Юрий','Жомов','Андреевич',1997-03-10, 0,'+79963211699','1234444670',4);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Анатолий','Андреев','Александрович',1998-09-15, 0,'+79961235687','7554567790',4);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Александр','Дробницкий','Юрьевич',1995-01-01, 0,'+79773255649','1454554890',4);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Елизавета','Мартиросян','Эдуардовна',1980-10-10, 1,'+79963100690','6234500790',5);
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values ('Герман','Фишер','Адольфович',1980-01-01, 0,'+79963211699','1233567790',6);
	--TypeOfWorks
	INSERT INTO TypeOfWorks (Name,Description,Prise) values ('Натяжной потолок','Установка натяжного потолка в помещении',40000);
	INSERT INTO TypeOfWorks (Name,Description,Prise) values ('Обшивка стен гипсокартоном','Обшивка стен гипсокартоном в помещении',50000);
	INSERT INTO TypeOfWorks (Name,Description,Prise) values ('Сборка чернового пола','Установка чернового пол из указаных материалов',50000);
	INSERT INTO TypeOfWorks (Name,Description,Prise) values ('Кладка','Возведение стен/перегородок из кирпича или иного материала',60000);
	INSERT INTO TypeOfWorks (Name,Description,Prise) values ('Установка оконных рам','Установка оконных рам под ключ',30000);
	--Material
	INSERT INTO Material (Name,Box, Description, Prise) values ('Натяжной потолок','Рулон','Натяжной потолок 1м кв',1000);
	INSERT INTO Material (Name,Box, Description, Prise) values ('Гипсокартон','Нет','10 листов',5000);
	INSERT INTO Material (Name,Box, Description, Prise) values ('Кирпич','Нет','Кирпич 100шт',2000);
	INSERT INTO Material (Name,Box, Description, Prise) values ('Доска ель','Связка','10шт 3м',1200);
	INSERT INTO Material (Name,Box, Description, Prise) values ('Пластиковое окно типовое','Кортонный короб','1шт 3м*2,5м',15000);
	INSERT INTO Material (Name,Box, Description, Prise) values ('Цемент','Мешок','1шт 25кг',1000);
	--UseMaterial
	INSERT INTO UseMaterial(ToWID, MID) values (1,1);
	INSERT INTO UseMaterial(ToWID, MID) values (2,2);
	INSERT INTO UseMaterial(ToWID, MID) values (3,4);
	INSERT INTO UseMaterial(ToWID, MID) values (4,3);
	INSERT INTO UseMaterial(ToWID, MID) values (5,5);
	INSERT INTO UseMaterial(ToWID, MID) values (4,6);
	--Brigade
	INSERT INTO Brigade(Name) values ('Областная');
	INSERT INTO Brigade(Name) values ('Главная');
	--PersonInBrigade
	INSERT INTO PersonInBrigade (PID,BID) values (1,1);
	INSERT INTO PersonInBrigade (PID,BID) values (4,1);
	INSERT INTO PersonInBrigade (PID,BID) values (6,1);
	INSERT INTO PersonInBrigade (PID,BID) values (7,1);
	INSERT INTO PersonInBrigade (PID,BID) values (2,2);
	INSERT INTO PersonInBrigade (PID,BID) values (4,2);
	INSERT INTO PersonInBrigade (PID,BID) values (8,2);
	INSERT INTO PersonInBrigade (PID,BID) values (9,2);
	--Customer
	INSERT INTO Customer (Name,Number) values ('ОАО Инвест','+79959567855');
	INSERT INTO Customer (Name,Number) values ('ООО МаксИКО','+79954477855');
	INSERT INTO Customer (Name,Number) values ('Генадий Петрович Захарченко','+79933277855');
	--Works
	INSERT INTO Works (ToWID,BID,CID,IsDone,IsPay,Prise,SDATE,EDATE) 
	values( 1,1,1,0,0, 
	(SELECT SUM(Material.Prise) from Material,UseMaterial 
	WHERE Material.Id = UseMaterial.MID AND UseMaterial.ToWID = 1) + 
	(select TypeOfWorks.Prise from	TypeOfWorks where TypeOfWorks.id = 1),'2018-01-10','2018-01-20');
	INSERT INTO Works (ToWID,BID,CID,IsDone,IsPay,Prise,SDATE,EDATE) 
	values( 4,2,2,1,1, 
	(SELECT SUM(Material.Prise) from Material,UseMaterial 
	WHERE Material.Id = UseMaterial.MID AND UseMaterial.ToWID = 4) + 
	(select TypeOfWorks.Prise from	TypeOfWorks where TypeOfWorks.id = 4),'2018-01-10','2018-01-20');
	INSERT INTO Works (ToWID,BID,CID,IsDone,IsPay,Prise,SDATE,EDATE)  
	values( 5,1,3,1,0, 
	(SELECT SUM(Material.Prise) from Material,UseMaterial 
	WHERE Material.Id = UseMaterial.MID AND UseMaterial.ToWID = 5) + 
	(select TypeOfWorks.Prise from	TypeOfWorks where TypeOfWorks.id = 5),'2018-01-25','2018-01-30');
	go
	
--ЛАБ 3
	--Представления
--V1
	/*Список бригад: наименование бригады, количество рабочих, количество выполненных
	заказов, выполняемый заказ (наименование заказчика, вид работы–в одной колонке);*/
	--Запрос построен ввиде поэтапного сшитья нескольких запросов с помощью left join по полю Name 
	--В последнем подзапросе используется RANK() OVER(Partition  для выбора последнего из групп заказов каждой бригады 
	CREATE VIEW V1 as
	select D1.Name, D1.PersonsCount,DW.Q as [count of done works], Cw.[Customer and work] from
	(
	(select Brigade.Name, Count(PersonInBrigade.PID) as PersonsCount from PersonInBrigade left join Brigade on PersonInBrigade.BID = Brigade.ID group by Brigade.Name) as D1 left join --количество рабочих
	(Select Brigade.Name, Count(Works.IsDone) as Q from works inner join Brigade on Works.BID = Brigade.ID where works.IsDone = 1 group by Brigade.Name) as DW on  D1.Name = DW.Name left join -- количество выполненных заказов
	(select TOP(1) with ties RANK() OVER(Partition BY Brigade.Name
                ORDER BY Works.SDATE DESC) rnk,Works.SDATE, Brigade.Name, Customer.Name + ' '+ TypeOfWorks.Name as 'Customer and work' from Works inner join Customer on Works.CID = Customer.ID
																	  inner join Brigade on Works.BID = Brigade.ID
																	  inner join TypeOfWorks on Works.ToWID = TypeOfWorks.ID 
																	  WHERE Works.IsDone = 0
																	  ORDER by rnk ) as CW on D1.Name = CW.Name --выполняемый заказ 
	)
	go

--V2	
	/*Список заказчиков: наименование; адрес, количество сделанных заказов, средняя стоимость заказа;*/
	--Запрос построен ввиде поэтапного сшитья нескольких запросов с помощью left join по полю N (Customer.Name) 
	--Используются агрегирующие функции и группировки по сшиваемумому полю
	CREATE VIEW V2 as
	select Q1.N as [Customer Name], Q1.A as [Customer Address], Q2.Q as [Customer works count], Q3.AvgPrise from
	  (select Customer.ID as I, Customer.Name as N, Customer.Address as A from Customer) as Q1 left join 
	  (select  Customer.ID as I, Count(Works.id) as Q from works left join Customer on Works.CID = Customer.ID group by Customer.ID)as Q2 on Q1.I = Q2.I left join
	  (select Customer.ID as I, Avg(Works.Prise) as AvgPrise from works left join Customer on Works.CID = Customer.ID group by Customer.ID) as Q3 on Q3.I = Q1.I
	go

--V3	
	/*Список выполненных заказов: наименование заказчика, бригада, стоимость заказа, срок выполнения заказа (в днях), вид работы, отметка об оплате;*/
	--Один запрос, используется функция DateDiff - нахождения разницы по времени между датами
	CREATE VIEW V3 as
	select Customer.Name as [Customer], Brigade.Name as [Brigade], Works.Prise,DateDiff(D,Works.SDATE,Works.EDATE) as [Time to work in days],TypeOfWorks.Name, Works.IsDone from
																   Works left join Customer on Works.CID = Customer.ID
																		 left join Brigade on Works.BID = Brigade.ID 
																		 left join TypeOfWorks on Works.ToWID = TypeOfWorks.ID
		where Works.IsDone = 1
	go	

--V4	
	/*Список выполняемых заказов: наименование заказчика, бригада, дата начала, дата окончания, вид работы.*/
	--Простой запрос без использования каких либо функций, подобен V3
	CREATE VIEW V4 as
	select Customer.Name as [Customer], Brigade.Name as [Brigade], Works.SDATE as [Start date],Works.EDATE as [End date],TypeOfWorks.Name from
																   Works left join Customer on Works.CID = Customer.ID
																		 left join Brigade on Works.BID = Brigade.ID 
																		 left join TypeOfWorks on Works.ToWID = TypeOfWorks.ID
		where Works.IsDone = 0
	go
	
	--функции
	
--F1	
	/*Скалярная функция, возвращающая информацию о бригаде, которая выполнила работ на самую большую сумму за указанный период*/
	--В связи с форматом вывода - функция возвращает VARCHAR, принимает дату начала и конца
	CREATE FUNCTION F1 (@DATES datetime,@DATEE datetime)   
	RETURNS VARCHAR(255)
	AS  
	BEGIN
	--Возвращаем строку согласно заданию
	RETURN CONVERT(VARCHAR(MAX),(select TOP(1) Brigade.Name  + ' (колличество заказов: ' + CONVERT(VARCHAR,Count(Works.id)) + '; общая стоимость: ' +  CONVERT(VARCHAR,sum(works.prise)) + ')'  from Works left join Brigade on Works.BID = Brigade.ID 
	   where 
		 Works.EDATE between @DATES and @DATEE
		 and
		 Works.SDATE between @DATES and @DATEE
		 group by Brigade.Name
		 order by sum(works.prise))) ;
	END;
	GO
	
--F2
	/*Табличная функция, возвращающая информацию о заказах, которые были действующими в заданный период времени*/
	--Функция возврата строки-списка членов бригады (с ms sql server 2017 можно попробывать заменить на STRING_AGG)
	--Используется представление результата запроса в виде XML, затем конвертация в строку CAST и связка STUFF
	CREATE FUNCTION F2_CONCAT (@BID int) --https://habr.com/post/200120/ источник
	RETURNS VARCHAR(MAX)
	AS
	BEGIN 
	RETURN (select Chars = STUFF(CAST((
		SELECT [text()] = ', ' + (Person.FirstName + ' ' + Person.LastName + ' ' + Person.LastName)
		from PersonInBrigade left join Person on PersonInBrigade.PID = Person.ID
						 left join Brigade on PersonInBrigade.BID = Brigade.ID			
						 WHERE Brigade.ID = @BID
		FOR XML PATH(''), TYPE) AS VARCHAR(max)), 1, 2, ''));
	END;
	go
	

	--Основная функция
	--Используется два запроса сшшитые друг с другом left join по полю [заказчик]
	--Первая функция выбирает все кроме поле [бригада], это поле выбирается вторым запросом и в нем используется функция F2_CONCAT
	create function F2 (@DATES datetime,@DATEE datetime)
	RETURNS TABLE
	AS
	RETURN
	(
	Select Q1.заказчик, Q1.[срок выполнения заказа], Q1.[вид работы],Q1.бригада, Q1.[стоимость (руб)] from
	(select Customer.name as [заказчик], (CONVERT(VARCHAR,Works.SDATE) + ' - ' + CONVERT(VARCHAR,Works.EDATE)) as [срок выполнения заказа], TypeOfWorks.Name as [вид работы], Brigade.Name, Works.Prise as [стоимость (руб)], Brigade.Name + ' (' + [dbo].[F2_CONCAT](Brigade.ID) + ')' as [бригада] 
	from Works left join TypeOfWorks on Works.ToWID = TypeOfWorks.ID
			   left join Brigade on Works.BID = Brigade.ID
			   left join Customer on Works.CID = Customer.ID
			   where Works.SDATE between @DATES and @DATEE
			   and Works.EDATE between @DATES and @DATEE) as Q1
	);
	go
	
	--Процедуры
--P1
	/*Процедура для добавления нового сотрудника;*/
	--Вместо кода должности пользователь вводит название
	--Пол определяется буквой Ж - женский инчае мужской
	CREATE PROCEDURE P1(@FirstName varchar(50), @LastName varchar(50), @MiddleName varchar(50),
					@BDay datetime, @Sex char, @Number varchar(50), @Passport varchar(100), @Rang varchar(100))	 
	AS
	BEGIN
	DECLARE @RN int;
	SET @RN = (select Rang.id from rang where Rang.Name = @Rang);
	DEClARE @S bit;
	IF (LOWER(@SEX) = 'ж') SET @S = 1; --LOWER позволяет не обращать внимание на то в каком регистре веден параметр
	ELSE SET @S = 0;
	INSERT INTO Person (FirstName, LastName, MiddleName, BDay, Sex, Number, Passport, Rang)
	values (@FirstName, @LastName, @MiddleName, @BDay, @S, @Number, @Passport, @RN);
	END;
	go	
	
--P2
	/* Процедура для добавления нового заказа;*/
	--Вместо кода типа работы, бригады, заказчкика пользователь вводит соответствующие названия
	--Пометка об оплате определяется словом Да - 1 иначе 0, максимум можно ввести 3 буквы ("нет")
	CREATE PROCEDURE P2 (@ToWID varchar(100),@BID varchar(100),@CID varchar(100),@IsPay varchar(3),
					 @Prise decimal(18,2),@SDATE datetime,@EDATE datetime) 
	AS
	BEGIN
	DECLARE @T int;
	DECLARE @B int;
	DECLARE @C int;
	DECLARE @P bit;
	IF (LOWER(@IsPay) = 'да') SET @P = 1; --LOWER позволяет не обращать внимание на то в каком регистре веден параметр
	ELSE SET @P = 0; 
	SET @T = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @ToWID);
	SET @B = (select Brigade.ID from Brigade where Brigade.Name = @BID);
	SET @C = (select Customer.ID from Customer where Customer.Name = @CID);
	INSERT INTO Works (ToWID,BID,CID,IsDone,IsPay,Prise,SDATE,EDATE) 
		values( @T,@B,@C,0,@P, @Prise,@SDATE,@EDATE); 
	END;
	go	
--P3
	/*Процедура, возвращающая информацию о заказчиках, заказывающих указанный вид работ:*/
	--Процедура состоит из 2 запросов соедененных union 
	--1)Составляет основную таблицу используя подзапрос соеденненный left join и групировку по заказчику с условием передоваемого параметра
	--параметр это название типа работ, с помощью подзапроса получаем его код
	--Все приводится к varchar для реализации UNION
	CREATE PROCEDURE P3 (@Work varchar(100))
	AS
	BEGIN
	select Q2.Заказчик as [Заказчик], CONVERT(varchar,q1.[Количество заказов]) as [Количество заказов],  CONVERT(varchar,q1.[Общая стоимость заказов (руб.)]) as [Общая стоимость заказов (руб.)], CONVERT(varchar,q1.[Средний срок выполнения заказа (дней)]) as [Средний срок выполнения заказа (дней)],Q2.[Информация о последнем заказе] from 
	(
		(select Customer.ID, COUNT(Works.ID) as [Количество заказов], SUM(Works.Prise) as [Общая стоимость заказов (руб.)], AVG(datediff(d,Works.SDATE,Works.EDATE)) as [Средний срок выполнения заказа (дней)]
		from Works left join Customer on Works.CID = Customer.ID
		where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)
		group by Customer.ID) as Q1 left join
		(select TOP(1) with ties RANK() OVER(Partition BY Customer.ID
						ORDER BY Works.EDATE DESC) as rnk, Customer.ID,Customer.Name as [Заказчик], (TypeOfWorks.Name + ', ' + CONVERT(varchar,Works.SDATE) + ' - ' + CONVERT(varchar,Works.EDATE)) as [Информация о последнем заказе]
		from Works left join TypeOfWorks on Works.ToWID = TypeOfWorks.ID
				   left join Customer on Works.CID = Customer.ID
		where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)
		ORDER by rnk) as Q2 on Q1.ID = Q2.ID
	)--2)Запрос представляющий из себя набор из соответвующих итоговых подзапросов 'QQ№' с единственным полем 'q' соеденных cross join,  
	union --используются соответвующе первому запросу названия столбцов
	(
	select QQ1.q as [Заказчик], QQ2.q as [Количество заказов], QQ3.q as [Общая стоимость заказов (руб.)], QQ4.q as [Средний срок выполнения заказа (дней)], QQ5.q as [Информация о последнем заказе] from
		(select  'Итого: заказчиков - ' + CONVERT(varchar,count(q1.CID))as [q] from (select CID from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work) group by CID) as q1) as QQ1
		cross join
		(select 'количество - ' + CONVERT(varchar,count(q2.ID)) as[q]  from (select ID from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ2
		cross join
		(select 'Общая стоимость - ' + CONVERT(varchar,sum(q2.Prise)) as[q]  from (select Prise from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ3
		cross join
		(select 'средний срок - ' + CONVERT(varchar,avg(q2.D)) as[q]  from (select DATEDIFF(d,Works.SDATE,WORKS.EDATE) as D from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ4
		cross join
		(select ' ' as q) as QQ5
	) order by [Информация о последнем заказе] desc --сортировка нужна для расположения итоговой строки последней
	END;
	go	
	/*Процедура, возвращающая информацию о заказчиках, заказывающих указанный вид работ:*/
	--Процедура состоит из 2 запросов соедененных union 
	--1)Составляет основную таблицу используя подзапрос соеденненный left join и групировку по заказчику с условием передоваемого параметра
	--параметр это название типа работ, с помощью подзапроса получаем его код
	--Все приводится к varchar для реализации UNION
	CREATE PROCEDURE P3 (Work varchar(100))
	AS $$
	BEGIN
	select Q2.Заказчик as "Заказчик", CONVERT(varchar,q1."Количество заказов") as "Количество заказов",  CONVERT(varchar,q1."Общая стоимость заказов (руб.)") as "Общая стоимость заказов (руб.)", CONVERT(varchar,q1."Средний срок выполнения заказа (дней)") as "Средний срок выполнения заказа (дней)",Q2."Информация о последнем заказе" from 
	(
		(select Customer.ID, COUNT(Works.ID) as "Количество заказов", SUM(Works.Prise) as "Общая стоимость заказов (руб.)", AVG(datediff(d,Works.SDATE,Works.EDATE)) as "Средний срок выполнения заказа (дней)"
		from Works left join Customer on Works.CID = Customer.ID
		where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = Work)
		group by Customer.ID) as Q1 left join
		(select  RANK() OVER(Partition BY Customer.ID
						ORDER BY Works.EDATE DESC) as rnk, Customer.ID,Customer.Name as "Заказчик", (TypeOfWorks.Name + ', ' + CONVERT(varchar,Works.SDATE) + ' - ' + CONVERT(varchar,Works.EDATE)) as "Информация о последнем заказе"
		from Works left join TypeOfWorks on Works.ToWID = TypeOfWorks.ID
				   left join Customer on Works.CID = Customer.ID
		where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = Work)
		ORDER by rnk LIMIT 1) as Q2 on Q1.ID = Q2.ID
	)--2)Запрос представляющий из себя набор из соответвующих итоговых подзапросов 'QQ№' с единственным полем 'q' соеденных cross join,  
	union --используются соответвующе первому запросу названия столбцов
	(
	select QQ1.q as "Заказчик", QQ2.q as "Количество заказов", QQ3.q as "Общая стоимость заказов (руб.)", QQ4.q as "Средний срок выполнения заказа (дней)", QQ5.q as "Информация о последнем заказе" from
		(select  'Итого: заказчиков - ' + CONVERT(varchar,count(q1.CID))as "q" from (select CID from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work) group by CID) as q1) as QQ1
		cross join
		(select 'количество - ' + CONVERT(varchar,count(q2.ID)) as"q"  from (select ID from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ2
		cross join
		(select 'Общая стоимость - ' + CONVERT(varchar,sum(q2.Prise)) as"q"  from (select Prise from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ3
		cross join
		(select 'средний срок - ' + CONVERT(varchar,avg(q2.D)) as"q"  from (select DATEDIFF(d,Works.SDATE,WORKS.EDATE) as D from Works where Works.ToWID = (select TypeOfWorks.ID from TypeOfWorks where TypeOfWorks.Name = @Work)) as q2) as QQ4
		cross join
		(select ' ' as q) as QQ5
	) order by "Информация о последнем заказе" desc; --сортировка нужна для расположения итоговой строки последней
	END;
	$$  LANGUAGE plpgsql;
	