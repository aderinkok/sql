-- Syntax for SQL Server and Azure SQL Database  

SELECT [KOLONLAR] FROM [TABLO_ADI]

-- Ogrenciler tablosu 
/*
| id | ad  | soyad  | yas |
|  1 | Ali | Yılmaz |  19 |
|  2 | Ayşe| Demir  |  20 |
*/
-- Örnek – 1

SELECT * FROM ogrenciler

/* Örnek - 1 Çıktı
| id | ad  | soyad  | yas |
|  1 | Ali | Yılmaz |  19 |
|  2 | Ayşe| Demir  |  20 |
*/

-- Örnek – 2

SELECT ad,soyad,yas FROM ogrenciler

/* Örnek - 2 Çıktı
| ad  | soyad  | yas |
| Ali | Yılmaz |  19 |
| Ayşe| Demir  |  20 |
*/

-- Örnek – 3

SELECT id FROM ogrenciler

/* Örnek - 3 Çıktı
| id |
|  1 |
|  2 |
*/

-- NOT: * ifadesi tüm kolonları/sütunları kapsamaktadır.
