--syntax

ALTER [TUR] [NESNE_ADI] [PARAMETRELER]


--ALTER DATABASE - 1 

ALTER DATABASE Yeni2
MODIFY FILE
(
Name = 'dbAdi',
Size = 12
)

/* --ALTER DATABASE - 1 - �IKTI 
Commands completed successfully.

- Mevcut veritaban� yap�land�rmas�nda de�i�iklik yap�laca�� zaman Name parametresinin belirtilmesi gerekmetedir. �rnekte CREATE b�l�m�nde olu�turulan veritaban�n�n boyutu de�i�tirilmi�tir.


*/

-- ALTER TABLE - 1

ALTER TABLE personel
ADD 
memleket VARCHAR(50),
yas INT

/* --ALTER DATABASE - 1 - �IKTI 
Commands completed successfully.

- CREATE b�l�m�nde olu�turulan personel tablosuna memleket ve yas kolonlar� olu�turulmu�tur.

*/

-- ALTER TABLE - 2
ALTER TABLE personel
ALTER COLUMN 
memleket NVARCHAR(50)

/* --ALTER DATABASE - 2 - �IKTI 
Commands completed successfully.

- CREATE b�l�m�nde olu�turulan personel tablosunda bulunan memleket kolonunun veri t�r� nvarchar olarak de�i�tirilmi�tir.

*/

-- ALTER TABLE - 3
ALTER TABLE personel
DROP COLUMN memleket,yas

/* --ALTER DATABASE - 3 - �IKTI 
Commands completed successfully.

- personel tablosunda bulunan memleket ve yas kolonlar� silinmi�tir.

*/


