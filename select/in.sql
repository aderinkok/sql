-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOLON_ADI] IN([veri1],[veri2],[veri3],[veriN])

-- IN() ifadesi yalnýzca metinsel iþlemlerde kullanýlmayabilirde. 
-- IN() ifadesi içerisine yazýlan ifadeler ayný veri türünden olmalýdýr.
-- kullanici tablosu 
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Aygün     |  21 |
|  4 | Ayþe      | Demir     |  25 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 1

SELECT * FROM kullanici WHERE ad IN('Sare','Abdulmelik')
/* Örnek - 1 Çýktý
| id | ad        | soyad     | yas |
|  3 | Sare      | Aygün     |  21 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/
-- Örnek – 2

SELECT * FROM kullanici WHERE yas IN(18,19,40)
/* Örnek - 1 Çýktý
| id | ad        | soyad     | yas |
|  1 | Ali       | Yýlmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  5 | Abdulmelik| Derinkök  |  40 |
*/


