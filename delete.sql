--syntax

DELETE FROM [TABLO_ADI] WHERE [�ART]

--D�KKAT: DELETE komutu kullan�l�rken WHERE ifadesi kullan�lmazsa yani �art belirtilmezse tablodaki t�m veriler silinir.

/*

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
DELETE FROM ogrenciler WHERE id=2

/* �rnek - 1 ��kt�
(1 row affected)
 -- Tablo olarak ��kt� vermez ancak bilgi mesaj� olarak etkilenen sat�r say�s�n� yazd�r�r.

  ��lemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Y�lmaz     |  1    | 65   | 82    |
|  3 | Asel Sare     | Ayg�n      |  2    | 85   | 79    |
|  4 | Ay�e          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derink�k   |  2    | 100  | 100   |
|  6 | Muhammed Ya��z| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eyl�l    | Mutlu      |  2    | 90   | 90    |

*/

--�rnek - 2
DELETE FROM ogrenciler 

/* �rnek - 2 ��kt�
(6 rows affected)
 -- Tablo olarak ��kt� vermez ancak bilgi mesaj� olarak etkilenen sat�r say�s�n� yazd�r�r.

  ��lemden sonra ogrenciler tablosu:
| id | ad            | soyad      | sinif | vize | final |

			[TABLODA KAYIT BULUNMAZ]

*/