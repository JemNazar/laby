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




--INSERT INTO Person_Fio(FIO) VALUES ('������ �.�.')
--INSERT INTO Person_Fio(FIO) VALUES('������ �.�.')
--INSERT INTO Person_Fio(FIO) VALUES('�������� �.�.')


--INSERT INTO Person_Adres(ADRES) VALUES ('����������� 93�')
--INSERT INTO Person_Adres(ADRES) VALUES ('���������� 57')
--INSERT INTO Person_Adres(ADRES) VALUES ('������ 23')

