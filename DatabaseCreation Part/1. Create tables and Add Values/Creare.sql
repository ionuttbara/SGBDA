-- Tabela Brands
CREATE TABLE Brands (
    ID INT PRIMARY KEY,
    Denumire NVARCHAR(100)
);

-- Tabela Models
CREATE TABLE Models (
    ID INT PRIMARY KEY,
    Denumire NVARCHAR(100),
    An INT,
    BrandID INT,
    FOREIGN KEY (BrandID) REFERENCES Brands(ID)
);
-- Tabela Cars
CREATE TABLE Cars (
    ID INT PRIMARY KEY,
    BrandID INT,
    ModelID INT,
    An INT,
    Culoare NVARCHAR(50),
    Pret DECIMAL(10, 2),
    Disponibilitate BIT,
    FOREIGN KEY (BrandID) REFERENCES Brands(ID),
    FOREIGN KEY (ModelID) REFERENCES Models(ID)
);

-- Tabela Features
CREATE TABLE Features (
    ID INT PRIMARY KEY,
    Nume NVARCHAR(100),
    Tip_Binar CHAR(1) CHECK (Tip_Binar IN ('y', 'n'))
    FOREIGN KEY (ID) REFERENCES Cars(ID),
    FOREIGN KEY (ID) REFERENCES Features(ID)
);

-- Tabela Employees
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Nume NVARCHAR(100),
    Prenume NVARCHAR(100),
    Pozitie NVARCHAR(100),
    Vechime INT
);
-- Tabela Customers
CREATE TABLE Customers (
    ID INT PRIMARY KEY,
    Nume NVARCHAR(100),
    Prenume NVARCHAR(100),
    Varsta INT,
    Sex CHAR(1),
    Adresa NVARCHAR(255),
    Telefon NVARCHAR(20),
    Email NVARCHAR(100)
);

-- Tabela Sales
CREATE TABLE Sales (
    ID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    DealerID INT,
    Data_vanzare DATE,
    Suma DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES Cars(ID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
    FOREIGN KEY (DealerID) REFERENCES Employees(ID)
);

-- Tabela Showrooms
CREATE TABLE Showrooms (
    ID INT PRIMARY KEY,
    Nume NVARCHAR(100),
    Adresa NVARCHAR(255)
);
-- Tabela TestDrives
CREATE TABLE TestDrives (
    ID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    DealershipID INT,
    Data DATE,
    Feedback NVARCHAR(100),
    FOREIGN KEY (CarID) REFERENCES Cars(ID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
    FOREIGN KEY (DealershipID) REFERENCES Showrooms(ID)
);

-- Tabela Financing
CREATE TABLE Financing (
    ID INT PRIMARY KEY,
    TranzactieID INT,
    Rata DECIMAL(10, 2),
    Perioada INT,
    Dobanda DECIMAL(5, 2),
    FOREIGN KEY (TranzactieID) REFERENCES Sales(ID)
);