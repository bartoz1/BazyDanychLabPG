
-- DODANIE DOSTEPNYCH KATEGORII
INSERT INTO Kategorie (nazwa) VALUES ('motoryzacja'), ('sport'), ('rozrywka'), ('gry'), ('ksiazki'), ('filmy'), ('meble'), ('obuwie'), ('ubrania'), ('akcesoria GSM')

-- DODANIE PRODUKTOW I PRZYPISANIE IM OCEN
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('felga aluminiowa 21', 'motoryzacja', 'Aluminiowa felga 21 cali model 2021', 240.70);
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(5, 'Super felgi!', IDENT_CURRENT('Produkty'));
	
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('skakanka 2m', 'sport', 'Skakanka z lozyskiem', 49.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(3, 'Bardzo ciche �o�ysko!', IDENT_CURRENT('Produkty')),
	(2, null, IDENT_CURRENT('Produkty'));;



INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('hantle 15kg' ,'sport', 'Sztangielka z gwintem, czyli klasyka, a zarazem niezb�dnik ka�dej domowej si�owni.', 234.75),
	('filtr kabinowy', 'motoryzacja', 'Filtry kabinowe chroni� podr�uj�cych przed zanieczyszczeniami przedostaj�cymi si� do wn�trza samochodu.', 86),
	('mata do cwiczen', 'sport', 'Mata do �wicze� 4FIZJO TPE to najwy�szej jako�ci mata gimnastyczna.', 80.99)

INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, 'Przyjemny materia�', IDENT_CURRENT('Produkty'));

INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('George Orwell Folwark Zwierzecy', 'ksiazki', 'Folwark zwierz�cy � opowie�� o rewolucji, kt�ra posz�a nie tak.', 15.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(5, null, IDENT_CURRENT('Produkty'));

INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Stephen King Instytut', 'ksiazki', 'Ksi��ka �Instytut� Stephena Kinga jest znakomitym horrorem, kt�ry zwala z n�g fabu��.', 39.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, null, IDENT_CURRENT('Produkty')),
	(5, 'Ciekawa ksi��ka', IDENT_CURRENT('Produkty')),
	(4, null, IDENT_CURRENT('Produkty'));

INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Monopoly', 'rozrywka', 'Kultowa gra planszowa Monopoly', 89.99),
	('Wsiasc do Pociagu', 'rozrywka' , 'Rebel, gra planszowa Wsi��� do Poci�gu: Europa', 143.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, 'Super plansz�wka', IDENT_CURRENT('Produkty'))
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Scrabble', 'rozrywka', 'Scrabble to gra, kt�ra pozwoli Ci utrzyma� sw�j umys� w doskona�ej kondycji.', 92.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(3, null, IDENT_CURRENT('Produkty')),
	(2, 'na zdjeciu wygl�da�a lepiej :/', IDENT_CURRENT('Produkty')),
	(4, null, IDENT_CURRENT('Produkty'));
-- sprawdzenie przypisania ocen do prod
-- select * from Produkty, Oceny WHERE Oceny.produkt_id = Produkty.id 

-- TWORZENIE KOSZYKOW I PRZYPISYWANIE ICH DO POSZCZEGOLNYCH KLIENTOW
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES 
		   ('Bartosz', 'Lis', '504239152', IDENT_CURRENT('Koszyk'))




INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Jan', 'Kustosz', '681239173', IDENT_CURRENT('Koszyk'))
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Mikolaj', 'Starzak', '504296384',IDENT_CURRENT('Koszyk') )
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Szymon', 'Majewski', '604997198', IDENT_CURRENT('Koszyk'))
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Piotr', 'Dolkowski', '657982154', IDENT_CURRENT('Koszyk') )
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Jakub', 'Jablkowski', '504128785',IDENT_CURRENT('Koszyk') )
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Michal', 'Lipek', '504298654', IDENT_CURRENT('Koszyk'))
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Krzysztof', 'Bulwinski', 687425691, IDENT_CURRENT('Koszyk'))
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Marcin', 'Kaczek', '504215698', IDENT_CURRENT('Koszyk') )
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Marek', 'Caitlyn', '783569254', IDENT_CURRENT('Koszyk') )
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Damian', 'Golasek', '504215485', IDENT_CURRENT('Koszyk'))

INSERT INTO Promocje (kod, data_rozpoczecia, data_zakonczenia, znizka)
	VALUES ('SUMM3R', '2021-06-24', '2021-08-24', 0.3),
		   ('OFF15NOW', '2021-03-21', '2021-03-29', 0.15),
		   ('TODAY15OFF', '2021-04-21', '2021-04-22', 0.15),
		   ('OFF15N0W', '2021-01-05', '2021-01-15', 0.15),
		   ('BIRTHDAY', '2021-07-25', '2021-07-26', 0.35),
		   ('BACKTOSQL', '2021-08-20', '2021-09-20', 0.25),
		   ('NIGHT15', '2021-04-25', '2021-04-26', 0.15),
		   ('O7NG4C9', '2021-07-25', '2021-12-26', 0.35),
		   ('NEWYEAR20', '2021-12-15', '2022-01-10', 0.20),
		   ('P0L3K4', '2021-10-25', '2022-01-26', 0.10),
		   ('RT5UL8', '2021-12-01', '2021-12-29', 0.20),
		   ('XMAS', '2021-12-15', '2021-12-29', 0.35)

INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES('ul. Lampego Alfreda 84', 'lokal 4c', '41-608', '�wi�toch�owice', 'Polska', null),
	   ('ul. Kotarbi�skiego Tadeusza 104', null, '61-415', 'Pozna�', 'Polska', 'odbior jedynie w godzinach wieczornych'),
	   ('Czere�niowa 15/303', null, '05-077', 'Warszawa', 'Polska', null),
	   ('Cegielskiego Hipolita 119', null, '52-130', 'Wroc�aw', 'Polska', null),
	   ('G�ogowska 3', null, '45-315', 'Opole', 'Polska', null),
	   ('Berberysowa 12', null, '15-591', 'Bia�ystok', 'Polska', 'odbior mozliwy po godzinie 16'),
	   ('ul. Wy�cigowa 141/101', null, '20-425', 'Lublin', 'Polska', null),
	   ('ul. Witosa Wincentego 71/203', null, '51-507', 'Wroc�aw', 'Polska', 'odbior w godzinach wieczornych lub porannych'),
	   ('ul. Chopina 47', null, '55-203', 'O�awa', 'Polska', null),
	   ('ul. �ytnia 72', null, '91-003', '��d�', 'Polska', null),
	   ('W�adys�awa �okietka 32', 'lokal 1c', '25-627', 'Kielce', 'Polska', null)


INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-01-24', 1, 1, NULL),
		   ('odebrane', 1, '2021-02-04', 2, 2, NULL),
		   ('przyjete', 0, '2021-01-24', 3, 3, NULL),
		   ('odebrane', 1, '2021-03-24', 1, 1, 'OFF15NOW'),
		   ('odebrane', 1, '2021-07-27', 4, 4, 'O7NG4C9'),
		   ('odebrane', 1, '2021-08-07', 5, 5, NULL),
		   ('przyjete', 0, '2021-08-24', 6, 6, 'BACKTOSQL'),
		   ('odebrane', 1, '2021-08-25', 7, 7, 'BACKTOSQL'),
		   ('odebrane', 1, '2021-08-25', 8, 8, 'BACKTOSQL'),
		   ('wyslane', 1, '2021-11-26', 9, 9, 'P0L3K4'),
		   ('wyslane', 1, '2021-12-07', 1, 1, 'P0L3K4'),
		   ('zapakowane', 1, '2021-12-15', 4, 4, NULL),
		   ('przyjete', 0, '2021-12-15', 3, 3, NULL)

INSERT INTO Produkt_zamowienie (produkt_id, zamowienie_id, ilosc)
	VALUES (1, 1, 1),
		   (3, 1, 1),
		   (5, 2, 1),
		   (3, 3, 2),
		   (1, 4, 1),
		   (6, 5, 1),
		   (3, 5, 3),
		   (4, 5, 2),
		   (2, 6, 1),
		   (7, 7, 1),
		   (2, 7, 2),
		   (4, 8, 1),
		   (1, 8, 4),
		   (5, 8, 1),
		   (2, 9, 1),
		   (9, 10, 1),
		   (6, 11, 2),
		   (7, 11, 1),
		   (8, 12, 1),
		   (10, 13, 1)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id)
	VALUES ('Na feldze sa widoczne zadrapania', 'przyjeta', 1, 1),
		   ('Zly kolor hantli!', 'rozpatrywana', 0, 3),
		   ('Znudzilo mi sie', 'odrzucona', 0, 13),
		   ('S�aba fabula', 'rozpatrywana', 0, 7)

INSERT INTO Produkt_koszyk (produkt_id, koszyk_id, ilosc)
	VALUES (1, 1, 1),
		   (3, 1, 3),
		   (7, 2, 1),
		   (5, 3, 4),
		   (2, 3, 1),
		   (9, 4, 2),
		   (1, 6, 1),
		   (8, 7, 3),
		   (4, 8, 2),
		   (9, 9, 1),
		   (2, 10, 1),
		   (3, 10, 1),
		   (5, 10, 1)
