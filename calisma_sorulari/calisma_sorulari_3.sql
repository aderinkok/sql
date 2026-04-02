/* ================================
   1. CREATE DATABASE
================================ */

CREATE DATABASE final;
GO

USE final;
GO


/* ================================
   2. CREATE TABLE: ogrenci
================================ */

CREATE TABLE ogrenci (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    dogum_yeri VARCHAR(30) DEFAULT 'TR',
    dogum_tarihi DATE NOT NULL
);


/* ================================
   3. CREATE TABLE: ogrenci_detay
================================ */

CREATE TABLE ogrenci_detay (
    id INT PRIMARY KEY IDENTITY(1,1),
    ogrenci_id INT,
    okul VARCHAR(50) DEFAULT 'Pazaryeri MYO',
    bolum VARCHAR(50) DEFAULT 'Bilgisayar Programcılığı',
    sinif INT NOT NULL,
    mezuniyet_tarihi DATE NULL,

    CONSTRAINT FK_ogrenci
    FOREIGN KEY (ogrenci_id)
    REFERENCES ogrenci(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


/* ================================
   4. INSERT DATA INTO ogrenci
================================ */

INSERT INTO ogrenci (ad, soyad, dogum_yeri, dogum_tarihi) VALUES
('Aytaç','Aksoy','Van','2000-01-04'),
('Naim','Aksoy','Eskişehir','2001-05-24'),
('Ensar','Yılmaz','İstanbul','2002-06-12'),
('Gülnaz','Değirmenci','Mardin','2001-02-17'),
('Abdülaziz','Küçük','Ankara','2000-03-10'),
('Mesud','Burakgazi','Bilecik','2003-04-08'),
('Gülnur','Teke','İzmir','2003-07-03'),
('Umut','Değirmenci','Trabzon','2002-02-07'),
('Bulut','Demirci','Ağrı','2001-05-14'),
('Belinay','Değirmenci','Rize','2002-06-19'),
('Firuze','Solak','Çanakkale','2003-03-21'),
('Fadime','Badem','Malatya','2000-06-09'),
('Danyal','Teke','Elazığ','2002-09-18'),
('Nadire','Kartal','Afyon','2001-12-26'),
('Behiye','Değirmenci','Tunceli','2000-11-23'),
('Mazhar','Katırcı','Sakarya','2001-11-18'),
('Haydar','Karga','Mersin','2001-01-12'),
('Lütfiye','Ekmekçi','Kırşehir','2000-10-27'),
('İpek','Yılmaz','Kayseri','2002-12-05'),
('Meral','Kartal','İstanbul','2001-06-19');


/* ================================
   INSERT DATA INTO ogrenci_detay
================================ */

INSERT INTO ogrenci_detay (ogrenci_id, okul, bolum, sinif, mezuniyet_tarihi) VALUES
(1,'Bilecik MYO','İnternet ve Ağ Tek.',1,'2021-06-23'),
(2,'Bozüyük MYO','Web Tasarım ve Kod.',1,NULL),
(3,'Malatya MYO','İnternet ve Ağ Tek.',2,'2021-06-23'),
(4,NULL,'Web Tasarım ve Kod.',2,NULL),
(5,'Ankara MYO','Web Tasarım ve Kod.',2,'2021-06-23'),
(6,'İzmir MYO','İnternet ve Ağ Tek.',1,NULL),
(7,'Bilecik MYO','İnternet ve Ağ Tek.',2,'2021-06-23'),
(8,'Malatya MYO',NULL,1,NULL),
(9,NULL,'İnternet ve Ağ Tek.',1,NULL),
(10,NULL,NULL,2,'2020-06-18'),
(11,'Ankara MYO','Web Tasarım ve Kod.',1,NULL),
(12,'Malatya MYO','İnternet ve Ağ Tek.',1,NULL),
(13,'İzmir MYO','İnternet ve Ağ Tek.',2,NULL),
(14,NULL,'Web Tasarım ve Kod.',1,NULL),
(15,'Bilecik MYO','Web Tasarım ve Kod.',1,NULL);


/* ================================
   5. INNER JOIN (Only matching rows)
================================ */

SELECT *
FROM ogrenci o
INNER JOIN ogrenci_detay od
ON o.id = od.ogrenci_id;


/* ================================
   6. LEFT JOIN (All students)
================================ */

SELECT *
FROM ogrenci o
LEFT JOIN ogrenci_detay od
ON o.id = od.ogrenci_id;


/* ================================
   7. RIGHT JOIN
================================ */

SELECT *
FROM ogrenci o
RIGHT JOIN ogrenci_detay od
ON o.id = od.ogrenci_id;


/* ================================
   8. FULL JOIN
================================ */

SELECT *
FROM ogrenci o
FULL JOIN ogrenci_detay od
ON o.id = od.ogrenci_id;


/* ================================
   9. UPDATE dogum_yeri
================================ */

UPDATE ogrenci
SET dogum_yeri = 'Afyonkarahisar'
WHERE dogum_yeri = 'Afyon';


/* ================================
   10. UPDATE bolum names
================================ */

UPDATE ogrenci_detay
SET bolum = 'İnternet ve Ağ Teknolojileri'
WHERE bolum LIKE '%Tek.%';

UPDATE ogrenci_detay
SET bolum = 'Web Tasarım ve Kodlama'
WHERE bolum LIKE '%Kod.%';


/* ================================
   11. Extract day, month, year
================================ */

SELECT
    DAY(dogum_tarihi) AS gun,
    MONTH(dogum_tarihi) AS ay,
    YEAR(dogum_tarihi) AS yil
FROM ogrenci;


/* ================================
   12. Delete all records
================================ */

DELETE FROM ogrenci;


/* ================================
   13. Delete records with NULL mezuniyet_tarihi
================================ */

DELETE FROM ogrenci_detay
WHERE mezuniyet_tarihi IS NULL;


/* ================================
   14. Drop tables
================================ */

DROP TABLE ogrenci_detay;
DROP TABLE ogrenci;


/* ================================
   15. Drop database
================================ */

USE master;
DROP DATABASE final;
