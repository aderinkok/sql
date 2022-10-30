-- Syntax

SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOÞUL] LIKE '[ARAMA_DESENI]'
-- WHERE ifadesinden sonraki "[KOÞUL] LIKE '[ARAMA_DESENI]'" alanýndan sonra çoklu filtreleme yapýlacaksa AND/OR baðlaçlarý kullanýlabilir.

-- il tablosu 
/*
| id | ad            |
|  1 | Adana         | 
|  2 | Adýyaman      | 
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
-- Örnek 1: ad özelliði "Bi" ile baþlayan kayýtlarý çeker.
/* Örnek - 1 Çýktý
| id  | ad     |
|  11 | Bilecik| 
|  12 | Bingöl | 
|  13 | Bitlis |

*/

--Örnek - 2
SELECT * FROM il WHERE ad LIKE 'MA%A'
-- Örnek 2: ad özelliði "Ma" ile baþlayan ve "a" ile biten kayýtlarý çeker.
/* Örnek - 2 Çýktý
| id  | ad     |
|  44 | Malatya| 
|  45 | Manisa | 


*/
--Örnek - 3 
SELECT * FROM il WHERE ad LIKE 'MA____A'
-- Örnek 3: ad özelliði "Ma" ile baþlayan ve "a" ile biten ve uzunluðu 7 karakter olan kayýtlarý çeker.
/* Örnek - 3 Çýktý
| id  | ad     |
|  44 | Malatya| 

*/
--Örnek - 4

SELECT * FROM il WHERE ad LIKE '%E_A%'
-- Örnek 4: ad özelliðinin herhangi bir yerinde "e" ile baþlayýp "a" ile biten 3 karakter uzunluðunda ifade barýndýran kayýtlarý çeker.
/* Örnek - 4 Çýktý
| id  | ad     |
|  23 | Elazýð | 

*/
--Örnek -5
SELECT * FROM il WHERE ad LIKE '%ð%'
-- Örnek 5: ad özelliðinde "ð" bulunan kayýtlarý çeker.
/* Örnek -5 Çýktý
| id  | ad      |
| 4	  | Aðrý	|
|23	  | Elazýð	|
|48	  | Muðla	|
|51	  | Niðde	|
|59	  | Tekirdað|	
|76	  | Iðdýr	|
*/

--Örnek -6
SELECT * FROM il WHERE ad LIKE '%[ke]'
-- Örnek 6: ad özelliði "k" veya "e" ile biten kayýtlarý çeker.
/* Örnek - 6 Çýktý
| id    | ad      |
|11		|Bilecik  |	
|17		|Çanakkale|	
|22		|Edirne	  |
|29		|Gümüþhane|	
|51  	|Niðde	  |
|53		|Rize	  |
|64	    |Uþak	  |
|67		|Zonguldak|	
|71	    |Kýrýkkale|	
|73     |Þýrnak	  |
|78  	|Karabük  |
|80		|Osmaniye |
|81		|Düzce	  |
*/
-- Örnek - 7 
SELECT * FROM il WHERE ad LIKE '[^a-y]%'
-- Örnek 7: ad özelliði "a-y" aralýðýndaki karakterlerle BAÞLAMAYAN kayýtlarý çeker.
/* Örnek - 7 Çýktý
| id  | ad       |
|  77 | Zonguldak| 

*/