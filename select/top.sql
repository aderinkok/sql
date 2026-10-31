-- Syntax 
SELECT TOP [N] [KOLONLAR] FROM [TABLO_ADI] 

-- Tablodan yalnızca [N] adet kaydı getirir.
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT TOP 1 * FROM kullanici 
/* Örnek - 1 Çıktı 
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |

*/
-- Örnek – 2

SELECT TOP 3 * FROM kullanici 
/* Örnek - 1 Çıktı
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
*/

