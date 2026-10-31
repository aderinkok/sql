-- String Fonksiyonlar

--syntax

 LOWER('[METİN]')
 UPPER('[METİN]')
 LEFT('[METİN]',[SAYI])
 RIGHT('[METİN]',[SAYI])
 LTRIM('[METİN]')
 RTRIM('[METİN]')
 SUBSTRING('[METİN]',[INDEX],[UZUNLUK])
 CHARINDEX('[KARAKTER]','[METİN]')
 REVERSE('[METİN]')
 REPLACE('[METİN]','[ARANAN_DEĞER]','[YENİ_DEĞER]')


--Örnek - LOWER 

SELECT LOWER('AbdulMelik')

-- Örnek - LOWER Çıktı
/*
|(No column name)|
| abdulmelik     |
*/

--Örnek - UPPER 

SELECT UPPER('AbdulMelik')

-- Örnek - UPPER Çıktı
/*
|(No column name)|
| ABDULMELİK     |
*/
--Örnek - LEFT 
SELECT LEFT('Abdulmelik',5)

-- Örnek - LEFT Çıktı
/*
|(No column name)|
| Abdul          |
*/
--Örnek - RIGHT 
SELECT RIGHT('Abdulmelik',5)

-- Örnek - RIGHT Çıktı
/*
|(No column name)|
| melik          |
*/
--Örnek - LTRIM 

SELECT LTRIM('  Abdulmelik  ')

-- Örnek - LTRIM Çıktı
/*
|(No column name)|
| Abdulmelik     |

*/

--Örnek - RTRIM 

SELECT RTRIM('  Abdulmelik  ') 

-- Örnek - RTRIM Çıktı
/*
|(No column name)|
|   Abdulmelik   |

*/
--Örnek - SUBSTRING 

SELECT SUBSTRING('Abdulmelik',2,4) 

-- Örnek - SUBSTRING Çıktı
/*
|(No column name)|
|   bdul         |

*/
--Örnek - CHARINDEX 

SELECT CHARINDEX('u','Abdulmelik') 

-- Örnek - CHARINDEX Çıktı
/*
|(No column name)|
|   4            |

*/
--Örnek - REVERSE 

SELECT REVERSE('Abdulmelik') 

-- Örnek - REVERSE Çıktı
/*
|(No column name)|
|   kilemludbA   |

*/
--Örnek - REPLACE 

SELECT REPLACE('Fatih Sultan Yavuz','Yavuz','Mehmet') 

-- Örnek - REPLACE Çıktı
/*
|(No column name)         |
|   Fatih Sultan Mehmet   |

*/
