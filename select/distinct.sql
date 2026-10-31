-- Syntax 
SELECT DISTINCT [KOLON] FROM [TABLO_ADI] 

/*
ogrenciler
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  5 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  5 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/
-- Örnek – 1

SELECT DISTINCT sinif FROM ogrenciler 
/* Örnek - 1 Çıktı 
 | sinif |
 |  1    |
 |  2    |
*/
