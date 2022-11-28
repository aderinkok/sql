--Syntax

--1. kullan�m
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--2. kullan�m
INSERT INTO [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--3. kullan�m
INSERT [TABLO_ADI] ([Kolon1],[Kolon2],[Kolon3],...,[KolonN]) VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--4. kullan�m
INSERT [TABLO_ADI] ([Kolon1],[Kolon2]) VALUES ([Veri1],[Veri2])
--5. kullan�m
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN]),([2Veri1],[2Veri2],[2Veri3],...,[2VeriN]),...,([nVeri1],[nVeri2],[nVeri3],...,[nVeriN])

/*
1. kullan�mda VALUES alan�ndan sonra parantez i�inde tablodaki kolon s�ralamas�na g�re eklenmesi istenen veriler virg�l ile ayr�larak belirtilir.
Bir ve be�inci kullan�mlarda oldu�u gibi "VALUES" ifadesinden �nce kolon ad veya adlar� belirtilmemi�se t�m kolonlar i�in de�er belirtilmelidir.
2. kullan�mda birinciden farkl� olarak "INTO" ifadesi bulunmaktad�r. Ancak T-SQL syntax'� i�in opsiyonel bir ifadedir yani kullan�lmas� veya
kullan�lmamas� durumu i�lemi etkilememektedir. ���nc� kullan�mda [TABLO_ADI] ifadesinden sonra parantez i�inde kolon ad� veya adlar� belirtilerek
yaln�zca belirtilen kolonlara veri giri�i yap�labilir. D�rd�nc� kullan�mda ���nc� ile ayn� ifadeyi temsil etmektedir yaln�zca veri giri�i yap�lacak
kolon say�s� farkl�d�r. Be�inci kullan�m �eklinde birden fazla sat�r ekleme i�lemi yap�lmaktad�r. "VALUES" ifadesinden sonra parantez i�inde veriler 
belirtilip parantez kapat�ld�ktan sonra virg�l ile 2, 3, 4 ... n adet sat�r ayn� kod ile eklenebilmektedir.

NOT: E�er kolon de�eri NOT NULL �eklinde ayarlanm�� ise mutlaka de�er girilmelidir.
NOT2: Otomatik artan Identity/Primary Key olarak belirlenmi� kolonlara de�er giri�i yap�lmaz.
NOT3: T-SQL'de tek INSERT ifadesi ile en fazla 1000 sat�r veri eklenebilmektedir.

*/