/*
KURULUM DETAYLARI
- İmleç bu sayfada iken "Execute" butonu veya F5 tuşu ile sayfadaki sorgular işletilir.
- Sorgular işletildikten sonra "Kampus" veritabanı, tabloları ve verileri oluşturuldu." mesajı çıktı olarak görülmelidir.
- Hata alınması durumunda sık karşılaşılan durum veritabanının ilgili sunucuda var olması ve seçili olmasından kaynaklı silme işlemenin gerçekleştirilememesidir.
- CTRL + U seçeneği ile ya da "Execute" butonunun sol tarafında aktif/seçili durumda olan veritabanı tüm çalışma sayfalarında "Kampus" dışında bir seçeneğe ayarlanarak sayfa tekrar çalıştırılmalıdır.
- Veritabanı Türkçe sıralama ve karşılaştırma kuralları (Turkish_CI_AS) ile oluşturulur. Bu sayede ORDER BY, LIKE ve UPPER/LOWER
  sonuçları sunucunun dil ayarından bağımsız olarak her bilgisayarda aynıdır. (Örn: LIKE 'i%' ifadesi "İrem" kaydını getirir, "Işıl" kaydını getirmez.)
- Betik tekrar çalıştırıldığında veritabanı silinip yeniden oluşturulur; yapılan tüm değişiklikler ilk haline döner.



 -------------------------------
|Kampus veritabanı  - 2026     |
|--Update 31.10.26             |
 -------------------------------
_____________________________________________________
|Bulunan Tablolar:                                  |
|---------------------------------------------------|
|  ÖĞRENCİ İŞLERİ                                   |
|1- bolum                                           |
|2- ogretim_elemani  (bolum)                        |
|3- ogrenci          (bolum, ogretim_elemani)       |
|4- ogrenci_detay    (ogrenci)             [1:1]    |
|5- ders             (bolum, ogretim_elemani)       |
|6- ders_kayit       (ogrenci, ders)       [M:N]    |
|  KÜTÜPHANE                                        |
|7- kategori                                        |
|8- yazar                                           |
|9- kitap            (kategori)                     |
|10- kitap_yazar     (kitap, yazar)        [M:N]    |
|11- odunc           (kitap, ogrenci)               |
_____________________________________________________

İlişkiler:
- Her öğrencinin bir bölümü (bolum_id) ve bir danışmanı (danisman_id -> ogretim_elemani) vardır. NULL olabilir.
- ogrenci_detay tablosu öğrencinin iletişim, ikamet, sağlık, veli ve burs bilgilerini tutar (öğrenci - detay, bire bir).
  ogrenci_detay.ogrenci_id kolonu hem FOREIGN KEY hem de UNIQUE olduğu için bir öğrencinin en fazla bir detay kaydı olabilir.
  "Işıl Arslan" ve "Deniz Yıldırım" öğrencilerinin detay kaydı bulunmamaktadır.
- ders_kayit tablosu öğrencilerin aldığı dersleri ve vize/final notlarını tutar (öğrenci - ders, çoka çok).
- kitap_yazar tablosu kitapların yazarlarını tutar; bir kitabın birden fazla yazarı olabilir (kitap - yazar, çoka çok).
- odunc tablosu kampüs kütüphanesinden öğrencilerin ödünç aldığı kitapları tutar. iade_tarihi NULL ise kitap henüz iade edilmemiştir.

TC Kimlik Numarası (ogrenci ve ogretim_elemani tabloları):
- TC kimlik numaraları açık metin olarak tutulmaz. Her kayıt için iki kolon bulunur:
    tc_kimlik_sifreli : AES-256 ile şifrelenmiş değer (ENCRYPTBYPASSPHRASE). Geri çözülebilir.
                        Aynı numara her şifrelemede farklı görünür; bu nedenle bu kolon ile eşitlik araması ve UNIQUE kontrolü yapılamaz.
    tc_kimlik_ozet    : SHA2_256 özet (hash) değeri. Geri çözülemez, aynı numara için her zaman aynıdır.
                        Benzersizlik (UNIQUE) kontrolü ve hızlı arama bu kolon üzerinden yapılır.
- NOT: MD5, SHA1, SHA2_256 gibi özet (hash) fonksiyonları tek yönlüdür; "decrypt" edilerek geri çözülemez.
  Geri okunması gereken veriler şifrelenir (encryption), yalnızca karşılaştırılması gereken veriler için özet kullanılır.
- Yardımcı fonksiyonlar:
    dbo.tc_gecerli(tc)       : Numara kurala uygunsa 1, değilse 0 döndürür.
                               (11 hane, yalnızca rakam, ilk hane 0 olamaz, ilk 10 hanenin toplamının birler basamağı 11. haneyi verir.)
    dbo.tc_sifrele(tc)       : Şifreli değeri döndürür. Kurala uymayan numara için NULL döndürdüğünden kayıt eklenemez.
    dbo.tc_ozet(tc)          : Özet değerini döndürür. Kurala uymayan numara için NULL döndürür.
    dbo.tc_coz(sifreli)      : Şifreli değeri çözerek açık TC kimlik numarasını döndürür.
- dbo ifadesi: SQL Server'da tablo, fonksiyon gibi nesneler şemalar (schema) altında tutulur. dbo (database owner) varsayılan şemanın adıdır ve
  bu veritabanındaki tüm nesneler dbo şemasında oluşturulmuştur. Bir nesnenin tam adı veritabani.sema.nesne şeklindedir (Örn: Kampus.dbo.ogrenci).
  Tablolarda şema yazılmadığında tablo kullanıcının varsayılan şemasında (genellikle dbo) aranır; bu nedenle ogrenci ile dbo.ogrenci aynı tablodur.
  Kullanıcı tanımlı fonksiyonlarda ise şema adı ZORUNLUDUR: tc_coz(...) şeklinde yazılan fonksiyon sistem fonksiyonu olarak aranır ve
  "'tc_coz' is not a recognized built-in function name." hatası alınır. COUNT, MAX, YEAR gibi sistem fonksiyonlarında şema yazılmaz.
- Örnek kullanım:
    SELECT ad, soyad, dbo.tc_coz(tc_kimlik_sifreli) [TC Kimlik No] FROM ogrenci
    SELECT * FROM ogrenci WHERE tc_kimlik_ozet = dbo.tc_ozet('53618033739')       --Özet ile arama: indeks kullanılır, hızlıdır.
    SELECT * FROM ogrenci WHERE dbo.tc_coz(tc_kimlik_sifreli) = '53618033739'    --Çözerek arama: tüm kayıtlar tek tek çözülür, yavaştır.
    INSERT ... VALUES (..., dbo.tc_sifrele('53618033739'), dbo.tc_ozet('53618033739'))
- Şifreleme parolası eğitim amacıyla fonksiyonların içine yazılmıştır. Gerçek sistemlerde parola/anahtar ayrı ve korunaklı bir yerde saklanır.
- Veritabanındaki TC kimlik numaraları rastgele üretilmiştir. Resmi algoritmanın 10. hane kuralını bilerek sağlamadıkları için gerçek bir kişiye ait olamazlar.
  Telefon numaraları da herhangi bir operatöre ait olmayan 0500 ön eki ile yazılmıştır.



*/
BEGIN TRY
SET NOCOUNT ON;
USE master;


DECLARE @SQL_Drop nvarchar(1000);
IF EXISTS (SELECT TOP 1 * FROM sys.databases WHERE [name] = N'Kampus')
BEGIN
    SET @SQL_Drop = N'ALTER DATABASE Kampus SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                 DROP DATABASE Kampus;';
    EXEC (@SQL_Drop);
END;


DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1


EXECUTE (N'CREATE DATABASE Kampus
  ON PRIMARY (NAME = N''Kampus'', FILENAME = N''' + @device_directory + N'kampus.mdf'')
  LOG ON (NAME = N''kampus_log'',  FILENAME = N''' + @device_directory + N'kampus.ldf'')
  COLLATE Turkish_CI_AS')


/*FUNCTION - TC kimlik numarası işlemleri (her fonksiyon ayrı bir komut olarak oluşturulmalıdır)*/

EXEC Kampus.sys.sp_executesql N'
CREATE FUNCTION dbo.tc_gecerli (@tc VARCHAR(20))
RETURNS BIT
AS
BEGIN
    IF @tc IS NULL OR LEN(@tc) <> 11 OR @tc LIKE ''%[^0-9]%'' OR LEFT(@tc, 1) = ''0''
        RETURN 0;

    DECLARE @i INT = 1, @toplam INT = 0;
    WHILE @i <= 10
    BEGIN
        SET @toplam = @toplam + CAST(SUBSTRING(@tc, @i, 1) AS INT);
        SET @i = @i + 1;
    END

    RETURN CASE WHEN @toplam % 10 = CAST(RIGHT(@tc, 1) AS INT) THEN 1 ELSE 0 END;
END';

EXEC Kampus.sys.sp_executesql N'
CREATE FUNCTION dbo.tc_sifrele (@tc VARCHAR(20))
RETURNS VARBINARY(128)
AS
BEGIN
    RETURN CASE WHEN dbo.tc_gecerli(@tc) = 1 THEN ENCRYPTBYPASSPHRASE(''Kampus-VTYS-2026'', CAST(@tc AS VARCHAR(11))) END;
END';

EXEC Kampus.sys.sp_executesql N'
CREATE FUNCTION dbo.tc_ozet (@tc VARCHAR(20))
RETURNS BINARY(32)
AS
BEGIN
    RETURN CASE WHEN dbo.tc_gecerli(@tc) = 1 THEN HASHBYTES(''SHA2_256'', ''Kampus#'' + CAST(@tc AS VARCHAR(11))) END;
END';

EXEC Kampus.sys.sp_executesql N'
CREATE FUNCTION dbo.tc_coz (@sifreli VARBINARY(128))
RETURNS VARCHAR(11)
AS
BEGIN
    RETURN CONVERT(VARCHAR(11), DECRYPTBYPASSPHRASE(''Kampus-VTYS-2026'', @sifreli));
END';

/*FUNCTION*/


DECLARE @SQL_Setup nvarchar(MAX);
SET @SQL_Setup = N'
USE [Kampus];

SET DATEFORMAT ymd;
set quoted_identifier on;

/*TABLE*/

-- ÖĞRENCİ İŞLERİ

CREATE TABLE [bolum] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [bolum_adi] NVARCHAR(100) NOT NULL,
    [kontenjan] INT NOT NULL,
    CONSTRAINT [PK_bolum] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE [ogretim_elemani] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ad] NVARCHAR(50) NOT NULL,
    [soyad] NVARCHAR(50) NOT NULL,
    [unvan] NVARCHAR(30) NOT NULL,
    [bolum_id] INT NULL,
    [ise_baslama] DATE NOT NULL,
    [tc_kimlik_sifreli] VARBINARY(128) NOT NULL,
    [tc_kimlik_ozet] BINARY(32) NOT NULL,
    CONSTRAINT [PK_ogretim_elemani] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [UQ_ogretim_elemani_tc] UNIQUE ([tc_kimlik_ozet]),
    CONSTRAINT [FK_ogretim_elemani_bolum] FOREIGN KEY ([bolum_id]) REFERENCES [bolum]([id]) ON DELETE SET NULL
);

CREATE TABLE [ogrenci] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ogrenci_no] NVARCHAR(10) NOT NULL,
    [ad] NVARCHAR(50) NOT NULL,
    [soyad] NVARCHAR(50) NOT NULL,
    [cinsiyet] NCHAR(1) NOT NULL,
    [dogum_tarihi] DATE NOT NULL,
    [dogum_yeri] NVARCHAR(50) NOT NULL,
    [bolum_id] INT NULL,
    [danisman_id] INT NULL,
    [sinif] INT NOT NULL,
    [ortalama] INT NOT NULL,
    [eposta] NVARCHAR(100) NULL,
    [tc_kimlik_sifreli] VARBINARY(128) NOT NULL,
    [tc_kimlik_ozet] BINARY(32) NOT NULL,
    CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [UQ_ogrenci_no] UNIQUE ([ogrenci_no]),
    CONSTRAINT [UQ_ogrenci_tc] UNIQUE ([tc_kimlik_ozet]),
    CONSTRAINT [CK_ogrenci_cinsiyet] CHECK ([cinsiyet] IN (N''K'', N''E'')),
    CONSTRAINT [CK_ogrenci_sinif] CHECK ([sinif] BETWEEN 1 AND 2),
    CONSTRAINT [CK_ogrenci_ortalama] CHECK ([ortalama] BETWEEN 0 AND 100),
    CONSTRAINT [FK_ogrenci_bolum] FOREIGN KEY ([bolum_id]) REFERENCES [bolum]([id]) ON DELETE SET NULL,
    CONSTRAINT [FK_ogrenci_danisman] FOREIGN KEY ([danisman_id]) REFERENCES [ogretim_elemani]([id]) ON DELETE SET NULL
);

-- Bire bir (1:1) ilişki: ogrenci_id kolonu UNIQUE olduğu için bir öğrenciye ait en fazla bir detay kaydı eklenebilir.
CREATE TABLE [ogrenci_detay] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ogrenci_id] INT NOT NULL,
    [telefon] NVARCHAR(15) NOT NULL,
    [ikamet_ili] NVARCHAR(50) NOT NULL,
    [adres] NVARCHAR(200) NULL,
    [kan_grubu] NVARCHAR(6) NULL,
    [veli_adi] NVARCHAR(100) NULL,
    [veli_telefon] NVARCHAR(15) NULL,
    [burslu] BIT NOT NULL CONSTRAINT [DF_ogrenci_detay_burslu] DEFAULT (0),
    [yurtta_kaliyor] BIT NOT NULL CONSTRAINT [DF_ogrenci_detay_yurtta_kaliyor] DEFAULT (0),
    [kayit_tarihi] DATE NOT NULL,
    CONSTRAINT [PK_ogrenci_detay] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [UQ_ogrenci_detay_ogrenci] UNIQUE ([ogrenci_id]),
    CONSTRAINT [CK_ogrenci_detay_kan_grubu] CHECK ([kan_grubu] IN (N''0 Rh+'', N''0 Rh-'', N''A Rh+'', N''A Rh-'', N''B Rh+'', N''B Rh-'', N''AB Rh+'', N''AB Rh-'')),
    CONSTRAINT [FK_ogrenci_detay_ogrenci] FOREIGN KEY ([ogrenci_id]) REFERENCES [ogrenci]([id]) ON DELETE CASCADE
);

CREATE TABLE [ders] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ders_kodu] NVARCHAR(10) NOT NULL,
    [ders_adi] NVARCHAR(100) NOT NULL,
    [kredi] INT NOT NULL,
    [bolum_id] INT NULL,
    [ogretim_elemani_id] INT NULL,
    CONSTRAINT [PK_ders] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [UQ_ders_kodu] UNIQUE ([ders_kodu]),
    CONSTRAINT [FK_ders_bolum] FOREIGN KEY ([bolum_id]) REFERENCES [bolum]([id]),
    CONSTRAINT [FK_ders_ogretim_elemani] FOREIGN KEY ([ogretim_elemani_id]) REFERENCES [ogretim_elemani]([id]) ON DELETE SET NULL
);

CREATE TABLE [ders_kayit] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ogrenci_id] INT NOT NULL,
    [ders_id] INT NOT NULL,
    [vize] INT NULL,
    [final] INT NULL,
    CONSTRAINT [PK_ders_kayit] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [CK_ders_kayit_vize] CHECK ([vize] BETWEEN 0 AND 100),
    CONSTRAINT [CK_ders_kayit_final] CHECK ([final] BETWEEN 0 AND 100),
    CONSTRAINT [FK_ders_kayit_ogrenci] FOREIGN KEY ([ogrenci_id]) REFERENCES [ogrenci]([id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ders_kayit_ders] FOREIGN KEY ([ders_id]) REFERENCES [ders]([id]) ON DELETE CASCADE
);

-- KÜTÜPHANE

CREATE TABLE [kategori] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [kategori_adi] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_kategori] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE [yazar] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [ad] NVARCHAR(50) NOT NULL,
    [soyad] NVARCHAR(50) NOT NULL,
    [ulke] NVARCHAR(50) NOT NULL,
    [dogum_yili] INT NOT NULL,
    CONSTRAINT [PK_yazar] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE [kitap] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [kitap_adi] NVARCHAR(100) NOT NULL,
    [kategori_id] INT NULL,
    [yayinevi] NVARCHAR(100) NOT NULL,
    [sayfa_sayisi] INT NOT NULL,
    [basim_yili] INT NOT NULL,
    [dil] NVARCHAR(30) NOT NULL,
    [stok] INT NOT NULL CONSTRAINT [DF_kitap_stok] DEFAULT (1),
    CONSTRAINT [PK_kitap] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [FK_kitap_kategori] FOREIGN KEY ([kategori_id]) REFERENCES [kategori]([id]) ON DELETE SET NULL
);

CREATE TABLE [kitap_yazar] (
    [kitap_id] INT NOT NULL,
    [yazar_id] INT NOT NULL,
    CONSTRAINT [PK_kitap_yazar] PRIMARY KEY CLUSTERED ([kitap_id], [yazar_id]),
    CONSTRAINT [FK_kitap_yazar_kitap] FOREIGN KEY ([kitap_id]) REFERENCES [kitap]([id]) ON DELETE CASCADE,
    CONSTRAINT [FK_kitap_yazar_yazar] FOREIGN KEY ([yazar_id]) REFERENCES [yazar]([id]) ON DELETE CASCADE
);

-- Ödünç verilmiş bir kitap silinemez (ON DELETE NO ACTION), öğrenci silinirse ödünç kayıtları da silinir (ON DELETE CASCADE).
CREATE TABLE [odunc] (
    [id] INT IDENTITY (1, 1) NOT NULL,
    [kitap_id] INT NOT NULL,
    [ogrenci_id] INT NOT NULL,
    [odunc_tarihi] DATE NOT NULL,
    [son_teslim_tarihi] DATE NOT NULL,
    [iade_tarihi] DATE NULL,
    CONSTRAINT [PK_odunc] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [FK_odunc_kitap] FOREIGN KEY ([kitap_id]) REFERENCES [kitap]([id]),
    CONSTRAINT [FK_odunc_ogrenci] FOREIGN KEY ([ogrenci_id]) REFERENCES [ogrenci]([id]) ON DELETE CASCADE
);

/*TABLE*/

/*DATA*/

INSERT [bolum] ([bolum_adi], [kontenjan]) VALUES
(N''Bilgisayar Programcılığı'', 40),
(N''Web Tasarımı ve Kodlama'', 30),
(N''İnternet ve Ağ Teknolojileri'', 30),
(N''Muhasebe ve Vergi Uygulamaları'', 35),
(N''Elektrik'', 25),
(N''Grafik Tasarımı'', 20);

INSERT [ogretim_elemani] ([ad], [soyad], [unvan], [bolum_id], [ise_baslama], [tc_kimlik_sifreli], [tc_kimlik_ozet]) VALUES
(N''Selim'', N''Aksoy'', N''Dr. Öğr. Üyesi'', 1, ''2012-09-15'', dbo.tc_sifrele(''10292538022''), dbo.tc_ozet(''10292538022'')),
(N''Nurcan'', N''Bilgin'', N''Öğr. Gör.'', 1, ''2016-02-01'', dbo.tc_sifrele(''86455555957''), dbo.tc_ozet(''86455555957'')),
(N''Kerem'', N''Yalçın'', N''Öğr. Gör.'', 2, ''2018-09-10'', dbo.tc_sifrele(''25260947005''), dbo.tc_ozet(''25260947005'')),
(N''Derya'', N''Ünal'', N''Doç. Dr.'', 3, ''2010-10-01'', dbo.tc_sifrele(''90903269097''), dbo.tc_ozet(''90903269097'')),
(N''Hakan'', N''Öztürk'', N''Öğr. Gör.'', 4, ''2015-09-01'', dbo.tc_sifrele(''59349500421''), dbo.tc_ozet(''59349500421'')),
(N''Elif'', N''Şahin'', N''Öğr. Gör.'', 5, ''2020-02-15'', dbo.tc_sifrele(''17583258997''), dbo.tc_ozet(''17583258997'')),
(N''Murat'', N''Kılıç'', N''Dr. Öğr. Üyesi'', NULL, ''2019-09-01'', dbo.tc_sifrele(''22419541941''), dbo.tc_ozet(''22419541941'')),
(N''Gizem'', N''Arslan'', N''Öğr. Gör.'', 2, ''2022-09-01'', dbo.tc_sifrele(''89717909437''), dbo.tc_ozet(''89717909437'')),
(N''Abdulmelik'', N''Derinkök'', N''Öğr. Gör.'', 1, ''2014-09-01'', dbo.tc_sifrele(''73465299544''), dbo.tc_ozet(''73465299544''));

INSERT [ogrenci] ([ogrenci_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [bolum_id], [danisman_id], [sinif], [ortalama], [eposta], [tc_kimlik_sifreli], [tc_kimlik_ozet]) VALUES
(N''2024010101'', N''Ahmet'', N''Yılmaz'', N''E'', ''2005-03-14'', N''Bilecik'', 1, 1, 2, 72, N''ahmet.yilmaz@kampus.edu.tr'', dbo.tc_sifrele(''53618033739''), dbo.tc_ozet(''53618033739'')),
(N''2024010102'', N''Ayşe'', N''Kaya'', N''K'', ''2005-07-22'', N''Eskişehir'', 1, 1, 2, 88, N''ayse.kaya@kampus.edu.tr'', dbo.tc_sifrele(''31990431381''), dbo.tc_ozet(''31990431381'')),
(N''2025010103'', N''Mehmet'', N''Demir'', N''E'', ''2006-01-09'', N''Bursa'', 1, 2, 1, 55, NULL, dbo.tc_sifrele(''36593106261''), dbo.tc_ozet(''36593106261'')),
(N''2025010104'', N''Zeynep'', N''Çelik'', N''K'', ''2006-11-30'', N''Bilecik'', 1, 2, 1, 91, N''zeynep.celik@kampus.edu.tr'', dbo.tc_sifrele(''28420614625''), dbo.tc_ozet(''28420614625'')),
(N''2024010105'', N''Emre'', N''Şahin'', N''E'', ''2004-05-17'', N''Malatya'', 1, 1, 2, 60, N''emre.sahin@kampus.edu.tr'', dbo.tc_sifrele(''43218312846''), dbo.tc_ozet(''43218312846'')),
(N''2025010106'', N''Işıl'', N''Arslan'', N''K'', ''2006-08-03'', N''İzmir'', 1, 2, 1, 47, NULL, dbo.tc_sifrele(''20356883162''), dbo.tc_ozet(''20356883162'')),
(N''2024020101'', N''Burak'', N''Öztürk'', N''E'', ''2005-02-25'', N''Eskişehir'', 2, 3, 2, 80, N''burak.ozturk@kampus.edu.tr'', dbo.tc_sifrele(''93377828906''), dbo.tc_ozet(''93377828906'')),
(N''2024020102'', N''Elif'', N''Aydın'', N''K'', ''2005-09-12'', N''Bilecik'', 2, 3, 2, 76, N''elif.aydin@kampus.edu.tr'', dbo.tc_sifrele(''72040010149''), dbo.tc_ozet(''72040010149'')),
(N''2025020103'', N''Can'', N''Yıldız'', N''E'', ''2006-04-28'', N''İstanbul'', 2, 8, 1, 39, N''can.yildiz@kampus.edu.tr'', dbo.tc_sifrele(''95952778002''), dbo.tc_ozet(''95952778002'')),
(N''2025020104'', N''Şule'', N''Koç'', N''K'', ''2006-12-05'', N''Bursa'', 2, 3, 1, 83, NULL, dbo.tc_sifrele(''14878941248''), dbo.tc_ozet(''14878941248'')),
(N''2024030101'', N''Arda'', N''Kurt'', N''E'', ''2004-10-19'', N''Malatya'', 3, 4, 2, 67, N''arda.kurt@kampus.edu.tr'', dbo.tc_sifrele(''99418464746''), dbo.tc_ozet(''99418464746'')),
(N''2024030102'', N''İrem'', N''Aksoy'', N''K'', ''2005-06-08'', N''Eskişehir'', 3, 4, 2, 94, N''irem.aksoy@kampus.edu.tr'', dbo.tc_sifrele(''29949362161''), dbo.tc_ozet(''29949362161'')),
(N''2025030103'', N''Gökay'', N''Polat'', N''E'', ''2006-03-21'', N''Bilecik'', 3, 4, 1, 58, N''gokay.polat@kampus.edu.tr'', dbo.tc_sifrele(''88414653571''), dbo.tc_ozet(''88414653571'')),
(N''2025030104'', N''Çağla'', N''Erdem'', N''K'', ''2006-07-15'', N''Kütahya'', 3, NULL, 1, 71, NULL, dbo.tc_sifrele(''10381353150''), dbo.tc_ozet(''10381353150'')),
(N''2024040101'', N''Ömer'', N''Kaya'', N''E'', ''2004-12-01'', N''Bursa'', 4, 5, 2, 45, N''omer.kaya@kampus.edu.tr'', dbo.tc_sifrele(''60585934123''), dbo.tc_ozet(''60585934123'')),
(N''2024040102'', N''Aslı'', N''Doğan'', N''K'', ''2005-01-27'', N''Sakarya'', 4, 5, 2, 80, N''asli.dogan@kampus.edu.tr'', dbo.tc_sifrele(''30833906800''), dbo.tc_ozet(''30833906800'')),
(N''2025040103'', N''Ümit'', N''Yılmaz'', N''E'', ''2006-09-09'', N''Malatya'', 4, 5, 1, 62, NULL, dbo.tc_sifrele(''54383389452''), dbo.tc_ozet(''54383389452'')),
(N''2024050101'', N''Tuğba'', N''Demir'', N''K'', ''2005-04-04'', N''Eskişehir'', 5, 6, 2, 53, N''tugba.demir@kampus.edu.tr'', dbo.tc_sifrele(''57683474374''), dbo.tc_ozet(''57683474374'')),
(N''2025050102'', N''Yusuf'', N''Güneş'', N''E'', ''2006-02-16'', N''İstanbul'', 5, 6, 1, 69, N''yusuf.gunes@kampus.edu.tr'', dbo.tc_sifrele(''78482479346''), dbo.tc_ozet(''78482479346'')),
(N''2025000001'', N''Deniz'', N''Yıldırım'', N''K'', ''2005-11-11'', N''Bilecik'', NULL, NULL, 1, 77, N''deniz.yildirim@kampus.edu.tr'', dbo.tc_sifrele(''64741794372''), dbo.tc_ozet(''64741794372''));

INSERT [ogrenci_detay] ([ogrenci_id], [telefon], [ikamet_ili], [adres], [kan_grubu], [veli_adi], [veli_telefon], [burslu], [yurtta_kaliyor], [kayit_tarihi]) VALUES
(1, N''0500 101 10 01'', N''Bilecik'', N''Ertuğrulgazi Mah. Kızılay Cad. No:5, Merkez'', N''A Rh+'', N''Hasan Yılmaz'', N''0500 201 10 01'', 0, 0, ''2024-09-02''),
(2, N''0500 101 10 02'', N''Bilecik'', N''KYK Bilecik Kız Öğrenci Yurdu'', N''0 Rh+'', N''Fatma Kaya'', N''0500 201 10 02'', 1, 1, ''2024-09-02''),
(3, N''0500 101 10 03'', N''Bursa'', N''Osmangazi Mah. Çınar Sok. No:8, Osmangazi'', N''B Rh+'', N''Ali Demir'', N''0500 201 10 03'', 0, 0, ''2025-09-08''),
(4, N''0500 101 10 04'', N''Bilecik'', N''Bahçelievler Mah. Gazi Cad. No:21, Merkez'', N''A Rh-'', N''Mustafa Çelik'', N''0500 201 10 04'', 1, 0, ''2025-09-08''),
(5, N''0500 101 10 05'', N''Bilecik'', N''KYK Bilecik Erkek Öğrenci Yurdu'', N''0 Rh+'', N''İbrahim Şahin'', NULL, 0, 1, ''2024-09-02''),
(7, N''0500 101 10 07'', N''Eskişehir'', N''Hoşnudiye Mah. İsmet İnönü Cad. No:44, Tepebaşı'', N''AB Rh+'', N''Serkan Öztürk'', N''0500 201 10 07'', 0, 0, ''2024-09-03''),
(8, N''0500 101 10 08'', N''Bilecik'', N''İstiklal Mah. Atatürk Bulvarı No:17, Merkez'', N''A Rh+'', N''Ayten Aydın'', N''0500 201 10 08'', 1, 0, ''2024-09-03''),
(9, N''0500 101 10 09'', N''Bilecik'', N''KYK Bilecik Erkek Öğrenci Yurdu'', N''0 Rh-'', N''Kemal Yıldız'', N''0500 201 10 09'', 0, 1, ''2025-09-09''),
(10, N''0500 101 10 10'', N''Bursa'', N''Fethiye Mah. Ilıca Cad. No:3, Nilüfer'', N''B Rh+'', N''Sevgi Koç'', NULL, 1, 0, ''2025-09-09''),
(11, N''0500 101 10 11'', N''Bilecik'', N''Gülümbe Mah. Kampüs Sok. No:4, Merkez'', N''A Rh+'', N''Osman Kurt'', N''0500 201 10 11'', 0, 0, ''2024-09-04''),
(12, N''0500 101 10 12'', N''Eskişehir'', N''Vişnelik Mah. Kurtuluş Cad. No:9, Odunpazarı'', N''0 Rh+'', N''Nermin Aksoy'', N''0500 201 10 12'', 1, 0, ''2024-09-04''),
(13, N''0500 101 10 13'', N''Bilecik'', N''Cumhuriyet Mah. Pazaryeri Cad. No:30, Pazaryeri'', NULL, N''Ramazan Polat'', N''0500 201 10 13'', 0, 0, ''2025-09-10''),
(14, N''0500 101 10 14'', N''Bilecik'', N''KYK Bilecik Kız Öğrenci Yurdu'', N''A Rh+'', N''Gülay Erdem'', N''0500 201 10 14'', 0, 1, ''2025-09-10''),
(15, N''0500 101 10 15'', N''Bilecik'', N''KYK Bilecik Erkek Öğrenci Yurdu'', N''0 Rh+'', N''Recep Kaya'', NULL, 0, 1, ''2024-09-05''),
(16, N''0500 101 10 16'', N''Sakarya'', N''Mithatpaşa Mah. Çark Cad. No:12, Adapazarı'', N''A Rh-'', N''Hülya Doğan'', N''0500 201 10 16'', 1, 0, ''2024-09-05''),
(17, N''0500 101 10 17'', N''Bilecik'', N''KYK Bilecik Erkek Öğrenci Yurdu'', N''B Rh+'', N''Cemal Yılmaz'', N''0500 201 10 17'', 0, 1, ''2025-09-11''),
(18, N''0500 101 10 18'', N''Eskişehir'', N''Şirintepe Mah. Kanatlı Sok. No:6, Tepebaşı'', N''0 Rh+'', N''Nuri Demir'', N''0500 201 10 18'', 0, 0, ''2024-09-06''),
(19, N''0500 101 10 19'', N''Bilecik'', N''KYK Bilecik Erkek Öğrenci Yurdu'', N''A Rh+'', N''Bekir Güneş'', N''0500 201 10 19'', 1, 1, ''2025-09-11'');

INSERT [ders] ([ders_kodu], [ders_adi], [kredi], [bolum_id], [ogretim_elemani_id]) VALUES
(N''BP101'', N''Algoritma ve Programlamaya Giriş'', 4, 1, 1),
(N''BP102'', N''Veritabanı Yönetim Sistemleri'', 4, 1, 9),
(N''BP201'', N''Nesne Tabanlı Programlama'', 4, 1, 2),
(N''WT101'', N''Web Tasarımın Temelleri'', 3, 2, 3),
(N''WT201'', N''Mobil Uygulama Geliştirme'', 3, 2, 3),
(N''AT101'', N''Ağ Temelleri'', 3, 3, 4),
(N''AT201'', N''Kablosuz Ağ Teknolojileri'', 3, 3, 4),
(N''MV101'', N''Genel Muhasebe'', 4, 4, 5),
(N''EL101'', N''Temel Elektrik'', 4, 5, 6),
(N''TD101'', N''Türk Dili'', 2, NULL, 7),
(N''MT101'', N''Matematik'', 3, NULL, 7),
(N''IS101'', N''İş Sağlığı ve Güvenliği'', 2, NULL, NULL);

INSERT [ders_kayit] ([ogrenci_id], [ders_id], [vize], [final]) VALUES
(1, 2, 70, 78), (1, 3, 65, 72), (1, 11, 55, 60),
(2, 2, 90, 85), (2, 3, 82, 95), (2, 11, 75, 88),
(3, 1, 45, 58), (3, 2, 50, NULL), (3, 10, 60, 64),
(4, 1, 95, 92), (4, 2, 88, 96), (4, 10, 85, 90),
(5, 2, 60, 55), (5, 3, 58, 66),
(6, 1, 30, 42), (6, 10, 52, NULL),
(7, 5, 78, 84), (7, 2, 72, 80),
(8, 5, 70, 74), (8, 2, 68, 79), (8, 11, 80, 82),
(9, 4, 35, 40), (9, 10, 48, 45),
(10, 4, 85, 88), (10, 10, 90, 86), (10, 1, 76, 81),
(11, 6, 62, 70), (11, 11, 58, 65),
(12, 6, 92, 98), (12, 2, 88, 93),
(13, 6, 55, 60), (13, 10, 64, 57),
(14, 6, 70, 74), (14, 10, 72, 68),
(15, 8, 40, 47), (15, 11, 42, NULL),
(16, 8, 78, 85), (16, 11, 80, 76),
(17, 8, 60, 66), (17, 10, 65, 58),
(18, 9, 50, 56), (18, 11, 48, 52),
(19, 9, 66, 72), (19, 10, 70, 70);

INSERT [kategori] ([kategori_adi]) VALUES
(N''Roman''),
(N''Bilim Kurgu''),
(N''Polisiye''),
(N''Tarih''),
(N''Bilgisayar''),
(N''Felsefe''),
(N''Şiir''),
(N''Fantastik'');

INSERT [yazar] ([ad], [soyad], [ulke], [dogum_yili]) VALUES
(N''Orhan'', N''Pamuk'', N''Türkiye'', 1952),
(N''Sabahattin'', N''Ali'', N''Türkiye'', 1907),
(N''Yaşar'', N''Kemal'', N''Türkiye'', 1923),
(N''Agatha'', N''Christie'', N''İngiltere'', 1890),
(N''Isaac'', N''Asimov'', N''ABD'', 1920),
(N''George'', N''Orwell'', N''İngiltere'', 1903),
(N''Terry'', N''Pratchett'', N''İngiltere'', 1948),
(N''Neil'', N''Gaiman'', N''İngiltere'', 1960),
(N''Brian'', N''Kernighan'', N''Kanada'', 1942),
(N''Dennis'', N''Ritchie'', N''ABD'', 1941),
(N''Robert'', N''Martin'', N''ABD'', 1952),
(N''İlber'', N''Ortaylı'', N''Türkiye'', 1947),
(N''Halil'', N''İnalcık'', N''Türkiye'', 1916),
(N''Ahmet Hamdi'', N''Tanpınar'', N''Türkiye'', 1901),
(N''Albert'', N''Camus'', N''Fransa'', 1913),
(N''Nazım'', N''Hikmet'', N''Türkiye'', 1902),
(N''J.R.R.'', N''Tolkien'', N''İngiltere'', 1892);

INSERT [kitap] ([kitap_adi], [kategori_id], [yayinevi], [sayfa_sayisi], [basim_yili], [dil], [stok]) VALUES
(N''Kar'', 1, N''Yapı Kredi Yayınları'', 436, 2018, N''Türkçe'', 3),
(N''Masumiyet Müzesi'', 1, N''Yapı Kredi Yayınları'', 592, 2016, N''Türkçe'', 2),
(N''Kürk Mantolu Madonna'', 1, N''Yapı Kredi Yayınları'', 160, 2021, N''Türkçe'', 5),
(N''İçimizdeki Şeytan'', 1, N''Yapı Kredi Yayınları'', 264, 2019, N''Türkçe'', 2),
(N''İnce Memed 1'', 1, N''Yapı Kredi Yayınları'', 436, 2017, N''Türkçe'', 1),
(N''Doğu Ekspresinde Cinayet'', 3, N''Altın Kitaplar'', 256, 2020, N''Türkçe'', 4),
(N''Ve Sonra Hiç Kalmadı'', 3, N''Altın Kitaplar'', 248, 2019, N''Türkçe'', 3),
(N''Vakıf'', 2, N''İthaki Yayınları'', 288, 2018, N''Türkçe'', 2),
(N''Ben, Robot'', 2, N''İthaki Yayınları'', 304, 2020, N''Türkçe'', 0),
(N''1984'', 2, N''Can Yayınları'', 352, 2021, N''Türkçe'', 6),
(N''Hayvan Çiftliği'', 1, N''Can Yayınları'', 152, 2022, N''Türkçe'', 4),
(N''Kıyamet Gösterisi'', 2, N''İthaki Yayınları'', 432, 2017, N''Türkçe'', 1),
(N''The C Programming Language'', 5, N''Prentice Hall'', 272, 1988, N''İngilizce'', 2),
(N''Temiz Kod'', 5, N''Kodlab'', 431, 2019, N''Türkçe'', 3),
(N''Clean Architecture'', 5, N''Prentice Hall'', 432, 2017, N''İngilizce'', 1),
(N''Türklerin Tarihi'', 4, N''Timaş Yayınları'', 288, 2015, N''Türkçe'', 2),
(N''Osmanlı İmparatorluğu Klasik Çağ'', 4, N''Yapı Kredi Yayınları'', 352, 2016, N''Türkçe'', 1),
(N''Huzur'', 1, N''Dergah Yayınları'', 392, 2018, N''Türkçe'', 2),
(N''Saatleri Ayarlama Enstitüsü'', 1, N''Dergah Yayınları'', 382, 2020, N''Türkçe'', 3),
(N''Yabancı'', 6, N''Can Yayınları'', 112, 2021, N''Türkçe'', 5),
(N''Sisifos Söyleni'', 6, N''Can Yayınları'', 160, 2019, N''Türkçe'', 2),
(N''Kampüs Rehberi'', NULL, N''Kampüs Yayınları'', 96, 2025, N''Türkçe'', 10),
(N''Yüzüklerin Efendisi'', 8, N''Metis Yayınları'', 1192, 2020, N''Türkçe'', 2),
(N''Hobbit'', 8, N''İthaki Yayınları'', 384, 2019, N''Türkçe'', 3),
(N''Silmarillion'', 8, N''İthaki Yayınları'', 528, 2021, N''Türkçe'', 2);

INSERT [kitap_yazar] ([kitap_id], [yazar_id]) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 4), (7, 4), (8, 5), (9, 5), (10, 6), (11, 6),
(12, 7), (12, 8), (13, 9), (13, 10), (14, 11), (15, 11), (16, 12), (17, 13), (18, 14), (19, 14),
(20, 15), (21, 15), (23, 17), (24, 17), (25, 17);

INSERT [odunc] ([kitap_id], [ogrenci_id], [odunc_tarihi], [son_teslim_tarihi], [iade_tarihi]) VALUES
(3, 1, ''2025-09-21'', ''2025-10-05'', ''2025-10-02''),
(14, 2, ''2025-09-21'', ''2025-10-05'', ''2025-10-04''),
(10, 4, ''2025-09-22'', ''2025-10-06'', ''2025-10-10''),
(6, 8, ''2025-09-22'', ''2025-10-06'', ''2025-10-01''),
(13, 3, ''2025-09-23'', ''2025-10-07'', ''2025-10-07''),
(3, 12, ''2025-09-24'', ''2025-10-08'', ''2025-10-08''),
(8, 11, ''2025-09-25'', ''2025-10-09'', ''2025-10-20''),
(1, 16, ''2025-09-25'', ''2025-10-09'', ''2025-10-06''),
(14, 5, ''2025-09-28'', ''2025-10-12'', ''2025-10-12''),
(11, 10, ''2025-09-28'', ''2025-10-12'', ''2025-10-09''),
(19, 18, ''2025-09-29'', ''2025-10-13'', ''2025-10-15''),
(3, 20, ''2025-09-30'', ''2025-10-14'', ''2025-10-13''),
(20, 15, ''2025-10-01'', ''2025-10-15'', ''2025-10-14''),
(12, 7, ''2025-10-02'', ''2025-10-16'', ''2025-10-16''),
(10, 2, ''2025-10-05'', ''2025-10-19'', ''2025-10-17''),
(7, 14, ''2025-10-05'', ''2025-10-19'', ''2025-10-27''),
(16, 19, ''2025-10-06'', ''2025-10-20'', ''2025-10-19''),
(14, 13, ''2025-10-07'', ''2025-10-21'', NULL),
(4, 6, ''2025-10-08'', ''2025-10-22'', ''2025-10-21''),
(3, 8, ''2025-10-09'', ''2025-10-23'', ''2025-10-22''),
(21, 12, ''2025-10-12'', ''2025-10-26'', ''2025-10-23''),
(18, 1, ''2025-10-13'', ''2025-10-27'', NULL),
(2, 4, ''2025-10-14'', ''2025-10-28'', ''2025-10-26''),
(10, 11, ''2025-10-15'', ''2025-10-29'', NULL),
(9, 16, ''2025-10-16'', ''2025-10-30'', NULL),
(6, 20, ''2025-10-19'', ''2025-11-02'', ''2025-10-26''),
(1, 3, ''2025-10-20'', ''2025-11-03'', ''2025-10-28''),
(11, 5, ''2025-10-21'', ''2025-11-04'', ''2025-10-27''),
(8, 2, ''2025-10-22'', ''2025-11-05'', ''2025-10-29''),
(19, 12, ''2025-10-23'', ''2025-11-06'', ''2025-10-29''),
(24, 7, ''2025-10-19'', ''2025-11-02'', ''2025-10-30''),
(23, 10, ''2025-10-20'', ''2025-11-03'', ''2025-10-29''),
(24, 19, ''2025-10-26'', ''2025-11-09'', NULL);

/*DATA*/
';


EXEC sp_executesql @SQL_Setup;

PRINT('"Kampus" veritabanı, tabloları ve verileri oluşturuldu.')

END TRY
BEGIN CATCH

    PRINT('!!! HATA OLUŞTU !!!');
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_STATE() AS ErrorState,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH
