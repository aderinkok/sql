-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] 
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] DESC, [KOLON2] ASC
SELECT [KOLONLAR] FROM [TABLO_ADI] ORDER BY [KOLON_ADI] ASC

-- ORDER BY ifadesinden sonra yer alan [KOLON_ADI] sütunu referans alınarak sıralama gerçekleştirilir.
-- ORDER BY [KOLON_ADI] şeklinde kullanılırsa varsayılan olarak ASC (Ascending - Artan) olarak sıralar.
-- ORDER BY [KOLON_ADI] DESC (Descending - Azalan) şeklinde kullanılırsa ilgili kolonun değerini en yüksekten en düşüğe doğru sıralar.
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yılmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT * FROM kullanici ORDER BY yas
SELECT * FROM kullanici ORDER BY yas ASC
/* Örnek - 1 Çıktı 
| id | ad        | soyad     | yas |
|  2 | Ahmet     | Mutlu     |  18 |
|  1 | Ali       | Yılmaz    |  19 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 2

SELECT * FROM kullanici ORDER BY yas DESC
/* Örnek - 1 Çıktı
| id | ad        | soyad     | yas |
|  5 | Abdulmelik| Derinkök  |  40 |
|  4 | Ayşe      | Demir     |  25 |
|  3 | Sare      | Aygün     |  21 |
|  1 | Ali       | Yılmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
*/


