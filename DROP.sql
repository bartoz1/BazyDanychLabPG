
ALTER TABLE Produkt_zamowienie DROP CONSTRAINT nalezy_do_zamowienia
ALTER TABLE Produkt_zamowienie DROP CONSTRAINT zawiera
ALTER TABLE Zamowienia DROP CONSTRAINT zamawia
ALTER TABLE Reklamacje DROP CONSTRAINT zlozono_reklamacje
ALTER TABLE Klienci DROP CONSTRAINT posiada
ALTER TABLE Produkt_koszyk DROP CONSTRAINT dodane_do_koszyka
ALTER TABLE Zamowienia DROP CONSTRAINT zamawia_na_adres
ALTER TABLE Produkt_koszyk DROP CONSTRAINT jest_w_koszyku
ALTER TABLE Zamowienia DROP CONSTRAINT korzysta_z_promocji
ALTER TABLE Produkty DROP CONSTRAINT nalezy_do_kategorii
ALTER TABLE Oceny DROP CONSTRAINT odnosi_sie_do

DROP TABLE Produkty
DROP TABLE Klienci
DROP TABLE Produkt_zamowienie
DROP TABLE Zamowienia

DROP TABLE Reklamacje
DROP TABLE Promocje
DROP TABLE Produkt_koszyk
DROP TABLE Oceny
DROP TABLE Koszyk
DROP TABLE Kategorie
DROP TABLE Adresy
--DROP DATABASE sklep_internetowy;