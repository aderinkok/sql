--syntax

--INNER JOIN
SELECT * FROM [TABLO_1] INNER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] LEFT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] RIGHT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] FULL OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] CROSS JOIN [TABLO_2]
-- Tablo isimlerine alias (takma ad) ataması yapılabilir. Ör: SELECT * FROM [TABLO_1] t1 INNER...
-- * ifadesi iki tablodaki tüm kolonları çeker. Belirli kolonların gelmesi isteniyorsa [TABLO_ADI].[KOLON_ADI] yapısı ile belirtilmelidir.
-- OUTER ifadesinin kullanımı opsiyoneldir.
/*
tablo1: ogrenci
|id  |ad             |soyad       |bolum|dogum_yeri |
|  1 | Ali           | Yılmaz     |  1  | Sivas     |
|  2 | Ahmet         | Mutlu      |  3  | Bilecik   |
|  3 | Asel Sare     | Aygün      |  2  | Bursa     |
|  4 | Ayşe          | Demir      |  1  | Bursa     |
|  5 | Abdulmelik    | Derinkök   |  1  | Balıkesir |
|  6 | Muhammed Yağız| Mutlu      |  4  | Eskişehir |
|  7 | Elif Eylül    | Mutlu      |  3  | Elazığ    |
| 8  | Orhan         | Veli       | NULL| Malatya   |
tablo2: program
| id |ad             |
|  1 | Bilgisayar    |
|  2 | Elektronik    |
|  3 | İşletme       |
|  4 | Muhasebe      |


-- tablo1 ve tablo2 arasında ilişkili kolonlar tablo2.id = tablo1.bolum şeklindedir.

*/

--Örnek - 1 (INNER JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenciler o INNER JOIN program p ON o.bolum=p.id
-- id=8 olan kaydın bolum alanı NULL olduğu için bu sorguda listelenmez.
/*Örnek - 1 Çıktı
 |ad             |soyad       |ad           |
 | Ali           | Yılmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  İşletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayşe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yağız| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  İşletme    |
 */

 --Örnek - 2 (LEFT JOIN)
 --1
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT JOIN program p ON o.bolum=p.id 
--2
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT OUTER JOIN program p ON o.bolum=p.id
-- iki kodda aynı çıktıyı verir.
/*Örnek - 2 Çıktı
 |ad             |soyad       |ad           |
 | Ali           | Yılmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  İşletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayşe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yağız| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  İşletme    |
 | Orhan         | Veli       |  NULL       |

 */

  --Örnek - 3 (RIGHT JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT JOIN program p ON o.bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT OUTER JOIN program p ON o.bolum=p.id
/*Örnek - 3 Çıktı
 |ad            |   soyad    |ad           |
 |Ali           |   Yılmaz   |	Bilgisayar |
 |Ayşe          |   Demir    |	Bilgisayar |
 |Abdulmelik    |	Derinkök |  Bilgisayar |
 |Asel Sare     |	Aygün	 |  Elektronik |
 |Ahmet	        |   Mutlu    |  İşletme    |
 |Elif Eylül    |	Mutlu	 |  İşletme    |
 |Muhammed Yağız|	Mutlu	 |  Muhasebe   |

 */

   --Örnek - 4 (FULL JOIN)
SELECT [o r].ad,[o r].soyad,p.ad  FROM ogrenci [o r] FULL JOIN program p ON [o r].bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o FULL OUTER JOIN program p ON o.bolum=p.id
/*Örnek - 4 Çıktı
 |ad             |soyad       |ad           |
 | Ali           | Yılmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  İşletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayşe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yağız| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  İşletme    |
 | Orhan         | Veli       |  NULL       |

 */

--Örnek - 5 (CROSS JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o CROSS JOIN program p

/* Örnek - 5 Çıktı
 |ad             |soyad       |ad           |
 | Ali           | Yılmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Bilgisayar |
 | Asel Sare     | Aygün      |  Bilgisayar | 
 | Ayşe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yağız| Mutlu      |  Bilgisayar |
 | Elif Eylül    | Mutlu      |  Bilgisayar |
 | Orhan         | Veli       |  Bilgisayar |
 | Ali           | Yılmaz     |  Elektronik |
 | Ahmet         | Mutlu      |  Elektronik |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayşe          | Demir      |  Elektronik | 
 | Abdulmelik    | Derinkök   |  Elektronik | 
 | Muhammed Yağız| Mutlu      |  Elektronik |
 | Elif Eylül    | Mutlu      |  Elektronik |
 | Orhan         | Veli       |  Elektronik |
 | Ali           | Yılmaz     |  İşletme    |
 | Ahmet         | Mutlu      |  İşletme    |
 | Asel Sare     | Aygün      |  İşletme    | 
 | Ayşe          | Demir      |  İşletme    | 
 | Abdulmelik    | Derinkök   |  İşletme    | 
 | Muhammed Yağız| Mutlu      |  İşletme    |
 | Elif Eylül    | Mutlu      |  İşletme    |
 | Orhan         | Veli       |  İşletme    |
 | Ali           | Yılmaz     |  Muhasebe   |
 | Ahmet         | Mutlu      |  Muhasebe   |
 | Asel Sare     | Aygün      |  Muhasebe   | 
 | Ayşe          | Demir      |  Muhasebe   | 
 | Abdulmelik    | Derinkök   |  Muhasebe   | 
 | Muhammed Yağız| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  Muhasebe   |
 | Orhan         | Veli       |  Muhasebe   |

*/

