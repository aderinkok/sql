--syntax

UPDATE [TABLO_ADI] SET [KOLON1] = [DE�ER1], [KOLON2] = [DE�ER2],...,[KOLONn] = [DE�ERn] WHERE [�ART]

/*
- D�KKAT: UPDATE komutu yaz�ld�ktan sonra WHERE ifadesi ile �art belirtilmezse veri g�ncellemesi yap�lacak kolonlardaki t�m veriler de�i�ir.

 - ogrenciler tablosu

| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Y�lmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Ayg�n      |  2    | 85   | 79    |
|  4 | Ay�e          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derink�k   |  2    | 100  | 100   |
|  6 | Muhammed Ya��z| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eyl�l    | Mutlu      |  2    | 90   | 90    |

*/
--�rnek - 1
UPDATE ogrenciler SET ad='Mehmet' WHERE id=2

/* �rnek - 1 ��kt�
(1 row affected)
 -- Tablo olarak ��kt� vermez ancak bilgi mesaj� olarak etkilenen sat�r say�s�n� yazd�r�r.

  ��lemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Y�lmaz     |  1    | 65   | 82    |
|  2 | Mehmet        | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Ayg�n      |  2    | 85   | 79    |
|  4 | Ay�e          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derink�k   |  2    | 100  | 100   |
|  6 | Muhammed Ya��z| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eyl�l    | Mutlu      |  2    | 90   | 90    |

*/
--�rnek - 2
UPDATE ogrenciler SET ad='Veli'

/* �rnek - 2 ��kt�

(7 rows affected)
 -- Tablo olarak ��kt� vermez ancak bilgi mesaj� olarak etkilenen sat�r say�s�n� yazd�r�r.

  ��lemden sonra ogrenciler tablosu:
| id | ad   | soyad      | sinif | vize | final |
|  1 | Veli | Y�lmaz     |  1    | 65   | 82    |
|  2 | Veli | Mutlu      |  1    | 30   | 45    |
|  3 | Veli | Ayg�n      |  2    | 85   | 79    |
|  4 | Veli | Demir      |  2    | 55   | 63    |
|  5 | Veli | Derink�k   |  2    | 100  | 100   |
|  6 | Veli | Mutlu      |  2    | 95   | 68    |
|  7 | Veli | Mutlu      |  2    | 90   | 90    |
*/