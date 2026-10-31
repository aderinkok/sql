/*
Örnekler için Northwind veritabanı kullanılacaktır.
Çalışma Soruları - 2 (SELECT)
Sorular derste işlenen konu sırasına göre düzenlenmiştir. (Konu sırası için calisma_sorulari_select_1.sql dosyasına bakınız.)

--- 1. SELECT ---
1- Employees tablosundaki tüm kayıtları listeleyin.
2- Customers tablosundaki tüm kayıtları listeleyin.
3- Region tablosundaki tüm kayıtları  listeleyin.

--- 2. ORDER BY ---
4- Products tablosundaki kayıtları UnitPrice özelliğine göre azalan sıralayınız ve yalnızca ProductName ve UnitPrice değerlerini listeleyiniz.
5- Employees tablosundaki FirstName, LastName ve City değerlerini City özelliğine göre, aynı şehirdeki çalışanları ise LastName özelliğine göre artan sıralayarak listeleyin.

--- 3. DISTINCT, TOP ---
6- Orders tablosundaki ShipCity kolonunda yer alan benzersiz kayıtları listeleyin.
7- Customers tablosundaki Country kolonunda yer alan benzersiz kayıtları listeleyin.
8- Products tablosundaki en pahalı 5 ürünün ProductName ve UnitPrice değerlerini listeleyin.

--- 4. WHERE, AND, OR, LIKE ---
9- Customers tablosundaki City özelliği Berlin olan kayıtları listeleyin. [Her zaman birden fazla kayıt gelmek zorunda değil.]
10- Customers tablosundaki City özelliği Bilecik olan kayıtları listeleyin.[Her zaman kayıt gelmek zorunda değil.]
11- Products tablosundaki ProductName değeri 7 karakter uzunluğundaki kayıtları listeleyin.
12- Products tablosundaki ProductName değeri en az 2 kelime olan kayıtları LIKE kullanarak listeleyin.
13- Products tablosundaki UnitPrice sütununda yer alan değerin 160 eksiği, 100'den büyük olan kayıtları listeleyin.
14- Products tablosundaki UnitPrice sütununda yer alan değerin %10'u, 20'den büyük olan kayıtları listeleyin.
15- Products tablosundaki stokta olan ürünleri listeleyin.
16- Products tablosundaki UnitsInStock özelliği 0'dan büyük olan kayıtları listeleyin.
17- Seafood kategorisindeki ürünleri listeleyin. [Ürün Tablosu = Products, Kategori tablosu = Categories]

--- 5. TAKMA AD, TOPLAMA FONKSİYONLARI, GROUP BY, HAVING, BETWEEN, IN, NOT, NULL, SÜTUN BİRLEŞTİRME ---
18- Employees tablosundaki TitleOfCourtesy, FirstName ve LastName sütunlarını aralarında boşluk bırakmak şartı ile birleştirerek Name takma isimli bir sütunda listeleyin. [boşluk için ' ' ifadesi kullanılabilir.]
19- Adı Laura olan çalışanın adres, şehir ve ülke bilgisini aynı sütunda Adres takma adı ile listeleyin.[Çalışan tablosu = Employees]
20- Products tablosundaki ürünlerin ortalama birim fiyatını (UnitPrice) "Ortalama Fiyat" takma adı ile listeleyin.
21- Orders tablosundaki kayıtları ShipCity kolonuna göre gruplayın.
22- Orders tablosundaki kayıtları ShipCity kolonuna göre gruplayın ve her bir grubun kayıt sayısını listeleyin.
23- Orders tablosundaki kayıtları ShipCity kolonuna göre gruplayın ve her bir grubun kayıt sayısını artan sıralayarak listeleyin.
24- Orders tablosundaki kayıtları ShipCity kolonuna göre gruplayın ve kayıt sayısı 20'den büyük olan grupların kayıt sayısını azalan sıralayarak listeleyin.
25- Products tablosundaki kayıtları CategoryID kolonuna göre gruplandırın ve grupların kayıt sayısını listeleyin.
26- Customers tablosundaki kayıtları Country kolonuna göre gruplayın ve müşteri sayısı 5 veya daha fazla olan ülkeleri müşteri sayısına göre azalan sıralayarak listeleyin.
27- Products tablosundaki UnitPrice değeri 20 ile 30 arasında (uç değerler DAHİL) olan kayıtları BETWEEN kullanarak listeleyin.
28- Products tablosundaki ProductName değeri tek kelime olan (boşluk içermeyen) kayıtları LIKE kullanarak listeleyin. [NOT ifadesi unutulmamalıdır.]
29- Customers tablosundaki Country değeri Germany, France veya UK olmayan müşterileri IN kullanarak listeleyin.
30- Orders tablosundaki ShipRegion değeri NULL olmayan ifadeleri listeleyin. **
31- Orders tablosundaki ShipRegion değeri NULL olan ifadeleri listeleyin. **
32- Şehir bilgisi London, Madrid ve Buenos Aires olan ve Fax numarası bulunan müşterileri listeleyin.[Müşteri tablosu = Customers]

--- 6. JOIN (vize sonrası) ---

A- İlgili tablolardaki eşleştirilecek alanları tabloları inceleyerek tespit ediniz.
B- Products tablosunda ProductName, Categories tablosunda CategoryName alanlarını listeleyiniz.
C- Her iki tablodaki tüm verileri listeleyiniz.
33- Products tablosu (p takma adı ile) ile Categories (c takma adı ile) tablosunu  Inner Join yapısı kullanarak birleştirin.
34- Products tablosu (p takma adı ile) ile Categories (c takma adı ile) tablosunu  LEFT Join yapısı kullanarak birleştirin.
35- Products tablosu (p takma adı ile) ile Categories (c takma adı ile) tablosunu  RIGHT Join yapısı kullanarak birleştirin.
36- Products tablosu (p takma adı ile) ile Categories (c takma adı ile) tablosunu  FULL Join yapısı kullanarak birleştirin.
37- Products tablosu (p takma adı ile) ile Categories (c takma adı ile) tablosunu  CROSS Join yapısı kullanarak birleştirin.

*/

USE Northwind --Komutlar çalışmazsa üzerinde işlem yapılacak veritabanına geçiş yapılmalıdır.

/* ---Cevaplar--- */

/* ===================== 1. SELECT ===================== */

--1
SELECT * FROM Employees  --* ifadesi tablodaki tüm kolonları listeler.

--2
SELECT * FROM Customers

--3
SELECT * FROM Region


/* ===================== 2. ORDER BY ===================== */

--4
SELECT ProductName,UnitPrice FROM Products ORDER BY UnitPrice DESC  --Yalnızca listelenmesi istenen kolonlar SELECT ifadesinde yazılır.

--5
SELECT FirstName,LastName,City FROM Employees ORDER BY City,LastName  --İkinci kolon yalnızca şehri aynı olan çalışanları sıralar.


/* ===================== 3. DISTINCT, TOP ===================== */

--6
SELECT DISTINCT ShipCity FROM Orders  --21. sorudaki GROUP BY ile aynı çıktıyı verir.

--7
SELECT DISTINCT Country FROM Customers  --DISTINCT tekrar eden değerleri bir kez listeler (21 farklı ülke).

--8
SELECT TOP 5 ProductName,UnitPrice FROM Products ORDER BY UnitPrice DESC  --En pahalı ürünleri bulmak için TOP ifadesi ORDER BY ... DESC ile birlikte kullanılır.


/* ===================== 4. WHERE, AND, OR, LIKE ===================== */

--9
SELECT * FROM Customers WHERE City='Berlin'  --Metin değerleri tek tırnak içinde yazılır.

--10
SELECT * FROM Customers WHERE City='Bilecik'  --Koşulu sağlayan kayıt bulunmadığında sorgu hata vermez, boş çıktı döner.

--11
SELECT * FROM Products WHERE ProductName LIKE '_______'  --Her _ karakteri tam olarak bir karakteri temsil eder; 7 adet _ 7 karakter uzunluğundaki değerleri getirir.

--12
SELECT * FROM Products WHERE ProductName LIKE '% %'  --'% %' deseni içinde en az bir boşluk bulunan (en az 2 kelimelik) değerleri getirir.

--13
SELECT * FROM Products WHERE UnitPrice - 160>100  --Koşul UnitPrice>260 koşuluna eşdeğerdir.

--14
SELECT * FROM Products WHERE (UnitPrice/10)>20  --UnitPrice/10 fiyatın %10'udur; koşul UnitPrice>200 koşuluna eşdeğerdir.

--15
SELECT * FROM Products WHERE UnitsInStock>0  --Stokta olan ürünler UnitsInStock değeri 0'dan büyük olan ürünlerdir.

--16
SELECT * FROM Products WHERE UnitsInStock>0

--17
SELECT * FROM Products WHERE CategoryId=8
--NOT: Seafood kategorisinin CategoryID değeri (8) Categories tablosundan bakılarak bulunmuştur.
--Değeri bilmeden aynı sonuç iç içe sorgu (subquery) ile de elde edilebilir:
SELECT * FROM Products WHERE CategoryID=(SELECT CategoryID FROM Categories WHERE CategoryName='Seafood')


/* ===================== 5. TAKMA AD, TOPLAMA FONKSİYONLARI, GROUP BY, HAVING, BETWEEN, IN, NOT, NULL, SÜTUN BİRLEŞTİRME ===================== */

--18
SELECT TitleOfCourtesy+' '+FirstName+' '+LastName Name FROM Employees
--NOT: + operatörü metinleri birleştirir. Birleştirilen kolonlardan biri NULL ise sonuç da NULL olur.

--19
SELECT Address+' '+ City+' '+ Country Adres FROM Employees Where FirstName='Laura'  --Kolonlar arasında boşluk bırakmak için ' ' ifadesi eklenir.

--20
SELECT AVG(UnitPrice) [Ortalama Fiyat] FROM Products  --UnitPrice ondalıklı (money) bir kolon olduğu için sonuç ondalıklı döner.

--21
SELECT ShipCity FROM Orders GROUP BY ShipCity  --GROUP BY her farklı ShipCity değeri için tek satır döndürür.

--22
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity  --COUNT(*) her gruptaki kayıt sayısını verir.

--23
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity ORDER BY COUNT(*)  --Sıralama yönü belirtilmediği için artan (ASC) sıralama yapılır.

--24
SELECT ShipCity,COUNT(*) FROM Orders GROUP BY ShipCity HAVING COUNT(*)>20 ORDER BY COUNT(*) DESC  --HAVING gruplama sonrasında oluşan grupları filtreler.

--25
SELECT CategoryId,COUNT(*) FROM Products GROUP BY CategoryID  --Kolon adları büyük/küçük harf duyarsız olduğu için CategoryId ve CategoryID aynı kolonu ifade eder.

--26
SELECT Country,COUNT(*) FROM Customers GROUP BY Country HAVING COUNT(*)>=5 ORDER BY COUNT(*) DESC
--NOT: Sorgu sırasıyla işletilir: GROUP BY ile ülkelere göre gruplanır, HAVING ile müşteri sayısı 5 ve üzeri olan gruplar seçilir, ORDER BY ile sıralanır.

--27
SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 30  --BETWEEN uç değerleri DAHİL eder; UnitPrice>=20 AND UnitPrice<=30 koşuluna eşdeğerdir.

--28
SELECT * FROM Products WHERE ProductName NOT LIKE '% %'  --NOT LIKE desene uymayan değerleri getirir.

--29
SELECT * FROM Customers WHERE Country NOT IN('Germany','France','UK')  --NOT IN, listedeki değerlerin hiçbirine eşit olmayan kayıtları getirir.

--30
SELECT * FROM Orders WHERE ShipRegion IS NOT NULL
SELECT * FROM Orders WHERE ShipRegion !=''
--NOT: NULL kontrolü IS NULL / IS NOT NULL ile yapılır. İkinci sorgu, NULL ile yapılan karşılaştırmalar sonuç üretmediği için
--NULL kayıtları getirmez; ancak boş metin ('') içeren kayıtları da dışarıda bırakır.

--31
SELECT * FROM Orders WHERE ShipRegion IS  NULL

--32
SELECT * FROM Customers WHERE City IN('London','Madrid','Buenos Aires') AND Fax IS NOT NULL  --IN ve IS NOT NULL koşulları AND ile birleştirilmiştir.


/* ===================== 6. JOIN (vize sonrası) ===================== */

--33
SELECT p.ProductName, c.CategoryName FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID  --INNER JOIN yalnızca iki tabloda eşleşen kayıtları getirir.

--34
SELECT p.ProductName, c.CategoryName FROM Products p LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
--NOT: LEFT JOIN soldaki tablonun (Products) tüm kayıtlarını getirir. Tüm ürünlerin kategorisi bulunduğu için çıktı INNER JOIN ile aynıdır.

--35
SELECT p.ProductName, c.CategoryName FROM Products p RIGHT JOIN Categories c ON p.CategoryID = c.CategoryID  --RIGHT JOIN sağdaki tablonun (Categories) tüm kayıtlarını getirir.

--36
SELECT p.ProductName, c.CategoryName FROM Products p FULL JOIN Categories c ON p.CategoryID = c.CategoryID  --FULL JOIN her iki tablodaki eşleşen ve eşleşmeyen tüm kayıtları getirir.

--37
SELECT p.ProductName, c.CategoryName FROM Products p CROSS JOIN Categories c  --CROSS JOIN iki tablodaki kayıtların tüm olası eşleşmelerini üretir (77 x 8 = 616 satır).
