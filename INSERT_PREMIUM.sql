
-- DODANIE DOSTEPNYCH KATEGORII
INSERT INTO Kategorie (nazwa) VALUES ('motoryzacja'), ('sport'), ('rozrywka'), ('gry'), ('ksiazki'), ('filmy'), ('meble'), ('obuwie'), ('ubrania'), ('akcesoria GSM')

-- DODANIE KODOW PROMOCYJNYCH
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


-- DODANIE PRODUKTOW I PRZYPISANIE IM OCEN
-- produkt + 1 ocena
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('felga aluminiowa 21', 'motoryzacja', 'Aluminiowa felga 21 cali model 2021', 240.70);
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(5, 'Super felgi!', IDENT_CURRENT('Produkty'));
-- produkt + 2 oceny	
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('skakanka 2m', 'sport', 'Skakanka z lozyskiem', 49.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(3, 'Bardzo ciche łożysko!', IDENT_CURRENT('Produkty')),
	(2, null, IDENT_CURRENT('Produkty'));;
-- 3 prod + 1 ocen
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('hantle 15kg' ,'sport', 'Sztangielka z gwintem, czyli klasyka, a zarazem niezbędnik każdej domowej siłowni.', 234.75),
	('filtr kabinowy', 'motoryzacja', 'Filtry kabinowe chronią podróżujących przed zanieczyszczeniami przedostającymi się do wnętrza samochodu.', 86),
	('mata do cwiczen', 'sport', 'Mata do ćwiczeń 4FIZJO TPE to najwyższej jakości mata gimnastyczna.', 80.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, 'Przyjemny materiał', IDENT_CURRENT('Produkty'));
-- 1 prod + 1 ocen
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('George Orwell Folwark Zwierzecy', 'ksiazki', 'Folwark zwierzęcy – opowieść o rewolucji, która poszła nie tak.', 15.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(5, null, IDENT_CURRENT('Produkty'));
-- 1 prod + 3 ocen
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Stephen King Instytut', 'ksiazki', 'Książka „Instytut” Stephena Kinga jest znakomitym horrorem, który zwala z nóg fabułą.', 39.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, null, IDENT_CURRENT('Produkty')),
	(5, 'Ciekawa książka', IDENT_CURRENT('Produkty')),
	(4, null, IDENT_CURRENT('Produkty'));
-- 2 prod + 1 ocen
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Monopoly', 'rozrywka', 'Kultowa gra planszowa Monopoly', 89.99),
	('Wsiasc do Pociagu', 'rozrywka' , 'Rebel, gra planszowa Wsiąść do Pociągu: Europa', 143.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(4, 'Super planszówka', IDENT_CURRENT('Produkty'))
-- 1 prod + 3 ocen
INSERT INTO Produkty (nazwa, kategoria, opis, cena) VALUES 
	('Scrabble', 'rozrywka', 'Scrabble to gra, która pozwoli Ci utrzymać swój umysł w doskonałej kondycji.', 92.99)
INSERT INTO Oceny(ocena, tekst, produkt_id) VALUES
	(3, null, IDENT_CURRENT('Produkty')),
	(2, 'produkt na zdjeciu wyglądał lepiej :/', IDENT_CURRENT('Produkty')),
	(4, null, IDENT_CURRENT('Produkty'));
-- sprawdzenie przypisania ocen do prod
-- select * from Produkty, Oceny WHERE Oceny.produkt_id = Produkty.id 

-- TWORZENIE KOSZYKOW, PRZYPISYWANIE ICH DO POSZCZEGOLNYCH KLIENTOW, DODANIE ZAMOWIEN KLIENTOW I REKLAMACJI
-- klient 1
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES 
		   ('Bartosz', 'Lis', '504239152', IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Kościuszki Tadeusza 72', null, '50-037', 'Wrocław', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-01-24', IDENT_CURRENT('Adresy'),IDENT_CURRENT('Klienci'), NULL),
			('odebrane', 1, '2021-03-24', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), 'OFF15NOW'),
			('wyslane', 1, '2021-12-07', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), 'P0L3K4')
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('Na produkcie są widoczne ślady użytkowania', 'przyjeta', 1, IDENT_CURRENT('Zamowienia'))
-- klient 2
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Jan', 'Kustosz', '681239173', IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Lampego Alfreda 84', 'lokal 4c', '41-608', 'Świętochłowice', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-02-04', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('zwrot bez podania przyczyny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))

-- klient 3
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Mikolaj', 'Starzak', '504296384',IDENT_CURRENT('Koszyk') )
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
VALUES ('ul. Kotarbińskiego Tadeusza 104', null, '61-415', 'Poznań', 'Polska', 'odbior jedynie w godzinach wieczornych')
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('przyjete', 0, '2021-01-24', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL),
			('odebrane', 0, '2021-12-15', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('Produkt niekompletny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
-- klient 4
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Szymon', 'Majewski', '604997198', IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
VALUES ('Czereśniowa 15/303', null, '05-077', 'Warszawa', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-07-27', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('zwrot bez podania przyczyny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES	('odebrane', 1, '2021-12-15', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('zwrot bez podania przyczyny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
-- klient 5
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Piotr', 'Dolkowski', '657982154', IDENT_CURRENT('Koszyk') )
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('Cegielskiego Hipolita 119', null, '52-130', 'Wrocław', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-08-07', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('zwrot bez podania przyczyny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
-- klient 6
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Jakub', 'Jablkowski', '504128785',IDENT_CURRENT('Koszyk') )
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('Głogowska 3', null, '45-315', 'Opole', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 0, '2021-08-24', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('Produkt niekompletny', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
-- klient 7
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Michal', 'Lipek', '504298654', IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('Berberysowa 12', null, '15-591', 'Białystok', 'Polska', 'odbior mozliwy po godzinie 16')
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-08-25', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('Jakość produktu jest niezadawalająca', 'odrzucona', 0, IDENT_CURRENT('Zamowienia'))
-- klient 8
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Krzysztof', 'Bulwinski', 687425691, IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Wyścigowa 141/101', null, '20-425', 'Lublin', 'Polska', null)
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('odebrane', 1, '2021-08-25', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)
INSERT INTO Reklamacje (opis, status, czy_zwrocono, zamowienie_id) 
	VALUES ('Zamowienie jest niezgodne z oczekiwaniami', 'rozpatrywana', 0, IDENT_CURRENT('Zamowienia'))
-- klient 9
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Marcin', 'Kaczek', '504215698', IDENT_CURRENT('Koszyk') )
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Witosa Wincentego 71/203', null, '51-507', 'Wrocław', 'Polska', 'odbior w godzinach wieczornych lub porannych')
INSERT INTO Zamowienia (status, czy_oplacone, data_zlozenia, adres_id, klient_id, kod_promocji)
	VALUES ('wyslane', 1, '2021-11-26', IDENT_CURRENT('Adresy'), IDENT_CURRENT('Klienci'), NULL)

-- klient 10
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Marek', 'Caitlyn', '783569254', IDENT_CURRENT('Koszyk') )
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Chopina 47', null, '55-203', 'Oława', 'Polska', null)

-- klient 11
INSERT INTO Koszyk(data_modyfikacji) VALUES (null)
INSERT INTO Klienci (imie, nazwisko, telefon, koszyk_id) VALUES
		   ('Damian', 'Golasek', '504215485', IDENT_CURRENT('Koszyk'))
INSERT INTO Adresy (adres_cz1, adres_cz2, kod_pocztowy, miejscowosc, kraj, dodatkowe_informacje) 
 VALUES ('ul. Żytnia 72', null, '91-003', 'Łódź', 'Polska', null)

-- DODANIE LOSOWYCH PRODUKTOW DO LOSOWYCH ZAMOWIEN KLIENTOW
INSERT INTO Produkt_zamowienie (produkt_id, zamowienie_id, ilosc)
	(SELECT top 35 T1.ID, T2.ID, ABS(CHECKSUM(NewId())) % 2 + 1
	FROM Produkty as T1 
	CROSS JOIN Zamowienia as T2 
	
	)ORDER BY NEWID()
--INSERT INTO Produkt_zamowienie (produkt_id, zamowienie_id, ilosc)
--	VALUES (1, 1, 1),
--		   (3, 1, 1),
--		   (5, 2, 1),
--		   (3, 3, 2),
--		   (1, 4, 1),
--		   (6, 5, 1),
--		   (3, 5, 3),
--		   (4, 5, 2),
--		   (2, 6, 1),
--		   (7, 7, 1),
--		   (2, 7, 2),
--		   (4, 8, 1),
--		   (1, 8, 4),
--		   (5, 8, 1),
--		   (2, 9, 1),
--		   (9, 10, 1),
--		   (6, 11, 2),
--		   (7, 11, 1),
--		   (8, 12, 1),
--		   (10, 13, 1)

-- DODANIE LOSOWYCH PRODUKTOW DO LOSOWYCH KOSZYKOW KLIENTOW
INSERT INTO Produkt_koszyk (produkt_id, koszyk_id, ilosc)
	(SELECT top 15 T1.ID, T2.ID, ABS(CHECKSUM(NewId())) % 3 + 1
	FROM Produkty as T1 
	CROSS JOIN Koszyk as T2 
	
	)ORDER BY NEWID()

--select * from Klienci, Produkty, Produkt_koszyk WHERE Produkt_koszyk.koszyk_id = Klienci.koszyk_id and Produkt_koszyk.produkt_id = Produkty.ID
select * from Klienci, Produkty, Produkt_zamowienie, Zamowienia WHERE Produkt_zamowienie.zamowienie_id = Zamowienia.ID
	and Produkt_zamowienie.produkt_id = Produkty.ID and Zamowienia.klient_id = Klienci.ID
	ORDER BY Zamowienia.id
--select * from Produkty, Zamowienia, Reklamacje, Produkt_zamowienie WHERE Produkty.id = Produkt_zamowienie.produkt_id 
--		and Produkt_zamowienie.zamowienie_id = Zamowienia.id and Reklamacje.zamowienie_id = Zamowienia.id
--SELECT * from Zamowienia, Adresy WHERE Zamowienia.adres_id = Adresy.ID

-- WYŚWIETLENIE ZAMOWIEN, KTORE MAJA REKLAMACJE
--select Zamowienia.ID, Zamowienia.status, kod_promocji, nazwa as 'Nazwa prod', Reklamacje.opis as 'przyczyna zwotu', kategoria, cena, Reklamacje.status as 'status rek', czy_zwrocono, ilosc from Zamowienia, Produkty, Reklamacje, Produkt_zamowienie 
--	WHERE Reklamacje.zamowienie_id = Zamowienia.ID and Produkt_zamowienie.zamowienie_id = Zamowienia.ID 
--	and Produkt_zamowienie.produkt_id = Produkty.ID
--	ORDER BY Zamowienia.id
