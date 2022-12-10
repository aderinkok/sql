-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] DESC, [KOLON2] ASC
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] ASC

-- ORDER BY ifadesinden sonra yer alan [KOLON_ADI] s�tunu referans al�narak s�ralama ger�ekle�tirilir.
-- ORDER BY [KOLON_ADI] �eklinde kullan�l�rsa varsay�lan olarak ASC (Ascending - Artan) olarak s�ralar.
-- ORDER BY [KOLON_ADI] DESC (Descending - Azalan) �eklinde kullan�l�rsa ilgili kolonun de�erini en y�ksekten en d����e do�ru s�ralar.
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 1

SELECT * FROM kullanici ORDER BY yas
SELECT * FROM kullanici ORDER BY yas ASC
/* �rnek - 1 ��kt� 
| id | ad        | soyad     | yas |
|  2 | Ahmet     | Mutlu     |  18 |
|  1 | Ali       | Y�lmaz    |  19 |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 2

SELECT * FROM kullanici ORDER BY yas DESC
/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  5 | Abdulmelik| Derink�k  |  40 |
|  4 | Ay�e      | Demir     |  25 |
|  3 | Sare      | Ayg�n     |  21 |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
*/


