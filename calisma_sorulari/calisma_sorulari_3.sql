/*

Çalýþma Sorularý - 3 
Aþaðýdaki ifadelerde kullanýlacak veritabaný farklýlýk gösterebilir:
1-  final isimli veritabaný oluþturunuz.
	### aþaðýda yer alan ifadeleri final veritabanýnda gerçekleþtiriniz ###
2-  final veritabanýna ogrenci isimli tablo olusturunuz tablonun kolonlarýna dair ozellikler:
    - Kolon adý: id           Türü: int          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon adý: ad           Türü: VARCHAR(50)  CONSTRAINTS: NOT NULL
	- Kolon adý: soyad        Türü: VARCHAR(50)  CONSTRAINTS: NOT NULL 
	- Kolon adý: dogum_yeri   Türü: VARCHAR(30)  CONSTRAINTS: DEFAULT('TR') NULL
	- Kolon adý: dogum_tarihi Türü: DATE         CONSTRAINTS: NOT NULL
3-  final veritabanýna ogrenci_detay isimli tablo olusturunuz tablonun kolonlarýna dair ozellikler:
    - Kolon adý: id               Türü: INT          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon adý: ogrenci_id       Türü: INT          CONSTRAINTS: FOREIGN KEY REFERENCES ogrenci(id) 
	  ON UPDATE CASCADE ON DELETE CASCADE
	- Kolon adý: okul             Türü: VARCHAR(50)  CONSTRAINTS: DEFAULT ('Pazaryeri MYO') NULL 
	- Kolon adý: bolum            Türü: VARCHAR(30)  CONSTRAINTS: DEFAULT('Bilgisayar Programcýlýðý') NULL
	- Kolon adý: sinif            Türü: INT          CONSTRAINTS: NOT NULL
	- Kolon adý: mezuniyet_tarihi Türü: DATE         CONSTRAINTS: NULL
4- ogrenci ve ogrenci_detay tablosuna aþaðýdaki kayýtlarý en az sorgu ile ekleyiniz.
NOT: ogrenci_detay tablosuna eklenecek veri için öncelikle ogrenci tablosunda kayýt oluþturulmalý ve id bilgisi
ogrenci_detay tablosundaki ogrenci_id kolonu için elde edilmelidir.
NOT-2: Kolonlarda deðer bulunmayan kayýtlarýn ilgili kolon deðeri boþ olacaktýr.
|ad        |soyad       |dogum_yeri |dogum_tarihi | okul        | bolum              | sinif | mezuniyet_tarihi |
|Aytaç     | Aksoy      | Van       |2000-01-04   | Bilecik MYO | Ýnternet ve Að Tek.| 1     | 2021-06-23       |
|Naim      | Aksoy      | Eskiþehir |2001-05-24   | Bozüyük MYO | Web Tasarým ve Kod.| 1     |                  |
|Ensar     | Yýlmaz     | Ýstanbul  |2002-06-12   | Malatya MYO | Ýnternet ve Að Tek.| 2     | 2021-06-23       |
|Gülnaz    | Deðirmenci | Mardin    |2001-02-17   |             | Web Tasarým ve Kod.| 2     |                  |
|Abdülaziz | Küçük      | Ankara    |2000-03-10   | Ankara MYO  | Web Tasarým ve Kod.| 2     | 2021-06-23       |
|Mesud     | Burakgazi  | Bilecik   |2003-04-08   | Ýzmir MYO   | Ýnternet ve Að Tek.| 1     |                  |
|Gülnur    | Teke       | Ýzmir     |2003-07-03   | Bilecik MYO | Ýnternet ve Að Tek.| 2     | 2021-06-23       |
|Umut      | Deðirmenci | Trabzon   |2002-02-07   | Malatya MYO |                    | 1     |                  |
|Bulut     | Demirci    | Aðrý      |2001-05-14   |             | Ýnternet ve Að Tek.| 1     |                  |
|Belinay   | Deðirmenci | Rize      |2002-06-19   |             |                    | 2     | 2020-06-18       |
|Firuze    | Solak      | Çanakkale |2003-03-21   | Ankara MYO  | Web Tasarým ve Kod.| 1     |                  |
|Fadime    | Badem      | Malatya   |2000-06-09   | Malatya MYO | Ýnternet ve Að Tek.| 1     |                  |
|Danyal    | Teke       | Elazýð    |2002-09-18   | Ýzmir MYO   | Ýnternet ve Að Tek.| 2     |                  |
|Nadire    | Kartal     | Afyon     |2001-12-26   |             | Web Tasarým ve Kod.| 1     |                  |
|Behiye    | Deðirmenci | Tunceli   |2000-11-23   | Bilecik MYO | Web Tasarým ve Kod.| 1     |                  |
|Mazhar    | Katýrcý    | Sakarya   |2001-11-18   |             |                    |       |                  |
|Haydar    | Karga      | Mersin    |2001-01-12   |             |                    |       |                  |
|Lütfiye   | Ekmekçi    | Kýrþehir  |2000-10-27   |             |                    |       |                  |
|Ýpek      | Yýlmaz     | Kayseri   |2002-12-05   |             |                    |       |                  |
|Meral     | Kartal     | Ýstanbul  |2001-06-19   |             |                    |       |                  |

5- Her iki tabloda yer alan tüm kolonlarý listeleyen ve yalnýzca eþleþen INNER JOIN komutunu yazýnýz.
6- ogrenci tablosundaki tüm kayýtlarý listelemek koþulu ile ogrenci_detay tablosu ile birleþtirerek, iki tablonun tüm kolonlarýný (eþleþen veya eþleþmeyen veriler) INNER listeleyiniz.
7- ogrenci tablosundaki kayýtlarý ogrenci_detay tablosu ile birleþtirerek, iki tablonun tüm kolonlarýný (yalnýzca eþleþen veriler) listeleyiniz.
8- ogrenci tablosundaki tüm kayýtlarý  listelemek koþulu ile ogrenci_detay tablosu ile birleþtirerek, iki tablonun tüm kolonlarýný (eþleþen veya eþleþmeyen veriler) FULL JOIN listeleyiniz.
9- ogrenci tablosundaki dogum_yeri kolonundaki deðeri "Afyon" olan kayýtlarýn dogum_yeri kolon deðerini "Afyonkarahisar" olarak güncelleyiniz.
10-ogrenci_detay tablosundaki bolum kolonunda "Tek." ve "Kod." ifadeleri bulunan kayýtlarýn  bolum deðerlerini sýrasýyla "Ýnternet ve Að Teknolojileri" ve "Web Tasarým ve Kodlama" olarak güncelleniyiniz.
11-ogrenci tablosundaki dogum_tarihi sütunundaki deðerin parçalanarak ay, yýl ve gün sütunlarý ile isimleri ile listeleyiniz.
12-ogrenci tablosundaki tüm kayýtlarý (id kolonunun artýþ deðerini de sýfýrlayarak) siliniz. (***)
13-ogrenci_detay tablosundaki mezuniyet_tarihi kolon deðeri NULL olan kayýtlarý siliniz.
14-ogrenci tablosunu siliniz.
15-ogrenci_detay tablosunu siliniz.
16-final veritabanýný siliniz.
*/



/*Cevaplar*/

--1
CREATE DATABASE final

--2 [komut çalýþtýrýlmadan önce ilgili veritabaný seçilmelidir!]

use final;
CREATE TABLE ogrenci
(
id               INT          PRIMARY KEY IDENTITY(1,1),
ad               VARCHAR(50)  NOT NULL,
soyad            VARCHAR(50)  NOT NULL,
dogum_yeri       VARCHAR(30)  DEFAULT('tr') NULL,
dogum_tarihi     DATE         NOT NULL,
)

--3 
CREATE table ogrenci_detay
(
id               INT PRIMARY KEY IDENTITY(1,1),
ogrenci_id       INT FOREIGN KEY REFERENCES ogrenci(id) ON UPDATE CASCADE ON DELETE CASCADE,
okul             VARCHAR(50) DEFAULT('Pazaryeri MYO') NULL,
bolum            VARCHAR(50) DEFAULT('Bilgisayar Programcýlýðý') NULL,
sinif            INT NOT NULL,
mezuniyet_tarihi DATE NULL
)


--4
--I. Aþama 
INSERT ogrenci VALUES
('Aytaç','Aksoy','Van','2000-01-04'),
('Naim','Aksoy','Eskiþehir','2001-05-24'),
('Ensar','Yýlmaz','Ýstanbul','2002-06-12'),
('Gülnaz','Deðirmenci','Mardin','2001-02-17'),
('Abdülaziz','Küçük','Ankara','2000-03-10'),
('Mesud','Burakgazi','Bilecik','2003-04-08 '),
('Gülnur','Teke','Ýzmir','2003-07-03'),
('Umut','Deðirmenci','Trabzon','2002-02-07'),
('Bulut','Demirci','Aðrý','2001-05-14'),
('Belinay','Deðirmenci','Rize','2002-06-19'),
('Firuze','Solak','Çanakkale','2003-03-21'),
('Fadime','Badem','Malatya','2000-06-09'),
('Danyal','Teke','Elazýð','2002-09-18'),
('Nadire','Kartal','Afyon','2001-12-26'),
('Behiye','Deðirmenci','Tunceli','2000-11-23'),
('Mazhar','Katýrcý','Sakarya','2001-11-18'),
('Haydar','Karga','Mersin','2001-01-12'),
('Lütfiye','Kýrþehir','Tunceli','2000-10-27'),
('Ýpek','Yýlmaz','Kayseri','2002-12-05'),
('Meral','Kartal','Ýstanbul','2001-06-19')

--II. Aþama
--Not: ogrenci_detay kayýtlarýný eklemek için ana tablodaki id verisinin bilinmesi gerekmektedir.
/*
Örnek olmasý amacýyla eklenen ilk kayýt iç içe sorgu yöntemi kullanýlarak eklenmiþtir.
SELECT id FROM ogrenci WHERE ad='Aytaç' AND soyad='Aksoy' AND dogum_yeri='Van'
sorgusu bize detayýný eklemek istediðimiz kaydýn id deðerini verir. Bu sorgu ana sorgunun içinde parantez içerisinde 
kullanýldýðýnda id deðeri yazýlmýþ gibi davranacaktýr. Sorgunun tam kullanýmý aþaðýda yer almaktadýr.
*/
-- 1. kaydýn detay verisinin eklenmesi.
INSERT ogrenci_detay VALUES ((SELECT id FROM ogrenci WHERE ad='Aytaç' AND soyad='Aksoy' AND dogum_yeri='Van'),'Bilecik MYO', 'Ýnternet ve Að Tek.',1,'2021-06-23')

--Diðer kayýtlar 
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif) VALUES(2,'Bozüyük MYO', 'Web Tasarým ve Kod.',1)
INSERT ogrenci_detay VALUES(3,'Malatya MYO', 'Ýnternet ve Að Tek.',1,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,bolum,sinif) VALUES(4,'Ýnternet ve Að Tek.',2)
INSERT ogrenci_detay VALUES(5,'Ankara MYO', 'Web Tasarým ve Kod.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(6,'Ýzmir MYO', 'Ýnternet ve Að Tek.',1)
INSERT ogrenci_detay VALUES(7,'Bilecik MYO', 'Ýnternet ve Að Tek.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,sinif)  VALUES(8,'Malatya MYO',1)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif)  VALUES(9,'Ýnternet ve Að Tek.',1)
INSERT ogrenci_detay (ogrenci_id,sinif,mezuniyet_tarihi)  VALUES(10,1,'2020-06-08')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(11,'Ankara MYO', 'Web Tasarým ve Kod.',1),
(12,'Malatya MYO', 'Ýnternet ve Að Tek.',1),
(13,'Ýzmir MYO', 'Ýnternet ve Að Tek.',2)
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(14,'Bilecik MYO','Web Tasarým ve Kod.',1)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif) VALUES(15,'Web Tasarým ve Kod.',1)



--5
SELECT * FROM ogrenci INNER JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--6

SELECT * FROM ogrenci LEFT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--7
--NOT: INNER JOIN sorgusuda kullanýlabilirdi. 
SELECT * FROM ogrenci RIGHT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--8
SELECT * FROM ogrenci FULL JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--9 
UPDATE ogrenci SET dogum_yeri='Afyonkarahisar' WHERE dogum_yeri='Afyon'
--10
UPDATE ogrenci_detay SET bolum='Ýnternet ve Að Teknolojileri' WHERE bolum LIKE '%Tek.%'
UPDATE ogrenci_detay SET bolum='Web Tasarým ve Kodlama' WHERE bolum LIKE '%Kod.%'

--11
-- Ýki komutta ayný çýktýyý verir.
SELECT MONTH(dogum_tarihi) ay, YEAR(dogum_tarihi) yýl, DAY(dogum_tarihi) FROM ogrenci 
SELECT DATEPART(MONTH,dogum_tarihi) ay, DATEPART(YEAR,dogum_tarihi) yýl, DATEPART(DAY,dogum_tarihi) FROM ogrenci 

--12
--NOT: Ýlgili tabloda bir kolon baþka bir tabloda FOREIGN KEY olarak ayarlandýðý için hata alýnacaktýr.
--Bu tarzda "ana tablo" statüsündeki tablolarda iþlemler için iliþkili tablolarýna da müdahele etmek gerekir.
TRUNCATE TABLE ogrenci

--13  ogrenci_detay tablosundaki mezuniyet_tarihi kolon deðeri NULL olan kayýtlarý siliniz.

DELETE FROM ogrenci_detay WHERE mezuniyet_tarihi IS NULL

--14 - ogrenci tablosunu siliniz.
--NOT: Ýlgili tabloda bir kolon baþka bir tabloda FOREIGN KEY olarak ayarlandýðý için hata alýnacaktýr.
--Bu tarzda "ana tablo" statüsündeki tablolarda iþlemler için iliþkili tablolarýna da müdahele etmek gerekir.
DROP TABLE ogrenci

--15 - ogrenci_detay tablosunu siliniz.

DROP TABLE ogrenci_detay

--16 - final veritabanýný siliniz.
-- Veritabaný kullanýmda ise "Cannot drop database "final" because it is currently in use." hatasý alýnacaktýr.
DROP DATABASE final


--MSSQL ortamýnda silmek için:
--I. Yöntem
--Management Studio ortamýndan da veritabaný deðiþikliði gerçekleþtirilebilir.
USE master;
DROP DATABASE final


--II. Yöntem
-- Bu durum birden fazla aktif kullanýcýsý bulunan veritabanlarýný silmek için kullanýlýr.
USE master;
ALTER DATABASE final SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE final;