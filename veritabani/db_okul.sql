/*
KURULUM DETAYLARI
- İmleç bu sayfada iken "Execute" butonu veya F5 tuşu ile sayfadaki sorgular işletilir.
- Sorgular işletildikten sonra "Db_okul" veritabanı, tabloları ve verileri oluşturuldu." mesajı çıktı olarak görülmelidir.
- Hata alınması durumunda sık karşılaşılan durum veritabanının ilgili sunucuda var olması ve seçili olmasından kaynaklı silme işlemenin gerçekleştirilememesidir.
- CTRL + U seçeneği ile ya da "Execute" butonunun sol tarafında aktif/seçili durumda olan veritabanı tüm çalışma sayfalarında "Db_okul" dışında bir seçeneğe ayarlanarak sayfa tekrar çalıştırılmalıdır.



 -------------------------------
|Db_okul veritabanı  - 2023    |
 -------------------------------
_________________________
|Bulunan Tablolar:      |
|-----------------------|
|1- ogrenci             |
|2- ogrenci_detay       |
|3- ogretmen            |
|4- bolum               |
|5- ders                |
_________________________





*/
BEGIN TRY
SET NOCOUNT ON;
USE master;
if exists (select * from sysdatabases where name='Db_okul')
        --print('Db_okul veritabanı sunucuda bulundu yeniden oluşturulmadan önce silinecek.');
		USE tempdb;
DECLARE @SQL nvarchar(1000);
IF EXISTS (SELECT TOP 1 * FROM sys.databases WHERE [name] = N'Db_okul')
BEGIN
    SET @SQL = N'USE [Db_okul];
                 ALTER DATABASE Db_okul SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                 USE [tempdb];
                 DROP DATABASE Db_okul;';
    EXEC (@SQL);
END;
DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1
EXECUTE (N'CREATE DATABASE Db_okul
  ON PRIMARY (NAME = N''Db_okul'', FILENAME = N''' + @device_directory + N'dokul.mdf'')
  LOG ON (NAME = N''dokul_log'',  FILENAME = N''' + @device_directory + N'dokul.ldf'')')
--print('Db_okul veritabanı oluşturuldu.')
set quoted_identifier on
SET DATEFORMAT mdy
use "Db_okul"
/*TABLE*/

CREATE TABLE "ogrenci" (
	"id" "int" IDENTITY (1, 1) NOT NULL ,
	"tc_kimlik" nvarchar (50) NOT NULL,
	"ad" nvarchar (50) NOT NULL ,
	"soyad" nvarchar (50) NOT NULL ,
	"dogum_yeri" nvarchar (50) NOT NULL ,
	"dogum_tarihi" date,
	CONSTRAINT "PK_ogrenci" PRIMARY KEY  CLUSTERED("id")
	)
CREATE TABLE "bolum" (
"id" "int" IDENTITY (1, 1) NOT NULL,
"bolum_adi" NVARCHAR(100) NOT NULL,
CONSTRAINT "PK_bolum" PRIMARY KEY  CLUSTERED("id"),
)
CREATE TABLE "ogretmen" (
"id" "int" IDENTITY (1, 1) NOT NULL ,
"ad" NVARCHAR(20) NOT NULL,
"soyad" NVARCHAR(20) NOT NULL,
"bolum_id" INT,
"brans" NVARCHAR(40),
"dogum_yeri" NVARCHAR(40),
CONSTRAINT "PK_ogretmen" PRIMARY KEY  CLUSTERED("id"),
CONSTRAINT "FK_bolumO" FOREIGN KEY("bolum_id") REFERENCES bolum(id) ON DELETE SET NULL ON UPDATE NO ACTION,
)

CREATE TABLE ders (
"id" "int" IDENTITY (1, 1) NOT NULL ,
"ders_adi" NVARCHAR(50) NOT NULL,
"brans" NVARCHAR(40),
CONSTRAINT "PK_ders" PRIMARY KEY  CLUSTERED("id"),
)

CREATE TABLE ders_ogretmen (
"id" "int" IDENTITY (1, 1) NOT NULL ,
"ders_id" INT NOT NULL,
"ogretmen_id" INT NOT NULL,
CONSTRAINT "PK_ders_ogretmen" PRIMARY KEY  CLUSTERED("id"),
CONSTRAINT "FK_ders" FOREIGN KEY("ders_id") REFERENCES ders(id) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT "FK_ogretmenD" FOREIGN KEY("ogretmen_id") REFERENCES ogretmen(id) ON DELETE CASCADE ON UPDATE NO ACTION,
)

CREATE TABLE ders_bolum (
"id" "int" IDENTITY (1, 1) NOT NULL ,
"bolum_id" INT NOT NULL,
"ders_id" INT NOT NULL,
CONSTRAINT "PK_ders_bolum" PRIMARY KEY  CLUSTERED("id"),
CONSTRAINT "FK_bolumD" FOREIGN KEY("bolum_id") REFERENCES bolum(id) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT "FK_dersB" FOREIGN KEY("ders_id") REFERENCES ders(id) ON DELETE CASCADE ON UPDATE NO ACTION,
)

CREATE TABLE "ogrenci_detay" (
	"id" "int" IDENTITY (1, 1) NOT NULL ,
	"ogrenci_id" INT NOT NULL,
	"danisman_id" INT,
	"bolum_id" INT,
	"ortalama" INT,
	"telefon" NVARCHAR(30),
	"adres" NVARCHAR(MAX),
	CONSTRAINT "PK_ogrenci_detay" PRIMARY KEY  CLUSTERED ("id"),
	CONSTRAINT "FK_ogrenci" FOREIGN KEY("ogrenci_id") REFERENCES ogrenci(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "FK_danisman" FOREIGN KEY("danisman_id") REFERENCES ogretmen(id) ON DELETE SET NULL ON UPDATE NO ACTION,
	CONSTRAINT "FK_bolum" FOREIGN KEY("bolum_id") REFERENCES bolum(id) ON DELETE SET NULL ON UPDATE NO ACTION,
	)
--print('Db_okul veritabanına ait tablolar oluşturuldu.')
/*TABLE*/

/*DATA*/
INSERT bolum VALUES
('Bilgisayar programcılığı'),
('Web Tasarımı ve Kodlama'),
('İnternet ve Ağ Teknolojileri'),
('Muhasebe')

INSERT ogretmen VALUES
('Abdulmelik','Derinkök',NULL,'Eğitim Bilimleri','Malatya'),
('Ahmet','Mutlu',NULL,'Bilgisayar','İzmir'),
('Erhan','Kara',1,'Bilgisayar','Bursa'),
('Yusuf','Aydın',2,'Web Tasarım','Sakarya'),
('Ali','Türk',2,'Web Tasarım','Edirne')
INSERT  ogrenci VALUES 
('11111111110', 'Ahmet','Ünlü','Malatya','1997-05-18'),
('22222222220', 'Mehmet','Yılmaz','İstanbul','1999-09-17'),
('33333333330', 'Ayşe','Demir','Hatay','1997-08-05'),
('44444444440', 'Hacer','Çakır','Siirt','1997-03-12'),
('55555555550', 'Hamdi','Kaya','Gaziantep','1996-01-25'),
('66666666660', 'Yasemin','Çelik','Rize','1999-05-30'),
('77777777770', 'Zeynep','Aydın','Bilecik','1995-02-06')

INSERT  ogrenci_detay(ogrenci_id,danisman_id,bolum_id,ortalama,telefon,adres) VALUES 
(1,1, 1,65,'05541234567','Merkez - Bilecik'),
(2,3, 3,73,'05351234567','Merkez - Bilecik'),
(3,4, 2,38,'05451234567','Merkez - Bilecik'),
(4,5, NULL,92,'05051234567','Merkez - Bilecik'),
(5,2, 1,79,'05301234567','Merkez - Bilecik'),
(6,1, 2,48,'05321234567','Pazayeri - Bilecik'),
(7,5, 3,55,'05441234567','Pazayeri - Bilecik')

INSERT  ogrenci_detay VALUES 
(3,2, NULL,70,'05061234567','Pazayeri - Bilecik'),
(5,3, 1,77,'05381234567','Pazayeri - Bilecik')

INSERT  ders VALUES 
('Veritabanı ve Yönetim Sistemleri', 'Bilgisayar'),
('Web Tasarımın Temelleri', 'Bilgisayar')
INSERT  ders(ders_adi) VALUES 
('Proje Yönetimi')
INSERT  ders VALUES 
('Temel Elektronik', 'Elektrik'),
('Matematik', 'Kültür'),
('Tarih', 'Kültür'),
('Türk Dili', 'Kültür'),
('Ağ Cihazları', 'Ağ Teknolojileri'),
('Kablosuz Ağ Cihazları', 'Ağ Teknolojileri'),
('Mobil Uygulama Geliştirme', 'Web'),
('İleri Web Programlama', 'Bilgisayar'),
('Grafik ve Animasyon', 'Web'),
('Kullanıcı Arabirimi Tasarımı', 'Web')
INSERT ders_bolum VALUES
(1,1),
(2,1),
(3,1),
(1,2),
(2,2),
(1,5),
(3,5),
(1,6),
(2,6),
(3,6),
(1,7),
(2,7),
(3,7),
(3,8),
(3,9),
(2,10),
(1,11),
(2,12),
(1,13)
INSERT ders_ogretmen VALUES
(1,1),
(1,2),
(2,3),
(5,5),
(5,3),
(4,1),
(13,2),
(11,2),
(10,1)

/*DATA*/
--print('Db_okul veritabanına ait veriler oluşturuldu.')
print('"Db_okul" veritabanı, tabloları ve verileri oluşturuldu.')
END TRY
BEGIN CATCH
PRINT('HATA')
END CATCH