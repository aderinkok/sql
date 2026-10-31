
use Northwind
select * from Employees



--1- Tüm kayıtları listeleyin.
SELECT * FROM Employees

--2- Yalnızca FirstName ve LastName sütunlarını görüntüleyerek tüm kayıtları listeleyin.
SELECT FirstName, LastName FROM Employees



--3- İlk 5 kaydı listeleyin (TOP ile)
SELECT TOP 5 * FROM Employees

--4- TitleOCourtesy sütunundaki verileri benzersiz olarak listeleyin.
SELECT DISTINCT TitleOfCourtesy FROM Employees


--5- KayıtlarıLastName kolonuna göre sıralayın.
SELECT * FROM Employees ORDER BY LastName


--6- Kayıtları LastName kolonuna göre azalan sıralayın.
SELECT * FROM Employees ORDER BY LastName DESC


--7- ID kolonu 4'ten büyük olan kolonları listeleyin.
SELECT * FROM Employees WHERE EmployeeID>4

--8- FirstName kolonu Anne olan kayıtları listeleyin.
SELECT * FROM Employees WHERE FirstName='Anne'

--9- LastName Davolio ve FirstName Anne olan kayıtları listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' AND FirstName='Anne'

--10- LastName Davolio veya FirstName Anne olan kayıtları listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' OR FirstName='Anne'