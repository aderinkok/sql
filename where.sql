-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOÞUL]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOÞUL] AND [KOÞUL2]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOÞUL] OR [KOÞUL2]

-- Birden fazla koþul belirtmek için "AND" ya da "OR" kullanýlýr.
-- WHERE ifadesi ile istenildiði kadar koþul belirtilebilir.
-- AND kullanýmýnda belirtilen koþullarýn tümünü saðlayan kayýtlar getirilir.
-- OR kullanýmýnda koþullardan herhangi birini saðlayan tüm kayýtlar getirilir.

-- kullanici tablosu 
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayþe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT * FROM kullanici WHERE ad='Sare'

/* Örnek - 1 Çýktý
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
*/

-- Örnek – 2

SELECT * FROM kullanici WHERE yas>20

/* Örnek - 2 Çýktý
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayþe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/

-- Örnek – 3

SELECT * FROM kullanici WHERE id=1

/* Örnek - 3 Çýktý
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
*/

--Örnek -4
SELECT * FROM kullanici WHERE id=1 AND yas=20

/* Örnek - 4 Çýktý
| id | ad        | soyad     | yas |
--ÞARTLARA UYGUN KAYIT OLMADIÐINDAN BOÞ DÖNDÜRÜR--
*/

--Örnek -5
SELECT * FROM kullanici WHERE id=1 OR yas=40

/* Örnek - 5 Çýktý
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/

