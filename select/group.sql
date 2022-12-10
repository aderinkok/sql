-- Aggregate fonksiyonlar
/* ogrenciler
| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Y�lmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Ayg�n      |  2    | 85   | 79    |
|  4 | Ay�e          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derink�k   |  2    | 100  | 100   |
|  5 | Muhammed Ya��z| Mutlu      |  2    | 95   | 68    |
|  5 | Elif Eyl�l    | Mutlu      |  2    | 90   | 90    |
*/
-- �rnek � 1 COUNT

SELECT COUNT(*) FROM ogrenciler
SELECT COUNT(ad) FROM ogrenciler
--�rnek -1 A��klama: Tablodaki kay�t say�s�n� d�nderir. �rnek tabloda toplam 7 kay�t bulunmaktad�r. �rnek 1'de yer alan sorgularda herhangi bir ko�ul belirtilmedi�inden COUNT fonksiyonunun i�ine hangi de�er girilirse girilsin ayn� sonucu verecektir.
/* �rnek - 1 ��kt� 
(No Column Name)
7


*/
-- �rnek � 2 SUM

SELECT SUM(vize) FROM ogrenciler 
--�rnek - 2 A��klama: Tablodaki vize s�tununda yer alan t�m kay�tlar� toplar ve sonucu ekrana yazd�r�r. �lgili tablodaki vize s�tununda yer alan kay�tlar�n toplam� 520'dir.
/* �rnek - 2 ��kt�
(No Column Name)
520
*/
-- �rnek � 3 MIN

SELECT MIN(vize) FROM ogrenciler 
--�rnek - 3 A��klama: Tablodaki vize s�tununda yer alan t�m kay�tlar� kar��la�t�r�r ve en d���k olan de�eri yazd�r�r. �lgili tablodaki en d���k vize de�eri 30'dur.
/* �rnek - 3 ��kt�
(No Column Name)
30
*/
-- �rnek � 4 MAX

SELECT MAX(final) FROM ogrenciler 
--�rnek - 4 A��klama: Tablodaki final s�tununda yer alan t�m kay�tlar� kar��la�t�r�r ve en y�ksek olan de�eri yazd�r�r. �lgili tablodaki en y�ksek final de�eri 100'd�r.
/* �rnek - 4 ��kt�
(No Column Name)
100
*/

-- �rnek � 5 AVG

SELECT AVG(final) FROM ogrenciler 
--�rnek - 5 A��klama: Tablodaki final s�tununda yer alan t�m kay�tlar� toplar ve sat�r say�s�na b�ler yani aritmetik ortalamas�n� al�r. �lgili tablodaki final kolonunda yer alan de�erlerin ortalamas� de�eri 75'tir.
-- 75,xx �eklinde bir sonu� olmas�na ra�men elde edilen ifade tam say� olarak ekrana yazd�r�lm��t�r.
/* �rnek - 5 ��kt�
(No Column Name)
75
*/

-- Syntax  GROUP BY
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] 
SELECT [KOLON_X],AGGREGATE_FONKSIYON([KOLON]) FROM [TABLO_ADI] GROUP BY [KOLON_X] HAVING  AGGREGATE_FONKSIYON([KOLON]) [OPERATOR] [KOSUL]

-- AGGREGATE_FONKSIYON alan�na SUM,MIN,MAX,AVG,COUNT ifadeleri getirilebilir.
-- [KOLON_X] ifadesi grupland�r�lacak kolon manas�na gelmektedir.
-- HAVING ifadesinde yer alan [OPERATOR] <,>,=,<>,<=,>= ifadelerinde biri olabilir.
-- �rnek HAVING COUNT(*) < 5 
-- E�er sorguda WHERE ifadesi kullan�lacaksa GROUP BY ifadesinden �nce yaz�lmal�d�r.


--�rnek 6 
SELECT sinif,COUNT(*) FROM ogrenciler GROUP BY sinif

--�rnek -6 A��klama: sinif kolonuna g�re grupland�rma i�lemi bulunmaktad�r. s�n�f kolonu 1 de�erinde olan 2 kay�t ve s�n�f kolonu 2 de�erinde olan 5 kay�t bulunmaktad�r. 
/*�rnek - 6 ��kt�

 | sinif |(No Column Name)|
 |    1  |        2       |
 |    2  |        5       |

*/

--�rnek 6 
SELECT sinif,AVG(vize) FROM ogrenciler GROUP BY sinif HAVING AVG(vize) > 50

--�rnek -6 A��klama: sinif kolonuna g�re grupland�rma i�lemi bulunmaktad�r. S�n�f kolonu ayn� olan kay�tlar�n vize notlar�n�n aritmetik ortalamas� al�n�r ve having ifadesinde de ortalama de�eri 50'den b�y�k olan s�n�flar g�sterilir.
-- s�n�f de�eri 1 olan kay�tlar�n vize ortalamas� 47 oldu�u i�in �arta uygunluk ta��maz bu nedenle de listelenmez.
-- s�n�f de�eri 2 olan kay�tlar�n vize ortalamas� ise 85'tir ve �arta uygunluk sa�lad��� i�in listelenir.
/*�rnek - 6 ��kt�

 | sinif |(No Column Name)|
 |    2  |        85       |

*/