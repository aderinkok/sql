use Kampus

/*
Örnekler için Kampus veritabanı kullanılacaktır. (veritabani/Kampus.sql betiği çalıştırılarak veritabanı oluşturulmalıdır.)
NOT: Bu sayfadaki sorgular tablolardaki verileri değiştirir. Verileri ilk haline döndürmek için Kampus.sql betiği tekrar çalıştırılabilir.
NOT-2: ogrenci tablosunda TC kimlik numarası şifreli olarak tutulur. Kayıt eklerken tc_kimlik_sifreli kolonu için dbo.tc_sifrele('...'),
tc_kimlik_ozet kolonu için dbo.tc_ozet('...') fonksiyonları kullanılmalıdır. (Bkz: Kampus.sql açıklamaları)
Fonksiyon adlarının önündeki dbo. ifadesi şema adıdır ve kullanıcı tanımlı fonksiyonlarda zorunludur. (Bkz: calisma_sorulari_select_1.sql 133. soru)
!!! Çalışmalarda gerçek TC kimlik numaranızı DEĞİL, sorularda verilen örnek numaraları kullanınız. !!!

1- ogrenci tablosuna ogrenci_no '2025010107', ad 'Mert', soyad 'Özkan', cinsiyet 'E', dogum_tarihi '2006-05-19', dogum_yeri 'Bursa',
   bolum_id 1, danisman_id 2, sinif 1, ortalama 58 ve TC kimlik numarası '31054808469' olan kaydı ekleyiniz. (eposta bilgisi girilmeyecektir.)

2- Kendi bilgilerinizi ogrenci tablosuna ekleyiniz. TC kimlik numarası olarak '70074155032' örnek numarasını kullanınız.

3- kitap tablosuna aşağıdaki iki kaydı TEK sorgu ile ekleyiniz.
   | kitap_adi      | kategori_id | yayinevi           | sayfa_sayisi | basim_yili | dil    | stok |
   | Tutunamayanlar | 1           | İletişim Yayınları | 724          | 2020       | Türkçe | 2    |
   | Dune           | 2           | İthaki Yayınları   | 712          | 2021       | Türkçe | 3    |

4- kitap tablosuna kitap_adi 'Sefiller', kategori_id 1, yayinevi 'Can Yayınları', sayfa_sayisi 1724, basim_yili 2018, dil 'Türkçe' olan kaydı
   stok değeri belirtmeden ekleyiniz. Eklenen kaydın stok değeri ne olmuştur? Neden?

5- 1. soruda eklenen öğrenci (Mert Özkan) için ogrenci_detay tablosuna aşağıdaki kaydı ekleyiniz.
   telefon '0500 101 10 21', ikamet_ili 'Bilecik', adres 'KYK Bilecik Erkek Öğrenci Yurdu', kan_grubu 'B Rh+', veli_adi 'Kadir Özkan',
   burslu 0, yurtta_kaliyor 1, kayit_tarihi '2025-09-08'

6- id değeri 1 olan öğrenci (Ahmet Yılmaz) için ogrenci_detay tablosuna ikinci bir kayıt eklemeyi deneyiniz. Hata alınmasının sebebi nedir? ***

7- ortalaması 50'den küçük olan öğrencilerin ortalama değerini 5 puan artırınız.

8- yayinevi 'Can Yayınları' olan kitapların stok değerini 2 artırınız.

9- iade_tarihi değeri NULL olan (henüz iade edilmemiş) ödünç kayıtlarının iade_tarihi değerini '2025-10-30' olarak güncelleyiniz.

10- Kendi bilgilerinizin bulunduğu kaydı id yapısı ile bularak kaydın ortalamasını 100 olarak güncelleyiniz.

11- Mert Özkan isimli öğrencinin TC kimlik numarasını '13003922279' olarak güncelleyiniz.

12- kitap tablosundan id değeri 3 olan kaydı siliniz. Hata alınmasının sebebi nedir? ***

13- Hiç ödünç alınmamış ve stok değeri 1 olan kitapları siliniz. ***

14- ogrenci tablosuna cinsiyet değeri 'X' olan bir kayıt eklemeyi deneyiniz. Hangi kısıt (CONSTRAINT) nedeniyle hata alınır?
    (TC kimlik numarası olarak '22779401901' örnek numarasını kullanınız.)

15- TC kimlik numarası '12345678901' olan bir öğrenci eklemeyi deneyiniz. Hata alınmasının sebebi nedir? ***

16- Ahmet Yılmaz isimli öğrencinin TC kimlik numarası ('53618033739') ile yeni bir öğrenci eklemeyi deneyiniz. Hangi kısıt nedeniyle hata alınır?
    Bu kısıt neden tc_kimlik_sifreli kolonuna değil de tc_kimlik_ozet kolonuna tanımlanmıştır? ***

17- Kendi bilgilerinizi içeren kaydı id yapısı ile bularak siliniz. Kaydınıza ait ogrenci_detay, ders_kayit ve odunc kayıtlarına ne olur?




*/
SELECT * FROM ogrenci
SELECT * FROM ogrenci_detay
SELECT * FROM kitap

--1
INSERT ogrenci(ogrenci_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,bolum_id,danisman_id,sinif,ortalama,tc_kimlik_sifreli,tc_kimlik_ozet)
VALUES('2025010107','Mert','Özkan','E','2006-05-19','Bursa',1,2,1,58,dbo.tc_sifrele('31054808469'),dbo.tc_ozet('31054808469'))

INSERT ogrenci VALUES('2025010107','Mert','Özkan','E','2006-05-19','Bursa',1,2,1,58,NULL,dbo.tc_sifrele('31054808469'),dbo.tc_ozet('31054808469'))
--NOT: Kolon adları yazılmadan ekleme yapıldığında IDENTITY kolonu (id) dışındaki TÜM kolonlar için sırasıyla değer verilmelidir.
--NOT-2: ogrenci_no ve tc_kimlik_ozet kolonları UNIQUE olduğu için aynı kayıt ikinci kez eklenmek istendiğinde hata alınır. İki sorgudan biri çalıştırılmalıdır.

SELECT ad,soyad,dbo.tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM ogrenci WHERE ogrenci_no='2025010107'  --Eklenen kaydın kontrolü




--2
INSERT ogrenci(ogrenci_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,sinif,ortalama,tc_kimlik_sifreli,tc_kimlik_ozet)
VALUES('2025019999','Adınız','Soyadınız','K','2006-01-01','Bilecik',1,99,dbo.tc_sifrele('70074155032'),dbo.tc_ozet('70074155032'))
--NOT: Değer verilmeyen kolonlar (bolum_id, danisman_id, eposta) NULL olarak kaydedilir.




--3
INSERT kitap(kitap_adi,kategori_id,yayinevi,sayfa_sayisi,basim_yili,dil,stok) VALUES
('Tutunamayanlar',1,'İletişim Yayınları',724,2020,'Türkçe',2),
('Dune',2,'İthaki Yayınları',712,2021,'Türkçe',3)
--NOT: Birden fazla kayıt, değer grupları virgül ile ayrılarak tek INSERT sorgusu ile eklenebilir.




--4
INSERT kitap(kitap_adi,kategori_id,yayinevi,sayfa_sayisi,basim_yili,dil) VALUES('Sefiller',1,'Can Yayınları',1724,2018,'Türkçe')
SELECT * FROM kitap WHERE kitap_adi='Sefiller'
--NOT: stok kolonunun varsayılan değeri (DEFAULT) 1 olarak tanımlandığı için değer verilmeyen kaydın stok değeri 1 olur.




--5
INSERT ogrenci_detay(ogrenci_id,telefon,ikamet_ili,adres,kan_grubu,veli_adi,burslu,yurtta_kaliyor,kayit_tarihi)
VALUES((SELECT id FROM ogrenci WHERE ogrenci_no='2025010107'),'0500 101 10 21','Bilecik','KYK Bilecik Erkek Öğrenci Yurdu','B Rh+','Kadir Özkan',0,1,'2025-09-08')
--NOT: ogrenci_id değeri iç içe sorgu ile ogrenci_no kullanılarak bulunmuştur. id değeri bilinirse doğrudan da yazılabilir.




--6
INSERT ogrenci_detay(ogrenci_id,telefon,ikamet_ili,kayit_tarihi) VALUES(1,'0500 101 10 99','Eskişehir','2024-09-02')
--NOT: ogrenci ile ogrenci_detay tabloları arasında bire bir (1:1) ilişki vardır. ogrenci_detay tablosundaki ogrenci_id kolonu
--UNIQUE (UQ_ogrenci_detay_ogrenci) olarak tanımlandığı için bir öğrenciye ait ikinci detay kaydı eklenemez.
--UNIQUE kısıtı olmasaydı aynı öğrenci için birden fazla detay eklenebilir ve ilişki bire çok (1:N) olurdu.




--7
UPDATE ogrenci SET ortalama=ortalama+5 WHERE ortalama<50  --Kolonun mevcut değeri kullanılarak güncelleme yapılabilir.




--8
UPDATE kitap SET stok=stok+2 WHERE yayinevi='Can Yayınları'  --Koşulu sağlayan tüm kayıtlar tek sorgu ile güncellenir.




--9
UPDATE odunc SET iade_tarihi='2025-10-30' WHERE iade_tarihi IS NULL  --iade_tarihi=NULL şeklinde yazılan koşul hiçbir kaydı güncellemez.




--10
SELECT * FROM ogrenci WHERE ogrenci_no='2025019999'
UPDATE ogrenci SET ortalama=100 WHERE id=22  --id değeri bir önceki sorgunun çıktısına göre yazılmalıdır.
--NOT: Hata ile sonuçlanan INSERT denemeleri de (Örn: 1. sorudaki ikinci sorgu) IDENTITY değerini artırır.
--Bu nedenle kaydınızın id değeri 22'den farklı olabilir; id değerini tahmin etmek yerine SELECT ile bulunuz.




--11
UPDATE ogrenci SET tc_kimlik_sifreli=dbo.tc_sifrele('13003922279'), tc_kimlik_ozet=dbo.tc_ozet('13003922279') WHERE ogrenci_no='2025010107'
--NOT: Şifreli değer ve özet değeri aynı numaradan üretildiği için iki kolon birlikte güncellenmelidir.
SELECT ad,soyad,dbo.tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM ogrenci WHERE ogrenci_no='2025010107'




--12
DELETE FROM kitap WHERE id=3
--NOT: id değeri 3 olan kitap odunc tablosunda kullanıldığı (FOREIGN KEY) için silinemez.
--odunc tablosundaki FK_odunc_kitap kısıtı ON DELETE NO ACTION olarak tanımlanmıştır.
--Kitabın silinebilmesi için önce bu kitaba ait ödünç kayıtları silinmelidir.




--13
SELECT * FROM kitap WHERE stok=1 AND id NOT IN (SELECT kitap_id FROM odunc)
DELETE FROM kitap WHERE stok=1 AND id NOT IN (SELECT kitap_id FROM odunc)
--NOT: Silinen kitaplara ait kitap_yazar kayıtları ON DELETE CASCADE nedeniyle otomatik olarak silinir.




--14
INSERT ogrenci(ogrenci_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,sinif,ortalama,tc_kimlik_sifreli,tc_kimlik_ozet)
VALUES('2025019998','Deneme','Kayıt','X','2006-01-01','Bilecik',1,50,dbo.tc_sifrele('22779401901'),dbo.tc_ozet('22779401901'))
--NOT: cinsiyet kolonu için tanımlanan CK_ogrenci_cinsiyet kısıtı yalnızca 'K' ve 'E' değerlerine izin verir.




--15
SELECT dbo.tc_gecerli('12345678901')  --0 döner: ilk 10 hanenin toplamı 45, birler basamağı 5'tir; 11. hane 1 olduğu için numara kurala uymaz.
INSERT ogrenci(ogrenci_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,sinif,ortalama,tc_kimlik_sifreli,tc_kimlik_ozet)
VALUES('2025019997','Deneme','Kayıt','E','2006-01-01','Bilecik',1,50,dbo.tc_sifrele('12345678901'),dbo.tc_ozet('12345678901'))
--NOT: dbo.tc_sifrele ve dbo.tc_ozet fonksiyonları kurala uymayan numaralar için NULL döndürür.
--tc_kimlik_sifreli ve tc_kimlik_ozet kolonları NOT NULL olduğu için kayıt eklenemez ("Cannot insert the value NULL..." hatası).




--16
INSERT ogrenci(ogrenci_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,sinif,ortalama,tc_kimlik_sifreli,tc_kimlik_ozet)
VALUES('2025019996','Deneme','Kayıt','E','2006-01-01','Bilecik',1,50,dbo.tc_sifrele('53618033739'),dbo.tc_ozet('53618033739'))
--NOT: tc_kimlik_ozet kolonu için tanımlanan UQ_ogrenci_tc kısıtı nedeniyle aynı TC kimlik numarası ikinci kez eklenemez.
--ENCRYPTBYPASSPHRASE aynı numarayı her seferinde farklı şekilde şifreler. Aşağıdaki sorgu ile görülebilir:
SELECT dbo.tc_sifrele('53618033739') [1. Şifreleme], dbo.tc_sifrele('53618033739') [2. Şifreleme], dbo.tc_ozet('53618033739') [Özet]
--Bu nedenle UNIQUE kısıtı tc_kimlik_sifreli kolonuna tanımlansaydı aynı numaraya sahip kayıtlar engellenemezdi.
--Özet (hash) değeri ise aynı numara için her zaman aynı olduğundan benzersizlik bu kolon üzerinden sağlanır.




--17
DELETE FROM ogrenci WHERE id=22  --id değeri 10. sorudaki gibi bulunarak yazılmalıdır.
--NOT: ogrenci_detay, ders_kayit ve odunc tablolarındaki FOREIGN KEY kısıtları ON DELETE CASCADE olarak tanımlandığı için
--öğrenciye ait bu kayıtlar da otomatik olarak silinir.




-- WHERE koşul ifadesi bulunmadan uygulanan UPDATE ve DELETE sorgu örnekleri
-- !!! İLGİLİ SORGULAR TÜM KAYITLARI ETKİLER, UYGULANIRKEN DİKKATLİ OLUNMALIDIR !!!
-- Sayfanın tamamı çalıştırıldığında yanlışlıkla işletilmemeleri için yorum satırı olarak bırakılmıştır.

--UPDATE ogrenci SET ad='Ali', soyad='Veli'

--DELETE FROM ogrenci   --ON DELETE CASCADE nedeniyle ogrenci_detay, ders_kayit ve odunc tablolarındaki kayıtlar da silinir.
