-- Tarih Fonksiyonlar�
--syntax

GETDATE([SAYI],[US])
CURRENT_TIMESTAMP
SYSDATETIME
DATEADD([TUR],[SAYI],[TAR�H])
-- [TUR] parametresi MILLISECOND,SECOND,MINUTE,HOUR, DAY,WEEK,MONTH ya da YEAR olabilir.
DATEDIFF([TUR],[TAR�H1],[TAR�H2])
-- [TUR] parametresi DAY,MONTH ya da YEAR olabilir.

 --�rnek - GETDATE 

SELECT GETDATE()

-- �rnek - GETDATE ��kt�
/*
|(No column name)         |
| YYYY-AA-GG SS:DD:ss.xxx | 

Komutun �al��t�r�ld��� andaki tarih bilgisini YYYY-AA-GG SS:DD:ss.xxx format�nda yazd�r�r.
*/
 --�rnek - DATEADD 

SELECT DATEADD(YEAR,5,'2022-12-03')  --1
SELECT DATEADD(MONTH,5,'2022-12-03') --2
SELECT DATEADD(DAY,5,'2022-12-03')   --3

-- �rnek - DATEADD ��kt�
/*
|(No column name)         | [1]
| 2027-12-03 00:00:00.000 | 

|(No column name)         | [2]
| 2023-05-03 00:00:00.000 | 

|(No column name)         | [3]
| 2022-12-08 00:00:00.000 | 

*/

 --�rnek - DATEDIFF 

SELECT DATEDIFF(YEAR,'2019-05-08','2022-12-03')  --1
SELECT DATEDIFF(MONTH,'2019-05-08','2022-12-03') --2
SELECT DATEDIFF(DAY,'2019-05-08','2022-12-03')   --3

-- �rnek - DATEDIFF ��kt�
/*
|(No column name) | [1]
| 3               | 

|(No column name) | [2]
| 43              | 

|(No column name) | [3]
| 1305            | 

*/

 --�rnek - DATEDIFF 

SELECT DATEPART(YEAR,'2022-12-03')    --1
SELECT DATEPART(MONTH,'2022-12-03') --2
SELECT DATEPART(DAY,'2022-12-03')   --3

-- �rnek - DATEDIFF ��kt�
/*
|(No column name) | [1]
| 2022            | 

|(No column name) | [2]
| 12              | 

|(No column name) | [3]
| 3               | 

*/


https://medium.com/machine-learning-t%C3%BCrkiye/sql-server-tarih-fonksiyonlar%C4%B1-d4cce45186b7