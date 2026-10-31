-- Aggregate fonksiyonlar
/* ogrenciler
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  5 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  5 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |
*/
-- Örnek – 1 COUNT

SELECT COUNT(*) FROM ogrenciler
SELECT COUNT(ad) FROM ogrenciler
--Örnek -1 Açıklama: Tablodaki kayıt sayısını dönderir. Örnek tabloda toplam 7 kayıt bulunmaktadır. Örnek 1'de yer alan sorgularda herhangi bir koşul belirtilmediğinden COUNT fonksiyonunun içine hangi değer girilirse girilsin aynı sonucu verecektir.
/* Örnek - 1 Çıktı 
(No Column Name)
7


*/
-- Örnek – 2 SUM

SELECT SUM(vize) FROM ogrenciler 
--Örnek - 2 Açıklama: Tablodaki vize sütununda yer alan tüm kayıtları toplar ve sonucu ekrana yazdırır. İlgili tablodaki vize sütununda yer alan kayıtların toplamı 520'dir.
/* Örnek - 2 Çıktı
(No Column Name)
520
*/
-- Örnek – 3 MIN

SELECT MIN(vize) FROM ogrenciler 
--Örnek - 3 Açıklama: Tablodaki vize sütununda yer alan tüm kayıtları karşılaştırır ve en düşük olan değeri yazdırır. İlgili tablodaki en düşük vize değeri 30'dur.
/* Örnek - 3 Çıktı
(No Column Name)
30
*/
-- Örnek – 4 MAX

SELECT MAX(final) FROM ogrenciler 
--Örnek - 4 Açıklama: Tablodaki final sütununda yer alan tüm kayıtları karşılaştırır ve en yüksek olan değeri yazdırır. İlgili tablodaki en yüksek final değeri 100'dür.
/* Örnek - 4 Çıktı
(No Column Name)
100
*/

-- Örnek – 5 AVG

SELECT AVG(final) FROM ogrenciler 
--Örnek - 5 Açıklama: Tablodaki final sütununda yer alan tüm kayıtları toplar ve satır sayısına böler yani aritmetik ortalamasını alır. İlgili tablodaki final kolonunda yer alan değerlerin ortalaması değeri 75'tir.
-- 75,xx şeklinde bir sonuç olmasına rağmen elde edilen ifade tam sayı olarak ekrana yazdırılmıştır.
/* Örnek - 5 Çıktı
(No Column Name)
75
*/

-- Syntax  GROUP BY
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] 
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] HAVING  AGGREGATE_FONKSIYON([KOLON]) [OPERATOR] [KOSUL]

-- AGGREGATE_FONKSIYON alanına SUM,MIN,MAX,AVG,COUNT ifadeleri getirilebilir.
-- [KOLON_X] ifadesi gruplandırılacak kolon manasına gelmektedir.
-- HAVING ifadesinde yer alan [OPERATOR] <,>,=,<>,<=,>= ifadelerinde biri olabilir.
-- Örnek HAVING COUNT(*) < 5 
-- Eğer sorguda WHERE ifadesi kullanılacaksa GROUP BY ifadesinden önce yazılmalıdır.


--Örnek 6 
SELECT sinif,COUNT(*) FROM ogrenciler GROUP BY sinif

--Örnek -6 Açıklama: sinif kolonuna göre gruplandırma işlemi bulunmaktadır. sınıf kolonu 1 değerinde olan 2 kayıt ve sınıf kolonu 2 değerinde olan 5 kayıt bulunmaktadır. 
/*Örnek - 6 Çıktı

 | sinif |(No Column Name)|
 |    1  |        2       |
 |    2  |        5       |

*/

--Örnek 6 
SELECT sinif,AVG(vize) FROM ogrenciler GROUP BY sinif HAVING AVG(vize) > 50

--Örnek -6 Açıklama: sinif kolonuna göre gruplandırma işlemi bulunmaktadır. Sınıf kolonu aynı olan kayıtların vize notlarının aritmetik ortalaması alınır ve having ifadesinde de ortalama değeri 50'den büyük olan sınıflar gösterilir.
-- sınıf değeri 1 olan kayıtların vize ortalaması 47 olduğu için şarta uygunluk taşımaz bu nedenle de listelenmez.
-- sınıf değeri 2 olan kayıtların vize ortalaması ise 85'tir ve şarta uygunluk sağladığı için listelenir.
/*Örnek - 6 Çıktı

 | sinif |(No Column Name)|
 |    2  |        85       |

*/