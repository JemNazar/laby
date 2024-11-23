use DataPerson
CREATE TABLE Person_Fio
(
	ID_FIO int not null IDENTITY(1,1)  PRIMARY KEY,
	FIO varchar(100) NOT NULL, 
)


CREATE TABLE Person_Adres
(
	ID_Adres int not null IDENTITY(1,1)  PRIMARY KEY,
	ADRES varchar(100) NOT NULL, 
	ID_Person_FIO int,
	FOREIGN KEY (ID_Person_FIO) REFERENCES Person_Fio (ID_FIO),
)




--INSERT INTO Person_Fio(FIO) VALUES ('Иванов С.Ф.')
--INSERT INTO Person_Fio(FIO) VALUES('Петров В.А.')
--INSERT INTO Person_Fio(FIO) VALUES('Васильев А.А.')


--INSERT INTO Person_Adres(ADRES) VALUES ('Мельникайте 93а')
--INSERT INTO Person_Adres(ADRES) VALUES ('Котовского 57')
--INSERT INTO Person_Adres(ADRES) VALUES ('Ленина 23')

