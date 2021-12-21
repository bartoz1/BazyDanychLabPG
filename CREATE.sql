--CREATE DATABASE sklep_internetowy

CREATE TABLE Kategorie (
	nazwa varchar(50) PRIMARY KEY CHECK(nazwa NOT LIKE '%[^A-Z ]%')
)

CREATE  TABLE Produkty (
	ID	INT IDENTITY(1,1) PRIMARY KEY,
	nazwa VARCHAR(50) NOT NULL CHECK (nazwa NOT LIKE '%!%' and nazwa NOT LIKE '%@%'),
	kategoria VARCHAR(50),
	opis text,
	cena DECIMAl(7,2) NOT NULL CHECK(cena >=0 AND cena <=50000), 
	data_dodania DATE DEFAULT GETDATE(),
)


CREATE TABLE Klienci (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	imie varchar(40) CHECK (imie NOT LIKE '% %'),
	nazwisko varchar(40) CHECK (nazwisko NOT LIKE '% %'),
	telefon varchar(9) CHECK(telefon LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	koszyk_id int
)

CREATE TABLE Produkt_zamowienie (
	produkt_id int NOT NULL,
	zamowienie_id int NOT NULL,
	ilosc int not null CHECK(ilosc >= 0 AND ilosc <= 1000),
	PRIMARY KEY(produkt_id, zamowienie_id)
)

CREATE TABLE Zamowienia (
	ID int IDENTITY(1,1) PRIMARY KEY,
	status varchar(15) DEFAULT('przyjete') CHECK(status in ('przyjete', 'zapakowane', 'wyslane', 'odebrane')),
	czy_oplacone bit default(0),
	data_zlozenia datetime DEFAULT GETDATE(),
	adres_id int,
	klient_id int,
	kod_promocji varchar(10)
)

CREATE TABLE Adresy (
	ID int IDENTITY(1,1) PRIMARY KEY,
	adres_cz1 varchar(40) not null CHECK(adres_cz1 NOT LIKE '%[^A-Z/.¥¯ÊÆÑÓ£ 0-9]%'),
	adres_cz2 varchar(40) CHECK(adres_cz2 NOT LIKE '%[^A-Z/.¥¯ÊÆÑÓ£ 0-9]%'),
	kod_pocztowy char(6) not null CHECK (kod_pocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'),
	miejscowosc varchar(30) CHECK(miejscowosc NOT LIKE '%[^A-Z/.¥¯ÊÆÑÓ£ 0-9]%'),
	kraj varchar(58) CHECK(kraj NOT LIKE '%[^A-Z¥¯ÊÆÑÓ£ 0-9]%'),
	nazwa_planety varchar(100) CHECK(nazwa_planety NOT LIKE '%[^A-Z0-9 -/]%'),
	dodatkowe_informacje varchar(100)
)

CREATE TABLE Promocje (
	kod varchar(10) PRIMARY KEY	CHECK(kod NOT LIKE '%[^A-Z0-9]%'),
	data_rozpoczecia DATETIME DEFAULT GETDATE(),
	data_zakonczenia DATETIME DEFAULT (GETDATE()+30),
	znizka DECIMAl(4,2) NOT NULL CHECK(znizka >=0 AND znizka <=1)
	
)

CREATE TABLE Reklamacje (
	ID int IDENTITY(1,1) PRIMARY KEY,
	opis text not null,
	status varchar(15) default('rozpatrywana') CHECK(status in ('rozpatrywana', 'odrzucona', 'przyjeta')),
	czy_zwrocono bit default(0),
	zamowienie_id int
)

CREATE TABLE Koszyk (
	ID int	IDENTITY(1,1) PRIMARY KEY,
	data_modyfikacji DATETIME
)

CREATE TABLE Produkt_koszyk (
	produkt_id int not null,
	koszyk_id int not null,
	ilosc int not null CHECK(ilosc >=0 AND ilosc < 1000),
	PRIMARY KEY (produkt_id, koszyk_id)
)

CREATE TABLE Oceny (
	ID int IDENTITY(1,1) PRIMARY KEY,
	ocena int not null CHECK (ocena >= 1 AND ocena <=5),
	tekst varchar (100),
	data_dodania DATETIME DEFAULT GETDATE(),
	produkt_id int,
	
)

ALTER TABLE Produkt_zamowienie ADD CONSTRAINT nalezy_do_zamowienia FOREIGN KEY (produkt_id) REFERENCES Produkty(ID)
ALTER TABLE Produkt_zamowienie ADD CONSTRAINT zawiera FOREIGN KEY (zamowienie_id) REFERENCES Zamowienia(ID) ON DELETE CASCADE
ALTER TABLE Zamowienia ADD CONSTRAINT zamawia FOREIGN KEY (klient_id) REFERENCES Klienci(ID) ON DELETE SET NULL
ALTER TABLE Reklamacje ADD CONSTRAINT zlozono_reklamacje FOREIGN KEY (zamowienie_id) REFERENCES Zamowienia(ID) ON DELETE CASCADE
ALTER TABLE Klienci ADD CONSTRAINT posiada FOREIGN KEY (koszyk_id) REFERENCES Koszyk(ID) 
ALTER TABLE Produkt_koszyk ADD CONSTRAINT dodane_do_koszyka FOREIGN KEY (koszyk_id) REFERENCES Koszyk(ID)
ALTER TABLE Zamowienia ADD CONSTRAINT zamawia_na_adres FOREIGN KEY (adres_id) REFERENCES Adresy(ID)
ALTER TABLE Produkt_koszyk ADD CONSTRAINT jest_w_koszyku FOREIGN KEY (produkt_id) REFERENCES Produkty(ID)
ALTER TABLE Zamowienia ADD CONSTRAINT korzysta_z_promocji FOREIGN KEY (kod_promocji) REFERENCES Promocje(kod) ON DELETE NO ACTION ON UPDATE CASCADE
ALTER TABLE Produkty ADD CONSTRAINT nalezy_do_kategorii FOREIGN KEY (kategoria) REFERENCES Kategorie(nazwa) ON UPDATE CASCADE
ALTER TABLE Oceny ADD CONSTRAINT odnosi_sie_do FOREIGN KEY (produkt_id) REFERENCES Produkty(ID)

