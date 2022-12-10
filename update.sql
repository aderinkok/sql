--syntax

UPDATE [TABLO_ADI] SET [KOLON1] = [DEÐER1], [KOLON2] = [DEÐER2],...,[KOLONn] = [DEÐERn] WHERE [ÞART]

/*
- DÝKKAT: UPDATE komutu yazýldýktan sonra WHERE ifadesi ile þart belirtilmezse veri güncellemesi yapýlacak kolonlardaki tüm veriler deðiþir.

 - ogrenciler tablosu

| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yýlmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayþe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yaðýz| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/
--Örnek - 1
UPDATE ogrenciler SET ad='Mehmet' WHERE id=2

/* Örnek - 1 Çýktý
(1 row affected)
 -- Tablo olarak çýktý vermez ancak bilgi mesajý olarak etkilenen satýr sayýsýný yazdýrýr.

  Ýþlemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yýlmaz     |  1    | 65   | 82    |
|  2 | Mehmet        | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayþe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yaðýz| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/
--Örnek - 2
UPDATE ogrenciler SET ad='Veli'

/* Örnek - 2 Çýktý

(7 rows affected)
 -- Tablo olarak çýktý vermez ancak bilgi mesajý olarak etkilenen satýr sayýsýný yazdýrýr.

  Ýþlemden sonra ogrenciler tablosu:
| id | ad   | soyad      | sinif | vize | final |
|  1 | Veli | Yýlmaz     |  1    | 65   | 82    |
|  2 | Veli | Mutlu      |  1    | 30   | 45    |
|  3 | Veli | Aygün      |  2    | 85   | 79    |
|  4 | Veli | Demir      |  2    | 55   | 63    |
|  5 | Veli | Derinkök   |  2    | 100  | 100   |
|  6 | Veli | Mutlu      |  2    | 95   | 68    |
|  7 | Veli | Mutlu      |  2    | 90   | 90    |
*/