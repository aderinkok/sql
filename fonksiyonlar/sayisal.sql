-- Say�sal Fonksiyonlar
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

 --�rnek - POWER 

SELECT POWER(5,2)

-- �rnek - POWER ��kt�
/*
|(No column name)|
| 25             |
*/

--�rnek - PI 

SELECT PI()

-- �rnek - PI ��kt�
/*
|(No column name)|
|3,14159265358979|
*/
--�rnek - SIN 

SELECT SIN(60)

-- �rnek - SIN ��kt�
/*
|(No column name)  |
|-0,304810621102217|
*/
--�rnek - COS 

SELECT COS(60)

-- �rnek - COS ��kt�
/*
|(No column name)  |
|-0,952412980415156|
*/
--�rnek - COT 

SELECT COT(60)

-- �rnek - COT ��kt�
/*
|(No column name)  |
|3,12460562224231  |
*/
--�rnek - TAN 

SELECT TAN(60)

-- �rnek - TAN ��kt�
/*
|(No column name)  |
|0,320040389379563 |
*/
--�rnek - ABS 

SELECT ABS(-20)

-- �rnek - ABS ��kt�
/*
|(No column name)  |
|    20            |
*/
--�rnek - RAND 

SELECT RAND()

-- �rnek - RAND ��kt�
/*
|(No column name)   |
|0,xxxxxxxxxxxxxxxx | 

!RASTGELE B�R DE�ER �RET�R.
*/
--�rnek - FLOOR 

SELECT FLOOR(24.99999)

-- �rnek - FLOOR ��kt�
/*
|(No column name)  |
|     24           |
*/
--�rnek - CEILING 

SELECT CEILING(24.0001)

-- �rnek - CEILING ��kt�
/*
|(No column name)  |
|     25           |
*/
--�rnek - ROUND 

SELECT ROUND(24.992,2) --1
SELECT ROUND(24.999,0) --2

-- �rnek - ROUND ��kt�
/*
|(No column name)  |  [1]
|     24.990       |

|(No column name)  |  [2]
|     25.000       |
*/



