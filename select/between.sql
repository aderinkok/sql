-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOLON_ADI] BETWEEN [ALT_LIMIT] AND [UST_LIMIT]

-- BETWEEN ifadesinde belirtilen alt ve üst limit değerleri de dahil edilerek filtreleme gerçekleştirilir.
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

SELECT * FROM kullanici WHERE yas BETWEEN 20 AND 40

/* Örnek - 1 Çıktı
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayşe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/


