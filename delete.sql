--syntax

DELETE FROM [TABLO_ADI] WHERE [ÞART]

--DÝKKAT: DELETE komutu kullanýlýrken WHERE ifadesi kullanýlmazsa yani þart belirtilmezse tablodaki tüm veriler silinir.

/*

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
DELETE FROM ogrenciler WHERE id=2

/* Örnek - 1 Çýktý
(1 row affected)
 -- Tablo olarak çýktý vermez ancak bilgi mesajý olarak etkilenen satýr sayýsýný yazdýrýr.

  Ýþlemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yýlmaz     |  1    | 65   | 82    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayþe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yaðýz| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/

--Örnek - 2
DELETE FROM ogrenciler 

/* Örnek - 2 Çýktý
(6 rows affected)
 -- Tablo olarak çýktý vermez ancak bilgi mesajý olarak etkilenen satýr sayýsýný yazdýrýr.

  Ýþlemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |

			[TABLODA KAYIT BULUNMAZ]

*/