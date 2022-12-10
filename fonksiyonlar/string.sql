-- String Fonksiyonlar

--syntax

 LOWER('[METÝN]')
 UPPER('[METÝN]')
 LEFT('[METÝN]',[SAYI])
 RIGHT('[METÝN]',[SAYI])
 LTRIM('[METÝN]')
 RTRIM('[METÝN]')
 SUBSTRING('[METÝN]',[INDEX],[UZUNLUK])
 CHARINDEX('[KARAKTER]','[METÝN]')
 REVERSE('[METÝN]')
 REPLACE('[METÝN]','[ARANAN_DEÐER]','[YENÝ_DEÐER]')


--Örnek - LOWER 

SELECT LOWER('AbdulMelik')

-- Örnek - LOWER Çýktý
/*
|(No column name)|
| abdulmelik     |
*/

--Örnek - UPPER 

SELECT UPPER('AbdulMelik')

-- Örnek - UPPER Çýktý
/*
|(No column name)|
| ABDULMELÝK     |
*/
--Örnek - LEFT 
SELECT LEFT('Abdulmelik',5)

-- Örnek - LEFT Çýktý
/*
|(No column name)|
| Abdul          |
*/
--Örnek - RIGHT 
SELECT RIGHT('Abdulmelik',5)

-- Örnek - RIGHT Çýktý
/*
|(No column name)|
| melik          |
*/
--Örnek - LTRIM 

SELECT LTRIM('  Abdulmelik  ')

-- Örnek - LTRIM Çýktý
/*
|(No column name)|
| Abdulmelik     |

*/

--Örnek - RTRIM 

SELECT RTRIM('  Abdulmelik  ') 

-- Örnek - RTRIM Çýktý
/*
|(No column name)|
|   Abdulmelik   |

*/
--Örnek - SUBSTRING 

SELECT SUBSTRING('Abdulmelik',2,4) 

-- Örnek - SUBSTRING Çýktý
/*
|(No column name)|
|   bdul         |

*/
--Örnek - CHARINDEX 

SELECT CHARINDEX('u','Abdulmelik') 

-- Örnek - CHARINDEX Çýktý
/*
|(No column name)|
|   4            |

*/
--Örnek - REVERSE 

SELECT REVERSE('Abdulmelik') 

-- Örnek - REVERSE Çýktý
/*
|(No column name)|
|   kilemludbA   |

*/
--Örnek - REPLACE 

SELECT REPLACE('Fatih Sultan Yavuz','Yavuz','Mehmet') 

-- Örnek - REPLACE Çýktý
/*
|(No column name)         |
|   Fatih Sultan Mehmet   |

*/
