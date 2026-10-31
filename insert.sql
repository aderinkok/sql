--Syntax

--1. kullanım
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--2. kullanım
INSERT INTO [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--3. kullanım
INSERT [TABLO_ADI] ([Kolon1],[Kolon2],[Kolon3],...,[KolonN]) VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN])
--4. kullanım
INSERT [TABLO_ADI] ([Kolon1],[Kolon2]) VALUES ([Veri1],[Veri2])
--5. kullanım
INSERT [TABLO_ADI] VALUES ([Veri1],[Veri2],[Veri3],...,[VeriN]),([2Veri1],[2Veri2],[2Veri3],...,[2VeriN]),...,([nVeri1],[nVeri2],[nVeri3],...,[nVeriN])

/*
1. kullanımda VALUES alanından sonra parantez içinde tablodaki kolon sıralamasına göre eklenmesi istenen veriler virgül ile ayrılarak belirtilir.
Bir ve beşinci kullanımlarda olduğu gibi "VALUES" ifadesinden önce kolon ad veya adları belirtilmemişse tüm kolonlar için değer belirtilmelidir.
2. kullanımda birinciden farklı olarak "INTO" ifadesi bulunmaktadır. Ancak T-SQL syntax'ı için opsiyonel bir ifadedir yani kullanılması veya
kullanılmaması durumu işlemi etkilememektedir. Üçüncü kullanımda [TABLO_ADI] ifadesinden sonra parantez içinde kolon adı veya adları belirtilerek
yalnızca belirtilen kolonlara veri girişi yapılabilir. Dördüncü kullanımda üçüncü ile aynı ifadeyi temsil etmektedir yalnızca veri girişi yapılacak
kolon sayısı farklıdır. Beşinci kullanım şeklinde birden fazla satır ekleme işlemi yapılmaktadır. "VALUES" ifadesinden sonra parantez içinde veriler 
belirtilip parantez kapatıldıktan sonra virgül ile 2, 3, 4 ... n adet satır aynı kod ile eklenebilmektedir.

NOT: Eğer kolon değeri NOT NULL şeklinde ayarlanmış ise mutlaka değer girilmelidir.
NOT2: Otomatik artan Identity/Primary Key olarak belirlenmiş kolonlara değer girişi yapılmaz.
NOT3: T-SQL'de tek INSERT ifadesi ile en fazla 1000 satır veri eklenebilmektedir.



 - ogrenciler tablosu

| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 90   | 90    |


*/

--Örnek - 1
INSERT ogrenciler VALUES('Uğur','Erdem',1,68,92)

-- Örnek - 1 Çıktı
/*

(1 row affected)
 -- Tablo olarak çıktı vermez ancak bilgi mesajı olarak etkilenen satır sayısını yazdırır.

 İşlemden sonra ogrenciler tablosu:

| id | ad            | soyad      | sinif | vize | final |
|  1 | Ali           | Yılmaz     |  1    | 65   | 82    |
|  2 | Ahmet         | Mutlu      |  1    | 30   | 45    |
|  3 | Asel Sare     | Aygün      |  2    | 85   | 79    |
|  4 | Ayşe          | Demir      |  2    | 55   | 63    |
|  5 | Abdulmelik    | Derinkök   |  2    | 100  | 100   |
|  6 | Muhammed Yağız| Mutlu      |  2    | 95   | 68    |
|  7 | Elif Eylül    | Mutlu      |  2    | 68   | 92    |
|  8 | Uğur          | Erdem      |  1    | 90   | 90    |



*/