--Syntax

--1. kullaným
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--2. kullaným
INSERT INTO [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--3. kullaným
INSERT [TABLO_ADI] ([Kolon1],[Kolon2],[Kolon3],...,[KolonN]) VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--4. kullaným
INSERT [TABLO_ADI] ([Kolon1],[Kolon2]) VALUES ([Veri1],[Veri2])
--5. kullaným
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN]),([2Veri1],[2Veri2],[2Veri3],...,[2VeriN]),...,([nVeri1],[nVeri2],[nVeri3],...,[nVeriN])

/*
1. kullanýmda VALUES alanýndan sonra parantez içinde tablodaki kolon sýralamasýna göre eklenmesi istenen veriler virgül ile ayrýlarak belirtilir.
Bir ve beþinci kullanýmlarda olduðu gibi "VALUES" ifadesinden önce kolon ad veya adlarý belirtilmemiþse tüm kolonlar için deðer belirtilmelidir.
2. kullanýmda birinciden farklý olarak "INTO" ifadesi bulunmaktadýr. Ancak T-SQL syntax'ý için opsiyonel bir ifadedir yani kullanýlmasý veya
kullanýlmamasý durumu iþlemi etkilememektedir. Üçüncü kullanýmda [TABLO_ADI] ifadesinden sonra parantez içinde kolon adý veya adlarý belirtilerek
yalnýzca belirtilen kolonlara veri giriþi yapýlabilir. Dördüncü kullanýmda üçüncü ile ayný ifadeyi temsil etmektedir yalnýzca veri giriþi yapýlacak
kolon sayýsý farklýdýr. Beþinci kullaným þeklinde birden fazla satýr ekleme iþlemi yapýlmaktadýr. "VALUES" ifadesinden sonra parantez içinde veriler 
belirtilip parantez kapatýldýktan sonra virgül ile 2, 3, 4 ... n adet satýr ayný kod ile eklenebilmektedir.

NOT: Eðer kolon deðeri NOT NULL þeklinde ayarlanmýþ ise mutlaka deðer girilmelidir.
NOT2: Otomatik artan Identity/Primary Key olarak belirlenmiþ kolonlara deðer giriþi yapýlmaz.
NOT3: T-SQL'de tek INSERT ifadesi ile en fazla 1000 satýr veri eklenebilmektedir.

*/