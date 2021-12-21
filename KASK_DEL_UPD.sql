--SELECT * FROM Kategorie
SELECT  * FROM Produkty
UPDATE Kategorie SET nazwa='mechanika' where nazwa='motoryzacja'
SELECT  * FROM Produkty

select zamowienia.id, nazwa, ilosc, data_zlozenia, Reklamacje.opis from Zamowienia, Produkt_zamowienie, Produkty, Reklamacje
	where Produkt_zamowienie.produkt_id = Produkty.id 
	and Produkt_zamowienie.zamowienie_id = Zamowienia.ID 
	and Zamowienia.ID in (SELECT zamowienie_id FROM Reklamacje)
	and Zamowienia.ID = Reklamacje.zamowienie_id
	ORDER BY Zamowienia.ID

SELECT * FROM Zamowienia
SELECT * FROM Reklamacje
DELETE FROM Zamowienia where ID=4
SELECT * FROM Reklamacje
SELECT * FROM Zamowienia