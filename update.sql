--syntax

UPDATE [TABLO_ADI] SET [KOLON1] = [DEĞER1], [KOLON2] = [DEĞER2],...,[KOLONn] = [DEĞERn] WHERE [ŞART]

/*
- DİKKAT: UPDATE komutu yazıldıktan sonra WHERE ifadesi ile şart belirtilmezse veri güncellemesi yapılacak kolonlardaki tüm veriler değişir.

 - ogrenciler tablosu

| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/
--Örnek - 1
UPDATE ogrenciler SET ad='Mehmet' WHERE id=2

/* Örnek - 1 Çıktı
(1 row affected)
 -- Tablo olarak çıktı vermez ancak bilgi mesajı olarak etkilenen satır sayısını yazdırır.

  İşlemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Mehmet        | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |

*/
--Örnek - 2
UPDATE ogrenciler SET ad='Veli'

/* Örnek - 2 Çıktı

(7 rows affected)
 -- Tablo olarak çıktı vermez ancak bilgi mesajı olarak etkilenen satır sayısını yazdırır.

  İşlemden sonra ogrenciler tablosu:
| id | ad   | soyad      | sinif | vize | final |
|  1 | Veli | Yılmaz     |  1    | 65   | 82    |
|  2 | Veli | Mutlu      |  1    | 30   | 45    |
|  3 | Veli | Aygün      |  2    | 85   | 79    |
|  4 | Veli | Demir      |  2    | 55   | 63    |
|  5 | Veli | Derinkök   |  2    | 100  | 100   |
|  6 | Veli | Mutlu      |  2    | 95   | 68    |
|  7 | Veli | Mutlu      |  2    | 90   | 90    |
*/