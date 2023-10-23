
use Northwind
select * from Employees



--1- Tüm kayýtlarý listeleyin.
SELECT * FROM Employees

--2- Yalnýzca FirstName ve LastName sütunlarýný görüntüleyerek tüm kayýtlarý listeleyin.
SELECT FirstName, LastName FROM Employees



--3- Ýlk 5 kaydý listeleyin (TOP ile)
SELECT TOP 5 * FROM Employees

--4- TitleOCourtesy sütunundaki verileri benzersiz olarak listeleyin.
SELECT DISTINCT TitleOfCourtesy FROM Employees


--5- KayýtlarýLastName kolonuna göre sýralayýn.
SELECT * FROM Employees ORDER BY LastName


--6- Kayýtlarý LastName kolonuna göre azalan sýralayýn.
SELECT * FROM Employees ORDER BY LastName DESC


--7- ID kolonu 4'ten büyük olan kolonlarý listeleyin.
SELECT * FROM Employees WHERE EmployeeID>4

--8- FirstName kolonu Anne olan kayýtlarý listeleyin.
SELECT * FROM Employees WHERE FirstName='Anne'

--9- LastName Davolio ve FirstName Anne olan kayýtlarý listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' AND FirstName='Anne'

--10- LastName Davolio veya FirstName Anne olan kayýtlarý listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' OR FirstName='Anne'