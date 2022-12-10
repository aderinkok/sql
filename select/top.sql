-- Syntax 
SELECT TOP [N] [KOLONLAR] FROM [TABLO_ADI] 

-- Tablodan yaln�zca [N] adet kayd� getirir.
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 1

SELECT TOP 1 * FROM kullanici 
/* �rnek - 1 ��kt� 
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |

*/
-- �rnek � 2

SELECT TOP 3 * FROM kullanici 
/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Ayg�n     |  21 |
*/

