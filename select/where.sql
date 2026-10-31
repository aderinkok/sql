-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOŞUL]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOŞUL] AND [KOŞUL2]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOŞUL] OR [KOŞUL2]

-- Birden fazla koşul belirtmek için "AND" ya da "OR" kullanılır.
-- WHERE ifadesi ile istenildiği kadar koşul belirtilebilir.
-- AND kullanımında belirtilen koşulların tümünü sağlayan kayıtlar getirilir.
-- OR kullanımında koşullardan herhangi birini sağlayan tüm kayıtlar getirilir.

-- kullanici tablosu 
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT * FROM kullanici WHERE ad='Sare'

/* Örnek - 1 Çıktı
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
*/

-- Örnek – 2

SELECT * FROM kullanici WHERE yas>20

/* Örnek - 2 Çıktı
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/

-- Örnek – 3

SELECT * FROM kullanici WHERE id=1

/* Örnek - 3 Çıktı
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
*/

--Örnek -4
SELECT * FROM kullanici WHERE id=1 AND yas=20

/* Örnek - 4 Çıktı
| id | ad        | soyad     | yas |
--ŞARTLARA UYGUN KAYIT OLMADIĞINDAN BOŞ DÖNDÜRÜR--
*/

--Örnek -5
SELECT * FROM kullanici WHERE id=1 OR yas=40

/* Örnek - 5 Çıktı
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/

