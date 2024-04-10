-- Inserare date in tabela Brands
INSERT INTO Brands (ID, Denumire) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Ford'),
(4, 'Chevrolet'),
(5, 'Volkswagen'),
(6, 'Nissan'),
(7, 'BMW'),
(8, 'Mercedes-Benz'),
(9, 'Audi'),
(10, 'Hyundai'),
(11, 'Kia'),
(12, 'Subaru'),
(13, 'Mazda'),
(14, 'Jeep'),
(15, 'Tesla');

-- Inserare date in tabela Models
INSERT INTO Models (ID, Denumire, An, BrandID) VALUES
(1, 'Corolla', 2020, 1),
(2, 'Civic', 2019, 2),
(3, 'Fiesta', 2021, 3),
(4, 'Malibu', 2022, 4),
(5, 'Golf', 2020, 5),
(6, 'Altima', 2021, 6),
(7, '3 Series', 2019, 7),
(8, 'C-Class', 2022, 8),
(9, 'A4', 2020, 9),
(10, 'Elantra', 2021, 10),
(11, 'Forte', 2020, 11),
(12, 'Impreza', 2022, 12),
(13, 'CX-5', 2019, 13),
(14, 'Cherokee', 2020, 14),
(15, 'Model 3', 2021, 15);


-- Inserare date in tabela Features
INSERT INTO Features (ID, Nume, Tip_Binar) VALUES
(1, 'Geamuri electrice', 'y'),
(2, 'Scaune încălzite', 'y'),
(3, 'Cruise control', 'n'),
(4, 'Sistem de navigație', 'y'),
(5, 'Camere de parcare', 'y'),
(6, 'Controlul tracțiunii', 'y'),
(7, 'Senzori de ploaie', 'n'),
(8, 'Sistem audio premium', 'y'),
(9, 'Asistență la frânare', 'y'),
(10, 'Controlul stabilității', 'y');



-- Inserare date in tabela Cars
INSERT INTO Cars (ID, BrandID, ModelID, An, Culoare, Pret, Disponibilitate) VALUES
(1, 1, 1, 2020, 'Alb', 25000.00, 1),
(2, 2, 2, 2019, 'Negru', 27000.00, 1),
(3, 3, 3, 2021, 'Roșu', 23000.00, 1),
(4, 4, 4, 2022, 'Argintiu', 28000.00, 2),
(5, 5, 5, 2020, 'Albastru', 26000.00, 2),
(6, 6, 6, 2021, 'Gri', 24000.00, 2),
(7, 7, 7, 2019, 'Alb', 30000.00, 3),
(8, 8, 8, 2022, 'Negru', 29000.00, 3),
(9, 9, 9, 2020, 'Alb', 27000.00, 3),
(10, 10, 10, 2021, 'Roșu', 25000.00, 3);


-- Inserare date in tabela Employees
INSERT INTO Employees (ID, Nume, Prenume, Pozitie, Vechime) VALUES
(1, 'Popescu', 'Ion', 'Vânzător', 3),
(2, 'Ionescu', 'Maria', 'Manager', 5),
(3, 'Georgescu', 'Andrei', 'Consultant financiar', 2),
(4, 'Constantinescu', 'Ana', 'Asistent vânzări', 1),
(5, 'Dumitrescu', 'Mihai', 'Service Manager', 4),
(6, 'Stanescu', 'Elena', 'Reprezentant vânzări', 3),
(7, 'Gheorghe', 'Alexandru', 'Marketing Specialist', 2),
(8, 'Florescu', 'Raluca', 'Director de vânzări', 1),
(9, 'Mihai', 'Cristian', 'Tehnician auto', 4),
(10, 'Stanciu', 'Andreea', 'Contabil', 5);


-- Inserare date in tabela Customers
INSERT INTO Customers (ID, Nume, Prenume, Varsta, Sex, Adresa, Telefon, Email) VALUES
(1, 'Pop', 'Ana', 30, 'F', 'Strada Florilor, Nr. 10', '0721123456', 'ana.pop@example.com'),
(2, 'Ionescu', 'Mihai', 25, 'M', 'Bulevardul Libertății, Nr. 15', '0732123456', 'mihai.ionescu@example.com'),
(3, 'Radu', 'Andreea', 28, 'F', 'Bulevardul Unirii, Nr. 20', '0712123456', 'andreea.radu@example.com'),
(4, 'Popescu', 'Ion', 35, 'M', 'Strada Crizantemelor, Nr. 5', '0742123456', 'ion.popescu@example.com'),
(5, 'Stan', 'Elena', 32, 'F', 'Aleea Castanilor, Nr. 8', '0752123456', 'elena.stan@example.com');


-- Inserare date in tabela Sales
INSERT INTO Sales (ID, CarID, CustomerID, DealerID, Data_vanzare, Suma) VALUES
(1, 1, 1, 1, '2024-03-20', 24000.00),
(2, 2, 2, 2, '2024-03-21', 26000.00),
(3, 3, 3, 3, '2024-03-22', 23000.00),
(4, 4, 4, 4, '2024-03-23', 28000.00),
(5, 5, 5, 5, '2024-03-24', 25000.00);


-- Inserare date in tabela Showrooms
INSERT INTO Showrooms (ID, Nume, Adresa) VALUES
(1, 'Showroom Principal', 'Strada Victoriei, Nr. 5'),
(2, 'Showroom Secundar', 'Bulevardul Unirii, Nr. 20'),
(3, 'Showroom Central', 'Bulevardul Decebal, Nr. 10'),
(4, 'Showroom Nord', 'Strada Aviatorilor, Nr. 15'),
(5, 'Showroom Sud', 'Bulevardul 1 Mai, Nr. 25');


-- Inserare date in tabela TestDrives
INSERT INTO TestDrives (ID, CarID, CustomerID, DealershipID, Data, Feedback) VALUES
(1, 1, 2, 1, '2024-03-22', 'Mașina a fost excelentă.'),
(2, 2, 1, 2, '2024-03-23', 'Experiența a fost pozitivă.'),
(3, 3, 3, 3, '2024-03-24', 'Vânzătorul a fost foarte informativ.'),
(4, 4, 4, 4, '2024-03-25', 'Am fost impresionat de profesionalismul echipei.'),
(5, 5, 5, 5, '2024-03-26', 'Recomand cu încredere acest showroom.');


-- Inserare date in tabela Financing
INSERT INTO Financing (ID, TranzactieID, Rata, Perioada, Dobanda) VALUES
(1, 1, 400.00, 60, 5.00),
(2, 2, 500.00, 48, 4.50),
(3, 3, 350.00, 72, 4.75),
(4, 4, 450.00, 36, 4.25),
(5, 5, 480.00, 24, 4.80);

