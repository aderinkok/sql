/*
JOIN Örnekleri

Github'da bulunan db_okul.sql dosyasının Çalıştırılarak Db_okul veritabanında çalışılması gerekmektedir.


*/


use Db_okul;

/*

1- ogretmen tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde her iki tablodada yalnızca eşleşen kayıtların listelendiği tabloları birleştirerek tüm kayıtları listeleyiniz.
2- ogretmen tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde o tablosunda yaln?zca e?le?en kay?tlar?n, b tablosunda ise t?m kay?tlar?n listelendi?i tabloları birleştirerek tüm kay?tlar? listeleyiniz.
3- ogretmen tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde b tablosunda yaln?zca e?le?en kay?tlar?n, o tablosunda ise t?m kay?tlar?n listelendi?i tabloları birleştirerek tüm kay?tlar? listeleyiniz.
4- ogretmen tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde eşleşen ya da e?le?meyen kay?tlar?n listelendi?i tablolar? birle?tirerek t?m kay?tlar? listeleyiniz.
!!!DİKKAT!!!  1-2-3-4. soruların SQL ifadelerini ve çıktılarını iyice anlayana kadar inceleyiniz. !!!DİKKAT!!!
5- ders tablosunu d takma adı ile bolum tablosunu b takma adı ile ve ders_bolum tablosunu db takma adı ile kullanarak d tablosundan ders_adi, b tablosundan bolum_adi kolonlarını listeleyerek inner join i?lemi ger?ekle?tiriniz.

*/

/* __________________ CEVAPLAR __________________ */

--1
SELECT * FROM ogretmen o INNER JOIN bolum b ON o.bolum_id=b.id
SELECT * FROM ogretmen o JOIN bolum b ON o.bolum_id=b.id
--2
SELECT * FROM  ogretmen o RIGHT JOIN bolum b  ON b.id=o.bolum_id
SELECT * FROM  bolum b LEFT JOIN ogretmen o  ON b.id=o.bolum_id
--3
SELECT * FROM ogretmen o LEFT JOIN bolum b ON o.bolum_id=b.id
SELECT * FROM bolum b RIGHT JOIN ogretmen o ON o.bolum_id=b.id
--4
SELECT * FROM ogretmen o FULL JOIN bolum b ON o.bolum_id=b.id


--5
SELECT d.ders_adi,b.bolum_adi FROM ders d  LEFT JOIN ders_bolum db ON d.id=db.ders_id INNER JOIN bolum b ON b.id=db.bolum_id
