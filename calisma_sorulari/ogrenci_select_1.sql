/*
Çalýþma Sorularý - 1
Aþaðýdaki tüm ifadeler ogrenci tablosu içindir:
1-  Tüm kayýtlarý listeleyen SQL ifadesini yazýnýz.
2-  dogum_yeri "Malatya" olan öðrencilerin en yüksek ortalamasýný listeleyen SQL ifadesini yazýnýz.
3-  dogum_yeri "Bilecik" olan öðrencilerin en yüksek ortalamasýný "En Yüksek" kolon adý ile listeleyen SQL ifadesini yazýnýz.
4-  ad,soyad kolonlarýný ad kolonuna göre artan sýralayarak listeleyiniz.
5-  ad,soyad kolonlarýný soyad kolonuna göre azalan sýralayarak listeleyiniz.
6-  Adý a ile baþlayan kayýtlarý listeleyiniz.
7-  Adý a ile baþlayan kayýtlarý ad kolonuna göre azalan sýralayarak listeleyiniz.
8-  Adý a ile baþlayan kayýtlarýn ortalama deðerinin ortalamasýný "Ortalama" kolon adý ile listeleyiniz.
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
28- dogum_yeri sütunundaki benzersiz verilerin kayýt sayýsýnýz listeleyiniz.
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
