-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KO�UL]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KO�UL] AND [KO�UL2]
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KO�UL] OR [KO�UL2]

-- Birden fazla ko�ul belirtmek i�in "AND" ya da "OR" kullan�l�r.
-- WHERE ifadesi ile istenildi�i kadar ko�ul belirtilebilir.
-- AND kullan�m�nda belirtilen ko�ullar�n t�m�n� sa�layan kay�tlar getirilir.
-- OR kullan�m�nda ko�ullardan herhangi birini sa�layan t�m kay�tlar getirilir.

-- kullanici tablosu 
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 1

SELECT * FROM kullanici WHERE ad='Sare'

/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  3 | Sare      | Ayg�n     |  21 |
*/

-- �rnek � 2

SELECT * FROM kullanici WHERE yas>20

/* �rnek - 2 ��kt�
| id | ad        | soyad     | yas |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/

-- �rnek � 3

SELECT * FROM kullanici WHERE id=1

/* �rnek - 3 ��kt�
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
*/

--�rnek -4
SELECT * FROM kullanici WHERE id=1 AND yas=20

/* �rnek - 4 ��kt�
| id | ad        | soyad     | yas |
--�ARTLARA UYGUN KAYIT OLMADI�INDAN BO� D�ND�R�R--
*/

--�rnek -5
SELECT * FROM kullanici WHERE id=1 OR yas=40

/* �rnek - 5 ��kt�
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/

