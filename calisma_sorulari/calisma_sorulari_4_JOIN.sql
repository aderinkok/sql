/*
JOIN Örnekleri

Github'da bulunan veritabani/Kampus.sql dosyasının çalıştırılarak Kampus veritabanında çalışılması gerekmektedir.


*/


use Kampus;

/*

--- TEMEL: İki tablolu birleştirmeler ---
1- ogretim_elemani tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde her iki tablodada yalnızca eşleşen kayıtların listelendiği tabloları birleştirerek tüm kayıtları listeleyiniz.
2- ogretim_elemani tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde o tablosunda yalnızca eşleşen kayıtların, b tablosunda ise tüm kayıtların listelendiği tabloları birleştirerek tüm kayıtları listeleyiniz.
3- ogretim_elemani tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde b tablosunda yalnızca eşleşen kayıtların, o tablosunda ise tüm kayıtların listelendiği tabloları birleştirerek tüm kayıtları listeleyiniz.
4- ogretim_elemani tablosunu o takma adı ile ve bolum tablosunu b takma adı ile tüm kolonlar listelenecek şekilde eşleşen ya da eşleşmeyen kayıtların listelendiği tabloları birleştirerek tüm kayıtları listeleyiniz.
!!!DİKKAT!!!  1-2-3-4. soruların SQL ifadelerini ve çıktılarını iyice anlayana kadar inceleyiniz. !!!DİKKAT!!!
5- ogrenci (o takma adı ile) ve bolum (b takma adı ile) tablolarını kullanarak öğrencilerin ad, soyad ve bolum_adi bilgilerini yalnızca eşleşen kayıtlar ile listeleyiniz.
6- 5. sorudaki sorguyu bölümü olmayan (bolum_id değeri NULL olan) öğrenciler de listelenecek şekilde yazınız.
7- Hiç öğrencisi olmayan bölümlerin adlarını listeleyiniz.
8- Her bölümde kaç öğrenci olduğunu bolum_adi ile birlikte listeleyiniz. Öğrencisi olmayan bölümler 0 değeri ile listelenmelidir. ***

--- ORTA: Takma adlar, çoka çok ilişkiler ve eşleşmeyen kayıtlar ---
9-  kitap (k takma adı ile) ve kategori (kt takma adı ile) tablolarını kullanarak kitap_adi ve kategori_adi kolonlarını INNER JOIN ile listeleyiniz.
10- Kategorisi olmayan kitaplar ve hiç kitabı olmayan kategoriler de görünecek şekilde kitap_adi ve kategori_adi kolonlarını listeleyiniz.
11- Öğrencilerin ad ve soyadını "Öğrenci", danışmanlarının unvan, ad ve soyadını "Danışman" kolon adı ile birleştirerek listeleyiniz.
    (ogrenci.danisman_id -> ogretim_elemani.id)
12- Derslerin ders_kodu, ders_adi ve dersi veren öğretim elemanının ad ve soyad bilgisini listeleyiniz. Öğretim elemanı atanmamış dersler de listelenmelidir.
13- kitap (k), kitap_yazar (ky) ve yazar (y) tablolarını kullanarak kitap_adi ile yazarın ad ve soyad bilgisini listeleyiniz.
    Birden fazla yazarı olan kitaplar çıktıda kaç kez görünmektedir?
14- ogrenci (o), ders_kayit (dk) ve ders (d) tablolarını kullanarak öğrencilerin ad, soyad, ders_adi, vize ve final bilgilerini listeleyiniz.
15- Kütüphaneden hiç kitap ödünç almamış öğrencilerin ad ve soyad bilgilerini listeleyiniz.
16- Hiç ödünç verilmemiş kitapların kitap_adi bilgisini listeleyiniz.

--- İLERİ: Çok tablolu birleştirmeler, gruplama ve self join ---
17- Henüz iade edilmemiş kitapları; öğrencinin ad ve soyadı, kitap_adi ve odunc_tarihi bilgileri ile listeleyiniz.
18- Geç iade edilen (iade_tarihi değeri son_teslim_tarihi değerinden büyük olan) ödünç kayıtlarını öğrencinin ad ve soyadı, kitap_adi ve
    kaç gün geciktiğini gösteren "Gecikme (Gün)" kolonu ile gecikme süresine göre azalan sıralayarak listeleyiniz.
19- Her öğrencinin ödünç aldığı kitap sayısını ad ve soyad bilgisi ile listeleyiniz. Yalnızca 2'den fazla kitap ödünç alan öğrenciler listelenmelidir.
20- Her kategorideki kitapların toplam kaç kez ödünç alındığını kategori_adi ile listeleyiniz ve çoktan aza doğru sıralayınız.
21- Her dersin vize ve final ortalamasını ders_adi ile listeleyiniz. Hiç öğrencisi olmayan dersler de listelenmelidir.
    Hiç öğrencisi olmayan derslerin ortalama değerleri neden NULL gelmektedir?
22- "Bilgisayar Programcılığı" bölümündeki öğrencilerin ad, soyad ve aldıkları derslerin ders_adi bilgisini listeleyiniz. (4 tablo)
23- Doğum yeri aynı olan öğrenci çiftlerini listeleyiniz. Her çift yalnızca bir kez listelenmelidir. (SELF JOIN) ***
24- 1. sınıftaki öğrencilerin, ortak derslerle (bolum_id değeri NULL olan dersler) olası tüm eşleşmelerini CROSS JOIN ile listeleyiniz.
    Çıktıda kaç satır bulunur? Neden?
25- Öğrencilerin bölümlerine göre kütüphaneden kaç kez kitap ödünç alındığını bolum_adi ile listeleyiniz.
    Bölümü olmayan öğrencilerin ödünç işlemleri "Bölümsüz" olarak gösterilmelidir. ***

--- BİRE BİR (1:1) İLİŞKİ ve EK ÖRNEKLER ---
26- ogrenci (o) ve ogrenci_detay (od) tablolarını kullanarak öğrencilerin ad, soyad, telefon ve ikamet_ili bilgilerini yalnızca eşleşen kayıtlar ile listeleyiniz.
    Her öğrenci çıktıda en fazla kaç kez görünebilir? Neden?
27- Detay (ogrenci_detay) kaydı bulunmayan öğrencilerin ad ve soyad bilgilerini listeleyiniz.
28- Doğum yeri (dogum_yeri) ile ikamet ettiği il (ikamet_ili) farklı olan öğrencilerin ad, soyad, dogum_yeri ve ikamet_ili bilgilerini listeleyiniz.
29- Hem burslu hem de yurtta kalan öğrencilerin ad, soyad ve bolum_adi bilgilerini listeleyiniz. (3 tablo)
30- Her bölümdeki burslu öğrenci sayısını bolum_adi ile birlikte listeleyiniz.
31- "Abdulmelik Derinkök" isimli öğretim elemanının verdiği derse kayıtlı öğrencilerin ad, soyad, ders_adi, vize ve final bilgilerini listeleyiniz. (4 tablo)
32- J.R.R. Tolkien'in kitaplarını ve her bir kitabın kaç kez ödünç alındığını listeleyiniz. Hiç ödünç alınmamış kitaplar 0 değeri ile listelenmelidir. ***

*/

/* __________________ CEVAPLAR __________________ */

--1
SELECT * FROM ogretim_elemani o INNER JOIN bolum b ON o.bolum_id=b.id
SELECT * FROM ogretim_elemani o JOIN bolum b ON o.bolum_id=b.id
--NOT: JOIN ifadesi INNER JOIN ile aynı anlama gelir. Bölümü olmayan öğretim elemanı ve öğretim elemanı olmayan bölüm listelenmez.
--2
SELECT * FROM ogretim_elemani o RIGHT JOIN bolum b ON b.id=o.bolum_id
SELECT * FROM bolum b LEFT JOIN ogretim_elemani o ON b.id=o.bolum_id
--NOT: RIGHT JOIN sağdaki tablonun (bolum) tüm kayıtlarını getirir. Tabloların yeri değiştirildiğinde aynı sonuç LEFT JOIN ile elde edilir.
--3
SELECT * FROM ogretim_elemani o LEFT JOIN bolum b ON o.bolum_id=b.id
SELECT * FROM bolum b RIGHT JOIN ogretim_elemani o ON o.bolum_id=b.id
--NOT: LEFT JOIN soldaki tablonun (ogretim_elemani) tüm kayıtlarını getirir. Bölümü olmayan öğretim elemanının bolum kolonları NULL olur.
--4
SELECT * FROM ogretim_elemani o FULL JOIN bolum b ON o.bolum_id=b.id  --FULL JOIN her iki tablodaki eşleşen ve eşleşmeyen tüm kayıtları getirir.

--5
SELECT o.ad,o.soyad,b.bolum_adi FROM ogrenci o INNER JOIN bolum b ON o.bolum_id=b.id  --Bölümü olmayan (bolum_id NULL) öğrenci eşleşmediği için listelenmez.

--6
SELECT o.ad,o.soyad,b.bolum_adi FROM ogrenci o LEFT JOIN bolum b ON o.bolum_id=b.id  --Bölümü olmayan öğrencinin bolum_adi değeri NULL olarak listelenir.

--7
SELECT b.bolum_adi FROM bolum b LEFT JOIN ogrenci o ON b.id=o.bolum_id WHERE o.id IS NULL  --Eşleşen öğrencisi olmayan bölümlerde o.id değeri NULL olur.

--8
SELECT b.bolum_adi,COUNT(o.id) [Öğrenci Sayısı] FROM bolum b LEFT JOIN ogrenci o ON b.id=o.bolum_id GROUP BY b.bolum_adi
--NOT: COUNT(*) satır sayısını verdiği için öğrencisi olmayan bölüm 1 olarak görünür.
--COUNT(o.id) ise NULL olmayan değerleri saydığı için öğrencisi olmayan bölüm 0 olarak görünür.
SELECT b.bolum_adi,COUNT(*) FROM bolum b LEFT JOIN ogrenci o ON b.id=o.bolum_id GROUP BY b.bolum_adi

--9
SELECT k.kitap_adi,kt.kategori_adi FROM kitap k INNER JOIN kategori kt ON k.kategori_id=kt.id  --Kategorisi olmayan kitap ve kitabı olmayan kategori listelenmez.

--10
SELECT k.kitap_adi,kt.kategori_adi FROM kitap k FULL JOIN kategori kt ON k.kategori_id=kt.id
--NOT: Eşleşmeyen kayıtlarda karşı tablonun kolonu NULL olur ("Kampüs Rehberi" kitabının kategori_adi, "Şiir" kategorisinin kitap_adi değeri).

--11
SELECT o.ad+' '+o.soyad Öğrenci, oe.unvan+' '+oe.ad+' '+oe.soyad Danışman
FROM ogrenci o INNER JOIN ogretim_elemani oe ON o.danisman_id=oe.id
--NOT: Her iki tabloda da ad ve soyad kolonları bulunduğu için kolon adlarının önüne tablo takma adı yazılması zorunludur.
--Danışmanı olmayan öğrencilerin de listelenmesi için LEFT JOIN kullanılmalıdır.

--12
SELECT d.ders_kodu,d.ders_adi,oe.ad,oe.soyad FROM ders d LEFT JOIN ogretim_elemani oe ON d.ogretim_elemani_id=oe.id  --Öğretim elemanı atanmamış ders LEFT JOIN sayesinde listelenir.

--13
SELECT k.kitap_adi,y.ad,y.soyad FROM kitap k
INNER JOIN kitap_yazar ky ON k.id=ky.kitap_id
INNER JOIN yazar y ON y.id=ky.yazar_id
--NOT: "Kıyamet Gösterisi" ve "The C Programming Language" kitaplarının ikişer yazarı olduğu için çıktıda ikişer kez görünür.

--14
SELECT o.ad,o.soyad,d.ders_adi,dk.vize,dk.final FROM ogrenci o
INNER JOIN ders_kayit dk ON o.id=dk.ogrenci_id
INNER JOIN ders d ON d.id=dk.ders_id
--NOT: ders_kayit tablosu ogrenci ve ders tabloları arasındaki çoka çok (M:N) ilişkiyi kurar.

--15
SELECT o.ad,o.soyad FROM ogrenci o LEFT JOIN odunc od ON o.id=od.ogrenci_id WHERE od.id IS NULL  --Ödünç kaydı olmayan öğrencilerde od.id değeri NULL olur.

--16
SELECT k.kitap_adi FROM kitap k LEFT JOIN odunc od ON k.id=od.kitap_id WHERE od.id IS NULL  --Ödünç kaydı olmayan kitaplarda od.id değeri NULL olur.

--17
SELECT o.ad,o.soyad,k.kitap_adi,od.odunc_tarihi FROM odunc od
INNER JOIN ogrenci o ON o.id=od.ogrenci_id
INNER JOIN kitap k ON k.id=od.kitap_id
WHERE od.iade_tarihi IS NULL
--NOT: Birden fazla JOIN art arda yazılabilir; her JOIN kendi ON koşulu ile tanımlanır.

--18
SELECT o.ad,o.soyad,k.kitap_adi,DATEDIFF(DAY,od.son_teslim_tarihi,od.iade_tarihi) [Gecikme (Gün)] FROM odunc od
INNER JOIN ogrenci o ON o.id=od.ogrenci_id
INNER JOIN kitap k ON k.id=od.kitap_id
WHERE od.iade_tarihi>od.son_teslim_tarihi
ORDER BY [Gecikme (Gün)] DESC
--NOT: DATEDIFF(DAY, başlangıç, bitiş) iki tarih arasındaki gün farkını verir. ORDER BY ifadesinde takma ad kullanılabilir.

--19
SELECT o.ad,o.soyad,COUNT(*) [Kitap Sayısı] FROM ogrenci o
INNER JOIN odunc od ON o.id=od.ogrenci_id
GROUP BY o.id,o.ad,o.soyad
HAVING COUNT(*)>2
--NOT: Aynı ad ve soyada sahip farklı öğrencilerin tek grupta toplanmaması için o.id kolonu da gruplamaya eklenmiştir.

--20
SELECT kt.kategori_adi,COUNT(*) [Ödünç Sayısı] FROM odunc od
INNER JOIN kitap k ON k.id=od.kitap_id
INNER JOIN kategori kt ON kt.id=k.kategori_id
GROUP BY kt.kategori_adi
ORDER BY COUNT(*) DESC
--NOT: Kategorisi olmayan kitaplar INNER JOIN nedeniyle sayıma dahil edilmez.

--21
SELECT d.ders_adi,AVG(dk.vize) [Vize Ortalaması],AVG(dk.final) [Final Ortalaması] FROM ders d
LEFT JOIN ders_kayit dk ON d.id=dk.ders_id
GROUP BY d.ders_adi
--NOT: Hiç öğrencisi olmayan derslerde vize ve final değerleri NULL olur. AVG fonksiyonu NULL değerleri hesaba katmadığı için sonuç NULL gelir.
--Finale girmeyen (final değeri NULL olan) öğrenciler de final ortalamasına dahil edilmez.

--22
SELECT o.ad,o.soyad,d.ders_adi FROM bolum b
INNER JOIN ogrenci o ON b.id=o.bolum_id
INNER JOIN ders_kayit dk ON o.id=dk.ogrenci_id
INNER JOIN ders d ON d.id=dk.ders_id
WHERE b.bolum_adi='Bilgisayar Programcılığı'
--NOT: WHERE koşulu birleştirme (JOIN) işleminden sonra oluşan satırlara uygulanır.

--23
SELECT o1.ad+' '+o1.soyad [Öğrenci 1],o2.ad+' '+o2.soyad [Öğrenci 2],o1.dogum_yeri FROM ogrenci o1
INNER JOIN ogrenci o2 ON o1.dogum_yeri=o2.dogum_yeri AND o1.id<o2.id
ORDER BY o1.dogum_yeri
--NOT: o1.id<o2.id koşulu bir öğrencinin kendisi ile eşleşmesini ve aynı çiftin iki kez (A-B ve B-A) listelenmesini engeller.

--24
SELECT o.ad,o.soyad,d.ders_adi FROM ogrenci o CROSS JOIN ders d WHERE o.sinif=1 AND d.bolum_id IS NULL
--NOT: CROSS JOIN iki tablodaki kayıtların tüm olası eşleşmelerini üretir. 10 öğrenci x 3 ortak ders = 30 satır.

--25
SELECT ISNULL(b.bolum_adi,'Bölümsüz') Bölüm,COUNT(*) [Ödünç Sayısı] FROM odunc od
INNER JOIN ogrenci o ON o.id=od.ogrenci_id
LEFT JOIN bolum b ON b.id=o.bolum_id
GROUP BY b.bolum_adi
ORDER BY [Ödünç Sayısı] DESC
--NOT: ISNULL(kolon, değer) fonksiyonu kolon değeri NULL ise ikinci parametredeki değeri döndürür.
--Bölümü olmayan öğrencilerin ödünç kayıtlarının sayıma dahil edilmesi için bolum tablosu LEFT JOIN ile bağlanmıştır.

--26
SELECT o.ad,o.soyad,od.telefon,od.ikamet_ili FROM ogrenci o INNER JOIN ogrenci_detay od ON o.id=od.ogrenci_id
--NOT: ogrenci_detay.ogrenci_id kolonu UNIQUE olduğu için her öğrencinin en fazla bir detay kaydı vardır (bire bir ilişki).
--Bu nedenle bir öğrenci çıktıda en fazla bir kez görünür. Detay kaydı olmayan öğrenciler INNER JOIN ile listelenmez.

--27
SELECT o.ad,o.soyad FROM ogrenci o LEFT JOIN ogrenci_detay od ON o.id=od.ogrenci_id WHERE od.id IS NULL  --Detay kaydı olmayan öğrencilerde od.id değeri NULL olur.

--28
SELECT o.ad,o.soyad,o.dogum_yeri,od.ikamet_ili FROM ogrenci o INNER JOIN ogrenci_detay od ON o.id=od.ogrenci_id
WHERE o.dogum_yeri<>od.ikamet_ili
--NOT: Koşulda iki farklı tablonun kolonları birbiriyle karşılaştırılabilir.

--29
SELECT o.ad,o.soyad,b.bolum_adi FROM ogrenci o
INNER JOIN ogrenci_detay od ON o.id=od.ogrenci_id
INNER JOIN bolum b ON b.id=o.bolum_id
WHERE od.burslu=1 AND od.yurtta_kaliyor=1
--NOT: BIT türündeki kolonlarda 1 doğru (evet), 0 yanlış (hayır) anlamındadır.

--30
SELECT b.bolum_adi,COUNT(*) [Burslu Öğrenci Sayısı] FROM bolum b
INNER JOIN ogrenci o ON b.id=o.bolum_id
INNER JOIN ogrenci_detay od ON o.id=od.ogrenci_id
WHERE od.burslu=1
GROUP BY b.bolum_adi
--NOT: Önce WHERE ile burslu öğrenciler seçilir, ardından bölümlere göre gruplanır.

--31
SELECT o.ad,o.soyad,d.ders_adi,dk.vize,dk.final FROM ogretim_elemani oe
INNER JOIN ders d ON oe.id=d.ogretim_elemani_id
INNER JOIN ders_kayit dk ON d.id=dk.ders_id
INNER JOIN ogrenci o ON o.id=dk.ogrenci_id
WHERE oe.ad='Abdulmelik' AND oe.soyad='Derinkök'
--NOT: Tablolar ogretim_elemani -> ders -> ders_kayit -> ogrenci sırasıyla ilişkili kolonlar üzerinden birleştirilmiştir.

--32
SELECT k.kitap_adi,COUNT(od.id) [Ödünç Sayısı] FROM yazar y
INNER JOIN kitap_yazar ky ON y.id=ky.yazar_id
INNER JOIN kitap k ON k.id=ky.kitap_id
LEFT JOIN odunc od ON k.id=od.kitap_id
WHERE y.soyad='Tolkien'
GROUP BY k.kitap_adi
--NOT: Hiç ödünç alınmamış kitapların da listelenmesi için odunc tablosu LEFT JOIN ile bağlanmış ve COUNT(od.id) kullanılmıştır.
