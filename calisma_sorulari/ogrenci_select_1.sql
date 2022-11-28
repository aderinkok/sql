/*
�al��ma Sorular� - 1
A�a��daki t�m ifadeler ogrenci tablosu i�indir:
1-  T�m kay�tlar� listeleyen SQL ifadesini yaz�n�z.
2-  dogum_yeri "Malatya" olan ��rencilerin en y�ksek ortalamas�n� listeleyen SQL ifadesini yaz�n�z.
3-  dogum_yeri "Bilecik" olan ��rencilerin en y�ksek ortalamas�n� "En Y�ksek" kolon ad� ile listeleyen SQL ifadesini yaz�n�z.
4-  ad,soyad kolonlar�n� ad kolonuna g�re artan s�ralayarak listeleyiniz.
5-  ad,soyad kolonlar�n� soyad kolonuna g�re azalan s�ralayarak listeleyiniz.
6-  Ad� a ile ba�layan kay�tlar� listeleyiniz.
7-  Ad� a ile ba�layan kay�tlar� ad kolonuna g�re azalan s�ralayarak listeleyiniz.
8-  Ad� a ile ba�layan kay�tlar�n ortalama de�erinin ortalamas�n� "Ortalama" kolon ad� ile listeleyiniz.
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
28- dogum_yeri s�tunundaki benzersiz verilerin kay�t say�s�n�z listeleyiniz.
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
