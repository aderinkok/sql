-- Sayısal Fonksiyonlar
--syntax

POWER([SAYI],[US])
PI()
SIN([SAYI])
COS([SAYI])
COT([SAYI])
TAN([SAYI])
ABS([SAYI])
RAND()
FLOOR([SAYI])
CEILING([SAYI])
ROUND([SAYI],[BASAMAK])

 --Örnek - POWER 

SELECT POWER(5,2)

-- Örnek - POWER Çıktı
/*
|(No column name)|
| 25             |
*/

--Örnek - PI 

SELECT PI()

-- Örnek - PI Çıktı
/*
|(No column name)|
|3,14159265358979|
*/
--Örnek - SIN 

SELECT SIN(60)

-- Örnek - SIN Çıktı
/*
|(No column name)  |
|-0,304810621102217|
*/
--Örnek - COS 

SELECT COS(60)

-- Örnek - COS Çıktı
/*
|(No column name)  |
|-0,952412980415156|
*/
--Örnek - COT 

SELECT COT(60)

-- Örnek - COT Çıktı
/*
|(No column name)  |
|3,12460562224231  |
*/
--Örnek - TAN 

SELECT TAN(60)

-- Örnek - TAN Çıktı
/*
|(No column name)  |
|0,320040389379563 |
*/
--Örnek - ABS 

SELECT ABS(-20)

-- Örnek - ABS Çıktı
/*
|(No column name)  |
|    20            |
*/
--Örnek - RAND 

SELECT RAND()

-- Örnek - RAND Çıktı
/*
|(No column name)   |
|0,xxxxxxxxxxxxxxxx | 

!RASTGELE BİR DEĞER ÜRETİR.
*/
--Örnek - FLOOR 

SELECT FLOOR(24.99999)

-- Örnek - FLOOR Çıktı
/*
|(No column name)  |
|     24           |
*/
--Örnek - CEILING 

SELECT CEILING(24.0001)

-- Örnek - CEILING Çıktı
/*
|(No column name)  |
|     25           |
*/
--Örnek - ROUND 

SELECT ROUND(24.992,2) --1
SELECT ROUND(24.999,0) --2

-- Örnek - ROUND Çıktı
/*
|(No column name)  |  [1]
|     24.990       |

|(No column name)  |  [2]
|     25.000       |
*/



