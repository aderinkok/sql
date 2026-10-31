-- syntax


-- Veritabanı adı değiştirme
SP_RENAME '[MEVCUT_AD]' ,'[YENİ_AD]' ,'database'


-- Tablo adı değiştirme
SP_RENAME '[TABLO_ADI]', '[YENİ_TABLO_ADI]'
-- Tablo adı değişikliğinde tablo adının tamamı dbo. ifadesi de [TABLO_ADI] alanında bulunmalıdır.


--Kolon adı değiştirme

SP_RENAME '[TABLO_ADI].[MEVCUT_KOLON_ADI]', '[YENİ_KOLON_ADI]', 'column'