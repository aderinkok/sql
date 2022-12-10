-- Aggregate fonksiyonlar
/* ogrenciler
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yýlmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayþe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  5 | Muhammed Yaðýz| Mutlu      |  2    | 95   | 68    |
|  5 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |
*/
-- Örnek – 1 COUNT

SELECT COUNT(*) FROM ogrenciler
SELECT COUNT(ad) FROM ogrenciler
--Örnek -1 Açýklama: Tablodaki kayýt sayýsýný dönderir. Örnek tabloda toplam 7 kayýt bulunmaktadýr. Örnek 1'de yer alan sorgularda herhangi bir koþul belirtilmediðinden COUNT fonksiyonunun içine hangi deðer girilirse girilsin ayný sonucu verecektir.
/* Örnek - 1 Çýktý 
(No Column Name)
7


*/
-- Örnek – 2 SUM

SELECT SUM(vize) FROM ogrenciler 
--Örnek - 2 Açýklama: Tablodaki vize sütununda yer alan tüm kayýtlarý toplar ve sonucu ekrana yazdýrýr. Ýlgili tablodaki vize sütununda yer alan kayýtlarýn toplamý 520'dir.
/* Örnek - 2 Çýktý
(No Column Name)
520
*/
-- Örnek – 3 MIN

SELECT MIN(vize) FROM ogrenciler 
--Örnek - 3 Açýklama: Tablodaki vize sütununda yer alan tüm kayýtlarý karþýlaþtýrýr ve en düþük olan deðeri yazdýrýr. Ýlgili tablodaki en düþük vize deðeri 30'dur.
/* Örnek - 3 Çýktý
(No Column Name)
30
*/
-- Örnek – 4 MAX

SELECT MAX(final) FROM ogrenciler 
--Örnek - 4 Açýklama: Tablodaki final sütununda yer alan tüm kayýtlarý karþýlaþtýrýr ve en yüksek olan deðeri yazdýrýr. Ýlgili tablodaki en yüksek final deðeri 100'dür.
/* Örnek - 4 Çýktý
(No Column Name)
100
*/

-- Örnek – 5 AVG

SELECT AVG(final) FROM ogrenciler 
--Örnek - 5 Açýklama: Tablodaki final sütununda yer alan tüm kayýtlarý toplar ve satýr sayýsýna böler yani aritmetik ortalamasýný alýr. Ýlgili tablodaki final kolonunda yer alan deðerlerin ortalamasý deðeri 75'tir.
-- 75,xx þeklinde bir sonuç olmasýna raðmen elde edilen ifade tam sayý olarak ekrana yazdýrýlmýþtýr.
/* Örnek - 5 Çýktý
(No Column Name)
75
*/

-- Syntax  GROUP BY
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] 
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] HAVING  AGGREGATE_FONKSIYON([KOLON]) [OPERATOR] [KOSUL]

-- AGGREGATE_FONKSIYON alanýna SUM,MIN,MAX,AVG,COUNT ifadeleri getirilebilir.
-- [KOLON_X] ifadesi gruplandýrýlacak kolon manasýna gelmektedir.
-- HAVING ifadesinde yer alan [OPERATOR] <,>,=,<>,<=,>= ifadelerinde biri olabilir.
-- Örnek HAVING COUNT(*) < 5 
-- Eðer sorguda WHERE ifadesi kullanýlacaksa GROUP BY ifadesinden önce yazýlmalýdýr.


--Örnek 6 
SELECT sinif,COUNT(*) FROM ogrenciler GROUP BY sinif

--Örnek -6 Açýklama: sinif kolonuna göre gruplandýrma iþlemi bulunmaktadýr. sýnýf kolonu 1 deðerinde olan 2 kayýt ve sýnýf kolonu 2 deðerinde olan 5 kayýt bulunmaktadýr. 
/*Örnek - 6 Çýktý

 | sinif |(No Column Name)|
 |    1  |        2       |
 |    2  |        5       |

*/

--Örnek 6 
SELECT sinif,AVG(vize) FROM ogrenciler GROUP BY sinif HAVING AVG(vize) > 50

--Örnek -6 Açýklama: sinif kolonuna göre gruplandýrma iþlemi bulunmaktadýr. Sýnýf kolonu ayný olan kayýtlarýn vize notlarýnýn aritmetik ortalamasý alýnýr ve having ifadesinde de ortalama deðeri 50'den büyük olan sýnýflar gösterilir.
-- sýnýf deðeri 1 olan kayýtlarýn vize ortalamasý 47 olduðu için þarta uygunluk taþýmaz bu nedenle de listelenmez.
-- sýnýf deðeri 2 olan kayýtlarýn vize ortalamasý ise 85'tir ve þarta uygunluk saðladýðý için listelenir.
/*Örnek - 6 Çýktý

 | sinif |(No Column Name)|
 |    2  |        85       |

*/