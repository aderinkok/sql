-- syntax


-- Veritaban� ad� de�i�tirme
SP_RENAME '[MEVCUT_AD]' ,'[YEN�_AD]' ,'database'


-- Tablo ad� de�i�tirme
SP_RENAME '[TABLO_ADI]', '[YEN�_TABLO_ADI]'
-- Tablo ad� de�i�ikli�inde tablo ad�n�n tamam� dbo. ifadesi de [TABLO_ADI] alan�nda bulunmal�d�r.


--Kolon ad� de�i�tirme

SP_RENAME '[TABLO_ADI].[MEVCUT_KOLON_ADI]', '[YEN�_KOLON_ADI]', 'column'