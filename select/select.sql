-- Syntax for SQL Server and Azure SQL Database  

SELECT [KOLONLAR] FROM [TABLO_ADI]

-- Ogrenciler tablosu 
/*
| id | ad  | soyad  | yas |
|  1 | Ali | Yýlmaz |  19 |
|  2 | Ayþe| Demir  |  20 |
*/
-- Örnek – 1

SELECT * FROM ogrenciler

/* Örnek - 1 Çýktý
| id | ad  | soyad  | yas |
|  1 | Ali | Yýlmaz |  19 |
|  2 | Ayþe| Demir  |  20 |
*/

-- Örnek – 2

SELECT ad,soyad,yas FROM ogrenciler

/* Örnek - 2 Çýktý
| ad  | soyad  | yas |
| Ali | Yýlmaz |  19 |
| Ayþe| Demir  |  20 |
*/

-- Örnek – 3

SELECT id FROM ogrenciler

/* Örnek - 3 Çýktý
| id |
|  1 |
|  2 |
*/

-- NOT: * ifadesi tüm kolonlarý/sütunlarý kapsamaktadýr.
