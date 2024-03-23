-- Stored Procedure 1: Retrieve Cars by Brand
CREATE PROCEDURE GetCarsByBrand
    @BrandName NVARCHAR(255)
AS
BEGIN
    SELECT c.ID, c.An, c.Culoare, c.Pret
    FROM Cars c
    INNER JOIN Brands b ON c.BrandID = b.ID
    WHERE b.Denumire = @BrandName;
END;
GO

-- Stored Procedure 2: Calculate Average Sale Amount
CREATE PROCEDURE CalculateAverageSaleAmount
    @Average DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SELECT @Average = AVG(Suma)
    FROM Sales;
END;
GO

-- Stored Procedure 3: Insert Customer
CREATE PROCEDURE InsertCustomer
    @Nume NVARCHAR(100),
    @Prenume NVARCHAR(100),
    @Varsta INT,
    @Sex CHAR(1),
    @Adresa NVARCHAR(255),
    @Telefon NVARCHAR(20),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO Customers (Nume, Prenume, Varsta, Sex, Adresa, Telefon, Email)
    VALUES (@Nume, @Prenume, @Varsta, @Sex, @Adresa, @Telefon, @Email);
END;
GO

-- Stored Procedure 4: Update Car Price by ID
CREATE PROCEDURE UpdateCarPriceByID
    @CarID INT,
    @NewPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE Cars
    SET Pret = @NewPrice
    WHERE ID = @CarID;
END;
GO

-- Stored Procedure 5: Delete Customer by ID
CREATE PROCEDURE DeleteCustomerByID
    @CustomerID INT
AS
BEGIN
    DELETE FROM Customers
    WHERE ID = @CustomerID;
END;
GO

-- Trigger 1: After Insert Trigger on Sales Table
CREATE TRIGGER AfterInsertSales
ON Sales
AFTER INSERT
AS
BEGIN
    -- Here you can define your desired actions after insertion into the Sales table
    -- For example, logging the sales information into another table or sending notifications
    PRINT 'A new sale has been recorded.';
END;
GO

-- Trigger 2: Before Update Trigger on Cars Table
CREATE TRIGGER BeforeUpdateCars
ON Cars
BEFORE UPDATE
AS
BEGIN
    -- Here you can define your desired actions before updating the Cars table
    -- For example, enforcing constraints or performing validations
    PRINT 'Attempting to update car information...';
END;
GO
