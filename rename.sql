-- syntax


-- Veritabaný adý deðiþtirme
SP_RENAME '[MEVCUT_AD]' ,'[YENÝ_AD]' ,'database'


-- Tablo adý deðiþtirme
SP_RENAME '[TABLO_ADI]', '[YENÝ_TABLO_ADI]'
-- Tablo adý deðiþikliðinde tablo adýnýn tamamý dbo. ifadesi de [TABLO_ADI] alanýnda bulunmalýdýr.


--Kolon adý deðiþtirme

SP_RENAME '[TABLO_ADI].[MEVCUT_KOLON_ADI]', '[YENÝ_KOLON_ADI]', 'column'