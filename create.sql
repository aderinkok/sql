--syntax

CREATE [TUR] [NESNE_ADI] [PARAMETRELER]



--VERİTABANI Oluşturma - 1 

CREATE DATABASE Yeni 

--VERİTABANI Oluşturma - 1 - Çıktı 
/*
  Commands completed successfully.

Veritabanı mevcut değilse yukarıdaki gibi çıktı verir ve veritabanını varsayılan yapılandırma ile oluşturur. Ancak veritabanı daha önceden eklenmişse aşağıdaki gibi çıktı verecektir.

 Database 'Yeni' already exists. Choose a different database name.
*/

--VERİTABANI Oluşturma - 2 

CREATE DATABASE Yeni2
ON
(
Name= 'dbAdi',
Filename= 'D:\dbb.mdf',
Size=9,
Filegrowth=3
)

--VERİTABANI Oluşturma - 2 - Çıktı 
/*
  Commands completed successfully.

Veritabanı mevcut değilse yukarıdaki gibi çıktı verir ve veritabanını varsayılan yapılandırma ile oluşturur. Ancak veritabanı daha önceden eklenmişse aşağıdaki gibi çıktı verecektir.

 Database 'Yeni2' already exists. Choose a different database name.

NAME: SQL Server veritabanımıza başvurduğunda bu ismi kullanır. İsim uniqe(benzersiz) olmak zorundadır.
FILENAME: Veritabanımızın kaydedileceği yolu ifade eder.
SIZE: Veritabanınızın ilk boyutu
MAXSIZE: Veritabanınızın en fazla ulaşabileceği boyut, MB cinsinden değeri ifade eder.
FILEGROWTH: Yeterli boşluk kalmadığında veritabanınızın genişleme miktarı, MB cinsinden değeri ifade eder.
*/


--TABLO oluşturma - 1 
CREATE TABLE [Tablo Adı]
(
Id INT PRIMARY KEY Identity(2,4),
metin VARCHAR(50)
)

--TABLO oluşturma - 1 - Çıktı 
/*
  Commands completed successfully.

Tablo ilgili veritabanında mevcut değilse yukarıdaki gibi çıktı verir ve tabloyu oluşturur. Ancak tablo daha önceden eklenmişse aşağıdaki gibi çıktı verecektir.

 There is already an object named 'Tablo Adı' in the database.

*/

--TABLO oluşturma - 2 

CREATE TABLE personel(

   id   INT  IDENTITY(1,1) NOT NULL,
   ad NVARCHAR (20) NOT NULL,     
   soyad NVARCHAR (20), 
   unvan  NVARCHAR (20) ,      
   PRIMARY KEY (id)
)
--TABLO oluşturma - 2 - Çıktı 
/*
  Commands completed successfully.

Tablo ilgili veritabanında mevcut değilse yukarıdaki gibi çıktı verir ve tabloyu oluşturur. Ancak tablo daha önceden eklenmişse aşağıdaki gibi çıktı verecektir.

 There is already an object named 'personel' in the database.

 - IDENTITY(1,1) yazımında ilk sayı başlangıç değerini, ikinci sayı ise artış miktarını ifade etmektedir. 
 - NOT NULL ifadesi kolon değerinin boş bırakılamayacağı anlamını taşımaktadır. Eğer NOT NULL ifadesi kullanılmazsa kolon NULL değer alabilir yani ilgili alan boş bırakılabilir.
*/
