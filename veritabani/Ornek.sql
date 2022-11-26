/*�rnek veritaban�  - 2022 
Bulunan Tablolar:
1- ogrenci (vize)





*/
SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='Ornek')
		drop database Ornek
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE Ornek
  ON PRIMARY (NAME = N''Ornek'', FILENAME = N''' + @device_directory + N'ornk.mdf'')
  LOG ON (NAME = N''ornk_log'',  FILENAME = N''' + @device_directory + N'ornk.ldf'')')
go

set quoted_identifier on
GO
SET DATEFORMAT mdy
GO
use "Ornek"
go

CREATE TABLE "ogrenci" (
	"id" "int" IDENTITY (1, 1) NOT NULL ,
	"ad" nvarchar (50) NOT NULL ,
	"soyad" nvarchar (50) NOT NULL ,
	"bolum" nvarchar (20) NOT NULL ,
	"ortalama" int NOT NULL ,
	"dogum_yeri" nvarchar (50) NOT NULL ,
	"yas" int NOT NULL,
	CONSTRAINT "PK_ogrenci" PRIMARY KEY  CLUSTERED 
	(
		"id"
	)
	)
GO

INSERT  ogrenci VALUES 
('Ahmet', '�nl�','Bilgisayar',65,'Malatya',19),
('Mehmet', 'Y�lmaz','Elektrik',78,'Bilecik',20),
('Ay�e', 'Demir','Muhasebe',65,'Eski�ehir',20),
('Ali', '�ahin','Bilgisayar',80,'Malatya',21),
('Musa', 'Ta�','Elektrik',55,'Malatya',19),
('Yaprak', 'G�l','Bilgisayar',60,'Bilecik',19),
('Yi�it', 'Y�ld�r�m','Bilgisayar',82,'Malatya',20),
('Can', 'Yi�it','Elektrik',90,'Bilecik',19),
('Meral', 'Yi�iter','Muhasebe',85,'Malatya',21)

GO
