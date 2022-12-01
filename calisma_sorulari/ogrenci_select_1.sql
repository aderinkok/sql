/*

Çalýþma Sorularý - 1 (SELECT)
Aþaðýdaki tüm ifadeler ogrenci tablosu içindir:
1-  Tüm kayýtlarý listeleyen SQL ifadesini yazýnýz.
2-  dogum_yeri "Malatya" olan öðrencilerin en yüksek ortalamasýný listeleyen SQL ifadesini yazýnýz.
3-  dogum_yeri "Bilecik" olan öðrencilerin en yüksek ortalamasýný "En Yüksek" kolon adý ile listeleyen SQL ifadesini yazýnýz.
4-  ad,soyad kolonlarýný ad kolonuna göre artan sýralayarak listeleyiniz.
5-  ad,soyad kolonlarýný soyad kolonuna göre azalan sýralayarak listeleyiniz.
6-  Adý a ile baþlayan kayýtlarý listeleyiniz.
7-  Adý a ile baþlayan kayýtlarý ad kolonuna göre azalan sýralayarak listeleyiniz.
8-  Adý a ile baþlayan kayýtlarýn ortalama deðerlerinin ortalamasýný "Ortalama" kolon adý ile listeleyiniz.
9-  ad ve soyad kolonlarýný birleþtirerek "Ýsim" kolon adý ile listeleyiniz.
10- Kayýtlarý ortalama deðerine azalan sýralayarak listeleyiniz.
11- bolum sütunundaki verileri benzersiz olarak listeleyiniz.
12- dogum_yeri kolonundaki verileri benzersiz olarak listeleyiniz.
13- ortalama özelliðindeki verileri benzersiz olarak listeleyiniz.
14- Ýlk 4 kaydý listeleyiniz.
15- Ýlk 3 kaydý id kolonuna göre azalan sýralayarak listeleyiniz.
16- ortalama deðeri 60 ile 80 arasýnda olan kayýtlarý listeleyiniz.
17- ortalama deðeri 60 ile 80 arasýnda olan (uç deðerler DAHÝL) kayýtlarý listeleyiniz.
18- ortalama deðeri 60 ile 80 arasýnda olan kayýtlarý BETWEEN ile listeleyiniz.
19- ortalama deðeri 60 ile 80 arasýnda olan (uç deðerler DAHÝL) kayýtlarý BETWEEN ile listeleyiniz.
20- yas kolonundaki verileri benzersiz olarak listeleyiniz.
21- Yaþý 20'den küçük ve doðum yeri Malatya olan ve ortalamasý 64'ten büyük veya 55'ten küçük olan kayýtlarý listeleyiniz.
22- Soyadý "Taþ", "Göl" veya "Yiðit" olan kayýtlarý listeleyiniz.
23- Soyadý "Taþ", "Göl" veya "Yiðit" olan kayýtlarý IN kullanarak listeleyiniz.
24- Soyadý "Taþ", "Göl" veya "Yiðit" olmayan kayýtlarý listeleyiniz.
25- Soyadý "Taþ", "Göl" veya "Yiðit" olmayan kayýtlarý IN listeleyiniz.***
26- Toplam kayýt sayýsýný "Toplam" kolon adý ile listeleyiniz.
27- dogum_yeri sütunundaki benzersiz verileri listeleyiniz.
28- dogum_yeri sütunundaki benzersiz verilerin kayýt sayýsýný listeleyiniz.
29- yas sütunundaki benzersiz verileri listeleyiniz.
30- ad sütunundaki benzersiz verileri listeleyiniz.
31- yas sütunundaki benzersiz verilerin kayýt sayýsýný listeleyiniz.
32- Tüm kayýtlarý bolum sütununa göre gruplayýnýz ve her bölümde kaç kiþi olduðunu listeleyiniz.
33- Her bir bölümde kaç öðrenci olduðunu listeleyiniz.
34- Her bir bölümde kaç kayýt olduðunu listeleyiniz.
35- Her bir bölümdeki en yüksek ortalamayý listeleyiniz.
36- Her bir bölümdeki en düþük ortalamayý listeleyiniz.
37- Her bir bölümdeki ortalama sütunun ortalama deðerini listeleyiniz.
38- yas deðeri 19 ve 20 olan kayýtlarýn sayýsýný tek komut ile listeleyiniz.
39- Her bir dogum_yeri deðerinde kaç kayýt olduðunu listeleyiniz.
40- Her bir dogum_yeri deðerinde kaç kayýt olduðunu "Kiþi" kolon adýyla, dogum_yeri kolonunu "Memleket" kolon adýyla listeleyiniz.
41- Bolum degeri Elektrik olmayan kayýtlarý bolum sütununa göre gruplayýnýz  ve  her bölümde kaç kiþi olduðunu listeleyiniz.
42- Bolum degeri Bilgisayar veya Muhasebe olan kayýtlarý bolum sütununa göre gruplayýnýz  ve  her bölümde kaç kiþi olduðunu listeleyiniz.
43- Her bir dogum_yeri deðerinde kaç kayýt olduðunu "Kiþi" kolon adýyla , dogum_yeri kolonunu "Memleket" kolon adýyla ancak kayýt sayýsý ("Kiþi" takma adlý kolon deðeri) 3 veya üstü bir deðerde ise listeleyiniz.
*/

/*Cevaplar*/

USE Ornek  --Komutlar çalýþmazsa üzerinde iþlem yapýlacak veritabanýna geçiþ yapýlmalýdýr.


--1
SELECT * FROM ogrenci

--2
SELECT MAX(ortalama) FROM ogrenci WHERE dogum_yeri='Malatya'

--3
SELECT MAX(ortalama) [En Yüksek] FROM ogrenci WHERE dogum_yeri='Bilecik'

--4
SELECT ad,soyad FROM ogrenci ORDER BY ad ASC
SELECT ad,soyad FROM ogrenci ORDER BY ad 

--5
SELECT ad,soyad FROM ogrenci ORDER BY soyad DESC

--6
SELECT * FROM ogrenci WHERE ad LIKE 'a%'
--7
SELECT * FROM ogrenci WHERE ad LIKE 'a%' ORDER BY ad DESC

--8
SELECT AVG(ortalama) Ortalama FROM ogrenci WHERE ad LIKE 'a%'

--9
SELECT ad+soyad Ýsim FROM ogrenci --Ad ve soyad arasýnda boþluk býrakmadan çýktý verir.
SELECT ad+' '+soyad Ýsim FROM ogrenci --Ad ve soyad arasýnda boþluk býrakarak çýktý verir.

--10
SELECT * FROM ogrenci ORDER BY ortalama DESC

--11
SELECT DISTINCT bolum FROM ogrenci

--12
SELECT DISTINCT dogum_yeri FROM ogrenci

--13
SELECT DISTINCT ortalama FROM ogrenci

--14
SELECT TOP 4 * FROM ogrenci

--15
SELECT TOP 3 * FROM ogrenci ORDER BY id DESC

--16
SELECT * FROM ogrenci WHERE ortalama>60 AND ortalama<80

--17
SELECT * FROM ogrenci WHERE ortalama>=60 AND ortalama<=80

--18
SELECT * FROM ogrenci WHERE ortalama BETWEEN 61 AND 79

--19
SELECT * FROM ogrenci WHERE ortalama BETWEEN 60 AND 80

--20
SELECT DISTINCT yas FROM ogrenci

--21
SELECT * FROM ogrenci WHERE yas<20 AND dogum_yeri='Malatya' AND ortalama>64 OR ortalama<55

--22
SELECT * FROM ogrenci WHERE soyad='Taþ' OR soyad='Göl' OR soyad='Yiðit'

--23
SELECT * FROM ogrenci WHERE soyad IN('Taþ','Göl','Yiðit')

--24
SELECT * FROM ogrenci WHERE soyad!='Taþ' AND soyad!='Göl' AND soyad!='Yiðit'

--25
SELECT * FROM ogrenci WHERE soyad NOT IN('Taþ','Göl','Yiðit')

--26
SELECT COUNT(*) Toplam FROM ogrenci

--27
SELECT DISTINCT dogum_yeri FROM ogrenci

--28
SELECT COUNT(DISTINCT dogum_yeri) FROM ogrenci

--29
SELECT DISTINCT yas FROM ogrenci

--30
SELECT DISTINCT ad FROM ogrenci

--31
SELECT COUNT(DISTINCT yas) FROM ogrenci

--32
SELECT bolum,COUNT(*) FROM ogrenci GROUP BY bolum

--33
SELECT bolum,COUNT(*) FROM ogrenci GROUP BY bolum

--34
SELECT bolum,COUNT(*) FROM ogrenci GROUP BY bolum

--35
SELECT bolum,MAX(ortalama) FROM ogrenci GROUP BY bolum

--36
SELECT bolum,MIN(ortalama) FROM ogrenci GROUP BY bolum

--37
SELECT bolum,AVG(ortalama) FROM ogrenci GROUP BY bolum

--38
SELECT yas,COUNT(*) FROM ogrenci WHERE yas IN(19,20) GROUP BY yas

--39
SELECT dogum_yeri,COUNT(*) FROM ogrenci GROUP BY dogum_yeri

--40
SELECT dogum_yeri Memleket ,COUNT(*) Kiþi FROM ogrenci GROUP BY dogum_yeri

--41
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum!='Elektrik' GROUP BY bolum

--42
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum!='Elektrik' GROUP BY bolum
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum='Bilgisayar' OR bolum='Muhasebe' GROUP BY bolum
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum IN('Bilgisayar','Muhasebe') GROUP BY bolum

--43
SELECT dogum_yeri Memleket ,COUNT(*) Kiþi FROM ogrenci GROUP BY dogum_yeri HAVING COUNT(*)>=3

