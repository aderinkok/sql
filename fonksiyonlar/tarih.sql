-- Tarih Fonksiyonları
--syntax

 GETDATE()
 CURRENT_TIMESTAMP
 SYSDATETIME()
 DATEADD([TUR],[SAYI],[TARİH])
 -- [TUR] parametresi MILLISECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH ya da YEAR olabilir. 
 DATEDIFF([TUR],[TARİH1],[TARİH2])
 -- [TUR] parametresi MILLISECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH ya da YEAR olabilir.
 DATEPART([TUR],[TARİH])
 -- [TUR] parametresi MILLISECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH ya da YEAR olabilir.

 --Örnek - GETDATE 

SELECT GETDATE()

-- Örnek - GETDATE Çıktı
/*
|(No column name)         |
| YYYY-AA-GG SS:DD:ss.xxx | 

Komutun çalıştırıldığı andaki tarih bilgisini YYYY-AA-GG SS:DD:ss.xxx formatında yazdırır.
*/

 --Örnek - CURRENT_TIMESTAMP 

SELECT CURRENT_TIMESTAMP


-- Örnek - CURRENT_TIMESTAMP Çıktı
/*
|(No column name)         |
| YYYY-AA-GG SS:DD:ss.xxx | 

Komutun çalıştırıldığı andaki tarih bilgisini YYYY-AA-GG SS:DD:ss.xxx formatında yazdırır.
*/

 --Örnek -  SYSDATETIME 

SELECT  SYSDATETIME()


-- Örnek -  SYSDATETIME Çıktı
/*
|(No column name)         |
| YYYY-AA-GG SS:DD:ss.xxxxxxx | 

Komutun çalıştırıldığı andaki tarih bilgisini YYYY-AA-GG SS:DD:ss.xxx formatında yazdırır.
*/

 --Örnek - DATEADD 

SELECT DATEADD(YEAR,5,'2022-12-03')  --1
SELECT DATEADD(MONTH,5,'2022-12-03') --2
SELECT DATEADD(DAY,5,'2022-12-03')   --3
SELECT DATEADD(MONTH,-5,'2022-01-01') --4
-- Örnek - DATEADD Çıktı
/*
|(No column name)         | [1]
| 2027-12-03 00:00:00.000 | 

|(No column name)         | [2]
| 2023-05-03 00:00:00.000 | 

|(No column name)         | [3]
| 2022-12-08 00:00:00.000 | 

|(No column name)         | [4]
| 2021-08-01 00:00:00.000 | 

*/

 --Örnek - DATEDIFF 

SELECT DATEDIFF(YEAR,'2019-05-08','2022-12-03')  --1
SELECT DATEDIFF(MONTH,'2019-05-08','2022-12-03') --2
SELECT DATEDIFF(DAY,'2019-05-08','2022-12-03')   --3

-- Örnek - DATEDIFF Çıktı
/*
|(No column name) | [1]
| 3               | 

|(No column name) | [2]
| 43              | 

|(No column name) | [3]
| 1305            | 

*/

 --Örnek - DATEPART 

SELECT DATEPART(YEAR,'2022-12-03')    --1
SELECT DATEPART(MONTH,'2022-12-03') --2
SELECT DATEPART(DAY,'2022-12-03')   --3

-- Örnek - DATEPART Çıktı
/*
|(No column name) | [1]
| 2022            | 

|(No column name) | [2]
| 12              | 

|(No column name) | [3]
| 3               | 

*/

