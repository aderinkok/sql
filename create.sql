--syntax

CREATE [TUR] [NESNE_ADI] [PARAMETRELER]



--VERÝTABANI Oluþturma - 1 

CREATE DATABASE Yeni 

--VERÝTABANI Oluþturma - 1 - Çýktý 
/*
  Commands completed successfully.

Veritabaný mevcut deðilse yukarýdaki gibi çýktý verir ve veritabanýný varsayýlan yapýlandýrma ile oluþturur. Ancak veritabaný daha önceden eklenmiþse aþaðýdaki gibi çýktý verecektir.

 Database 'Yeni' already exists. Choose a different database name.
*/

--VERÝTABANI Oluþturma - 2 

CREATE DATABASE Yeni2
ON
(
Name= 'dbAdi',
Filename= 'D:\dbb.mdf',
Size=9,
Filegrowth=3
)

--VERÝTABANI Oluþturma - 2 - Çýktý 
/*
  Commands completed successfully.

Veritabaný mevcut deðilse yukarýdaki gibi çýktý verir ve veritabanýný varsayýlan yapýlandýrma ile oluþturur. Ancak veritabaný daha önceden eklenmiþse aþaðýdaki gibi çýktý verecektir.

 Database 'Yeni2' already exists. Choose a different database name.

NAME: SQL Server veritabanýmýza baþvurduðunda bu ismi kullanýr. Ýsim uniqe(benzersiz) olmak zorundadýr.
FILENAME: Veritabanýmýzýn kaydedileceði yolu ifade eder.
SIZE: Veritabanýnýzýn ilk boyutu
MAXSIZE: Veritabanýnýzýn en fazla ulaþabileceði boyut, MB cinsinden deðeri ifade eder.
FILEGROWTH: Yeterli boþluk kalmadýðýnda veritabanýnýzýn geniþleme miktarý, MB cinsinden deðeri ifade eder.
*/


--TABLO oluþturma - 1 
CREATE TABLE [Tablo Adý]
(
Id INT PRIMARY KEY Identity(2,4),
metin VARCHAR(50)
)

--TABLO oluþturma - 1 - Çýktý 
/*
  Commands completed successfully.

Tablo ilgili veritabanýnda mevcut deðilse yukarýdaki gibi çýktý verir ve tabloyu oluþturur. Ancak tablo daha önceden eklenmiþse aþaðýdaki gibi çýktý verecektir.

 There is already an object named 'Tablo Adý' in the database.

*/

--TABLO oluþturma - 2 

CREATE TABLE personel(

   id   INT  IDENTITY(1,1) NOT NULL,
   ad NVARCHAR (20) NOT NULL,     
   soyad NVARCHAR (20), 
   unvan  NVARCHAR (20) ,      
   PRIMARY KEY (id)
)
--TABLO oluþturma - 2 - Çýktý 
/*
  Commands completed successfully.

Tablo ilgili veritabanýnda mevcut deðilse yukarýdaki gibi çýktý verir ve tabloyu oluþturur. Ancak tablo daha önceden eklenmiþse aþaðýdaki gibi çýktý verecektir.

 There is already an object named 'personel' in the database.

 - IDENTITY(1,1) yazýmýnda ilk sayý baþlangýç deðerini, ikinci sayý ise artýþ miktarýný ifade etmektedir. 
 - NOT NULL ifadesi kolon deðerinin boþ býrakýlamayacaðý anlamýný taþýmaktadýr. Eðer NOT NULL ifadesi kullanýlmazsa kolon NULL deðer alabilir yani ilgili alan boþ býrakýlabilir.
*/
