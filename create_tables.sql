-- Usuwanie tabeli

DROP TABLE Pracownicy;

DROP TABLE Sprzęt;

DROP TABLE Właściciele;

DROP TABLE Zwierzęta;

DROP TABLE Wizyty;

DROP TABLE Transakcje;

-- Tworzenie tabeli

CREATE TABLE Pracownicy (
id_pracownika TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Imię VARCHAR(40),
Nazwisko VARCHAR(40),
PESEL CHAR(11) NOT NULL,
Telefon CHAR(9),
Email VARCHAR(50),
`Data zatrudnienia` DATE,
Specjalizacja VARCHAR(12),
Pensja SMALLINT UNSIGNED
)  ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE Sprzęt (
id_sprzętu TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(40),
Kategoria VARCHAR(40),
Wartość MEDIUMINT UNSIGNED
) ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE Właściciele (
id_właściciela SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Imię VARCHAR(40),
Nazwisko VARCHAR(40),
PESEL CHAR(11) NOT NULL,
Telefon CHAR(9),
Email VARCHAR(50)
)  ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE Zwierzęta (
id_zwierzęcia SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_właściciela SMALLINT UNSIGNED REFERENCES Właściciele(id_właściciela),
Imię VARCHAR(40),
`Data urodzenia` DATE,
`Data rejestracji` DATE,
Gatunek VARCHAR(40),
Rasa VARCHAR(40),
Płeć CHAR(1)
)  ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE Wizyty (
id_wizyty SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Data DATE,
Godzina TIME(0),
id_pracownika TINYINT UNSIGNED REFERENCES Pracownicy(id_pracownika),
`Czas trwania wizyty` TIME(0),
`Rodzaj wizyty` VARCHAR(40),
id_zwierzęcia SMALLINT UNSIGNED REFERENCES Zwierzęta(id_zwierzęcia)
)  ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE Transakcje (
id_transakcji SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Data DATE,
`Rodzaj transakcji` VARCHAR(40),
Kwota SMALLINT,
`id_wizyty jeśli wizyta` SMALLINT UNSIGNED REFERENCES Wizyty(id_wizyty)
) ENGINE = INNODB DEFAULT CHARSET = UTF8MB4 COLLATE = utf8mb4_unicode_ci;


