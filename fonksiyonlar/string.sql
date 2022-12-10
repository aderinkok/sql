-- String Fonksiyonlar

--syntax

 LOWER('[MET�N]')
 UPPER('[MET�N]')
 LEFT('[MET�N]',[SAYI])
 RIGHT('[MET�N]',[SAYI])
 LTRIM('[MET�N]')
 RTRIM('[MET�N]')
 SUBSTRING('[MET�N]',[INDEX],[UZUNLUK])
 CHARINDEX('[KARAKTER]','[MET�N]')
 REVERSE('[MET�N]')
 REPLACE('[MET�N]','[ARANAN_DE�ER]','[YEN�_DE�ER]')


--�rnek - LOWER 

SELECT LOWER('AbdulMelik')

-- �rnek - LOWER ��kt�
/*
|(No column name)|
| abdulmelik     |
*/

--�rnek - UPPER 

SELECT UPPER('AbdulMelik')

-- �rnek - UPPER ��kt�
/*
|(No column name)|
| ABDULMEL�K     |
*/
--�rnek - LEFT 
SELECT LEFT('Abdulmelik',5)

-- �rnek - LEFT ��kt�
/*
|(No column name)|
| Abdul          |
*/
--�rnek - RIGHT 
SELECT RIGHT('Abdulmelik',5)

-- �rnek - RIGHT ��kt�
/*
|(No column name)|
| melik          |
*/
--�rnek - LTRIM 

SELECT LTRIM('  Abdulmelik  ')

-- �rnek - LTRIM ��kt�
/*
|(No column name)|
| Abdulmelik     |

*/

--�rnek - RTRIM 

SELECT RTRIM('  Abdulmelik  ') 

-- �rnek - RTRIM ��kt�
/*
|(No column name)|
|   Abdulmelik   |

*/
--�rnek - SUBSTRING 

SELECT SUBSTRING('Abdulmelik',2,4) 

-- �rnek - SUBSTRING ��kt�
/*
|(No column name)|
|   bdul         |

*/
--�rnek - CHARINDEX 

SELECT CHARINDEX('u','Abdulmelik') 

-- �rnek - CHARINDEX ��kt�
/*
|(No column name)|
|   4            |

*/
--�rnek - REVERSE 

SELECT REVERSE('Abdulmelik') 

-- �rnek - REVERSE ��kt�
/*
|(No column name)|
|   kilemludbA   |

*/
--�rnek - REPLACE 

SELECT REPLACE('Fatih Sultan Yavuz','Yavuz','Mehmet') 

-- �rnek - REPLACE ��kt�
/*
|(No column name)         |
|   Fatih Sultan Mehmet   |

*/
