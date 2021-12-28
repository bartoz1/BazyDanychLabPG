--KASKADOWE UAKTUALNIENIE KATEGORII PRODUKTU PO ZMIANIE NAZWY KATEGORII
SELECT  * FROM Produkty
UPDATE Kategorie SET nazwa='mechanika' where nazwa='motoryzacja'
SELECT  * FROM Produkty



--KASKADOWE USUWANIE REKLAMACJI PO USUNIECIU ZAMOWIENIA DO KTOREGO ODNOSI SIE REKLAMACJA
SELECT * FROM Zamowienia
SELECT * FROM Reklamacje
DELETE FROM Zamowienia where ID=4
SELECT * FROM Reklamacje
SELECT * FROM Zamowienia



-- KASKADOWE USUWANIE Z PRODUKT_ZAMOWIENIE PO USUNIECIU ZAMOWIENIA
SELECT * FROM Produkt_zamowienie where zamowienie_id <=5
DELETE FROM Zamowienia where ID=4
SELECT * FROM Produkt_zamowienie where zamowienie_id <=5
