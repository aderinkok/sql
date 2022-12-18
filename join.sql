--syntax

--INNER JOIN
SELECT * FROM [TABLO_1] INNER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] LEFT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] RIGHT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] FULL OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] CROSS JOIN [TABLO_2]
-- Tablo isimlerine alias (takma ad) atamasý yapýlabilir. Ör: SELECT * FROM [TABLO_1] t1 INNER...
-- * ifadesi iki tablodaki tüm kolonlarý çeker. Belirli kolonlarýn gelmesi isteniyorsa [TABLO_ADI].[KOLON_ADI] yapýsý ile belirtilmelidir.
-- OUTER ifadesinin kullanýmý opsiyoneldir.
/*
tablo1: ogrenci
|id  |ad             |soyad       |bolum|dogum_yeri |
|  1 | Ali           | Yýlmaz     |  1  | Sivas     |
|  2 | Ahmet         | Mutlu      |  3  | Bilecik   |
|  3 | Asel Sare     | Aygün      |  2  | Bursa     |
|  4 | Ayþe          | Demir      |  1  | Bursa     |
|  5 | Abdulmelik    | Derinkök   |  1  | Balýkesir |
|  6 | Muhammed Yaðýz| Mutlu      |  4  | Eskiþehir |
|  7 | Elif Eylül    | Mutlu      |  3  | Elazýð    |
| 8  | Orhan         | Veli       | NULL| Malatya   |
tablo2: program
| id |ad             |
|  1 | Bilgisayar    |
|  2 | Elektronik    |
|  3 | Ýþletme       |
|  4 | Muhasebe      |


-- tablo1 ve tablo2 arasýnda iliþkili kolonlar tablo2.id = tablo1.bolum þeklindedir.

*/

--Örnek - 1 (INNER JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenciler o INNER JOIN program p ON o.bolum=p.id
-- id=8 olan kaydýn bolum alaný NULL olduðu için bu sorguda listelenmez.
/*Örnek - 1 Çýktý
 |ad             |soyad       |ad           |
 | Ali           | Yýlmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Ýþletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayþe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yaðýz| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  Ýþletme    |
 */

 --Örnek - 2 (LEFT JOIN)
 --1
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT JOIN program p ON o.bolum=p.id 
--2
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT OUTER JOIN program p ON o.bolum=p.id
-- iki kodda ayný çýktýyý verir.
/*Örnek - 2 Çýktý
 |ad             |soyad       |ad           |
 | Ali           | Yýlmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Ýþletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayþe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yaðýz| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  Ýþletme    |
 | Orhan         | Veli       |  NULL       |

 */

  --Örnek - 3 (RIGHT JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT JOIN program p ON o.bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT OUTER JOIN program p ON o.bolum=p.id
/*Örnek - 3 Çýktý
 |ad            |   soyad    |ad           |
 |Ali           |   Yýlmaz   |	Bilgisayar |
 |Ayþe          |   Demir    |	Bilgisayar |
 |Abdulmelik    |	Derinkök |  Bilgisayar |
 |Asel Sare     |	Aygün	 |  Elektronik |
 |Ahmet	        |   Mutlu    |  Ýþletme    |
 |Elif Eylül    |	Mutlu	 |  Ýþletme    |
 |Muhammed Yaðýz|	Mutlu	 |  Muhasebe   |

 */

   --Örnek - 4 (FULL JOIN)
SELECT [o r].ad,[o r].soyad,p.ad  FROM ogrenci [o r] FULL JOIN program p ON [o r].bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o FULL OUTER JOIN program p ON o.bolum=p.id
/*Örnek - 4 Çýktý
 |ad             |soyad       |ad           |
 | Ali           | Yýlmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Ýþletme    |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayþe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yaðýz| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  Ýþletme    |
 | Orhan         | Veli       |  NULL       |

 */

--Örnek - 5 (CROSS JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o CROSS JOIN program p

/* Örnek - 5 Çýktý
 |ad             |soyad       |ad           |
 | Ali           | Yýlmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Bilgisayar |
 | Asel Sare     | Aygün      |  Bilgisayar | 
 | Ayþe          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derinkök   |  Bilgisayar | 
 | Muhammed Yaðýz| Mutlu      |  Bilgisayar |
 | Elif Eylül    | Mutlu      |  Bilgisayar |
 | Orhan         | Veli       |  Bilgisayar |
 | Ali           | Yýlmaz     |  Elektronik |
 | Ahmet         | Mutlu      |  Elektronik |
 | Asel Sare     | Aygün      |  Elektronik | 
 | Ayþe          | Demir      |  Elektronik | 
 | Abdulmelik    | Derinkök   |  Elektronik | 
 | Muhammed Yaðýz| Mutlu      |  Elektronik |
 | Elif Eylül    | Mutlu      |  Elektronik |
 | Orhan         | Veli       |  Elektronik |
 | Ali           | Yýlmaz     |  Ýþletme    |
 | Ahmet         | Mutlu      |  Ýþletme    |
 | Asel Sare     | Aygün      |  Ýþletme    | 
 | Ayþe          | Demir      |  Ýþletme    | 
 | Abdulmelik    | Derinkök   |  Ýþletme    | 
 | Muhammed Yaðýz| Mutlu      |  Ýþletme    |
 | Elif Eylül    | Mutlu      |  Ýþletme    |
 | Orhan         | Veli       |  Ýþletme    |
 | Ali           | Yýlmaz     |  Muhasebe   |
 | Ahmet         | Mutlu      |  Muhasebe   |
 | Asel Sare     | Aygün      |  Muhasebe   | 
 | Ayþe          | Demir      |  Muhasebe   | 
 | Abdulmelik    | Derinkök   |  Muhasebe   | 
 | Muhammed Yaðýz| Mutlu      |  Muhasebe   |
 | Elif Eylül    | Mutlu      |  Muhasebe   |
 | Orhan         | Veli       |  Muhasebe   |

*/

