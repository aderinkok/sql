-- Syntax

SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOŞUL] LIKE '[ARAMA_DESENI]'
-- WHERE ifadesinden sonraki "[KOŞUL] LIKE '[ARAMA_DESENI]'" alanından sonra çoklu filtreleme yapılacaksa AND/OR bağlaçları kullanılabilir.

-- il tablosu 
/*
| id | ad            |
|  1 | Adana         | 
|  2 | Adıyaman      | 
|  3 | Afyonkarahisar|
...
|  11 | Bilecik      |
...
|  44 | Malatya      |
...
|  81 | Düzce        |
*/

--Örnek - 1
SELECT * FROM il  WHERE ad LIKE 'Bi%'
-- Örnek 1: ad özelliği "Bi" ile başlayan kayıtları çeker.
/* Örnek - 1 Çıktı
| id  | ad     |
|  11 | Bilecik| 
|  12 | Bingöl | 
|  13 | Bitlis |

*/

--Örnek - 2
SELECT * FROM il WHERE ad LIKE 'MA%A'
-- Örnek 2: ad özelliği "Ma" ile başlayan ve "a" ile biten kayıtları çeker.
/* Örnek - 2 Çıktı
| id  | ad     |
|  44 | Malatya| 
|  45 | Manisa | 


*/
--Örnek - 3 
SELECT * FROM il WHERE ad LIKE 'MA____A'
-- Örnek 3: ad özelliği "Ma" ile başlayan ve "a" ile biten ve uzunluğu 7 karakter olan kayıtları çeker.
/* Örnek - 3 Çıktı
| id  | ad     |
|  44 | Malatya| 

*/
--Örnek - 4

SELECT * FROM il WHERE ad LIKE '%E_A%'
-- Örnek 4: ad özelliğinin herhangi bir yerinde "e" ile başlayıp "a" ile biten 3 karakter uzunluğunda ifade barındıran kayıtları çeker.
/* Örnek - 4 Çıktı
| id  | ad     |
|  23 | Elazığ | 

*/
--Örnek -5
SELECT * FROM il WHERE ad LIKE '%ğ%'
-- Örnek 5: ad özelliğinde "ğ" bulunan kayıtları çeker.
/* Örnek -5 Çıktı
| id  | ad      |
| 4	  | Ağrı	|
|23	  | Elazığ	|
|48	  | Muğla	|
|51	  | Niğde	|
|59	  | Tekirdağ|	
|76	  | Iğdır	|
*/

--Örnek -6
SELECT * FROM il WHERE ad LIKE '%[ke]'
-- Örnek 6: ad özelliği "k" veya "e" ile biten kayıtları çeker.
/* Örnek - 6 Çıktı
| id    | ad      |
|11		|Bilecik  |	
|17		|Çanakkale|	
|22		|Edirne	  |
|29		|Gümüşhane|	
|51  	|Niğde	  |
|53		|Rize	  |
|64	    |Uşak	  |
|67		|Zonguldak|	
|71	    |Kırıkkale|	
|73     |Şırnak	  |
|78  	|Karabük  |
|80		|Osmaniye |
|81		|Düzce	  |
*/
-- Örnek - 7 
SELECT * FROM il WHERE ad LIKE '[^a-y]%'
-- Örnek 7: ad özelliği "a-y" aralığındaki karakterlerle BAŞLAMAYAN kayıtları çeker.
/* Örnek - 7 Çıktı
| id  | ad       |
|  77 | Zonguldak|

*/

-- Örnek - 8 (Sık yapılan hata)
-- Ornek veritabanı ogrenci tablosu (veritabani/Ornek.sql betiği ile oluşturulur.)
/*
| id | ad     |
|  1 | Ahmet  |
|  2 | Mehmet |
|  3 | Ayşe   |
|  4 | Ali    |
|  5 | Musa   |
|  6 | Yaprak |
|  7 | Yiğit  |
|  8 | Can    |
|  9 | Meral  |
*/
SELECT * FROM ogrenci WHERE ad LIKE '[^Y]%a%'
-- Örnek 8: Amaç ad özelliği "Y" ile başlamayan ve içinde "a" bulunan kayıtları çekmektir. Ancak "a" ile başlayan Ahmet, Ayşe ve Ali kayıtları listelenmez.
/* Örnek - 8 Çıktı
| id  | ad    |
|  5  | Musa  |
|  8  | Can   |
|  9  | Meral |
*/
-- NEDEN: [^Y] ifadesi "Y dışındaki TEK bir karakter" anlamına gelir ve adın ilk harfini karşılar.
-- Desenin devamındaki %a% ifadesi ise ilk harften SONRA gelen bir "a" arar. Ahmet, Ayşe ve Ali kayıtlarındaki "a" ilk harf olduğu için [^Y] tarafından
-- karşılanır; adın geri kalanında (hmet, yşe, li) ikinci bir "a" bulunmadığından bu kayıtlar listelenmez.
-- ÇÖZÜM: İlk harf kontrolü ile "a" araması birbirinden ayrılmalıdır. Aşağıdaki sorguların tamamı aynı (doğru) çıktıyı verir.
SELECT * FROM ogrenci WHERE ad LIKE '[^Y]%' AND ad LIKE '%a%'          -- Çözüm 1: Desen iki ayrı koşula bölünür.
SELECT * FROM ogrenci WHERE ad NOT LIKE 'Y%' AND ad LIKE '%a%'         -- Çözüm 2: İlk harf kontrolü NOT LIKE ile yapılır.
SELECT * FROM ogrenci WHERE ad LIKE '[^Y]%a%' OR ad LIKE 'a%'          -- Çözüm 3: Desenin kaçırdığı "a ile başlayan" kayıtlar OR ile eklenir.
SELECT * FROM ogrenci WHERE LEFT(ad,1)<>'Y' AND ad LIKE '%a%'          -- Çözüm 4: İlk harf LEFT fonksiyonu ile kontrol edilir.
SELECT * FROM ogrenci WHERE ad NOT LIKE 'Y%' AND CHARINDEX('a',ad)>0   -- Çözüm 5: "a" harfi CHARINDEX fonksiyonu ile aranır (harf bulunamazsa 0 döner).
/* Çözüm Çıktısı
| id  | ad    |
|  1  | Ahmet |
|  3  | Ayşe  |
|  4  | Ali   |
|  5  | Musa  |
|  8  | Can   |
|  9  | Meral |
*/