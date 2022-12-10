--syntax

CREATE [TUR] [NESNE_ADI] [PARAMETRELER]



--VER�TABANI Olu�turma - 1 

CREATE DATABASE Yeni 

--VER�TABANI Olu�turma - 1 - ��kt� 
/*
  Commands completed successfully.

Veritaban� mevcut de�ilse yukar�daki gibi ��kt� verir ve veritaban�n� varsay�lan yap�land�rma ile olu�turur. Ancak veritaban� daha �nceden eklenmi�se a�a��daki gibi ��kt� verecektir.

 Database 'Yeni' already exists. Choose a different database name.
*/

--VER�TABANI Olu�turma - 2 

CREATE DATABASE Yeni2
ON
(
Name= 'dbAdi',
Filename= 'D:\dbb.mdf',
Size=9,
Filegrowth=3
)

--VER�TABANI Olu�turma - 2 - ��kt� 
/*
  Commands completed successfully.

Veritaban� mevcut de�ilse yukar�daki gibi ��kt� verir ve veritaban�n� varsay�lan yap�land�rma ile olu�turur. Ancak veritaban� daha �nceden eklenmi�se a�a��daki gibi ��kt� verecektir.

 Database 'Yeni2' already exists. Choose a different database name.

NAME: SQL Server veritaban�m�za ba�vurdu�unda bu ismi kullan�r. �sim uniqe(benzersiz) olmak zorundad�r.
FILENAME: Veritaban�m�z�n kaydedilece�i yolu ifade eder.
SIZE: Veritaban�n�z�n ilk boyutu
MAXSIZE: Veritaban�n�z�n en fazla ula�abilece�i boyut, MB cinsinden de�eri ifade eder.
FILEGROWTH: Yeterli bo�luk kalmad���nda veritaban�n�z�n geni�leme miktar�, MB cinsinden de�eri ifade eder.
*/


--TABLO olu�turma - 1 
CREATE TABLE [Tablo Ad�]
(
Id INT PRIMARY KEY Identity(2,4),
metin VARCHAR(50)
)

--TABLO olu�turma - 1 - ��kt� 
/*
  Commands completed successfully.

Tablo ilgili veritaban�nda mevcut de�ilse yukar�daki gibi ��kt� verir ve tabloyu olu�turur. Ancak tablo daha �nceden eklenmi�se a�a��daki gibi ��kt� verecektir.

 There is already an object named 'Tablo Ad�' in the database.

*/

--TABLO olu�turma - 2 

CREATE TABLE personel(

   id   INT��IDENTITY(1,1) NOT NULL,
   ad NVARCHAR (20) NOT NULL,     
   soyad NVARCHAR (20), 
   unvan��NVARCHAR (20) ,������
   PRIMARY KEY (id)
)
--TABLO olu�turma - 2 - ��kt� 
/*
  Commands completed successfully.

Tablo ilgili veritaban�nda mevcut de�ilse yukar�daki gibi ��kt� verir ve tabloyu olu�turur. Ancak tablo daha �nceden eklenmi�se a�a��daki gibi ��kt� verecektir.

 There is already an object named 'personel' in the database.

 - IDENTITY(1,1) yaz�m�nda ilk say� ba�lang�� de�erini, ikinci say� ise art�� miktar�n� ifade etmektedir. 
 - NOT NULL ifadesi kolon de�erinin bo� b�rak�lamayaca�� anlam�n� ta��maktad�r. E�er NOT NULL ifadesi kullan�lmazsa kolon NULL de�er alabilir yani ilgili alan bo� b�rak�labilir.
*/
