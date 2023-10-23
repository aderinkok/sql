
use Northwind
select * from Employees



--1- T�m kay�tlar� listeleyin.
SELECT * FROM Employees

--2- Yaln�zca FirstName ve LastName s�tunlar�n� g�r�nt�leyerek t�m kay�tlar� listeleyin.
SELECT FirstName, LastName FROM Employees



--3- �lk 5 kayd� listeleyin (TOP ile)
SELECT TOP 5 * FROM Employees

--4- TitleOCourtesy s�tunundaki verileri benzersiz olarak listeleyin.
SELECT DISTINCT TitleOfCourtesy FROM Employees


--5- Kay�tlar�LastName kolonuna g�re s�ralay�n.
SELECT * FROM Employees ORDER BY LastName


--6- Kay�tlar� LastName kolonuna g�re azalan s�ralay�n.
SELECT * FROM Employees ORDER BY LastName DESC


--7- ID kolonu 4'ten b�y�k olan kolonlar� listeleyin.
SELECT * FROM Employees WHERE EmployeeID>4

--8- FirstName kolonu Anne olan kay�tlar� listeleyin.
SELECT * FROM Employees WHERE FirstName='Anne'

--9- LastName Davolio ve FirstName Anne olan kay�tlar� listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' AND FirstName='Anne'

--10- LastName Davolio veya FirstName Anne olan kay�tlar� listeleyin.
SELECT * FROM Employees WHERE LastName='Davolio' OR FirstName='Anne'