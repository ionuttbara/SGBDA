-- Inserare date in tabela Brands
INSERT INTO Brands (ID, Denumire) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Ford');

-- Inserare date in tabela Models
INSERT INTO Models (ID, Denumire, An, BrandID) VALUES
(1, 'Corolla', 2020, 1),
(2, 'Civic', 2019, 2),
(3, 'Fiesta', 2021, 3);

-- Inserare date in tabela Features
INSERT INTO Features (ID, Nume, Tip_Binar) VALUES
(1, 'Geamuri electrice', 'y'),
(2, 'Scaune încălzite', 'y'),
(3, 'Cruise control', 'n');

-- Inserare date in tabela Cars
INSERT INTO Cars (ID, BrandID, ModelID, An, Culoare, Pret, Disponibilitate) VALUES
(1, 1, 1, 2020, 'Alb', 25000.00, 1),
(2, 2, 2, 2019, 'Negru', 27000.00, 1),
(3, 3, 3, 2021, 'Rosu', 23000.00, 1);

-- Inserare date in tabela Employees
INSERT INTO Employees (ID, Nume, Prenume, Pozitie, Vechime) VALUES
(1, 'Popescu', 'Ion', 'Vânzător', 3),
(2, 'Ionescu', 'Maria', 'Manager', 5),
(3, 'Georgescu', 'Andrei', 'Consultant financiar', 2);

-- Inserare date in tabela Customers
INSERT INTO Customers (ID, Nume, Prenume, Varsta, Sex, Adresa, Telefon, Email) VALUES
(1, 'Pop', 'Ana', 30, 'F', 'Strada Florilor, Nr. 10', '0721123456', 'ana.pop@example.com'),
(2, 'Ionescu', 'Mihai', 25, 'M', 'Bulevardul Libertății, Nr. 15', '0732123456', 'mihai.ionescu@example.com');

-- Inserare date in tabela Sales
INSERT INTO Sales (ID, CarID, CustomerID, DealerID, Data_vanzare, Suma) VALUES
(1, 1, 1, 1, '2024-03-20', 24000.00),
(2, 2, 2, 2, '2024-03-21', 26000.00);

-- Inserare date in tabela Showrooms
INSERT INTO Showrooms (ID, Nume, Adresa) VALUES
(1, 'Showroom Principal', 'Strada Victoriei, Nr. 5'),
(2, 'Showroom Secundar', 'Bulevardul Unirii, Nr. 20');

-- Inserare date in tabela TestDrives
INSERT INTO TestDrives (ID, CarID, CustomerID, DealershipID, Data, Feedback) VALUES
(1, 1, 2, 1, '2024-03-22', 'Mașina a fost excelentă.'),
(2, 2, 1, 2, '2024-03-23', 'Experiența a fost pozitivă.');

-- Inserare date in tabela Financing
INSERT INTO Financing (ID, TranzactieID, Rata, Perioada, Dobanda) VALUES
(1, 1, 400.00, 60, 5.00),
(2, 2, 500.00, 48, 4.50);
