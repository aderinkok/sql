--syntax

ALTER [TUR] [NESNE_ADI] [PARAMETRELER]


--ALTER DATABASE - 1 

ALTER DATABASE Yeni2
MODIFY FILE
(
Name = 'dbAdi',
Size = 12
)

/* --ALTER DATABASE - 1 - ÇIKTI 
Commands completed successfully.

- Mevcut veritabanı yapılandırmasında değişiklik yapılacağı zaman Name parametresinin belirtilmesi gerekmetedir. Örnekte CREATE bölümünde oluşturulan veritabanının boyutu değiştirilmiştir.


*/

-- ALTER TABLE - 1

ALTER TABLE personel
ADD 
memleket VARCHAR(50),
yas INT

/* --ALTER DATABASE - 1 - ÇIKTI 
Commands completed successfully.

- CREATE bölümünde oluşturulan personel tablosuna memleket ve yas kolonları oluşturulmuştur.

*/

-- ALTER TABLE - 2
ALTER TABLE personel
ALTER COLUMN 
memleket NVARCHAR(50)

/* --ALTER DATABASE - 2 - ÇIKTI 
Commands completed successfully.

- CREATE bölümünde oluşturulan personel tablosunda bulunan memleket kolonunun veri türü nvarchar olarak değiştirilmiştir.

*/

-- ALTER TABLE - 3
ALTER TABLE personel
DROP COLUMN memleket,yas

/* --ALTER DATABASE - 3 - ÇIKTI 
Commands completed successfully.

- personel tablosunda bulunan memleket ve yas kolonları silinmiştir.

*/


