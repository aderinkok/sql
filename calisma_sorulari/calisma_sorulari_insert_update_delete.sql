use ornek

/*
1- ad 'Muhammed' ,soyad değeri 'Özcan' olan ve bölüm değeri 'Web', ortalama değeri 58, dogum_yeri 'Bursa' ve yas değeri 19 olan kaydı ogrenci tablosuna ekleyiniz.

2- Kendi bilgilerinizi ogrenci tablosuna ekleyiniz.

3- ortalaması 65'ten küçük olan kayıtların ad alanını 'İsimsiz' ve soyad alanını 'öğrenci' olarak güncelleyiniz.

4- Ad alanı 'İsimsiz' olan ve ortalaması 60'tan küçük olan kayıtları siliniz.

5- Kendi bilgilerinizin bulunduğu kaydı id yapısı ile bularak kaydın ortalamasını 100 olarak güncelleyiniz.

6- Kendi bilgilerinizi içeren kaydı id yapısı ile bularak siliniz.




*/
SELECT * FROM ogrenci
--1
INSERT ogrenci(ad,soyad,bolum,ortalama,dogum_yeri,yas)  VALUES('Muhammed','Özcan','Web',58,'Bursa',19)

INSERT ogrenci VALUES('Muhammed','Özcan','Web',58,'Bursa',19)





--2
INSERT ogrenci VALUES('Abdulmelik','Derinkök','Bilgisayar',99,'Malatya',18)




--3
UPDATE ogrenci SET ad='İsimsiz', soyad='Öğrenci' WHERE ortalama<65




--4
DELETE FROM ogrenci WHERE ad='İsimsiz' AND ortalama<60





--5
UPDATE ogrenci SET ortalama=100 WHERE id=11




--6
DELETE FROM ogrenci WHERE id=11





-- WHERE koşul ifadesi bulunmadan uygulanan UPDATE ve DELETE sorgu Örnekleri
-- !!! İLGİLİ SORGULAR UYGULANIRKEN DİKKATLİ OLUNMALIDIR !!!

UPDATE ogrenci SET ad='Ali', soyad='Veli'

DELETE FROM ogrenci

