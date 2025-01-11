/*

�al��ma Sorular� - 3 
A�a��daki ifadelerde kullan�lacak veritaban� farkl�l�k g�sterebilir:
1-  final isimli veritaban� olu�turunuz.
	### a�a��da yer alan ifadeleri final veritaban�nda ger�ekle�tiriniz ###
2-  final veritaban�na ogrenci isimli tablo olusturunuz tablonun kolonlar�na dair ozellikler:
    - Kolon ad�: id           T�r�: int          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon ad�: ad           T�r�: VARCHAR(50)  CONSTRAINTS: NOT NULL
	- Kolon ad�: soyad        T�r�: VARCHAR(50)  CONSTRAINTS: NOT NULL 
	- Kolon ad�: dogum_yeri   T�r�: VARCHAR(30)  CONSTRAINTS: DEFAULT('TR') NULL
	- Kolon ad�: dogum_tarihi T�r�: DATE         CONSTRAINTS: NOT NULL
3-  final veritaban�na ogrenci_detay isimli tablo olusturunuz tablonun kolonlar�na dair ozellikler:
    - Kolon ad�: id               T�r�: INT          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon ad�: ogrenci_id       T�r�: INT          CONSTRAINTS: FOREIGN KEY REFERENCES ogrenci(id) 
	  ON UPDATE CASCADE ON DELETE CASCADE
	- Kolon ad�: okul             T�r�: VARCHAR(50)  CONSTRAINTS: DEFAULT ('Pazaryeri MYO') NULL 
	- Kolon ad�: bolum            T�r�: VARCHAR(30)  CONSTRAINTS: DEFAULT('Bilgisayar Programc�l���') NULL
	- Kolon ad�: sinif            T�r�: INT          CONSTRAINTS: NOT NULL
	- Kolon ad�: mezuniyet_tarihi T�r�: DATE         CONSTRAINTS: NULL
4- ogrenci ve ogrenci_detay tablosuna a�a��daki kay�tlar� en az sorgu ile ekleyiniz.
NOT: ogrenci_detay tablosuna eklenecek veri i�in �ncelikle ogrenci tablosunda kay�t olu�turulmal� ve id bilgisi
ogrenci_detay tablosundaki ogrenci_id kolonu i�in elde edilmelidir.
NOT-2: Kolonlarda de�er bulunmayan kay�tlar�n ilgili kolon de�eri bo� olacakt�r.
|ad        |soyad       |dogum_yeri |dogum_tarihi | okul        | bolum              | sinif | mezuniyet_tarihi |
|Ayta�     | Aksoy      | Van       |2000-01-04   | Bilecik MYO | �nternet ve A� Tek.| 1     | 2021-06-23       |
|Naim      | Aksoy      | Eski�ehir |2001-05-24   | Boz�y�k MYO | Web Tasar�m ve Kod.| 1     |                  |
|Ensar     | Y�lmaz     | �stanbul  |2002-06-12   | Malatya MYO | �nternet ve A� Tek.| 2     | 2021-06-23       |
|G�lnaz    | De�irmenci | Mardin    |2001-02-17   |             | Web Tasar�m ve Kod.| 2     |                  |
|Abd�laziz | K���k      | Ankara    |2000-03-10   | Ankara MYO  | Web Tasar�m ve Kod.| 2     | 2021-06-23       |
|Mesud     | Burakgazi  | Bilecik   |2003-04-08   | �zmir MYO   | �nternet ve A� Tek.| 1     |                  |
|G�lnur    | Teke       | �zmir     |2003-07-03   | Bilecik MYO | �nternet ve A� Tek.| 2     | 2021-06-23       |
|Umut      | De�irmenci | Trabzon   |2002-02-07   | Malatya MYO |                    | 1     |                  |
|Bulut     | Demirci    | A�r�      |2001-05-14   |             | �nternet ve A� Tek.| 1     |                  |
|Belinay   | De�irmenci | Rize      |2002-06-19   |             |                    | 2     | 2020-06-18       |
|Firuze    | Solak      | �anakkale |2003-03-21   | Ankara MYO  | Web Tasar�m ve Kod.| 1     |                  |
|Fadime    | Badem      | Malatya   |2000-06-09   | Malatya MYO | �nternet ve A� Tek.| 1     |                  |
|Danyal    | Teke       | Elaz��    |2002-09-18   | �zmir MYO   | �nternet ve A� Tek.| 2     |                  |
|Nadire    | Kartal     | Afyon     |2001-12-26   |             | Web Tasar�m ve Kod.| 1     |                  |
|Behiye    | De�irmenci | Tunceli   |2000-11-23   | Bilecik MYO | Web Tasar�m ve Kod.| 1     |                  |
|Mazhar    | Kat�rc�    | Sakarya   |2001-11-18   |             |                    |       |                  |
|Haydar    | Karga      | Mersin    |2001-01-12   |             |                    |       |                  |
|L�tfiye   | Ekmek�i    | K�r�ehir  |2000-10-27   |             |                    |       |                  |
|�pek      | Y�lmaz     | Kayseri   |2002-12-05   |             |                    |       |                  |
|Meral     | Kartal     | �stanbul  |2001-06-19   |             |                    |       |                  |

5- Her iki tabloda yer alan t�m kolonlar� listeleyen ve yaln�zca e�le�en INNER JOIN komutunu yaz�n�z.
6- ogrenci tablosundaki t�m kay�tlar� listelemek ko�ulu ile ogrenci_detay tablosu ile birle�tirerek, iki tablonun t�m kolonlar�n� (e�le�en veya e�le�meyen veriler) INNER listeleyiniz.
7- ogrenci tablosundaki kay�tlar� ogrenci_detay tablosu ile birle�tirerek, iki tablonun t�m kolonlar�n� (yaln�zca e�le�en veriler) listeleyiniz.
8- ogrenci tablosundaki t�m kay�tlar�  listelemek ko�ulu ile ogrenci_detay tablosu ile birle�tirerek, iki tablonun t�m kolonlar�n� (e�le�en veya e�le�meyen veriler) FULL JOIN listeleyiniz.
9- ogrenci tablosundaki dogum_yeri kolonundaki de�eri "Afyon" olan kay�tlar�n dogum_yeri kolon de�erini "Afyonkarahisar" olarak g�ncelleyiniz.
10-ogrenci_detay tablosundaki bolum kolonunda "Tek." ve "Kod." ifadeleri bulunan kay�tlar�n  bolum de�erlerini s�ras�yla "�nternet ve A� Teknolojileri" ve "Web Tasar�m ve Kodlama" olarak g�ncelleniyiniz.
11-ogrenci tablosundaki dogum_tarihi s�tunundaki de�erin par�alanarak ay, y�l ve g�n s�tunlar� ile isimleri ile listeleyiniz.
12-ogrenci tablosundaki t�m kay�tlar� (id kolonunun art�� de�erini de s�f�rlayarak) siliniz. (***)
13-ogrenci_detay tablosundaki mezuniyet_tarihi kolon de�eri NULL olan kay�tlar� siliniz.
14-ogrenci tablosunu siliniz.
15-ogrenci_detay tablosunu siliniz.
16-final veritaban�n� siliniz.
*/



/*Cevaplar*/

--1
CREATE DATABASE final

--2 [komut �al��t�r�lmadan �nce ilgili veritaban� se�ilmelidir!]

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
bolum            VARCHAR(50) DEFAULT('Bilgisayar Programc�l���') NULL,
sinif            INT NOT NULL,
mezuniyet_tarihi DATE NULL
)


--4
--I. A�ama 
INSERT ogrenci VALUES
('Ayta�','Aksoy','Van','2000-01-04'),
('Naim','Aksoy','Eski�ehir','2001-05-24'),
('Ensar','Y�lmaz','�stanbul','2002-06-12'),
('G�lnaz','De�irmenci','Mardin','2001-02-17'),
('Abd�laziz','K���k','Ankara','2000-03-10'),
('Mesud','Burakgazi','Bilecik','2003-04-08 '),
('G�lnur','Teke','�zmir','2003-07-03'),
('Umut','De�irmenci','Trabzon','2002-02-07'),
('Bulut','Demirci','A�r�','2001-05-14'),
('Belinay','De�irmenci','Rize','2002-06-19'),
('Firuze','Solak','�anakkale','2003-03-21'),
('Fadime','Badem','Malatya','2000-06-09'),
('Danyal','Teke','Elaz��','2002-09-18'),
('Nadire','Kartal','Afyon','2001-12-26'),
('Behiye','De�irmenci','Tunceli','2000-11-23'),
('Mazhar','Kat�rc�','Sakarya','2001-11-18'),
('Haydar','Karga','Mersin','2001-01-12'),
('L�tfiye','K�r�ehir','Tunceli','2000-10-27'),
('�pek','Y�lmaz','Kayseri','2002-12-05'),
('Meral','Kartal','�stanbul','2001-06-19')

--II. A�ama
--Not: ogrenci_detay kay�tlar�n� eklemek i�in ana tablodaki id verisinin bilinmesi gerekmektedir.
/*
�rnek olmas� amac�yla eklenen ilk kay�t i� i�e sorgu y�ntemi kullan�larak eklenmi�tir.
SELECT id FROM ogrenci WHERE ad='Ayta�' AND soyad='Aksoy' AND dogum_yeri='Van'
sorgusu bize detay�n� eklemek istedi�imiz kayd�n id de�erini verir. Bu sorgu ana sorgunun i�inde parantez i�erisinde 
kullan�ld���nda id de�eri yaz�lm�� gibi davranacakt�r. Sorgunun tam kullan�m� a�a��da yer almaktad�r.
*/
-- 1. kayd�n detay verisinin eklenmesi.
INSERT ogrenci_detay VALUES ((SELECT id FROM ogrenci WHERE ad='Ayta�' AND soyad='Aksoy' AND dogum_yeri='Van'),'Bilecik MYO', '�nternet ve A� Tek.',1,'2021-06-23')

--Di�er kay�tlar 
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif) VALUES(2,'Boz�y�k MYO', 'Web Tasar�m ve Kod.',1)
INSERT ogrenci_detay VALUES(3,'Malatya MYO', '�nternet ve A� Tek.',1,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,bolum,sinif) VALUES(4,'�nternet ve A� Tek.',2)
INSERT ogrenci_detay VALUES(5,'Ankara MYO', 'Web Tasar�m ve Kod.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(6,'�zmir MYO', '�nternet ve A� Tek.',1)
INSERT ogrenci_detay VALUES(7,'Bilecik MYO', '�nternet ve A� Tek.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,sinif)  VALUES(8,'Malatya MYO',1)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif)  VALUES(9,'�nternet ve A� Tek.',1)
INSERT ogrenci_detay (ogrenci_id,sinif,mezuniyet_tarihi)  VALUES(10,1,'2020-06-08')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(11,'Ankara MYO', 'Web Tasar�m ve Kod.',1),
(12,'Malatya MYO', '�nternet ve A� Tek.',1),
(13,'�zmir MYO', '�nternet ve A� Tek.',2)
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(14,'Bilecik MYO','Web Tasar�m ve Kod.',1)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif) VALUES(15,'Web Tasar�m ve Kod.',1)



--5
SELECT * FROM ogrenci INNER JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--6

SELECT * FROM ogrenci LEFT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--7
--NOT: INNER JOIN sorgusuda kullan�labilirdi. 
SELECT * FROM ogrenci RIGHT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--8
SELECT * FROM ogrenci FULL JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--9 
UPDATE ogrenci SET dogum_yeri='Afyonkarahisar' WHERE dogum_yeri='Afyon'
--10
UPDATE ogrenci_detay SET bolum='�nternet ve A� Teknolojileri' WHERE bolum LIKE '%Tek.%'
UPDATE ogrenci_detay SET bolum='Web Tasar�m ve Kodlama' WHERE bolum LIKE '%Kod.%'

--11
-- �ki komutta ayn� ��kt�y� verir.
SELECT MONTH(dogum_tarihi) ay, YEAR(dogum_tarihi) y�l, DAY(dogum_tarihi) FROM ogrenci 
SELECT DATEPART(MONTH,dogum_tarihi) ay, DATEPART(YEAR,dogum_tarihi) y�l, DATEPART(DAY,dogum_tarihi) FROM ogrenci 

--12
--NOT: �lgili tabloda bir kolon ba�ka bir tabloda FOREIGN KEY olarak ayarland��� i�in hata al�nacakt�r.
--Bu tarzda "ana tablo" stat�s�ndeki tablolarda i�lemler i�in ili�kili tablolar�na da m�dahele etmek gerekir.
TRUNCATE TABLE ogrenci

--13  ogrenci_detay tablosundaki mezuniyet_tarihi kolon de�eri NULL olan kay�tlar� siliniz.

DELETE FROM ogrenci_detay WHERE mezuniyet_tarihi IS NULL

--14 - ogrenci tablosunu siliniz.
--NOT: �lgili tabloda bir kolon ba�ka bir tabloda FOREIGN KEY olarak ayarland��� i�in hata al�nacakt�r.
--Bu tarzda "ana tablo" stat�s�ndeki tablolarda i�lemler i�in ili�kili tablolar�na da m�dahele etmek gerekir.
DROP TABLE ogrenci

--15 - ogrenci_detay tablosunu siliniz.

DROP TABLE ogrenci_detay

--16 - final veritaban�n� siliniz.
-- Veritaban� kullan�mda ise "Cannot drop database "final" because it is currently in use." hatas� al�nacakt�r.
DROP DATABASE final


--MSSQL ortam�nda silmek i�in:
--I. Y�ntem
--Management Studio ortam�ndan da veritaban� de�i�ikli�i ger�ekle�tirilebilir.
USE master;
DROP DATABASE final


--II. Y�ntem
-- Bu durum birden fazla aktif kullan�c�s� bulunan veritabanlar�n� silmek i�in kullan�l�r.
USE master;
ALTER DATABASE final SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE final;