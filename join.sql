--syntax

--INNER JOIN
SELECT * FROM [TABLO_1] INNER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] LEFT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] RIGHT OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] FULL OUTER JOIN [TABLO_2] ON [TABLO_1].[ILISKILI_KOLON] = [TABLO_2].[ILISKILI_KOLON]
SELECT * FROM [TABLO_1] CROSS JOIN [TABLO_2]
-- Tablo isimlerine alias (takma ad) atamas� yap�labilir. �r: SELECT * FROM [TABLO_1] t1 INNER...
-- * ifadesi iki tablodaki t�m kolonlar� �eker. Belirli kolonlar�n gelmesi isteniyorsa [TABLO_ADI].[KOLON_ADI] yap�s� ile belirtilmelidir.
-- OUTER ifadesinin kullan�m� opsiyoneldir.
/*
tablo1: ogrenci
|id  |ad             |soyad       |bolum|dogum_yeri |
|  1 | Ali           | Y�lmaz     |  1  | Sivas     |
|  2 | Ahmet         | Mutlu      |  3  | Bilecik   |
|  3 | Asel Sare     | Ayg�n      |  2  | Bursa     |
|  4 | Ay�e          | Demir      |  1  | Bursa     |
|  5 | Abdulmelik    | Derink�k   |  1  | Bal�kesir |
|  6 | Muhammed Ya��z| Mutlu      |  4  | Eski�ehir |
|  7 | Elif Eyl�l    | Mutlu      |  3  | Elaz��    |
| 8  | Orhan         | Veli       | NULL| Malatya   |
tablo2: program
| id |ad             |
|  1 | Bilgisayar    |
|  2 | Elektronik    |
|  3 | ��letme       |
|  4 | Muhasebe      |


-- tablo1 ve tablo2 aras�nda ili�kili kolonlar tablo2.id = tablo1.bolum �eklindedir.

*/

--�rnek - 1 (INNER JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenciler o INNER JOIN program p ON o.bolum=p.id
-- id=8 olan kayd�n bolum alan� NULL oldu�u i�in bu sorguda listelenmez.
/*�rnek - 1 ��kt�
 |ad             |soyad       |ad           |
 | Ali           | Y�lmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  ��letme    |
 | Asel Sare     | Ayg�n      |  Elektronik | 
 | Ay�e          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derink�k   |  Bilgisayar | 
 | Muhammed Ya��z| Mutlu      |  Muhasebe   |
 | Elif Eyl�l    | Mutlu      |  ��letme    |
 */

 --�rnek - 2 (LEFT JOIN)
 --1
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT JOIN program p ON o.bolum=p.id 
--2
SELECT o.ad,o.soyad,p.ad FROM ogrenci o LEFT OUTER JOIN program p ON o.bolum=p.id
-- iki kodda ayn� ��kt�y� verir.
/*�rnek - 2 ��kt�
 |ad             |soyad       |ad           |
 | Ali           | Y�lmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  ��letme    |
 | Asel Sare     | Ayg�n      |  Elektronik | 
 | Ay�e          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derink�k   |  Bilgisayar | 
 | Muhammed Ya��z| Mutlu      |  Muhasebe   |
 | Elif Eyl�l    | Mutlu      |  ��letme    |
 | Orhan         | Veli       |  NULL       |

 */

  --�rnek - 3 (RIGHT JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT JOIN program p ON o.bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o RIGHT OUTER JOIN program p ON o.bolum=p.id
/*�rnek - 3 ��kt�
 |ad            |   soyad    |ad           |
 |Ali           |   Y�lmaz   |	Bilgisayar |
 |Ay�e          |   Demir    |	Bilgisayar |
 |Abdulmelik    |	Derink�k |  Bilgisayar |
 |Asel Sare     |	Ayg�n	 |  Elektronik |
 |Ahmet	        |   Mutlu    |  ��letme    |
 |Elif Eyl�l    |	Mutlu	 |  ��letme    |
 |Muhammed Ya��z|	Mutlu	 |  Muhasebe   |

 */

   --�rnek - 4 (FULL JOIN)
SELECT [o r].ad,[o r].soyad,p.ad  FROM ogrenci [o r] FULL JOIN program p ON [o r].bolum=p.id
SELECT o.ad,o.soyad,p.ad FROM ogrenci o FULL OUTER JOIN program p ON o.bolum=p.id
/*�rnek - 4 ��kt�
 |ad             |soyad       |ad           |
 | Ali           | Y�lmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  ��letme    |
 | Asel Sare     | Ayg�n      |  Elektronik | 
 | Ay�e          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derink�k   |  Bilgisayar | 
 | Muhammed Ya��z| Mutlu      |  Muhasebe   |
 | Elif Eyl�l    | Mutlu      |  ��letme    |
 | Orhan         | Veli       |  NULL       |

 */

--�rnek - 5 (CROSS JOIN)
SELECT o.ad,o.soyad,p.ad FROM ogrenci o CROSS JOIN program p

/* �rnek - 5 ��kt�
 |ad             |soyad       |ad           |
 | Ali           | Y�lmaz     |  Bilgisayar |
 | Ahmet         | Mutlu      |  Bilgisayar |
 | Asel Sare     | Ayg�n      |  Bilgisayar | 
 | Ay�e          | Demir      |  Bilgisayar | 
 | Abdulmelik    | Derink�k   |  Bilgisayar | 
 | Muhammed Ya��z| Mutlu      |  Bilgisayar |
 | Elif Eyl�l    | Mutlu      |  Bilgisayar |
 | Orhan         | Veli       |  Bilgisayar |
 | Ali           | Y�lmaz     |  Elektronik |
 | Ahmet         | Mutlu      |  Elektronik |
 | Asel Sare     | Ayg�n      |  Elektronik | 
 | Ay�e          | Demir      |  Elektronik | 
 | Abdulmelik    | Derink�k   |  Elektronik | 
 | Muhammed Ya��z| Mutlu      |  Elektronik |
 | Elif Eyl�l    | Mutlu      |  Elektronik |
 | Orhan         | Veli       |  Elektronik |
 | Ali           | Y�lmaz     |  ��letme    |
 | Ahmet         | Mutlu      |  ��letme    |
 | Asel Sare     | Ayg�n      |  ��letme    | 
 | Ay�e          | Demir      |  ��letme    | 
 | Abdulmelik    | Derink�k   |  ��letme    | 
 | Muhammed Ya��z| Mutlu      |  ��letme    |
 | Elif Eyl�l    | Mutlu      |  ��letme    |
 | Orhan         | Veli       |  ��letme    |
 | Ali           | Y�lmaz     |  Muhasebe   |
 | Ahmet         | Mutlu      |  Muhasebe   |
 | Asel Sare     | Ayg�n      |  Muhasebe   | 
 | Ay�e          | Demir      |  Muhasebe   | 
 | Abdulmelik    | Derink�k   |  Muhasebe   | 
 | Muhammed Ya��z| Mutlu      |  Muhasebe   |
 | Elif Eyl�l    | Mutlu      |  Muhasebe   |
 | Orhan         | Veli       |  Muhasebe   |

*/

