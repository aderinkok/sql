-- Syntax 
SELECT [KOLONLAR] FROM [TABLO_ADI] WHERE [KOLON_ADI] IN([veri1],[veri2],[veri3],[veriN])

-- IN() ifadesi yaln�zca metinsel i�lemlerde kullan�lmayabilirde. 
-- IN() ifadesi i�erisine yaz�lan ifadeler ayn� veri t�r�nden olmal�d�r.
-- kullanici tablosu 
/*
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  3 | Sare      | Ayg�n     |  21 |
|  4 | Ay�e      | Demir     |  25 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 1

SELECT * FROM kullanici WHERE ad IN('Sare','Abdulmelik')
/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  3 | Sare      | Ayg�n     |  21 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/
-- �rnek � 2

SELECT * FROM kullanici WHERE yas IN(18,19,40)
/* �rnek - 1 ��kt�
| id | ad        | soyad     | yas |
|  1 | Ali       | Y�lmaz    |  19 |
|  2 | Ahmet     | Mutlu     |  18 |
|  5 | Abdulmelik| Derink�k  |  40 |
*/


