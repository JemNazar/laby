


CREATE TABLE Povar --����� ���- ���������
(
	ID_Povar int not null IDENTITY(1,1)  PRIMARY KEY,
	FIO varchar(100) NOT NULL, --��� �����
	Chef_Pos varchar(100) NOT NULL, --��������� ������

	
)

go

CREATE TABLE Salata
(  
    ID_Salat int not null IDENTITY(1,1)  PRIMARY KEY,
	Name_Salat varchar(50)  NOT NULL,--������������ ������
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
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('������ �.�.', '���-�����');
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('������ �.�.', '��. ��������');
INSERT INTO Povar(FIO, Chef_Pos) VALUES ('�������� �.�.', '���. ���. ������');




--Salat
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ( '����� �������', 50, '...', '������', 20);
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ('����� ��������', 65, '...', '������', 20);
INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) VALUES ( '��� ��������', 100, '...', '����', 60);


--Ingridient
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('���������',500,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('����',4,	'��',	'������ �������� �����');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('����',400,	'��',	'������ �������� �����');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('�������', 500,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('������', 500,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('������', 200,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('���', 100,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('����', 4,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('�������', 50,	'��',	'������-������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('������ ��������', 500,	'��',	'������ �������� �����');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('�������� ���������', 100,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES ('�������', 300,	'��',	'������ �������� �����');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('������', 100,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('�������� �����', 50,	'��',	'������������');
INSERT INTO Ingridient(Name_Ingrid, Ingr_Quan, Ingrid_Mera, prod_supp) VALUES('�����', 1,	'��',	'������������');


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


--���3
-- ������������� 


--������ ������� ������� ������ �������� ��� ����� � �������� ���� ���� 
CREATE VIEW List_Salat as
Select Name_Salat from Salata where ID_Salat not in (
Select Salata.ID_Salat
from Ing_Salat Left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing
left join Salata on Ing_Salat.ID_Salat = Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
left join Povar on Povar.ID_Povar = Povar_Salat.ID_Povar
WHERE Name_Ingrid = '����' and Chef_Pos != '���-�����' 
group by Salata.ID_Salat);

go

--Select * from List_Salat


--������ ������������ � ���� ������� ������� � ������ ������ ������� ��� ����������� �������� '������������' 
CREATE VIEW List_Ingr as
Select Ingridient.Name_Ingrid, Ingridient.Ingrid_Mera from Ingridient where ID_Ing not in(
Select Ingridient.ID_Ing 
from Ing_Salat left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing 
left join Salata on Ing_Salat.ID_Salat =  Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
Where Name_Salat != '����� �������' and prod_supp !='������������'
group by Ingridient.ID_Ing);
go


--������ ������� � ���������, ������� �������� ����� ������ ��� ��� ������� � �������� ��������� ���-����� 
CREATE VIEW List_Povar as
Select Povar.FIO, Povar.Chef_Pos from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != '����� �������' or Name_Salat != '��� ��������') and Chef_Pos != '���-�����');
go

--���������� �������������� � ������������ �������� ������� ������������� ��� ������������ ������ � �������������
CREATE VIEW Gorizontal as
Select * 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
go
--������������  ��������
CREATE VIEW Vertical as
Select Povar.FIO, Povar.Chef_Pos from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != '����� �������' or Name_Salat != '��� ��������') and Chef_Pos != '���-�����')
Union ALL
Select Ingridient.Name_Ingrid, Ingridient.Ingrid_Mera from Ingridient where ID_Ing not in(
Select Ingridient.ID_Ing 
from Ing_Salat left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing 
left join Salata on Ing_Salat.ID_Salat =  Salata.ID_Salat
left join Povar_Salat on Povar_Salat.ID_Salat = Ing_Salat.ID_Salat
Where Name_Salat != '����� �������' and prod_supp !='������������'
group by Ingridient.ID_Ing);

go

--� ������������� "������ �������" �������� ����������� ��� ������ ������� ���� 
Alter table Povar add ctaj varchar(20) null;

go

Alter VIEW List_Povar as
Select Povar.FIO, Povar.Chef_Pos, Povar.ctaj from Povar where Povar.ID_Povar not in( 
Select Povar.ID_Povar 
from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
Where (Name_Salat != '����� �������' or Name_Salat != '��� ��������') and Chef_Pos != '���-�����');

go

--������� ������������� ������� ������������
DROP VIEW List_Ingr;

go

--����_4
--�������� �������� � �������
 

 --��������� �������, ���������� ���������� � ��������� ������, �������� ��� � ������������ ���� 

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


--����� ������� 
Select dbo.PriceSalat('����')

go

--�������� � ������ ������� ����� �� ������ 30 �� ������ 100


CREATE FUNCTION POV_Table(@Price1 int, @Price2 int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT Q1.[������������ ������], Q1.[��������� ������], Q1.[����� �������������], Q1.[��������� ������]  FROM 
	(select Salata.Name_Salat as [������������ ������], (Povar.FIO + ' ' + Povar.Chef_Pos) as [��������� ������], (Convert(varchar, Salata.Time_Dish) + '���' ) as [����� �������������], (convert(varchar, Salata.price) + '�') as [��������� ������]
	from Povar_Salat left join Povar on Povar_Salat.ID_Povar = Povar.ID_Povar
    Left join Salata on Povar_Salat.ID_Salat =Salata.ID_Salat 
	where Salata.price between @Price1 and @Price2) as Q1
    
); 

go


--������� ��������� �������
select * from dbo.POV_Table(30,100)
go

-- �������� ��������� ������� ����� ��������� ����� ������.
CREATE PROCEDURE P1
(   
	--�������� ���������
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
	
	--����������, ����������� ��� ��������
    --��������� �������� ����������
    --�������� ������ �������� � ������ � � ����� ��������� ������
	Set @SalataName = LTRIM(RTRIM(@SalataName));
  
	--��������� ����� ������
	INSERT INTO Salata (Name_Salat, price, cook_method, TypeDish, Time_Dish) 
	VALUES( @SalataName, @Price, @COOKMETHOD, @TYPEDISH, @TIME)

	SET @idsalat = (SELECT  MAX(Salata.ID_Salat)
	from Salata);

	insert into Povar_Salat(ID_Povar, ID_Salat) values (@id_Pov, @idsalat)	 
	
end

go

EXEC P1  "��������", 100, "...", "������", 30, 3

drop procedure P1

go

CREATE PROCEDURE P2 (
  @name varchar(100)
  )
	AS 
	BEGIN

	select QQ1.q as [��� ������], QQ2.q [���������� ������������], QQ3.q as [����� ��������� �������(���.)], QQ4.q as [������� ����� �������������] from
		((select  '��� ������ - ' +  q2.Name_Salat as "q" from (select Name_Salat from Salata where Salata.Name_Salat = @name) as q2) as QQ1
		cross join
		(select '���������� ������������ - ' + convert(varchar,count(q2.ID_Ing)) as"q"  from (select Ing_Salat.ID_Ing from Ing_Salat  where ID_Ing = (Select ID_Salat from Salata where Salata.Name_Salat = @name)) as q2) as QQ2
		cross join
		(select '����� ��������� - ' +  convert(varchar,sum(q2.price)) as "q"  from (select price from Salata  where  Salata.Name_Salat = @name ) as q2) as QQ3
		cross join
		(select '������� ����� ������������� - ' + convert(varchar,avg(q2.Time_Dish))  as"q"  from (select Salata.Time_Dish from Salata  where Salata.Name_Salat = @name ) as q2) as QQ4
		cross join
		(select ' ' as q) as QQ5) order by "��� ������" desc; --���������� ����� ��� ������������ �������� ������ ���������
	END
go

EXEC P2 @name ='����� �������'
go

drop procedure P2

--������������ ������ �5 �������� ���������

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

--���������� ������� History ������ � ����������
use MenuKafe
go
CREATE TRIGGER Salat_ins_del_updt ON Salata
	after Insert, delete, update
	AS
	begin 

	INSERT INTO History (ProductId, Operation)
    SELECT INSERTED.ID_Salat, ('�������� ������ ' + INSERTED.Name_Salat + ' ���� ' + INSERTED.price)
    FROM INSERTED left join Salata on inserted.ID_Salat = Salata.ID_Salat

	INSERT INTO History (ProductId, Operation)
	SELECT DELETED.ID_Salat, ('������ ������ ' + DELETED.Name_Salat + ' ���� ' + DELETED.price)
	FROM DELETED LEFT join Salata on deleted.ID_Salat = Salata.ID_Salat

	INSERT INTO History (ProductId, Operation)
	SELECT INSERTED.ID_Salat, ('�������� ������ ' + INSERTED.Name_Salat + ' ���� ' + INSERTED.price)
	FROM INSERTED left join Salata on inserted.ID_Salat = Salata.ID_Salat
	
	end

	INSERT INTO  Salata(Name_Salat, price, cook_method, TypeDish, Time_Dish)
	VALUES('����� ��������', 54, '...', '������', 15)
	
	DELETE FROM Salata where ID_Salat = 1006

	Update Salata Set price = 75 where price = 78

go

Drop trigger Salat_ins_del_updt
 
 go



-- ����������� �������� 

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



  --������� �������� � ������� ��������

  CREATE TRIGGER d_tbPovar1 ON Povar
FOR DELETE
AS
 IF EXISTS (SELECT *
            FROM deleted
            WHERE FIO='������ �.�.')
  BEGIN 
   PRINT '������, ������ ������� ����� ������'
   ROLLBACK TRANSACTION
  END

 go

 Drop trigger d_tbPovar1
 
 --��������� �������� ����� ��� ����� ������
  CREATE TRIGGER d_tbIng ON Ingridient
FOR DELETE
AS
 IF (SELECT count(*) 
   FROM deleted)>1 
 BEGIN
  PRINT '������ ������� ����� ����� ������'
  ROLLBACK TRANSACTION
 END

 go

 Drop trigger d_tbing

 --��� ��������� ������� INGRIDIENT, � ������� Salata ������� price ����� ���������� 1 ������
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

  --�������, �����������, ��� � ���� ������ ����������� ���������� �������� ���_������
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

---- �� ����� ������ ���������� EVENTDATA � SYSTEM_USER.
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



 --������������ ������ �6

 --������� ������
 CREATE PROCEDURE  Insert_Salat
   (
        --�������� ���������
        
		@NameSalat varchar(50), 
		@price_salat int,
	    @CookMethod varchar(300),
		@Type_Dish varchar(50),
		@TimeDish int
   )
   AS
   BEGIN
         
		 Declare @idsalat int
        --����������, ����������� ��� �������� 
        --��������� �������� ����������
        --�������� ������ �������� � ������ � � ����� ��������� ������
        SET @NameSalat = LTRIM(RTRIM(@NameSalat));
        
        --��������� ����� ������
        INSERT INTO Salata( Name_Salat, price, cook_method, TypeDish, Time_Dish)
                VALUES (@NameSalat, @price_salat, @CookMethod, @Type_Dish, @TimeDish)

		SET @idsalat = (SELECT  Salata.ID_Salat
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing);

        --���������� ������
		select Salata.ID_Salat,  Salata.Name_Salat as [������������ ������], (convert(varchar, Salata.price) + '�') as [��������� ������(���)], Salata.cook_method as [������ �������������], Salata.TypeDish as [��� �����], (Convert(varchar, Salata.Time_Dish) + '���' ) as [����� �������������]
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing;
		
	END

	drop procedure Insert_Salat

 exec Insert_Salat  '��������', 82, '...', '������', '30'


 go 


 --��������� ������ 
 create PROCEDURE update_Salat
   ( --�������� ���������
        
		@NameSalat varchar(50), 
		@price_salat int
   )
   AS
   BEGIN
        --����������, ����������� ��� �������� 
        --��������� �������� ����������
        --�������� ������ �������� � ������ � � ����� ��������� ������
        SET @NameSalat = LTRIM(RTRIM(@NameSalat));
        
        --��������� ����� ������
		Update Salata
		Set price = @price_salat(SELECT  Salata.price
		from Povar_Salat left join Salata on Povar_Salat.ID_Salat = Salata.ID_Salat 
		left join Povar on  Povar.ID_Povar = Povar_Salat.ID_Povar 
		left join Ing_Salat on Ing_Salat.ID_Salat = Salata.ID_Salat
		left join Ingridient on Ing_Salat.ID_Ing = Ingridient.ID_Ing)
	END

   GO

 create PROCEDURE Drop_Salat
   ( --�������� ���������
        
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

   --������������� ����� �� ������� �������

