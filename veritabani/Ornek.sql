/*
KURULUM DETAYLARI
- İmleç bu sayfada iken "Execute" butonu veya F5 tuşu ile sayfadaki sorgular işletilir.
- Sorgular işletildikten sonra "Ornek" veritabanı, tabloları ve verileri oluşturuldu." mesajı çıktı olarak görülmelidir.
- Hata alınması durumunda sık karşılaşılan durum veritabanının ilgili sunucuda var olması ve seçili olmasından kaynaklı silme işlemenin gerçekleştirilememesidir.
- CTRL + U seçeneği ile ya da "Execute" butonunun sol tarafında aktif/seçili durumda olan veritabanı tüm çalışma sayfalarında "Ornek" dışında bir seçeneğe ayarlanarak sayfa tekrar çalıştırılmalıdır.



 -------------------------------
|Ornek veritabanı  - 2022      |
|--Update 03.11.25             |
 -------------------------------
_________________________
|Bulunan Tablolar:      |
|-----------------------|
|1- ogrenci             |
_________________________





*/
BEGIN TRY
SET NOCOUNT ON;
USE master;


DECLARE @SQL_Drop nvarchar(1000);
IF EXISTS (SELECT TOP 1 * FROM sys.databases WHERE [name] = N'Ornek')
BEGIN
    SET @SQL_Drop = N'ALTER DATABASE Ornek SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                 DROP DATABASE Ornek;';
    EXEC (@SQL_Drop);
END;


DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1


EXECUTE (N'CREATE DATABASE Ornek
  ON PRIMARY (NAME = N''Ornek'', FILENAME = N''' + @device_directory + N'ornk.mdf'')
  LOG ON (NAME = N''ornk_log'',  FILENAME = N''' + @device_directory + N'ornk.ldf'')')


DECLARE @SQL_Setup nvarchar(MAX);
SET @SQL_Setup = N'
USE [Ornek];

SET DATEFORMAT mdy;
set quoted_identifier on;


CREATE TABLE [ogrenci] (
    [id] INT IDENTITY (1, 1) NOT NULL ,
    [ad] NVARCHAR(50) NOT NULL ,
    [soyad] NVARCHAR(50) NOT NULL ,
    [bolum] NVARCHAR(20) NOT NULL ,
    [ortalama] INT NOT NULL ,
    [dogum_yeri] NVARCHAR(50) NOT NULL ,
    [yas] INT NOT NULL,
    CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED ([id])
);


INSERT [ogrenci] ([ad], [soyad], [bolum], [ortalama], [dogum_yeri], [yas]) 
VALUES
(N''Ahmet'', N''Ünlü'',N''Bilgisayar'',65,N''Malatya'',19),
(N''Mehmet'', N''Yılmaz'',N''Elektrik'',78,N''Bilecik'',20),
(N''Ayşe'', N''Demir'',N''Muhasebe'',65,N''Eskişehir'',20),
(N''Ali'', N''Şahin'',N''Bilgisayar'',80,N''Malatya'',21),
(N''Musa'', N''Taş'',N''Elektrik'',55,N''Malatya'',19),
(N''Yaprak'', N''Göl'',N''Bilgisayar'',60,N''Bilecik'',19),
(N''Yiğit'', N''Yıldırım'',N''Bilgisayar'',82,N''Malatya'',20),
(N''Can'', N''Yiğit'',N''Elektrik'',90,N''Bilecik'',19),
(N''Meral'', N''Yiğiter'',N''Muhasebe'',85,N''Malatya'',21);
';


EXEC sp_executesql @SQL_Setup;

PRINT('"Ornek" veritabanı, tabloları ve verileri oluşturuldu.')

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
