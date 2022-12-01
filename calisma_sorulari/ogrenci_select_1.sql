/*

�al��ma Sorular� - 1 (SELECT)
A�a��daki t�m ifadeler ogrenci tablosu i�indir:
1-  T�m kay�tlar� listeleyen SQL ifadesini yaz�n�z.
2-  dogum_yeri "Malatya" olan ��rencilerin en y�ksek ortalamas�n� listeleyen SQL ifadesini yaz�n�z.
3-  dogum_yeri "Bilecik" olan ��rencilerin en y�ksek ortalamas�n� "En Y�ksek" kolon ad� ile listeleyen SQL ifadesini yaz�n�z.
4-  ad,soyad kolonlar�n� ad kolonuna g�re artan s�ralayarak listeleyiniz.
5-  ad,soyad kolonlar�n� soyad kolonuna g�re azalan s�ralayarak listeleyiniz.
6-  Ad� a ile ba�layan kay�tlar� listeleyiniz.
7-  Ad� a ile ba�layan kay�tlar� ad kolonuna g�re azalan s�ralayarak listeleyiniz.
8-  Ad� a ile ba�layan kay�tlar�n ortalama de�erlerinin ortalamas�n� "Ortalama" kolon ad� ile listeleyiniz.
9-  ad ve soyad kolonlar�n� birle�tirerek "�sim" kolon ad� ile listeleyiniz.
10- Kay�tlar� ortalama de�erine azalan s�ralayarak listeleyiniz.
11- bolum s�tunundaki verileri benzersiz olarak listeleyiniz.
12- dogum_yeri kolonundaki verileri benzersiz olarak listeleyiniz.
13- ortalama �zelli�indeki verileri benzersiz olarak listeleyiniz.
14- �lk 4 kayd� listeleyiniz.
15- �lk 3 kayd� id kolonuna g�re azalan s�ralayarak listeleyiniz.
16- ortalama de�eri 60 ile 80 aras�nda olan kay�tlar� listeleyiniz.
17- ortalama de�eri 60 ile 80 aras�nda olan (u� de�erler DAH�L) kay�tlar� listeleyiniz.
18- ortalama de�eri 60 ile 80 aras�nda olan kay�tlar� BETWEEN ile listeleyiniz.
19- ortalama de�eri 60 ile 80 aras�nda olan (u� de�erler DAH�L) kay�tlar� BETWEEN ile listeleyiniz.
20- yas kolonundaki verileri benzersiz olarak listeleyiniz.
21- Ya�� 20'den k���k ve do�um yeri Malatya olan ve ortalamas� 64'ten b�y�k veya 55'ten k���k olan kay�tlar� listeleyiniz.
22- Soyad� "Ta�", "G�l" veya "Yi�it" olan kay�tlar� listeleyiniz.
23- Soyad� "Ta�", "G�l" veya "Yi�it" olan kay�tlar� IN kullanarak listeleyiniz.
24- Soyad� "Ta�", "G�l" veya "Yi�it" olmayan kay�tlar� listeleyiniz.
25- Soyad� "Ta�", "G�l" veya "Yi�it" olmayan kay�tlar� IN listeleyiniz.***
26- Toplam kay�t say�s�n� "Toplam" kolon ad� ile listeleyiniz.
27- dogum_yeri s�tunundaki benzersiz verileri listeleyiniz.
28- dogum_yeri s�tunundaki benzersiz verilerin kay�t say�s�n� listeleyiniz.
29- yas s�tunundaki benzersiz verileri listeleyiniz.
30- ad s�tunundaki benzersiz verileri listeleyiniz.
31- yas s�tunundaki benzersiz verilerin kay�t say�s�n� listeleyiniz.
32- T�m kay�tlar� bolum s�tununa g�re gruplay�n�z ve her b�l�mde ka� ki�i oldu�unu listeleyiniz.
33- Her bir b�l�mde ka� ��renci oldu�unu listeleyiniz.
34- Her bir b�l�mde ka� kay�t oldu�unu listeleyiniz.
35- Her bir b�l�mdeki en y�ksek ortalamay� listeleyiniz.
36- Her bir b�l�mdeki en d���k ortalamay� listeleyiniz.
37- Her bir b�l�mdeki ortalama s�tunun ortalama de�erini listeleyiniz.
38- yas de�eri 19 ve 20 olan kay�tlar�n say�s�n� tek komut ile listeleyiniz.
39- Her bir dogum_yeri de�erinde ka� kay�t oldu�unu listeleyiniz.
40- Her bir dogum_yeri de�erinde ka� kay�t oldu�unu "Ki�i" kolon ad�yla, dogum_yeri kolonunu "Memleket" kolon ad�yla listeleyiniz.
41- Bolum degeri Elektrik olmayan kay�tlar� bolum s�tununa g�re gruplay�n�z  ve  her b�l�mde ka� ki�i oldu�unu listeleyiniz.
42- Bolum degeri Bilgisayar veya Muhasebe olan kay�tlar� bolum s�tununa g�re gruplay�n�z  ve  her b�l�mde ka� ki�i oldu�unu listeleyiniz.
43- Her bir dogum_yeri de�erinde ka� kay�t oldu�unu "Ki�i" kolon ad�yla , dogum_yeri kolonunu "Memleket" kolon ad�yla ancak kay�t say�s� ("Ki�i" takma adl� kolon de�eri) 3 veya �st� bir de�erde ise listeleyiniz.
*/

/*Cevaplar*/

USE Ornek  --Komutlar �al��mazsa �zerinde i�lem yap�lacak veritaban�na ge�i� yap�lmal�d�r.


--1
SELECT * FROM ogrenci

--2
SELECT MAX(ortalama) FROM ogrenci WHERE dogum_yeri='Malatya'

--3
SELECT MAX(ortalama) [En Y�ksek] FROM ogrenci WHERE dogum_yeri='Bilecik'

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
SELECT ad+soyad �sim FROM ogrenci --Ad ve soyad aras�nda bo�luk b�rakmadan ��kt� verir.
SELECT ad+' '+soyad �sim FROM ogrenci --Ad ve soyad aras�nda bo�luk b�rakarak ��kt� verir.

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
SELECT * FROM ogrenci WHERE soyad='Ta�' OR soyad='G�l' OR soyad='Yi�it'

--23
SELECT * FROM ogrenci WHERE soyad IN('Ta�','G�l','Yi�it')

--24
SELECT * FROM ogrenci WHERE soyad!='Ta�' AND soyad!='G�l' AND soyad!='Yi�it'

--25
SELECT * FROM ogrenci WHERE soyad NOT IN('Ta�','G�l','Yi�it')

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
SELECT dogum_yeri Memleket ,COUNT(*) Ki�i FROM ogrenci GROUP BY dogum_yeri

--41
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum!='Elektrik' GROUP BY bolum

--42
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum!='Elektrik' GROUP BY bolum
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum='Bilgisayar' OR bolum='Muhasebe' GROUP BY bolum
SELECT bolum,COUNT(*) FROM ogrenci WHERE bolum IN('Bilgisayar','Muhasebe') GROUP BY bolum

--43
SELECT dogum_yeri Memleket ,COUNT(*) Ki�i FROM ogrenci GROUP BY dogum_yeri HAVING COUNT(*)>=3

