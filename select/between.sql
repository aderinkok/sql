-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOLON_ADI] BETWEEN [ALT_LIMIT] AND [UST_LIMIT]

-- BETWEEN ifadesinde belirtilen alt ve �st limit de�erleri de dahil edilerek filtreleme ger�ekle�tirilir.
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

SELECT * FROM kullanici WHERE yas BETWEEN 20 AND 40

/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/


