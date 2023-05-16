-- tables
-- Table: Klient
CREATE TABLE Klient (
    id int NOT NULL,
    Imie varchar(20) NOT NULL,
    Nazwisko varchar(20) NOT NULL,
    Telefon int NOT NULL,
    CONSTRAINT Klient PRIMARY KEY (id)
);

-- Table: Marka
CREATE TABLE Marka (
    id int NOT NULL,
    Nazwa varchar(20) NOT NULL,
    CONSTRAINT Marka_pk PRIMARY KEY (id)
);

-- Table: Model
CREATE TABLE Model (
    id int NOT NULL,
    Nazwa varchar(64) NOT NULL,
    Wersja varchar(64) NOT NULL,
    Marka_id int NOT NULL,
    CONSTRAINT Model_pk PRIMARY KEY (id)
);

-- Table: Pojazd
CREATE TABLE Pojazd (
    id int NOT NULL,
    Vin varchar(24) NOT NULL,
    Data_prod timestamp NOT NULL,
    Kolor varchar(64) NOT NULL,
    Pochodzenie varchar(64) NOT NULL,
    przebieg int NOT NULL,
    Model_id int NOT NULL,
    CONSTRAINT Pojazd_pk PRIMARY KEY (id)
);

-- Table: Pracownik
CREATE TABLE Pracownik (
    id int NOT NULL,
    Imie varchar(64) NOT NULL,
    Nazwisko varchar(64) NOT NULL,
    nr_konta varchar(20) NOT NULL,
    Stanowisko varchar(60) NOT NULL,
    Pensja bigint NOT NULL,
    Raport_id int NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id)
);

-- Table: Raport
CREATE TABLE Raport (
    id int NOT NULL,
    Sprawny bool NOT NULL,
    Czysty bool NOT NULL,
    Wartosc int NOT NULL,
    Opis varchar(500) NOT NULL,
    Pojazd_id int NOT NULL,
    CONSTRAINT Raport_pk PRIMARY KEY (id)
);

-- Table: Rezerwacja
CREATE TABLE Rezerwacja (
    id int NOT NULL,
    Start_rezerwacji timestamp NOT NULL,
    Koniec_rezerwacji timestamp NOT NULL,
    Pojazd_id int NOT NULL,
    Klient_id int NOT NULL,
    CONSTRAINT Rezerwacja_pk PRIMARY KEY (id)
);

-- Table: Wizyta
CREATE TABLE Wizyta (
    id int NOT NULL,
    Nazwa varchar(30) NOT NULL,
    data_in timestamp NOT NULL,
    Pojazd_id int NOT NULL,
    Handlarz_id int NOT NULL,
    Klient_id int NOT NULL,
    CONSTRAINT Wizyta_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Model_Marka (table: Model)
ALTER TABLE Model ADD CONSTRAINT Model_Marka FOREIGN KEY Model_Marka (Marka_id)
    REFERENCES Marka (id);

-- Reference: Pojazd_Model (table: Pojazd)
ALTER TABLE Pojazd ADD CONSTRAINT Pojazd_Model FOREIGN KEY Pojazd_Model (Model_id)
    REFERENCES Model (id);

-- Reference: Pracownik_Raport (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Raport FOREIGN KEY Pracownik_Raport (Raport_id)
    REFERENCES Raport (id);

-- Reference: Raport_Pojazd (table: Raport)
ALTER TABLE Raport ADD CONSTRAINT Raport_Pojazd FOREIGN KEY Raport_Pojazd (Pojazd_id)
    REFERENCES Pojazd (id);

-- Reference: Rezerwacja_Klient (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Klient FOREIGN KEY Rezerwacja_Klient (Klient_id)
    REFERENCES Klient (id);

-- Reference: Rezerwacja_Pojazd (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Pojazd FOREIGN KEY Rezerwacja_Pojazd (Pojazd_id)
    REFERENCES Pojazd (id);

-- Reference: Wizyta_Handlarz (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Handlarz FOREIGN KEY Wizyta_Handlarz (Handlarz_id)
    REFERENCES Pracownik (id);

-- Reference: Wizyta_Klient (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Klient FOREIGN KEY Wizyta_Klient (Klient_id)
    REFERENCES Klient (id);

-- Reference: Wizyta_Pojazd (table: Wizyta)
ALTER TABLE Wizyta ADD CONSTRAINT Wizyta_Pojazd FOREIGN KEY Wizyta_Pojazd (Pojazd_id)
    REFERENCES Pojazd (id);

-- End of file.

