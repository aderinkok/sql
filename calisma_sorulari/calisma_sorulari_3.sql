/*

Çalışma Soruları - 3 
Aşağıdaki ifadelerde kullanılacak veritabanı farklılık gösterebilir:
1-  final isimli veritabanı oluşturunuz.
	### aşağıda yer alan ifadeleri final veritabanında gerçekleştiriniz ###
2-  final veritabanına ogrenci isimli tablo olusturunuz tablonun kolonlarına dair ozellikler:
    - Kolon adı: id           Türü: int          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon adı: ad           Türü: VARCHAR(50)  CONSTRAINTS: NOT NULL
	- Kolon adı: soyad        Türü: VARCHAR(50)  CONSTRAINTS: NOT NULL 
	- Kolon adı: dogum_yeri   Türü: VARCHAR(30)  CONSTRAINTS: DEFAULT('TR') NULL
	- Kolon adı: dogum_tarihi Türü: DATE         CONSTRAINTS: NOT NULL
3-  final veritabanına ogrenci_detay isimli tablo olusturunuz tablonun kolonlarına dair ozellikler:
    - Kolon adı: id               Türü: INT          CONSTRAINTS: PRIMARY, IDENTITY(1,1)
	- Kolon adı: ogrenci_id       Türü: INT          CONSTRAINTS: FOREIGN KEY REFERENCES ogrenci(id) 
	  ON UPDATE CASCADE ON DELETE CASCADE
	- Kolon adı: okul             Türü: VARCHAR(50)  CONSTRAINTS: DEFAULT ('Pazaryeri MYO') NULL 
	- Kolon adı: bolum            Türü: VARCHAR(30)  CONSTRAINTS: DEFAULT('Bilgisayar Programcılığı') NULL
	- Kolon adı: sinif            Türü: INT          CONSTRAINTS: NOT NULL
	- Kolon adı: mezuniyet_tarihi Türü: DATE         CONSTRAINTS: NULL
4- ogrenci ve ogrenci_detay tablosuna aşağıdaki kayıtları en az sorgu ile ekleyiniz.
NOT: ogrenci_detay tablosuna eklenecek veri için öncelikle ogrenci tablosunda kayıt oluşturulmalı ve id bilgisi
ogrenci_detay tablosundaki ogrenci_id kolonu için elde edilmelidir.
NOT-2: Tabloda boş bırakılan hücreler için değer girilmeyecektir. Bu durumda varsayılan değeri (DEFAULT) tanımlı olan kolonlara
varsayılan değer, diğer kolonlara NULL atanır.
|ad        |soyad       |dogum_yeri |dogum_tarihi | okul        | bolum              | sinif | mezuniyet_tarihi |
|Aytaç     | Aksoy      | Van       |2000-01-04   | Bilecik MYO | İnternet ve Ağ Tek.| 1     | 2021-06-23       |
|Naim      | Aksoy      | Eskişehir |2001-05-24   | Bozüyük MYO | Web Tasarım ve Kod.| 1     |                  |
|Ensar     | Yılmaz     | İstanbul  |2002-06-12   | Malatya MYO | İnternet ve Ağ Tek.| 2     | 2021-06-23       |
|Gülnaz    | Değirmenci | Mardin    |2001-02-17   |             | Web Tasarım ve Kod.| 2     |                  |
|Abdülaziz | Küçük      | Ankara    |2000-03-10   | Ankara MYO  | Web Tasarım ve Kod.| 2     | 2021-06-23       |
|Mesud     | Burakgazi  | Bilecik   |2003-04-08   | İzmir MYO   | İnternet ve Ağ Tek.| 1     |                  |
|Gülnur    | Teke       | İzmir     |2003-07-03   | Bilecik MYO | İnternet ve Ağ Tek.| 2     | 2021-06-23       |
|Umut      | Değirmenci | Trabzon   |2002-02-07   | Malatya MYO |                    | 1     |                  |
|Bulut     | Demirci    | Ağrı      |2001-05-14   |             | İnternet ve Ağ Tek.| 1     |                  |
|Belinay   | Değirmenci | Rize      |2002-06-19   |             |                    | 2     | 2020-06-18       |
|Firuze    | Solak      | Çanakkale |2003-03-21   | Ankara MYO  | Web Tasarım ve Kod.| 1     |                  |
|Fadime    | Badem      | Malatya   |2000-06-09   | Malatya MYO | İnternet ve Ağ Tek.| 1     |                  |
|Danyal    | Teke       | Elazığ    |2002-09-18   | İzmir MYO   | İnternet ve Ağ Tek.| 2     |                  |
|Nadire    | Kartal     | Afyon     |2001-12-26   |             | Web Tasarım ve Kod.| 1     |                  |
|Behiye    | Değirmenci | Tunceli   |2000-11-23   | Bilecik MYO | Web Tasarım ve Kod.| 1     |                  |
|Mazhar    | Katırcı    | Sakarya   |2001-11-18   |             |                    |       |                  |
|Haydar    | Karga      | Mersin    |2001-01-12   |             |                    |       |                  |
|Lütfiye   | Ekmekçi    | Kırşehir  |2000-10-27   |             |                    |       |                  |
|İpek      | Yılmaz     | Kayseri   |2002-12-05   |             |                    |       |                  |
|Meral     | Kartal     | İstanbul  |2001-06-19   |             |                    |       |                  |

5- Her iki tabloda yer alan tüm kolonları listeleyen ve yalnızca eşleşen INNER JOIN komutunu yazınız.
6- ogrenci tablosundaki tüm kayıtları listelemek koşulu ile ogrenci_detay tablosu ile birleştirerek, iki tablonun tüm kolonlarını (eşleşen veya eşleşmeyen veriler) LEFT JOIN ile listeleyiniz.
7- ogrenci tablosundaki kayıtları ogrenci_detay tablosu ile birleştirerek, iki tablonun tüm kolonlarını (yalnızca eşleşen veriler) listeleyiniz.
8- ogrenci tablosundaki tüm kayıtları  listelemek koşulu ile ogrenci_detay tablosu ile birleştirerek, iki tablonun tüm kolonlarını (eşleşen veya eşleşmeyen veriler) FULL JOIN listeleyiniz.
9- ogrenci tablosundaki dogum_yeri kolonundaki değeri "Afyon" olan kayıtların dogum_yeri kolon değerini "Afyonkarahisar" olarak güncelleyiniz.
10-ogrenci_detay tablosundaki bolum kolonunda "Tek." ve "Kod." ifadeleri bulunan kayıtların  bolum değerlerini sırasıyla "İnternet ve Ağ Teknolojileri" ve "Web Tasarım ve Kodlama" olarak güncelleyiniz.
11-ogrenci tablosundaki dogum_tarihi sütunundaki değerin parçalanarak ay, yıl ve gün sütunları ile isimleri ile listeleyiniz.
12-ogrenci tablosundaki tüm kayıtları (id kolonunun artış değerini de sıfırlayarak) siliniz. (***)
13-ogrenci_detay tablosundaki mezuniyet_tarihi kolon değeri NULL olan kayıtları siliniz.
14-ogrenci tablosunu siliniz.
15-ogrenci_detay tablosunu siliniz.
16-final veritabanını siliniz.
*/



/*Cevaplar*/

--1
CREATE DATABASE final
--NOT: Sunucunun varsayılan dil ayarı Türkçe değilse VARCHAR kolonlarda Türkçe karakterler (ş, ğ, ı, İ) "?" olarak saklanabilir.
--Bu durumda veritabanı Türkçe karşılaştırma kuralları ile oluşturulabilir:
--CREATE DATABASE final COLLATE Turkish_CI_AS

--2 [komut çalıştırılmadan önce ilgili veritabanı seçilmelidir!]

use final;
CREATE TABLE ogrenci
(
id               INT          PRIMARY KEY IDENTITY(1,1),
ad               VARCHAR(50)  NOT NULL,
soyad            VARCHAR(50)  NOT NULL,
dogum_yeri       VARCHAR(30)  DEFAULT('TR') NULL,
dogum_tarihi     DATE         NOT NULL,
)
--NOT: IDENTITY(1,1) değerin 1'den başlayıp her kayıtta 1 artmasını sağlar. DEFAULT, değer verilmeyen kolona atanacak varsayılan değeri belirler.

--3 
CREATE table ogrenci_detay
(
id               INT PRIMARY KEY IDENTITY(1,1),
ogrenci_id       INT FOREIGN KEY REFERENCES ogrenci(id) ON UPDATE CASCADE ON DELETE CASCADE,
okul             VARCHAR(50) DEFAULT('Pazaryeri MYO') NULL,
bolum            VARCHAR(30) DEFAULT('Bilgisayar Programcılığı') NULL,
sinif            INT NOT NULL,
mezuniyet_tarihi DATE NULL
)
--NOT: FOREIGN KEY, ogrenci_id kolonunun yalnızca ogrenci tablosunda bulunan id değerlerini almasını sağlar.
--ON DELETE CASCADE ana kayıt silindiğinde ilişkili kayıtların da silinmesini, ON UPDATE CASCADE ise id değişikliğinin ilişkili kayıtlara yansımasını sağlar.


--4
--I. Aşama 
INSERT ogrenci VALUES
('Aytaç','Aksoy','Van','2000-01-04'),
('Naim','Aksoy','Eskişehir','2001-05-24'),
('Ensar','Yılmaz','İstanbul','2002-06-12'),
('Gülnaz','Değirmenci','Mardin','2001-02-17'),
('Abdülaziz','Küçük','Ankara','2000-03-10'),
('Mesud','Burakgazi','Bilecik','2003-04-08'),
('Gülnur','Teke','İzmir','2003-07-03'),
('Umut','Değirmenci','Trabzon','2002-02-07'),
('Bulut','Demirci','Ağrı','2001-05-14'),
('Belinay','Değirmenci','Rize','2002-06-19'),
('Firuze','Solak','Çanakkale','2003-03-21'),
('Fadime','Badem','Malatya','2000-06-09'),
('Danyal','Teke','Elazığ','2002-09-18'),
('Nadire','Kartal','Afyon','2001-12-26'),
('Behiye','Değirmenci','Tunceli','2000-11-23'),
('Mazhar','Katırcı','Sakarya','2001-11-18'),
('Haydar','Karga','Mersin','2001-01-12'),
('Lütfiye','Ekmekçi','Kırşehir','2000-10-27'),
('İpek','Yılmaz','Kayseri','2002-12-05'),
('Meral','Kartal','İstanbul','2001-06-19')

--II. Aşama
--Not: ogrenci_detay kayıtlarını eklemek için ana tablodaki id verisinin bilinmesi gerekmektedir.
/*
Örnek olması amacıyla eklenen ilk kayıt iç içe sorgu yöntemi kullanılarak eklenmiştir.
SELECT id FROM ogrenci WHERE ad='Aytaç' AND soyad='Aksoy' AND dogum_yeri='Van'
sorgusu bize detayını eklemek istediğimiz kaydın id değerini verir. Bu sorgu ana sorgunun içinde parantez içerisinde 
kullanıldığında id değeri yazılmış gibi davranacaktır. Sorgunun tam kullanımı aşağıda yer almaktadır.
*/
-- 1. kaydın detay verisinin eklenmesi.
INSERT ogrenci_detay VALUES ((SELECT id FROM ogrenci WHERE ad='Aytaç' AND soyad='Aksoy' AND dogum_yeri='Van'),'Bilecik MYO', 'İnternet ve Ağ Tek.',1,'2021-06-23')

--Diğer kayıtlar 
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif) VALUES(2,'Bozüyük MYO', 'Web Tasarım ve Kod.',1)
INSERT ogrenci_detay VALUES(3,'Malatya MYO', 'İnternet ve Ağ Tek.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,bolum,sinif) VALUES(4,'Web Tasarım ve Kod.',2)
INSERT ogrenci_detay VALUES(5,'Ankara MYO', 'Web Tasarım ve Kod.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(6,'İzmir MYO', 'İnternet ve Ağ Tek.',1)
INSERT ogrenci_detay VALUES(7,'Bilecik MYO', 'İnternet ve Ağ Tek.',2,'2021-06-23')
INSERT ogrenci_detay (ogrenci_id,okul,sinif)  VALUES(8,'Malatya MYO',1)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif)  VALUES(9,'İnternet ve Ağ Tek.',1)
INSERT ogrenci_detay (ogrenci_id,sinif,mezuniyet_tarihi)  VALUES(10,2,'2020-06-18')
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif)  VALUES(11,'Ankara MYO', 'Web Tasarım ve Kod.',1),
(12,'Malatya MYO', 'İnternet ve Ağ Tek.',1),
(13,'İzmir MYO', 'İnternet ve Ağ Tek.',2)
INSERT ogrenci_detay (ogrenci_id,bolum,sinif)  VALUES(14,'Web Tasarım ve Kod.',1)
INSERT ogrenci_detay (ogrenci_id,okul,bolum,sinif) VALUES(15,'Bilecik MYO','Web Tasarım ve Kod.',1)



--5
SELECT * FROM ogrenci INNER JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id  --Detay kaydı olmayan öğrenciler listelenmez.

--6

SELECT * FROM ogrenci LEFT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id  --Detay kaydı olmayan öğrencilerde ogrenci_detay kolonları NULL olur.

--7
--NOT: INNER JOIN sorgusu da kullanılabilirdi. Her detay kaydının bir öğrencisi olduğundan (FOREIGN KEY) iki sorgu aynı çıktıyı verir.
SELECT * FROM ogrenci RIGHT JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id

--8
SELECT * FROM ogrenci FULL JOIN ogrenci_detay ON ogrenci.id=ogrenci_detay.ogrenci_id
--NOT: Her detay kaydının bir öğrencisi olduğundan bu örnekte FULL JOIN ile LEFT JOIN aynı çıktıyı verir.

--9 
UPDATE ogrenci SET dogum_yeri='Afyonkarahisar' WHERE dogum_yeri='Afyon'  --WHERE koşulu yazılmazsa tüm kayıtların dogum_yeri değeri güncellenir.
--10
UPDATE ogrenci_detay SET bolum='İnternet ve Ağ Teknolojileri' WHERE bolum LIKE '%Tek.%'
UPDATE ogrenci_detay SET bolum='Web Tasarım ve Kodlama' WHERE bolum LIKE '%Kod.%'
--NOT: '%Tek.%' deseni değerin herhangi bir yerinde "Tek." ifadesi geçen kayıtları bulur.

--11
-- İki komutta aynı çıktıyı verir.
SELECT MONTH(dogum_tarihi) ay, YEAR(dogum_tarihi) yıl, DAY(dogum_tarihi) gün FROM ogrenci
SELECT DATEPART(MONTH,dogum_tarihi) ay, DATEPART(YEAR,dogum_tarihi) yıl, DATEPART(DAY,dogum_tarihi) gün FROM ogrenci

--12
--NOT: İlgili tabloda bir kolon başka bir tabloda FOREIGN KEY olarak ayarlandığı için hata alınacaktır.
--Bu tarzda "ana tablo" statüsündeki tablolarda işlemler için ilişkili tablolarına da müdahale etmek gerekir.
TRUNCATE TABLE ogrenci
--NOT: TRUNCATE tüm kayıtları siler ve IDENTITY değerini başlangıç değerine döndürür. DELETE ise IDENTITY değerini sıfırlamaz.

--13  ogrenci_detay tablosundaki mezuniyet_tarihi kolon değeri NULL olan kayıtları siliniz.

DELETE FROM ogrenci_detay WHERE mezuniyet_tarihi IS NULL  --NULL kontrolü IS NULL ile yapılır.

--14 - ogrenci tablosunu siliniz.
--NOT: İlgili tabloda bir kolon başka bir tabloda FOREIGN KEY olarak ayarlandığı için hata alınacaktır.
--Bu tarzda "ana tablo" statüsündeki tablolarda işlemler için ilişkili tablolarına da müdahale etmek gerekir.
DROP TABLE ogrenci

--15 - ogrenci_detay tablosunu siliniz.

DROP TABLE ogrenci_detay
--NOT: DROP TABLE tablonun yapısını ve verilerini tamamen siler. ogrenci_detay silindikten sonra ogrenci tablosu da silinebilir.

--16 - final veritabanını siliniz.
-- Veritabanı kullanımda ise "Cannot drop database "final" because it is currently in use." hatası alınacaktır.
DROP DATABASE final


--MSSQL ortamında silmek için:
--I. Yöntem
--Management Studio ortamından da veritabanı değişikliği gerçekleştirilebilir.
USE master;
DROP DATABASE final


--II. Yöntem
-- Bu durum birden fazla aktif kullanıcısı bulunan veritabanlarını silmek için kullanılır.
USE master;
ALTER DATABASE final SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE final;