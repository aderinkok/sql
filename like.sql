-- Syntax

SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KO�UL] LIKE '[ARAMA_DESENI]'
-- WHERE ifadesinden sonraki "[KO�UL] LIKE '[ARAMA_DESENI]'" alan�ndan sonra �oklu filtreleme yap�lacaksa AND/OR ba�la�lar� kullan�labilir.

-- il tablosu 
/*
| id | ad            |
|  1 | Adana         | 
|  2 | Ad�yaman      | 
|  3 | Afyonkarahisar|
...
|  11 | Bilecik      |
...
|  44 | Malatya      |
...
|  81 | D�zce        |
*/

--�rnek - 1
SELECT * FROM il  WHERE ad LIKE 'Bi%'
-- �rnek 1: ad �zelli�i "Bi" ile ba�layan kay�tlar� �eker.
/* �rnek - 1 ��kt�
| id  | ad     |
|  11 | Bilecik| 
|  12 | Bing�l | 
|  13 | Bitlis |

*/

--�rnek - 2
SELECT * FROM il WHERE ad LIKE 'MA%A'
-- �rnek 2: ad �zelli�i "Ma" ile ba�layan ve "a" ile biten kay�tlar� �eker.
/* �rnek - 2 ��kt�
| id  | ad     |
|  44 | Malatya| 
|  45 | Manisa | 


*/
--�rnek - 3 
SELECT * FROM il WHERE ad LIKE 'MA____A'
-- �rnek 3: ad �zelli�i "Ma" ile ba�layan ve "a" ile biten ve uzunlu�u 7 karakter olan kay�tlar� �eker.
/* �rnek - 3 ��kt�
| id  | ad     |
|  44 | Malatya| 

*/
--�rnek - 4

SELECT * FROM il WHERE ad LIKE '%E_A%'
-- �rnek 4: ad �zelli�inin herhangi bir yerinde "e" ile ba�lay�p "a" ile biten 3 karakter uzunlu�unda ifade bar�nd�ran kay�tlar� �eker.
/* �rnek - 4 ��kt�
| id  | ad     |
|  23 | Elaz�� | 

*/
--�rnek -5
SELECT * FROM il WHERE ad LIKE '%�%'
-- �rnek 5: ad �zelli�inde "�" bulunan kay�tlar� �eker.
/* �rnek -5 ��kt�
| id  | ad      |
| 4	  | A�r�	|
|23	  | Elaz��	|
|48	  | Mu�la	|
|51	  | Ni�de	|
|59	  | Tekirda�|	
|76	  | I�d�r	|
*/

--�rnek -6
SELECT * FROM il WHERE ad LIKE '%[ke]'
-- �rnek 6: ad �zelli�i "k" veya "e" ile biten kay�tlar� �eker.
/* �rnek - 6 ��kt�
| id    | ad      |
|11		|Bilecik  |	
|17		|�anakkale|	
|22		|Edirne	  |
|29		|G�m��hane|	
|51  	|Ni�de	  |
|53		|Rize	  |
|64	    |U�ak	  |
|67		|Zonguldak|	
|71	    |K�r�kkale|	
|73     |��rnak	  |
|78  	|Karab�k  |
|80		|Osmaniye |
|81		|D�zce	  |
*/
-- �rnek - 7 
SELECT * FROM il WHERE ad LIKE '[^a-y]%'
-- �rnek 7: ad �zelli�i "a-y" aral���ndaki karakterlerle BA�LAMAYAN kay�tlar� �eker.
/* �rnek - 7 ��kt�
| id  | ad       |
|  77 | Zonguldak| 

*/