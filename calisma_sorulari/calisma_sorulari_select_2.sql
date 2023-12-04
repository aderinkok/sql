/*
Örnekler için Northwind veritabaný kullanýlacaktýr.
Çalýþma Sorularý - 2 (SELECT) 
1- Employees tablosundaki tüm kayýtlarý listeleyin.
2- Customers tablosundaki tüm kayýtlarý listeleyin.
3- Region tablosundaki tüm kayýtlarý  listeleyin.
4- Customers tablosundaki City özelliði Berlin olan kayýtlarý listeleyin. [Her zaman birden fazla kayýt gelmek zorunda deðil.]
5- Customers tablosundaki City özelliði Bilecik olan kayýtlarý listeleyin.[Her zaman kayýt gelmek zorunda deðil.]
6- Employees tablosundaki TitleOfCourtesy, FirstName ve LastName sütunlarýný aralarýnda boþluk býrakmak þartý ile birleþtirerek Name takma isimli bir sütunda listeleyin. [boþluk için ' ' ifadesi kullanýlabilir.]
7- Products tablosundaki ProductName deðeri 7 karakter uzunluðundaki kayýtlarý listeleyin.
8- Products tablosundaki ProductName deðeri en az 2 kelime olan kayýtlarý LIKE kullanarak listeleyin.
9- Products tablosundaki ProductName deðeri en az 2 kelime olan kayýtlarý LIKE kullanarak listeleyin. [NOT ifadesi unutulmamalýdýr.]
10- Products tablosundaki kayýtlarý UnitPrice özelliðine göre azalan sýralayýnýz ve yalnýzca ProductName ve UnitPrice deðerlerini listeleyiniz.
11- Orders tablosundaki ShipRegion deðeri NULL olmayan ifadeleri listeleyin. **
12- Orders tablosundaki ShipRegion deðeri NULL olan ifadeleri listeleyin. **
13- Orders tablosundaki kayýtlarý ShipCity kolonuna göre gruplayýn.
14- Orders tablosundaki ShipCity kolonunda yer alan benzersiz kayýtlarý listeleyin.
15- Orders tablosundaki kayýtlarý ShipCity kolonuna göre gruplayýn ve her bir grubun kayýt sayýsýný listeleyin.
16- Orders tablosundaki kayýtlarý ShipCity kolonuna göre gruplayýn ve her bir grubun kayýt sayýsýný artan sýralayarak listeleyin.
17- Orders tablosundaki kayýtlarý ShipCity kolonuna göre gruplayýn ve kayýt sayýsý 20'den büyük olan gruplarýn kayýt sayýsýný azalan sýralayarak listeleyin.
18- Products tablosundaki UnitPrice sütununda yer alan deðerin 160 eksiði, 100'den büyük olan kayýtlarý listeleyin.
19- Products tablosundaki UnitPrice sütununda yer deðerin %10'u, 20'den büyük olan kayýtlarý listeleyin.
20- Products tablosundaki kayýtlarý CategoryID kolonuna göre gruplandýrýn ve gruplarýn kayýt sayýsýný listeleyin.
21- Products tablosundaki stokta olan ürünleri listeleyin.
22- Products tablosundaki UnitInStock özelliði 0'dan büyük olan kayýtlarý listeleyin.
23- Seafood kategorisindeki ürünleri listeleyin. [Ürün Tablosu = Products, Kategori tablosu = Categories]
24- Adý Laura olan çalýþanýn adres, þehir ve ülke bilgisini ayný sütunda Adres takma adý ile listeleyin.[Çalýþan tablosu = Employees]
25- Þehir bilgisi London, Madrid ve Buenos Aires olan ve Fax numarasý bulunan müþterileri listeleyin.[Müþteri tablosu = Customers]

-- JOIN

A- Ýlgili tablolardaki eþleþtirilecek alanlarý tablolarý inceleyerek tespit ediniz.
B- Products tablosunda ProductName, Categories tablosunda CategoryName alanlarýný listeleyiniz.
C- Her iki tablodaki tüm verileri listeleyiniz.
26- Products tablosu (p takma adý ile) ile Categories (c takma adý ile) tablosunu  Inner Join yapýsý kullanarak birleþtirin.
27- Products tablosu (p takma adý ile) ile Categories (c takma adý ile) tablosunu  LEFT Join yapýsý kullanarak birleþtirin.
28- Products tablosu (p takma adý ile) ile Categories (c takma adý ile) tablosunu  RIGHT Join yapýsý kullanarak birleþtirin.
29- Products tablosu (p takma adý ile) ile Categories (c takma adý ile) tablosunu  FULL Join yapýsý kullanarak birleþtirin.
30- Products tablosu (p takma adý ile) ile Categories (c takma adý ile) tablosunu  CROSS Join yapýsý kullanarak birleþtirin.

*/

USE Northwind --Komutlar çalýþmazsa üzerinde iþlem yapýlacak veritabanýna geçiþ yapýlmalýdýr.

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
