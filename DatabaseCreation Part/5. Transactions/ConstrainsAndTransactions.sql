-- Adăugare cheie unică pentru a asigura denumiri unice de Brand
ALTER TABLE Brands
ADD CONSTRAINT UQ_Brands_Denumire UNIQUE (Denumire);

-- Adăugare cheie unică compusă pentru a asigura combinații unice de Model și An
ALTER TABLE Models
ADD CONSTRAINT UQ_Models_DenumireAn UNIQUE (Denumire, An);

-- Adăugare cheie unică compusă pentru a asigura combinații unice de Brand, Model și An în tabela Cars
ALTER TABLE Cars
ADD CONSTRAINT UQ_Cars_BrandModelAn UNIQUE (Brand_ID, Model_ID, An);

-- Adăugare constrângere de check pentru a asigura că Pretul în tabela Cars este pozitiv
ALTER TABLE Cars
ADD CONSTRAINT CK_Cars_Pret_Positive CHECK (Pret >= 0);

-- Adăugare constrângere de check pentru a asigura că Suma în tabela Sales este pozitivă
ALTER TABLE Sales
ADD CONSTRAINT CK_Sales_Suma_Positive CHECK (Suma >= 0);

-- Adăugare constrângere de check pentru a asigura că Rata în tabela Financing este pozitivă
ALTER TABLE Financing
ADD CONSTRAINT CK_Financing_Rata_Positive CHECK (Rata >= 0);

-- Adăugare trigger pentru a verifica suma ratei și a dobânzii înainte de inserarea în tabela Financing
CREATE TRIGGER CheckRateDobanda
ON Financing
BEFORE INSERT
AS
BEGIN
    DECLARE @SumaTotala DECIMAL(10, 2);

    SELECT @SumaTotala = Rata + Dobanda
    FROM inserted;

    IF @SumaTotala > 1000.00
    BEGIN
        RAISEERROR('Suma totala a ratei si dobanzii trebuie sa fie mai mica sau egala cu 1000.00.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;