/*
�rnekler i�in Northwind veritaban� kullan�lacakt�r.
�al��ma Sorular� - 2 (SELECT) 
1- Employees tablosundaki t�m kay�tlar� listeleyin.
2- Customers tablosundaki t�m kay�tlar� listeleyin.
3- Region tablosundaki t�m kay�tlar�  listeleyin.
4- Customers tablosundaki City �zelli�i Berlin olan kay�tlar� listeleyin. [Her zaman birden fazla kay�t gelmek zorunda de�il.]
5- Customers tablosundaki City �zelli�i Bilecik olan kay�tlar� listeleyin.[Her zaman kay�t gelmek zorunda de�il.]
6- Employees tablosundaki TitleOfCourtesy, FirstName ve LastName s�tunlar�n� aralar�nda bo�luk b�rakmak �art� ile birle�tirerek Name takma isimli bir s�tunda listeleyin. [bo�luk i�in ' ' ifadesi kullan�labilir.]
7- Products tablosundaki ProductName de�eri 7 karakter uzunlu�undaki kay�tlar� listeleyin.
8- Products tablosundaki ProductName de�eri en az 2 kelime olan kay�tlar� LIKE kullanarak listeleyin.
9- Products tablosundaki ProductName de�eri en az 2 kelime olan kay�tlar� LIKE kullanarak listeleyin. [NOT ifadesi unutulmamal�d�r.]
10- Products tablosundaki kay�tlar� UnitPrice �zelli�ine g�re azalan s�ralay�n�z ve yaln�zca ProductName ve UnitPrice de�erlerini listeleyiniz.
11- Orders tablosundaki ShipRegion de�eri NULL olmayan ifadeleri listeleyin. **
12- Orders tablosundaki ShipRegion de�eri NULL olan ifadeleri listeleyin. **
13- Orders tablosundaki kay�tlar� ShipCity kolonuna g�re gruplay�n.
14- Orders tablosundaki ShipCity kolonunda yer alan benzersiz kay�tlar� listeleyin.
15- Orders tablosundaki kay�tlar� ShipCity kolonuna g�re gruplay�n ve her bir grubun kay�t say�s�n� listeleyin.
16- Orders tablosundaki kay�tlar� ShipCity kolonuna g�re gruplay�n ve her bir grubun kay�t say�s�n� artan s�ralayarak listeleyin.
17- Orders tablosundaki kay�tlar� ShipCity kolonuna g�re gruplay�n ve kay�t say�s� 20'den b�y�k olan gruplar�n kay�t say�s�n� azalan s�ralayarak listeleyin.
18- Products tablosundaki UnitPrice s�tununda yer alan de�erin 160 eksi�i, 100'den b�y�k olan kay�tlar� listeleyin.
19- Products tablosundaki UnitPrice s�tununda yer de�erin %10'u, 20'den b�y�k olan kay�tlar� listeleyin.
20- Products tablosundaki kay�tlar� CategoryID kolonuna g�re grupland�r�n ve gruplar�n kay�t say�s�n� listeleyin.
21- Products tablosundaki stokta olan �r�nleri listeleyin.
22- Products tablosundaki UnitInStock �zelli�i 0'dan b�y�k olan kay�tlar� listeleyin.
23- Seafood kategorisindeki �r�nleri listeleyin. [�r�n Tablosu = Products, Kategori tablosu = Categories]
24- Ad� Laura olan �al��an�n adres, �ehir ve �lke bilgisini ayn� s�tunda Adres takma ad� ile listeleyin.[�al��an tablosu = Employees]
25- �ehir bilgisi London, Madrid ve Buenos Aires olan ve Fax numaras� bulunan m��terileri listeleyin.[M��teri tablosu = Customers]

-- JOIN

A- �lgili tablolardaki e�le�tirilecek alanlar� tablolar� inceleyerek tespit ediniz.
B- Products tablosunda ProductName, Categories tablosunda CategoryName alanlar�n� listeleyiniz.
C- Her iki tablodaki t�m verileri listeleyiniz.
26- Products tablosu (p takma ad� ile) ile Categories (c takma ad� ile) tablosunu  Inner Join yap�s� kullanarak birle�tirin.
27- Products tablosu (p takma ad� ile) ile Categories (c takma ad� ile) tablosunu  LEFT Join yap�s� kullanarak birle�tirin.
28- Products tablosu (p takma ad� ile) ile Categories (c takma ad� ile) tablosunu  RIGHT Join yap�s� kullanarak birle�tirin.
29- Products tablosu (p takma ad� ile) ile Categories (c takma ad� ile) tablosunu  FULL Join yap�s� kullanarak birle�tirin.
30- Products tablosu (p takma ad� ile) ile Categories (c takma ad� ile) tablosunu  CROSS Join yap�s� kullanarak birle�tirin.

*/

USE Northwind --Komutlar �al��mazsa �zerinde i�lem yap�lacak veritaban�na ge�i� yap�lmal�d�r.

/* ---Cevaplar--- */
--1
SELECT * FROM Employees 

--2
SELECT * FROM Customers

--3
SELECT * FROM Region

--4
SELECT * FROM Customers WHERE City='Berlin'

--5
SELECT * FROM Customers WHERE City='Bilecik'

--6
SELECT TitleOfCourtesy+' '+FirstName+' '+LastName Name FROM Employees

--7
SELECT * FROM Products WHERE ProductName LIKE '_______'

--8
SELECT * FROM Products WHERE ProductName LIKE '% %'

--9
SELECT * FROM Products WHERE ProductName NOT LIKE '% %'

--10
SELECT ProductName,UnitPrice FROM Products ORDER BY UnitPrice DESC

--11
SELECT * FROM Orders WHERE ShipRegion IS NOT NULL
SELECT * FROM Orders WHERE ShipRegion !=''

--12
SELECT * FROM Orders WHERE ShipRegion IS  NULL

--13
SELECT ShipCity FROM Orders GROUP BY ShipCity

--14
SELECT DISTINCT ShipCity FROM Orders GROUP BY ShipCity

--15
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity

--16
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity ORDER BY COUNT(*)

--17
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity HAVING COUNT(*)>20 ORDER BY COUNT(*) DESC

--18
SELECT * FROM Products WHERE UnitPrice - 160>100

--19
SELECT * FROM Products WHERE (UnitPrice/10)>20

--20
SELECT CategoryId,COUNT(*) FROM Products GROUP BY CategoryID

--21
SELECT * FROM Products WHERE UnitsInStock>0

--22
SELECT * FROM Products WHERE UnitsInStock>0

--23
SELECT * FROM Products WHERE CategoryId=8

--24
SELECT Address+' '+ City+' '+ Country Adres FROM Employees Where FirstName='Laura'

--25
SELECT * FROM Customers WHERE City IN('London','Madrid','Buenos Aires') AND Fax IS NOT NULL



--26
SELECT p.ProductName, c.CategoryName FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID 

--27
SELECT p.ProductName, c.CategoryName FROM Products p LEFT JOIN Categories c ON p.CategoryID = c.CategoryID 

--28
SELECT p.ProductName, c.CategoryName FROM Products p RIGHT JOIN Categories c ON p.CategoryID = c.CategoryID 

--29
SELECT p.ProductName, c.CategoryName FROM Products p FULL JOIN Categories c ON p.CategoryID = c.CategoryID 

--30
SELECT p.ProductName, c.CategoryName FROM Products p CROSS JOIN Categories c
