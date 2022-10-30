-- Syntax for SQL Server and Azure SQL Database  

SELECT [KOLONLAR] FROM [TABLO_ADI]

-- Ogrenciler tablosu 
/*
| id | ad  | soyad  | yas |
|  1 | Ali | Y�lmaz |  19 |
|  2 | Ay�e| Demir  |  20 |
*/
-- �rnek � 1

SELECT * FROM ogrenciler

/* �rnek - 1 ��kt�
| id | ad  | soyad  | yas |
|  1 | Ali | Y�lmaz |  19 |
|  2 | Ay�e| Demir  |  20 |
*/

-- �rnek � 2

SELECT ad,soyad,yas FROM ogrenciler

/* �rnek - 2 ��kt�
| ad  | soyad  | yas |
| Ali | Y�lmaz |  19 |
| Ay�e| Demir  |  20 |
*/

-- �rnek � 3

SELECT id FROM ogrenciler

/* �rnek - 3 ��kt�
| id |
|  1 |
|  2 |
*/

-- NOT: * ifadesi t�m kolonlar�/s�tunlar� kapsamaktad�r.
