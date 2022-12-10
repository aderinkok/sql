-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] DESC, [KOLON2] ASC
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] ASC

-- ORDER BY ifadesinden sonra yer alan [KOLON_ADI] sütunu referans alýnarak sýralama gerçekleþtirilir.
-- ORDER BY [KOLON_ADI] þeklinde kullanýlýrsa varsayýlan olarak ASC (Ascending - Artan) olarak sýralar.
-- ORDER BY [KOLON_ADI] DESC (Descending - Azalan) þeklinde kullanýlýrsa ilgili kolonun deðerini en yüksekten en düþüðe doðru sýralar.
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayþe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT * FROM kullanici ORDER BY yas
SELECT * FROM kullanici ORDER BY yas ASC
/* Örnek - 1 Çýktý 
| id | ad        | soyad     | yas |
|  2 | Ahmet     | Mutlu     |  18 |
|  1 | Ali       | Yýlmaz    |  19 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayþe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 2

SELECT * FROM kullanici ORDER BY yas DESC
/* Örnek - 1 Çýktý
| id | ad        | soyad     | yas |
|  5 | Abdulmelik| Derinkök  |  40 |
|  4 | Ayþe      | Demir     |  25 |
|  3 | Sare      | Aygün     |  21 |
|  1 | Ali       | Yýlmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
*/


