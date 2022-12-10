-- Syntax 
SELECT DISTINCT [KOLON] FROM [TABLO_ADI] 

/*
ogrenciler
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Y�lmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Ayg�n      |  2    | 85   | 79    |
|  4 | Ay�e          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derink�k   |  2    | 100  | 100   |
|  5 | Muhammed Ya��z| Mutlu      |  2    | 95   | 68    |
|  5 | Elif Eyl�l    | Mutlu      |  2    | 90   | 90    |

*/
-- �rnek � 1

SELECT DISTINCT sinif FROM ogrenciler 
/* �rnek - 1 ��kt� 
 | sinif |
 |  1    |
 |  2    |
*/
