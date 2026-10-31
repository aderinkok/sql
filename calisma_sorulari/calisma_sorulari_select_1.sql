/*

Çalışma Soruları - 1 (SELECT)
Örnekler için Kampus veritabanı kullanılacaktır. (veritabani/Kampus.sql betiği çalıştırılarak veritabanı oluşturulmalıdır.)
Sorular derste işlenen konu sırasına göre düzenlenmiştir. Her bölümde yalnızca o bölüme kadar işlenen konular kullanılmıştır.
Her bölümdeki sorular farklı tablolar üzerinde ve kolaydan zora doğru sıralanmıştır. *** ile işaretlenen sorular ileri düzeydedir.

Konu sırası:
1- SELECT                                                                                         (1-9)
2- ORDER BY                                                                                       (10-19)
3- DISTINCT, TOP                                                                                  (20-32)
4- WHERE, AND, OR, LIKE                                                                           (33-59)
5- Takma ad, toplama (aggregate) fonksiyonları, GROUP BY, HAVING, BETWEEN, IN, NOT, NULL,
   sütun birleştirme, yorum satırı                                                                (60-124)
6- Ek: Fonksiyonlar ve şifreli TC kimlik numarası                                                 (125-137)
Vize sonrası konular: JOIN (calisma_sorulari_4_JOIN.sql), INSERT/UPDATE/DELETE (calisma_sorulari_insert_update_delete.sql),
CREATE/ALTER/DROP (calisma_sorulari_3.sql)


--- 1. SELECT (1-9) ---
1-  ogrenci tablosundaki tüm kayıtları listeleyen SQL ifadesini yazınız.
2-  kitap tablosundaki tüm kayıtları listeleyen SQL ifadesini yazınız.
3-  ogrenci tablosundaki ad, soyad ve ortalama kolonlarını listeleyiniz.
4-  kitap tablosundaki kitap_adi, yayinevi ve sayfa_sayisi kolonlarını listeleyiniz.
5-  ogretim_elemani tablosundaki unvan, ad ve soyad kolonlarını listeleyiniz.
6-  ders tablosundaki ders_kodu, ders_adi ve kredi kolonlarını listeleyiniz.
7-  ogrenci tablosundaki soyad ve ad kolonlarını bu sırayla (önce soyad) listeleyiniz.
8-  odunc tablosundaki kitap_id, ogrenci_id ve odunc_tarihi kolonlarını listeleyiniz.
9-  "select ad,soyad from ogrenci" ve "SELECT ad,soyad FROM OGRENCI" sorgularını çalıştırınız. İkinci sorguda hata alınmasının sebebi nedir? ***

--- 2. ORDER BY (10-19) ---
10- ogrenci tablosundaki ad,soyad kolonlarını ad kolonuna göre artan sıralayarak listeleyiniz.
11- ogrenci tablosundaki ad,soyad kolonlarını soyad kolonuna göre azalan sıralayarak listeleyiniz.
12- ogrenci tablosundaki kayıtları ortalama değerine göre azalan sıralayarak listeleyiniz.
13- kitap tablosundaki kitap_adi ve sayfa_sayisi kolonlarını sayfa_sayisi kolonuna göre azalan sıralayarak listeleyiniz.
14- ogretim_elemani tablosundaki unvan, ad ve soyad kolonlarını unvan kolonuna göre artan, aynı unvana sahip kayıtları ise soyad kolonuna göre artan sıralayarak listeleyiniz.
15- ders tablosundaki ders_adi ve kredi kolonlarını kredi kolonuna göre azalan, aynı krediye sahip dersleri ders_adi kolonuna göre artan sıralayarak listeleyiniz.
16- odunc tablosundaki kayıtları odunc_tarihi kolonuna göre en yeniden en eskiye doğru sıralayarak listeleyiniz.
17- yazar tablosundaki ad, soyad ve dogum_yili kolonlarını en yaşlı yazardan en genç yazara doğru sıralayarak listeleyiniz.
18- ogrenci tablosundaki yalnızca ad ve soyad kolonlarını ortalama değerine göre azalan sıralayarak listeleyiniz.
19- ogrenci tablosundaki ad, soyad ve ortalama kolonlarını, ORDER BY ifadesinde kolon adı yerine kolonun SELECT ifadesindeki sıra numarasını kullanarak
    ortalama değerine göre azalan sıralayınız. ***

--- 3. DISTINCT, TOP (20-32) ---
20- ogrenci tablosundaki dogum_yeri kolonundaki verileri benzersiz olarak listeleyiniz.
21- ogrenci tablosundaki sinif kolonundaki verileri benzersiz olarak listeleyiniz.
22- kitap tablosundaki yayinevi kolonundaki verileri benzersiz olarak listeleyiniz.
23- ogretim_elemani tablosundaki unvan kolonundaki verileri benzersiz olarak listeleyiniz.
24- kitap tablosundaki dil kolonundaki verileri benzersiz olarak ve alfabetik sıralayarak listeleyiniz.
25- ogrenci tablosundaki dogum_yeri ve sinif kolonlarını birlikte benzersiz olarak listeleyiniz. Çıktıda neden aynı şehir birden fazla kez yer almaktadır? ***
26- ogrenci tablosundaki ilk 5 kaydı listeleyiniz.
27- ogrenci tablosundaki ilk 3 kaydı id kolonuna göre azalan sıralayarak listeleyiniz.
28- Ortalaması en yüksek 3 öğrencinin ad, soyad ve ortalama bilgilerini listeleyiniz.
29- kitap tablosunda sayfa sayısı en fazla olan kitabın kitap_adi ve sayfa_sayisi bilgilerini listeleyiniz.
30- odunc tablosunda en son yapılan 3 ödünç işlemini listeleyiniz.
31- Ortalaması en yüksek 5 öğrencinin ad, soyad ve ortalama bilgilerini, 5. sıradaki öğrenci ile aynı ortalamaya sahip öğrenciler de listelenecek şekilde listeleyiniz. ***
32- kitap tablosundaki kitapların sayfa sayısı en fazla olan %20'sini kitap_adi ve sayfa_sayisi bilgileri ile listeleyiniz. ***

--- 4. WHERE, AND, OR, LIKE (33-59) ---
33- kitap tablosunda stokta bulunmayan (stok değeri 0 olan) kitapları listeleyiniz.
34- kitap tablosunda dil değeri "Türkçe" olmayan kitapları listeleyiniz.
35- ders tablosunda kredi değeri 4 olan derslerin ders_kodu ve ders_adi bilgilerini listeleyiniz.
36- ogrenci tablosunda 1. sınıfta olan öğrencilerin ad ve soyad bilgilerini ad kolonuna göre sıralayarak listeleyiniz.
37- ogretim_elemani tablosunda 2015 yılı ve sonrasında işe başlayan öğretim elemanlarının ad, soyad ve ise_baslama bilgilerini işe başlama tarihine göre
    eskiden yeniye sıralayarak listeleyiniz.
38- ogrenci_detay tablosunda burslu olan öğrencilerin ogrenci_id, telefon ve ikamet_ili bilgilerini listeleyiniz.
39- yazar tablosunda Türkiye dışındaki ülkelerden olan yazarların ad, soyad ve ulke bilgilerini ulke kolonuna göre sıralayarak listeleyiniz.
40- odunc tablosunda geç iade edilen (iade_tarihi değeri son_teslim_tarihi değerinden büyük olan) kayıtları listeleyiniz.
41- ders_kayit tablosunda vize notu 50'den küçük olan kayıtları vize notuna göre artan sıralayarak listeleyiniz.
42- ogrenci tablosunda ortalama değeri 60 ile 80 arasında olan kayıtları listeleyiniz.
43- ogrenci tablosunda ortalama değeri 60 ile 80 arasında olan (uç değerler DAHİL) kayıtları listeleyiniz.
44- ogrenci tablosunda soyadı "Kaya", "Demir" veya "Yıldız" olan kayıtları listeleyiniz.
45- ogrenci tablosunda soyadı "Kaya", "Demir" veya "Yıldız" olmayan kayıtları listeleyiniz.
46- ders_kayit tablosunda hem vize hem de final notu 80 veya üzeri olan kayıtları listeleyiniz.
47- ogrenci tablosunda 2. sınıfta olan, doğum yeri Bilecik olan ve ortalaması 70'ten büyük veya 50'den küçük olan kayıtları listeleyiniz. ***
48- kitap tablosunda yayınevi "Can Yayınları" veya "İthaki Yayınları" olan ve sayfa sayısı 300'den az olan kitapları listeleyiniz. ***
49- ogrenci tablosunda adı a ile başlayan kayıtları listeleyiniz.
50- ogrenci tablosunda adı a ile başlayan kayıtları ad kolonuna göre azalan sıralayarak listeleyiniz.
51- ogrenci tablosunda adının ikinci harfi "e" olan öğrencileri listeleyiniz.
52- ogrenci tablosunda soyadı "an" ile biten öğrencileri listeleyiniz.
53- kitap tablosunda kitap_adi değeri en az iki kelimeden oluşan (boşluk içeren) kitapları listeleyiniz.
54- ders tablosunda ders_kodu "BP" ile başlayan dersleri listeleyiniz.
55- ogrenci_detay tablosunda adres bilgisinde "Yurdu" ifadesi geçen kayıtların ogrenci_id ve adres bilgilerini listeleyiniz.
56- ogrenci tablosunda doğum yeri B veya E harfi ile başlayan öğrencilerin ad, soyad ve dogum_yeri bilgilerini köşeli parantez [ ] kullanarak listeleyiniz.
57- ogrenci tablosunda adı A ile E arasındaki (A ve E dahil) bir harf ile başlayan öğrencileri ad kolonuna göre sıralayarak listeleyiniz.
    Çıktıda "Çağla" kaydının yer almasının sebebi nedir? ***
58- ogrenci tablosunda adı "i" harfi ile başlayan öğrencileri listeleyiniz. Çıktıda "Işıl" kaydının neden bulunmadığını açıklayınız. ***
59- Soyadı K harfi ile başlamayan ve soyadında a harfi bulunan öğrencileri listelemek için SELECT * FROM ogrenci WHERE soyad LIKE '[^K]%a%'
    sorgusu yazılmıştır. Sorgunun çıktısında "Aydın" ve "Aksoy" soyadlı öğrenciler neden bulunmamaktadır? Sorguyu doğru sonucu verecek şekilde düzenleyiniz. ***

--- 5. TAKMA AD, TOPLAMA FONKSİYONLARI, GROUP BY, HAVING, BETWEEN, IN, NOT, NULL, SÜTUN BİRLEŞTİRME, YORUM SATIRI (60-124) ---
-- Takma ad (60-62)
60- ogrenci tablosundaki ad ve soyad kolonlarını "Adı" ve "Soyadı" takma adları ile listeleyiniz.
61- kitap tablosundaki kitap_adi ve sayfa_sayisi kolonlarını "Kitap Adı" ve "Sayfa Sayısı" takma adları ile listeleyiniz.
62- ders tablosundaki ders_kodu ve kredi kolonlarını "Kod" ve "Kredi" takma adları ile, takma adı kullanarak krediye göre azalan sıralayınız.
-- Toplama (aggregate) fonksiyonları (63-69)
63- ogrenci tablosundaki toplam kayıt sayısını "Toplam" kolon adı ile listeleyiniz.
64- dogum_yeri "Bilecik" olan öğrencilerin en yüksek ortalamasını listeleyen SQL ifadesini yazınız.
65- dogum_yeri "Eskişehir" olan öğrencilerin en yüksek ortalamasını "En Yüksek" kolon adı ile listeleyen SQL ifadesini yazınız.
66- Adı a ile başlayan öğrencilerin ortalama değerlerinin ortalamasını "Ortalama" kolon adı ile listeleyiniz.
67- kitap tablosundaki en az sayfa sayısını, en fazla sayfa sayısını ve toplam stok sayısını "En Az", "En Fazla" ve "Toplam Stok" kolon adları ile listeleyiniz.
68- ders tablosunda ders_kodu "BP" ile başlayan derslerin toplam kredisini "Toplam Kredi" kolon adı ile listeleyiniz.
69- ogrenci tablosundaki dogum_yeri kolonunda kaç farklı şehir bulunduğunu listeleyiniz.
-- GROUP BY (70-83)
70- ogrenci tablosunda her bir dogum_yeri değerinde kaç kayıt olduğunu listeleyiniz.
71- Her bir dogum_yeri değerinde kaç kayıt olduğunu "Kişi" kolon adıyla, dogum_yeri kolonunu "Memleket" kolon adıyla listeleyiniz.
72- Her bir cinsiyet değerinde kaç öğrenci olduğunu ve öğrencilerin ortalamalarının ortalamasını listeleyiniz.
73- Her bir sınıftaki en yüksek ve en düşük ortalamayı "En Yüksek" ve "En Düşük" kolon adları ile listeleyiniz.
74- ogrenci tablosunda her bir bolum_id değerinde kaç öğrenci olduğunu listeleyiniz.
75- ogrenci tablosunda bolum_id değeri 1 veya 2 olan kayıtları bolum_id kolonuna göre gruplayınız ve her bölümde kaç kişi olduğunu listeleyiniz.
76- ogretim_elemani tablosunda her bir unvanda kaç öğretim elemanı olduğunu listeleyiniz.
77- kitap tablosunda her bir yayınevinde kaç kitap olduğunu kitap sayısına göre azalan sıralayarak listeleyiniz.
78- kitap tablosunda her bir yayınevindeki kitapların toplam sayfa sayısını "Toplam Sayfa" kolon adı ile listeleyiniz.
79- ders tablosunda her bir bolum_id değerinde kaç ders bulunduğunu ve bu derslerin toplam kredisini listeleyiniz.
80- ders_kayit tablosunda her bir ders_id değerindeki kayıt sayısını, vize ortalamasını ve final ortalamasını listeleyiniz.
81- odunc tablosunda her öğrencinin (ogrenci_id) kaç kez kitap ödünç aldığını ödünç sayısına göre azalan sıralayarak listeleyiniz.
82- ogrenci_detay tablosunda her bir kan grubunda kaç öğrenci olduğunu listeleyiniz.
83- odunc tablosunda en çok ödünç alınan 4 kitabın kitap_id değerini ve ödünç alınma sayısını listeleyiniz.
    Ödünç sayısı 4. sıradaki kitapla eşit olan kitapların da listelenmesi için sorgu nasıl yazılmalıdır? ***
-- HAVING (84-88)
84- Her bir dogum_yeri değerinde kaç kayıt olduğunu "Kişi" kolon adıyla, dogum_yeri kolonunu "Memleket" kolon adıyla ancak kayıt sayısı ("Kişi" takma adlı kolon değeri)
    4 veya üstü bir değerde ise listeleyiniz.
85- kitap tablosunda kitap sayısı 3 veya daha fazla olan yayınevlerini kitap sayıları ile birlikte listeleyiniz.
86- ders_kayit tablosunda final ortalaması 75'ten büyük olan derslerin ders_id değerini ve final ortalamasını listeleyiniz.
87- odunc tablosunda 2'den fazla kitap ödünç alan öğrencilerin ogrenci_id değerini ve ödünç sayısını listeleyiniz.
88- kitap tablosunda yalnızca dili "Türkçe" olan kitaplar dikkate alındığında toplam sayfa sayısı 700'den fazla olan yayınevlerini
    toplam sayfa sayısı ile birlikte listeleyiniz. ***
-- BETWEEN (89-94)
89- ogrenci tablosunda ortalama değeri 60 ile 80 arasında olan kayıtları BETWEEN ile listeleyiniz.
90- ogrenci tablosunda ortalama değeri 60 ile 80 arasında olan (uç değerler DAHİL) kayıtları BETWEEN ile listeleyiniz.
91- kitap tablosunda basim_yili 2018 ile 2020 arasında (uç değerler DAHİL) olan kitapları basım yılına göre sıralayarak listeleyiniz.
92- odunc tablosunda 2025 yılının Ekim ayında (2025-10-01 ile 2025-10-31 tarihleri arasında) yapılan ödünç işlemlerini listeleyiniz.
93- yazar tablosunda 1900 ile 1950 yılları arasında (uç değerler DAHİL) doğan yazarların her ülkedeki sayısını listeleyiniz.
94- ogrenci tablosunda adı A ile C harfleri arasında olan öğrencileri listelemek için "WHERE ad BETWEEN 'A' AND 'C'" koşulu yazılmıştır.
    Çıktıda "Can" ve "Çağla" kayıtları neden bulunmamaktadır? ***
-- IN (95-99)
95- ogrenci tablosunda soyadı "Kaya", "Demir" veya "Yıldız" olan kayıtları IN kullanarak listeleyiniz.
96- ogrenci tablosunda bolum_id değeri 1 veya 2 olan kayıtları IN kullanarak bolum_id kolonuna göre gruplayınız ve her bölümde kaç kişi olduğunu listeleyiniz.
97- kitap tablosunda yayınevi "Can Yayınları" veya "İthaki Yayınları" olan kitapları IN kullanarak listeleyiniz.
98- ders tablosunda ders_kodu "BP101", "BP102" veya "TD101" olan dersleri listeleyiniz.
99- odunc tablosunda ogrenci_id değeri 1, 2 veya 3 olan ödünç kayıtlarını ogrenci_id kolonuna göre sıralayarak listeleyiniz.
-- NOT (100-104)
100- ogrenci tablosunda soyadı "Kaya", "Demir" veya "Yıldız" olmayan kayıtları IN kullanarak listeleyiniz.
101- kitap tablosunda kitap_adi değeri tek kelimeden oluşan (boşluk içermeyen) kitapları LIKE kullanarak listeleyiniz.
102- ogrenci tablosunda ortalama değeri 50 ile 80 arasında OLMAYAN kayıtları BETWEEN kullanarak listeleyiniz.
103- ogrenci tablosunda doğum yeri Bilecik olmayan öğrencileri NOT operatörünü koşulun başında kullanarak listeleyiniz.
104- ders tablosunda ders_kodu "BP" ile başlamayan ve kredisi 3 veya daha fazla olan dersleri listeleyiniz.
-- NULL (105-113)
105- ogrenci tablosunda eposta bilgisi bulunmayan (NULL olan) öğrencileri listeleyiniz.
106- ogrenci tablosunda "SELECT * FROM ogrenci WHERE eposta = NULL" sorgusu neden hiçbir kayıt getirmemektedir? ***
107- kitap tablosunda kategori_id değeri NULL olan kitapları listeleyiniz.
108- ogretim_elemani tablosunda bolum_id değeri NULL olan öğretim elemanlarının ad ve soyad bilgilerini listeleyiniz.
109- ders tablosunda öğretim elemanı atanmamış (ogretim_elemani_id değeri NULL olan) dersleri listeleyiniz.
110- ders_kayit tablosunda final notu girilmemiş (final değeri NULL olan) kayıtları listeleyiniz.
111- odunc tablosunda henüz iade edilmemiş kitaplara ait ödünç kayıtlarını listeleyiniz.
112- odunc tablosunda iade edilmiş kitaplara ait ödünç kayıtlarını iade tarihine göre sıralayarak listeleyiniz.
113- ders_kayit tablosunda COUNT(*) ve COUNT(final) ifadelerinin sonuçlarını aynı sorgu ile listeleyiniz. Sonuçlar neden farklıdır? ***
-- Sütun birleştirme ve hesaplanmış kolonlar (114-121)
114- ogrenci tablosundaki ad ve soyad kolonlarını birleştirerek "İsim" kolon adı ile listeleyiniz.
115- ogretim_elemani tablosundaki unvan, ad ve soyad kolonlarını aralarında birer boşluk bırakarak birleştiriniz ve "Öğretim Elemanı" kolon adı ile listeleyiniz.
116- kitap tablosundaki kitap_adi ve yayinevi kolonlarını "Kürk Mantolu Madonna (Yapı Kredi Yayınları)" biçiminde birleştirerek "Künye" kolon adı ile listeleyiniz.
117- yazar tablosundaki ad ve soyad kolonlarını birleştirerek "Yazar" kolon adı ile listeleyiniz ve sonucu takma ada göre sıralayınız.
118- ogrenci tablosundaki ad ve eposta kolonlarını aralarında bir boşluk bırakarak birleştiriniz. Bazı satırlarda sonucun NULL olmasının sebebi nedir? ***
119- kitap tablosunda sayfa sayısı 300'den fazla olan kitapların kitap_adi, sayfa_sayisi ve "Günde 20 sayfa okunursa kaç günde biteceğini" gösteren
     okuma_suresi kolonunu, okuma_suresi değerine göre azalan sıralayarak listeleyiniz.
120- ders_kayit tablosundaki kayıtların ogrenci_id, ders_id, vize ve final bilgilerini; vize notunun %40'ı ile final notunun %60'ı toplanarak hesaplanan
     "Başarı Notu" kolonu ile listeleyiniz.
121- 120. soruda hesaplanan başarı notu 60 veya üzeri olan kayıtları başarı notuna göre azalan sıralayarak listeleyiniz. ***
-- Yorum satırı (122-124)
122- ogrenci tablosundaki ad, soyad ve ortalama kolonlarını listeleyen sorguyu, soyad kolonu sorguda yazılı kalacak ancak listelenmeyecek şekilde
     tek satırlık yorum (--) kullanarak düzenleyiniz.
123- "SELECT * FROM ogrenci WHERE sinif=1 ORDER BY ad" sorgusundaki WHERE koşulunu silmeden, çok satırlık yorum (/* */) kullanarak devre dışı bırakınız.
124- kitap tablosundaki stoku 0 olan kitapları listeleyen sorgunun üstüne, sorgunun ne yaptığını açıklayan tek satırlık ve çok satırlık birer yorum ekleyiniz.

--- 6. EK: FONKSİYONLAR VE ŞİFRELİ TC KİMLİK NUMARASI (125-137) --- (Fonksiyonlar için fonksiyonlar klasörüne, TC kimlik numarası için Kampus.sql açıklamalarına bakınız.)
125- ogretim_elemani tablosunda 2015 yılı ve sonrasında işe başlayan öğretim elemanlarını YEAR fonksiyonu kullanarak listeleyiniz.
126- Öğretim elemanlarının ad, soyad ve 2025-09-01 tarihine göre kaç yıllık çalışan olduklarını "Kıdem (Yıl)" kolon adı ile listeleyiniz. ***
127- odunc tablosunda iade edilmiş kayıtların kitap_id ve ogrenci_id bilgilerini, kitabın kaç günde iade edildiğini gösteren "Süre (Gün)" kolonu ile listeleyiniz.
128- ogrenci_detay tablosunda her bir ikamet_ili değerinde kaç öğrenci olduğunu ve bu öğrencilerden kaçının yurtta kaldığını listeleyiniz. ***
129- ogrenci tablosundaki ad ve eposta bilgilerini listeleyiniz; eposta bilgisi bulunmayan öğrenciler için "E-posta yok" yazdırınız.
130- ogrenci tablosundaki ad ve ortalama kolonlarını "Ahmet : 72" biçiminde birleştirerek listeleyiniz. ad+' : '+ortalama ifadesi neden hata verir? ***
131- ogrenci tablosundaki ad, soyad, tc_kimlik_sifreli ve tc_kimlik_ozet kolonlarını listeleyiniz. TC kimlik numaraları neden okunamamaktadır?
132- Öğrencilerin ad, soyad ve şifresi çözülmüş TC kimlik numaralarını "TC Kimlik No" kolon adı ile listeleyiniz.
133- 132. sorudaki sorguyu fonksiyon adının önüne dbo. yazmadan çalıştırınız. Hata alınmasının sebebi nedir?
     Tablo adının önüne dbo. yazılması (dbo.ogrenci) sonucu değiştirir mi? ***
134- TC kimlik numarası 57683474374 olan öğrencinin ad ve soyad bilgisini tc_kimlik_ozet kolonunu kullanarak listeleyiniz.
135- 134. sorudaki öğrenciyi tc_kimlik_sifreli kolonundaki değeri çözerek bulunuz. 134. ve 135. sorulardaki yöntemlerden hangisi daha hızlıdır? Neden? ***
136- '53618033739', '12345678901' ve '11111111110' numaralarının kurala uygun olup olmadığını dbo.tc_gecerli fonksiyonu ile listeleyiniz.
137- ogretim_elemani tablosunda TC kimlik numarası 73465299544 olan kaydın unvan, ad ve soyad bilgisini listeleyiniz.
*/

/*Cevaplar*/

USE Kampus  --Komutlar çalışmazsa üzerinde işlem yapılacak veritabanına geçiş yapılmalıdır.


/* ===================== 1. SELECT ===================== */

--1
SELECT * FROM ogrenci  --* ifadesi tablodaki tüm kolonları listeler.

--2
SELECT * FROM kitap

--3
SELECT ad,soyad,ortalama FROM ogrenci  --Yalnızca listelenmesi istenen kolonlar aralarına virgül konularak yazılır.

--4
SELECT kitap_adi,yayinevi,sayfa_sayisi FROM kitap

--5
SELECT unvan,ad,soyad FROM ogretim_elemani

--6
SELECT ders_kodu,ders_adi,kredi FROM ders

--7
SELECT soyad,ad FROM ogrenci  --Kolonlar SELECT ifadesinde yazıldıkları sırayla listelenir; tablodaki sıra ile aynı olmak zorunda değildir.

--8
SELECT kitap_id,ogrenci_id,odunc_tarihi FROM odunc

--9
select ad,soyad from ogrenci
SELECT ad,soyad FROM OGRENCI
--NOT: SQL komutları (SELECT, FROM...) büyük/küçük harf duyarsızdır. Tablo ve kolon adları ise veritabanının karşılaştırma kurallarına göre değerlendirilir.
--Kampus veritabanı Türkçe kurallar (Turkish_CI_AS) ile oluşturulduğu için "I" harfinin küçüğü "ı" kabul edilir; OGRENCI ifadesi "ogrencı" olarak
--değerlendirilir ve "Invalid object name 'OGRENCI'" hatası alınır. Bu nedenle tablo ve kolon adları oluşturuldukları gibi yazılmalıdır.


/* ===================== 2. ORDER BY ===================== */

--10
SELECT ad,soyad FROM ogrenci ORDER BY ad ASC
SELECT ad,soyad FROM ogrenci ORDER BY ad  --Varsayılan sıralama yönü ASC (artan) olduğu için iki sorgu aynı çıktıyı verir.

--11
SELECT ad,soyad FROM ogrenci ORDER BY soyad DESC  --DESC azalan sıralama yapar.

--12
SELECT * FROM ogrenci ORDER BY ortalama DESC
--NOT: ortalama değeri aynı olan kayıtların (Örn: 80) kendi aralarındaki sırası garanti edilmez.

--13
SELECT kitap_adi,sayfa_sayisi FROM kitap ORDER BY sayfa_sayisi DESC

--14
SELECT unvan,ad,soyad FROM ogretim_elemani ORDER BY unvan,soyad
--NOT: ORDER BY ifadesinde birden fazla kolon yazılabilir. İkinci kolon yalnızca birinci kolondaki değerleri aynı olan kayıtları sıralar.

--15
SELECT ders_adi,kredi FROM ders ORDER BY kredi DESC,ders_adi ASC  --Her kolon için sıralama yönü ayrı ayrı belirtilebilir.

--16
SELECT * FROM odunc ORDER BY odunc_tarihi DESC  --Tarih kolonlarında DESC en yeni tarihten en eskiye doğru sıralar.

--17
SELECT ad,soyad,dogum_yili FROM yazar ORDER BY dogum_yili  --Doğum yılı en küçük olan yazar en yaşlı yazardır.

--18
SELECT ad,soyad FROM ogrenci ORDER BY ortalama DESC  --Sıralama, SELECT ifadesinde listelenmeyen bir kolona göre de yapılabilir.

--19
SELECT ad,soyad,ortalama FROM ogrenci ORDER BY 3 DESC
--NOT: 3 değeri SELECT ifadesindeki 3. kolonu (ortalama) ifade eder. Kolon sırası değiştiğinde sıralama da değişeceği için kolon adı kullanılması önerilir.


/* ===================== 3. DISTINCT, TOP ===================== */

--20
SELECT DISTINCT dogum_yeri FROM ogrenci  --DISTINCT tekrar eden değerleri bir kez listeler.

--21
SELECT DISTINCT sinif FROM ogrenci

--22
SELECT DISTINCT yayinevi FROM kitap

--23
SELECT DISTINCT unvan FROM ogretim_elemani

--24
SELECT DISTINCT dil FROM kitap ORDER BY dil

--25
SELECT DISTINCT dogum_yeri,sinif FROM ogrenci
--NOT: DISTINCT birden fazla kolon ile kullanıldığında kolonların birlikte oluşturduğu tekrarsız kombinasyonları listeler.
--Bilecik doğumlu hem 1. hem de 2. sınıf öğrencileri bulunduğu için "Bilecik - 1" ve "Bilecik - 2" ayrı satırlar olarak listelenir.

--26
SELECT TOP 5 * FROM ogrenci
--NOT: ORDER BY kullanılmadığında hangi kayıtların "ilk" kayıtlar olarak listeleneceği garanti edilmez.

--27
SELECT TOP 3 * FROM ogrenci ORDER BY id DESC  --Önce sıralama yapılır, ardından ilk 3 kayıt alınır.

--28
SELECT TOP 3 ad,soyad,ortalama FROM ogrenci ORDER BY ortalama DESC

--29
SELECT TOP 1 kitap_adi,sayfa_sayisi FROM kitap ORDER BY sayfa_sayisi DESC

--30
SELECT TOP 3 * FROM odunc ORDER BY odunc_tarihi DESC

--31
SELECT TOP 5 ad,soyad,ortalama FROM ogrenci ORDER BY ortalama DESC
SELECT TOP 5 WITH TIES ad,soyad,ortalama FROM ogrenci ORDER BY ortalama DESC
--NOT: 5. sıradaki ortalama (80) iki öğrenciye aittir. TOP 5 bu öğrencilerden yalnızca birini getirir ve hangisinin geleceği garanti edilmez.
--WITH TIES ifadesi son sıradaki değere eşit olan tüm kayıtları da listeler (6 kayıt). WITH TIES ifadesi ORDER BY ile birlikte kullanılmalıdır.

--32
SELECT TOP 20 PERCENT kitap_adi,sayfa_sayisi FROM kitap ORDER BY sayfa_sayisi DESC  --PERCENT kayıt sayısının yüzdesini alır (25 kitabın %20'si = 5 kitap).


/* ===================== 4. WHERE, AND, OR, LIKE ===================== */

--33
SELECT * FROM kitap WHERE stok=0  --Sayısal değerler tırnak içinde yazılmaz.

--34
SELECT * FROM kitap WHERE dil!='Türkçe'
SELECT * FROM kitap WHERE dil<>'Türkçe'  --!= ve <> operatörleri aynı anlama gelir. Metin değerleri tek tırnak içinde yazılır.

--35
SELECT ders_kodu,ders_adi FROM ders WHERE kredi=4

--36
SELECT ad,soyad FROM ogrenci WHERE sinif=1 ORDER BY ad  --ORDER BY ifadesi WHERE ifadesinden sonra yazılır.

--37
SELECT ad,soyad,ise_baslama FROM ogretim_elemani WHERE ise_baslama>='2015-01-01' ORDER BY ise_baslama
--NOT: Tarih değerleri 'YYYY-AA-GG' biçiminde tek tırnak içinde yazılır ve sayılar gibi karşılaştırılabilir.

--38
SELECT ogrenci_id,telefon,ikamet_ili FROM ogrenci_detay WHERE burslu=1  --BIT türündeki kolonlarda 1 doğru (evet), 0 yanlış (hayır) anlamındadır.

--39
SELECT ad,soyad,ulke FROM yazar WHERE ulke<>'Türkiye' ORDER BY ulke

--40
SELECT * FROM odunc WHERE iade_tarihi>son_teslim_tarihi  --Bir kolon sabit bir değer yerine başka bir kolon ile karşılaştırılabilir.

--41
SELECT * FROM ders_kayit WHERE vize<50 ORDER BY vize

--42
SELECT * FROM ogrenci WHERE ortalama>60 AND ortalama<80  -- ">" ve "<" operatörleri uç değerleri dahil etmez.

--43
SELECT * FROM ogrenci WHERE ortalama>=60 AND ortalama<=80  -- ">=" ve "<=" operatörleri uç değerleri dahil eder.

--44
SELECT * FROM ogrenci WHERE soyad='Kaya' OR soyad='Demir' OR soyad='Yıldız'  --Koşullardan birinin sağlanması yeterli olduğu için OR kullanılır.

--45
SELECT * FROM ogrenci WHERE soyad!='Kaya' AND soyad!='Demir' AND soyad!='Yıldız'  --Değerlerin hiçbirine eşit olmaması istendiği için AND kullanılır.

--46
SELECT * FROM ders_kayit WHERE vize>=80 AND final>=80  --AND ile bağlanan koşulların tamamı sağlanmalıdır.

--47
SELECT * FROM ogrenci WHERE sinif=2 AND dogum_yeri='Bilecik' AND (ortalama>70 OR ortalama<50)
--NOT: Parantez kullanılmazsa AND işlemi önce yapılır ve ortalaması 50'den küçük olan TÜM öğrenciler de listelenir.
--Aşağıdaki hatalı sorgunun çıktısını yukarıdaki sorgunun çıktısı ile karşılaştırınız.
SELECT * FROM ogrenci WHERE sinif=2 AND dogum_yeri='Bilecik' AND ortalama>70 OR ortalama<50

--48
SELECT * FROM kitap WHERE (yayinevi='Can Yayınları' OR yayinevi='İthaki Yayınları') AND sayfa_sayisi<300
--NOT: Parantez kullanılmazsa koşul "Can Yayınları'nın tüm kitapları VEYA İthaki Yayınları'nın 300 sayfadan az kitapları" olarak işletilir.
SELECT * FROM kitap WHERE yayinevi='Can Yayınları' OR yayinevi='İthaki Yayınları' AND sayfa_sayisi<300  --Hatalı sorgu: 352 sayfalık "1984" de listelenir.

--49
SELECT * FROM ogrenci WHERE ad LIKE 'a%'
--NOT: % işareti herhangi sayıda (sıfır dahil) karakteri temsil eder. Veritabanı büyük/küçük harf duyarsız (CI) olduğu için "Ahmet" gibi kayıtlar da listelenir.

--50
SELECT * FROM ogrenci WHERE ad LIKE 'a%' ORDER BY ad DESC

--51
SELECT * FROM ogrenci WHERE ad LIKE '_e%'  --_ (alt çizgi) tam olarak bir karakteri temsil eder.

--52
SELECT * FROM ogrenci WHERE soyad LIKE '%an'  --'%an' deseni "an" ile biten değerleri getirir.

--53
SELECT * FROM kitap WHERE kitap_adi LIKE '% %'  --'% %' deseni içinde en az bir boşluk bulunan değerleri getirir.

--54
SELECT * FROM ders WHERE ders_kodu LIKE 'BP%'

--55
SELECT ogrenci_id,adres FROM ogrenci_detay WHERE adres LIKE '%Yurdu%'  --'%Yurdu%' deseni değerin herhangi bir yerinde "Yurdu" geçen kayıtları getirir.

--56
SELECT ad,soyad,dogum_yeri FROM ogrenci WHERE dogum_yeri LIKE '[BE]%'
SELECT ad,soyad,dogum_yeri FROM ogrenci WHERE dogum_yeri LIKE 'B%' OR dogum_yeri LIKE 'E%'
--NOT: [BE] ifadesi tek bir karakter için "B veya E" anlamına gelir. İki sorgu aynı çıktıyı verir.

--57
SELECT * FROM ogrenci WHERE ad LIKE '[A-E]%' ORDER BY ad
--NOT: [A-E] ifadesi alfabede A ile E arasındaki harflerden birini temsil eder. Türkçe alfabe sıralamasında Ç harfi C ile D arasında
--yer aldığı için "Çağla" kaydı da listelenir.

--58
SELECT * FROM ogrenci WHERE ad LIKE 'i%'
--NOT: Kampus veritabanı Türkçe karşılaştırma kuralları (Turkish_CI_AS) ile oluşturulmuştur.
--Bu kurallara göre "i" harfinin büyük hali "İ", "ı" harfinin büyük hali ise "I" harfidir.
--Bu nedenle 'i%' deseni "İrem" kaydını getirir, "Işıl" kaydını getirmez. "Işıl" kaydı için 'ı%' deseni kullanılmalıdır.
SELECT * FROM ogrenci WHERE ad LIKE 'ı%'

--59
SELECT * FROM ogrenci WHERE soyad LIKE '[^K]%a%'  --Hatalı sorgu: "Aydın" ve "Aksoy" listelenmez.
--NOT: [^K] ifadesi "K dışındaki TEK bir karakter" anlamına gelir ve soyadının ilk harfini karşılar. Desenin devamındaki %a% ise ilk harften SONRA gelen bir "a" arar.
--"Aydın" ve "Aksoy" soyadlarındaki "a" ilk harf olduğu için [^K] tarafından karşılanır; geri kalan kısımda (ydın, ksoy) ikinci bir "a" bulunmadığından listelenmezler.
--"Arslan" ise ilk harften sonra ikinci bir "a" içerdiği için listelenir. Aşağıdaki çözümlerin tamamı aynı (doğru) çıktıyı verir.
SELECT * FROM ogrenci WHERE soyad LIKE '[^K]%' AND soyad LIKE '%a%'         --Çözüm 1: Desen iki ayrı koşula bölünür.
SELECT * FROM ogrenci WHERE soyad LIKE '[^K]%a%' OR soyad LIKE 'a%'         --Çözüm 2: Desenin kaçırdığı "a ile başlayan" kayıtlar OR ile eklenir.
--Aşağıdaki çözümlerde ilerleyen konularda işlenen NOT operatörü ve fonksiyonlar kullanılmıştır.
SELECT * FROM ogrenci WHERE soyad NOT LIKE 'K%' AND soyad LIKE '%a%'        --Çözüm 3: İlk harf kontrolü NOT LIKE ile yapılır.
SELECT * FROM ogrenci WHERE LEFT(soyad,1)<>'K' AND soyad LIKE '%a%'         --Çözüm 4: İlk harf LEFT fonksiyonu ile kontrol edilir.
SELECT * FROM ogrenci WHERE soyad NOT LIKE 'K%' AND CHARINDEX('a',soyad)>0  --Çözüm 5: "a" harfi CHARINDEX fonksiyonu ile aranır (harf bulunamazsa 0 döner).


/* ===================== 5. TAKMA AD, TOPLAMA FONKSİYONLARI, GROUP BY, HAVING, BETWEEN, IN, NOT, NULL, SÜTUN BİRLEŞTİRME, YORUM SATIRI ===================== */

--60
SELECT ad AS Adı,soyad AS Soyadı FROM ogrenci
SELECT ad Adı,soyad Soyadı FROM ogrenci  --Takma ad AS ile veya kolon adından sonra boşluk bırakılarak yazılır.

--61
SELECT kitap_adi [Kitap Adı],sayfa_sayisi [Sayfa Sayısı] FROM kitap
--NOT: Boşluk içeren takma adlar köşeli parantez [ ] veya çift tırnak " " içinde yazılır.

--62
SELECT ders_kodu Kod,kredi Kredi FROM ders ORDER BY Kredi DESC  --Takma ad ORDER BY ifadesinde kullanılabilir.

--63
SELECT COUNT(*) Toplam FROM ogrenci  --COUNT(*) tablodaki satır sayısını verir.

--64
SELECT MAX(ortalama) FROM ogrenci WHERE dogum_yeri='Bilecik'  --MAX fonksiyonu, koşulu sağlayan kayıtlar içindeki en büyük değeri verir.

--65
SELECT MAX(ortalama) [En Yüksek] FROM ogrenci WHERE dogum_yeri='Eskişehir'

--66
SELECT AVG(ortalama) Ortalama FROM ogrenci WHERE ad LIKE 'a%'  --ortalama kolonu INT olduğu için AVG sonucu tam sayı olarak döner.

--67
SELECT MIN(sayfa_sayisi) [En Az],MAX(sayfa_sayisi) [En Fazla],SUM(stok) [Toplam Stok] FROM kitap  --Aynı sorguda birden fazla toplama fonksiyonu kullanılabilir.

--68
SELECT SUM(kredi) [Toplam Kredi] FROM ders WHERE ders_kodu LIKE 'BP%'  --SUM fonksiyonu yalnızca WHERE koşulunu sağlayan kayıtları toplar.

--69
SELECT COUNT(DISTINCT dogum_yeri) FROM ogrenci  --COUNT(DISTINCT kolon) kolondaki farklı değerlerin sayısını verir.

--70
SELECT dogum_yeri,COUNT(*) FROM ogrenci GROUP BY dogum_yeri  --GROUP BY aynı değere sahip kayıtları gruplar; COUNT(*) her grubun kayıt sayısını verir.

--71
SELECT dogum_yeri Memleket ,COUNT(*) Kişi FROM ogrenci GROUP BY dogum_yeri

--72
SELECT cinsiyet,COUNT(*),AVG(ortalama) FROM ogrenci GROUP BY cinsiyet

--73
SELECT sinif,MAX(ortalama) [En Yüksek],MIN(ortalama) [En Düşük] FROM ogrenci GROUP BY sinif
--NOT: SELECT ifadesinde yer alan ve toplama fonksiyonu içinde olmayan her kolon GROUP BY ifadesinde de yazılmalıdır.

--74
SELECT bolum_id,COUNT(*) FROM ogrenci GROUP BY bolum_id
--NOT: bolum_id değeri NULL olan kayıtlar da ayrı bir grup olarak listelenir.
--Bölüm adlarını görmek için bolum tablosu ile birleştirme (JOIN) yapılmalıdır. (Bkz: calisma_sorulari_4_JOIN.sql)

--75
SELECT bolum_id,COUNT(*) FROM ogrenci WHERE bolum_id=1 OR bolum_id=2 GROUP BY bolum_id
--NOT: Önce WHERE ile kayıtlar filtrelenir, ardından kalan kayıtlar gruplanır.

--76
SELECT unvan,COUNT(*) FROM ogretim_elemani GROUP BY unvan

--77
SELECT yayinevi,COUNT(*) FROM kitap GROUP BY yayinevi ORDER BY COUNT(*) DESC  --ORDER BY ifadesinde toplama fonksiyonu kullanılabilir.

--78
SELECT yayinevi,SUM(sayfa_sayisi) [Toplam Sayfa] FROM kitap GROUP BY yayinevi  --SUM fonksiyonu her gruptaki değerlerin toplamını verir.

--79
SELECT bolum_id,COUNT(*),SUM(kredi) FROM ders GROUP BY bolum_id
--NOT: bolum_id değeri NULL olan grup, herhangi bir bölüme ait olmayan ortak dersleri (Türk Dili, Matematik, İş Sağlığı ve Güvenliği) gösterir.

--80
SELECT ders_id,COUNT(*),AVG(vize),AVG(final) FROM ders_kayit GROUP BY ders_id  --AVG fonksiyonu NULL değerleri hesaba katmaz.

--81
SELECT ogrenci_id,COUNT(*) FROM odunc GROUP BY ogrenci_id ORDER BY COUNT(*) DESC

--82
SELECT kan_grubu,COUNT(*) FROM ogrenci_detay GROUP BY kan_grubu  --kan_grubu değeri NULL olan kayıt ayrı bir grup olarak listelenir.

--83
SELECT TOP 4 kitap_id,COUNT(*) FROM odunc GROUP BY kitap_id ORDER BY COUNT(*) DESC
SELECT TOP 4 WITH TIES kitap_id,COUNT(*) FROM odunc GROUP BY kitap_id ORDER BY COUNT(*) DESC
--NOT: TOP 4 tam olarak 4 kayıt getirir; ödünç sayısı 2 olan kitaplardan hangisinin listeleneceği garanti edilmez.
--WITH TIES ifadesi son sıradaki değere eşit olan tüm kayıtları da listeler.

--84
SELECT dogum_yeri Memleket ,COUNT(*) Kişi FROM ogrenci GROUP BY dogum_yeri HAVING COUNT(*)>=4
--NOT: HAVING gruplama sonrasında oluşan grupları filtreler. HAVING ifadesinde takma ad (Kişi) kullanılamaz, COUNT(*) tekrar yazılır.

--85
SELECT yayinevi,COUNT(*) FROM kitap GROUP BY yayinevi HAVING COUNT(*)>=3

--86
SELECT ders_id,AVG(final) FROM ders_kayit GROUP BY ders_id HAVING AVG(final)>75
--NOT: Toplama fonksiyonu içeren koşullar WHERE ile değil HAVING ile yazılır.

--87
SELECT ogrenci_id,COUNT(*) FROM odunc GROUP BY ogrenci_id HAVING COUNT(*)>2

--88
SELECT yayinevi,SUM(sayfa_sayisi) [Toplam Sayfa] FROM kitap WHERE dil='Türkçe' GROUP BY yayinevi HAVING SUM(sayfa_sayisi)>700
--NOT: Sorgu sırasıyla işletilir: WHERE ile Türkçe kitaplar seçilir, GROUP BY ile yayınevlerine göre gruplanır, HAVING ile toplamı 700'den fazla olan gruplar listelenir.

--89
SELECT * FROM ogrenci WHERE ortalama BETWEEN 61 AND 79
--NOT: BETWEEN uç değerleri DAHİL eder. Uç değerlerin hariç tutulması için aralık 61-79 olarak yazılmıştır.

--90
SELECT * FROM ogrenci WHERE ortalama BETWEEN 60 AND 80  --ortalama>=60 AND ortalama<=80 koşuluna eşdeğerdir.

--91
SELECT * FROM kitap WHERE basim_yili BETWEEN 2018 AND 2020 ORDER BY basim_yili

--92
SELECT * FROM odunc WHERE odunc_tarihi BETWEEN '2025-10-01' AND '2025-10-31'  --BETWEEN tarih değerleri için de kullanılabilir.

--93
SELECT ulke,COUNT(*) FROM yazar WHERE dogum_yili BETWEEN 1900 AND 1950 GROUP BY ulke
--NOT: Önce WHERE ile doğum yılı koşulunu sağlayan yazarlar seçilir, ardından ülkelere göre gruplanır.

--94
SELECT * FROM ogrenci WHERE ad BETWEEN 'A' AND 'C'
--NOT: Metinlerde BETWEEN alfabetik sıraya göre çalışır. "Can" değeri alfabetik olarak "C" değerinden sonra geldiği için aralığın dışında kalır.
--Türkçe sıralamada Ç harfi C'den sonra geldiği için "Çağla" da listelenmez. A, B ve C ile başlayan tüm adlar için aşağıdaki koşullar kullanılabilir:
SELECT * FROM ogrenci WHERE ad LIKE '[A-C]%'
SELECT * FROM ogrenci WHERE ad>='A' AND ad<'Ç'

--95
SELECT * FROM ogrenci WHERE soyad IN('Kaya','Demir','Yıldız')  --IN, birden fazla OR koşulunun kısa yazımıdır.

--96
SELECT bolum_id,COUNT(*) FROM ogrenci WHERE bolum_id IN(1,2) GROUP BY bolum_id

--97
SELECT * FROM kitap WHERE yayinevi IN('Can Yayınları','İthaki Yayınları')

--98
SELECT * FROM ders WHERE ders_kodu IN('BP101','BP102','TD101')

--99
SELECT * FROM odunc WHERE ogrenci_id IN(1,2,3) ORDER BY ogrenci_id

--100
SELECT * FROM ogrenci WHERE soyad NOT IN('Kaya','Demir','Yıldız')  --NOT IN, listedeki değerlerin hiçbirine eşit olmayan kayıtları getirir.

--101
SELECT * FROM kitap WHERE kitap_adi NOT LIKE '% %'  --NOT LIKE, desene uymayan (boşluk içermeyen) değerleri getirir.

--102
SELECT * FROM ogrenci WHERE ortalama NOT BETWEEN 50 AND 80  --NOT BETWEEN, aralığın dışında kalan (50'den küçük veya 80'den büyük) değerleri getirir.

--103
SELECT * FROM ogrenci WHERE NOT dogum_yeri='Bilecik'
SELECT * FROM ogrenci WHERE dogum_yeri<>'Bilecik'  --NOT operatörü kendisinden sonra gelen koşulun sonucunu tersine çevirir; iki sorgu aynı çıktıyı verir.

--104
SELECT * FROM ders WHERE ders_kodu NOT LIKE 'BP%' AND kredi>=3

--105
SELECT * FROM ogrenci WHERE eposta IS NULL

--106
SELECT * FROM ogrenci WHERE eposta = NULL
--NOT: NULL "bilinmeyen değer" anlamına gelir ve = ile yapılan karşılaştırmalar sonuç üretmez. Bu nedenle sorgu hata vermez ancak hiçbir kayıt getirmez.
--NULL kontrolü IS NULL / IS NOT NULL ile yapılır.

--107
SELECT * FROM kitap WHERE kategori_id IS NULL  --NULL "değer yok" anlamına gelir; 0 veya boş metin ('') ile aynı değildir.

--108
SELECT ad,soyad FROM ogretim_elemani WHERE bolum_id IS NULL

--109
SELECT * FROM ders WHERE ogretim_elemani_id IS NULL

--110
SELECT * FROM ders_kayit WHERE final IS NULL

--111
SELECT * FROM odunc WHERE iade_tarihi IS NULL  --iade_tarihi değeri olmayan kayıtlar henüz iade edilmemiş kitapları gösterir.

--112
SELECT * FROM odunc WHERE iade_tarihi IS NOT NULL ORDER BY iade_tarihi

--113
SELECT COUNT(*) [Kayıt Sayısı],COUNT(final) [Final Notu Olan] FROM ders_kayit
--NOT: COUNT(*) tüm satırları, COUNT(final) ise final değeri NULL olmayan satırları sayar.

--114
SELECT ad+soyad İsim FROM ogrenci --Ad ve soyad arasında boşluk bırakmadan çıktı verir.
SELECT ad+' '+soyad İsim FROM ogrenci --Ad ve soyad arasında boşluk bırakarak çıktı verir.

--115
SELECT unvan+' '+ad+' '+soyad [Öğretim Elemanı] FROM ogretim_elemani

--116
SELECT kitap_adi+' ('+yayinevi+')' Künye FROM kitap  --Kolon değerleri ile sabit metinler (' (' ve ')') birlikte birleştirilebilir.

--117
SELECT ad+' '+soyad Yazar FROM yazar ORDER BY Yazar

--118
SELECT ad+' '+eposta FROM ogrenci
--NOT: + operatörü ile yapılan birleştirmede değerlerden biri NULL ise sonuç da NULL olur. eposta bilgisi bulunmayan öğrencilerde sonuç NULL'dur.
--Bu durumun çözümü için 129. soruya bakınız.

--119
SELECT kitap_adi,sayfa_sayisi,sayfa_sayisi/20 okuma_suresi FROM kitap WHERE sayfa_sayisi>300 ORDER BY okuma_suresi DESC
--NOT: sayfa_sayisi ve 20 tam sayı (INT) olduğu için sonuç da tam sayıdır (431/20 = 21). Ondalıklı sonuç için sayfa_sayisi/20.0 yazılabilir.
SELECT kitap_adi,sayfa_sayisi,sayfa_sayisi/20.0 okuma_suresi FROM kitap WHERE sayfa_sayisi>300 ORDER BY okuma_suresi DESC

--120
SELECT ogrenci_id,ders_id,vize,final,vize*0.4+final*0.6 [Başarı Notu] FROM ders_kayit
--NOT: Kolonlar üzerinde hesaplama yapılarak yeni bir kolon oluşturulabilir. final değeri NULL olan kayıtlarda hesaplama sonucu da NULL olur.

--121
SELECT ogrenci_id,ders_id,vize,final,vize*0.4+final*0.6 [Başarı Notu] FROM ders_kayit WHERE vize*0.4+final*0.6>=60 ORDER BY [Başarı Notu] DESC
--NOT: SELECT ifadesinde tanımlanan takma ad (Başarı Notu) WHERE ifadesinde kullanılamaz, çünkü WHERE ifadesi SELECT ifadesinden önce işletilir.
--ORDER BY ifadesi SELECT ifadesinden sonra işletildiği için takma ad ORDER BY ifadesinde kullanılabilir.

--122
SELECT ad,
--soyad,
ortalama FROM ogrenci
--NOT: -- işaretinden sonra satır sonuna kadar yazılan ifadeler yorum satırı olarak kabul edilir ve çalıştırılmaz. Çıktıda yalnızca ad ve ortalama kolonları bulunur.

--123
SELECT * FROM ogrenci /* WHERE sinif=1 */ ORDER BY ad
--NOT: /* ile */ arasındaki ifadeler (birden fazla satırı kapsasa da) yorum olarak kabul edilir. WHERE koşulu çalışmadığı için tüm öğrenciler listelenir.

--124
-- Stokta bulunmayan kitapları listeler.
/*
Sorgu kitap tablosunda stok değeri 0 olan kitapları getirir.
Yorumlar sorgunun çalışmasını etkilemez; sorgunun amacını açıklamak için kullanılır.
*/
SELECT * FROM kitap WHERE stok=0


/* ===================== 6. EK: FONKSİYONLAR VE ŞİFRELİ TC KİMLİK NUMARASI ===================== */

--125
SELECT ad,soyad,ise_baslama FROM ogretim_elemani WHERE YEAR(ise_baslama)>=2015 ORDER BY ise_baslama  --YEAR fonksiyonu tarihin yıl bilgisini verir; 37. soru ile aynı çıktıyı verir.

--126
SELECT ad,soyad,DATEDIFF(YEAR,ise_baslama,'2025-09-01') [Kıdem (Yıl)] FROM ogretim_elemani
--NOT: DATEDIFF(YEAR, ...) yalnızca yıl bilgilerinin farkını alır, ay ve gün dikkate alınmaz.
--Örn: 2012-09-15 ile 2025-09-01 arası 12 tam yıl olmasına rağmen sonuç 13 olarak hesaplanır.

--127
SELECT kitap_id,ogrenci_id,DATEDIFF(DAY,odunc_tarihi,iade_tarihi) [Süre (Gün)] FROM odunc WHERE iade_tarihi IS NOT NULL
--NOT: DATEDIFF(DAY, başlangıç, bitiş) iki tarih arasındaki gün farkını verir. İade edilmemiş kayıtlar IS NOT NULL koşulu ile dışarıda bırakılmıştır.

--128
SELECT ikamet_ili,COUNT(*) [Öğrenci],SUM(CAST(yurtta_kaliyor AS INT)) [Yurtta Kalan] FROM ogrenci_detay GROUP BY ikamet_ili
--NOT: BIT türündeki kolonlar SUM fonksiyonu ile doğrudan toplanamaz. CAST ile INT türüne dönüştürülerek yurtta kalan (1) öğrenciler toplanır.

--129
SELECT ad,ISNULL(eposta,'E-posta yok') eposta FROM ogrenci  --ISNULL(kolon, değer) kolon NULL ise ikinci parametredeki değeri döndürür.

--130
SELECT ad+' : '+ortalama FROM ogrenci
--NOT: ortalama kolonu INT olduğu için SQL Server metni sayıya dönüştürmeye çalışır ve "Conversion failed when converting the nvarchar value..." hatası alınır.
--Sayısal kolon CAST ile metne dönüştürülerek birleştirilmelidir.
SELECT ad+' : '+CAST(ortalama AS NVARCHAR(3)) FROM ogrenci

--131
SELECT ad,soyad,tc_kimlik_sifreli,tc_kimlik_ozet FROM ogrenci
--NOT: TC kimlik numaraları açık metin olarak değil, şifrelenmiş (tc_kimlik_sifreli) ve özet (tc_kimlik_ozet) değerleri olarak saklanır.

--132
SELECT ad,soyad,dbo.tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM ogrenci

--133
SELECT ad,soyad,tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM ogrenci
--NOT: dbo (database owner), SQL Server'da varsayılan şemanın (schema) adıdır. Şema; tablo, fonksiyon gibi nesnelerin gruplandığı yapıdır.
--Bir nesnenin tam adı veritabani.sema.nesne şeklindedir (Örn: Kampus.dbo.ogrenci). Kampus veritabanındaki tüm nesneler dbo şemasındadır.
--Kullanıcı tanımlı fonksiyonlar şema adı ile çağrılmalıdır. dbo. yazılmadığında fonksiyon sistem fonksiyonu olarak aranır ve
--"'tc_coz' is not a recognized built-in function name." hatası alınır. COUNT, MAX, YEAR gibi sistem fonksiyonlarında şema yazılmaz.
SELECT ad,soyad,dbo.tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM dbo.ogrenci
--NOT: Tablolarda şema yazılmadığında tablo kullanıcının varsayılan şemasında (genellikle dbo) aranır. Bu nedenle ogrenci ile dbo.ogrenci aynı tabloyu
--ifade eder ve sonuç değişmez. Farklı şemalarda aynı adlı tablolar bulunabileceği için şema adının yazılması kullanılacak tabloyu kesinleştirir.

--134
SELECT ad,soyad FROM ogrenci WHERE tc_kimlik_ozet=dbo.tc_ozet('57683474374')

--135
SELECT ad,soyad FROM ogrenci WHERE dbo.tc_coz(tc_kimlik_sifreli)='57683474374'
--NOT: 134. sorudaki yöntem daha hızlıdır. Aranan numaranın özeti bir kez hesaplanır ve UNIQUE kısıtının oluşturduğu indeks ile doğrudan bulunur.
--135. sorudaki yöntemde ise tablodaki TÜM kayıtların şifresi tek tek çözülerek karşılaştırılır; kayıt sayısı arttıkça sorgu yavaşlar.
--Özet (hash) değeri geri çözülemez. MD5, SHA2_256 gibi özet fonksiyonlarında "decrypt" işlemi yoktur; aranan değerin özeti alınarak karşılaştırma yapılır.

--136
SELECT dbo.tc_gecerli('53618033739') [53618033739],dbo.tc_gecerli('12345678901') [12345678901],dbo.tc_gecerli('11111111110') [11111111110]
--NOT: Kural: 11 hane, yalnızca rakam, ilk hane 0 olamaz ve ilk 10 hanenin toplamının birler basamağı 11. haneyi verir.
--12345678901 için ilk 10 hanenin toplamı 45'tir; birler basamağı (5) 11. hane (1) ile aynı olmadığından numara geçersizdir.

--137
SELECT unvan,ad,soyad FROM ogretim_elemani WHERE tc_kimlik_ozet=dbo.tc_ozet('73465299544')
