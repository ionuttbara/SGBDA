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
    SET NOCOUNT ON;

    BEGIN TRY
        -- Retrieve the inserted sales information
        DECLARE @SaleID INT, @CarID INT, @CustomerID INT, @DealerID INT, @SaleDate DATE, @SaleAmount DECIMAL(10, 2);
        SELECT @SaleID = ID, @CarID = CarID, @CustomerID = CustomerID, @DealerID = DealerID, @SaleDate = Data_vanzare, @SaleAmount = Suma
        FROM inserted;

        -- Log the sales information into another table
        INSERT INTO SalesLog (SaleID, CarID, CustomerID, DealerID, SaleDate, SaleAmount)
        VALUES (@SaleID, @CarID, @CustomerID, @DealerID, @SaleDate, @SaleAmount);

        -- Send notification about the new sale
        EXEC SendSalesNotification @SaleID;

        PRINT 'A new sale has been recorded.';

    END TRY
    BEGIN CATCH
        -- If an error occurs, rollback the transaction
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Raise an error or log the error message
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;
GO

-- Trigger 2: Before Update Trigger on Cars Table
CREATE TRIGGER InsteadOfUpdateCars
ON Cars
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the update violates any constraints (e.g., price increase limit)
        IF UPDATE(Pret) AND EXISTS (SELECT 1 FROM inserted i JOIN deleted d ON i.ID = d.ID WHERE i.Pret > d.Pret * 1.1)
        BEGIN
            RAISERROR('Price increase limit exceeded.', 16, 1);
            RETURN;
        END

        PRINT 'Attempting to update car information...';

    END TRY
    BEGIN CATCH
        -- If an error occurs, rollback the transaction
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Raise an error or log the error message
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;
GO
