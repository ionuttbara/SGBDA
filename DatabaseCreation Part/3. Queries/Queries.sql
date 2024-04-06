--- Interogare simplă de selectare a tuturor mașinilor dintr-un anumit showroom:1

SELECT *
FROM Cars
WHERE ID = (SELECT ID FROM Showrooms WHERE Nume = 'Nume Showroom');


--- Interogare pentru a găsi cel mai vechi și cel mai nou model de mașină:2
SELECT MIN(An) AS CelMaiVechiModel, MAX(An) AS CelMaiNouModel
FROM Cars;


--- Interogare pentru a găsi toate detaliile vânzărilor, alături de numele și prenumele clienților:3
SELECT s.ID AS SaleID, c.Nume AS CustomerLastName, c.Prenume AS CustomerFirstName, s.Data_vanzare AS SaleDate, s.Suma AS SaleAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.ID;


---Interogare pentru a găsi suma totală a vânzărilor pentru fiecare dealer:4

SELECT e.Nume, e.Prenume, SUM(s.Suma) AS TotalSalesAmount
FROM Sales s
JOIN Employees e ON s.DealerID = e.ID
GROUP BY e.Nume, e.Prenume;


--- Interogare pentru a găsi numele și prenumele clienților care au cumpărat o mașină de culoare roșie:5
SELECT cu.Nume, cu.Prenume
FROM Customers cu
JOIN Sales s ON cu.ID = s.CustomerID
JOIN Cars c ON s.CarID = c.ID
WHERE c.Culoare = 'Rosu';

--- Interogare pentru a găsi numele showroom-ului și numărul total de mașini disponibile în fiecare showroom:6

SELECT s.Nume, COUNT(*) AS TotalAvailableCars
FROM Showrooms s
JOIN Cars c ON s.ID = c.ShowroomID
WHERE c.Disponibilitate = 1
GROUP BY s.Nume;


--- Selectarea detaliilor despre mașinile care au geamuri electrice:7

SELECT *
FROM Cars c
INNER JOIN FeaturesCars fc ON c.ID = fc.CarID
INNER JOIN Features f ON fc.FeatureID = f.ID
WHERE f.Nume = 'geamuri electrice';

--- Selectarea detaliilor despre mașinile vândute de un anumit dealer:8

SELECT *
FROM SalesDetailsView
WHERE EmployeeID = 123; -- ID-ul dealerului dorit

--- Selectarea detaliilor despre angajații care au o vechime mai mare de 5 ani: 9
SELECT *
FROM Employees
WHERE Vechime > 5;


--- Selectarea numărului total de test drive-uri efectuate în fiecare showroom:10

SELECT s.ID AS ShowroomID, s.Nume AS ShowroomName, COUNT(td.ID) AS TotalTestDrives
FROM Showrooms s
LEFT JOIN TestDrives td ON s.ID = td.DealershipID
GROUP BY s.ID, s.Nume;


--- Selectarea detaliilor despre clienții care au cumpărat mai mult de o mașină:11
SELECT cu.ID, cu.Nume, cu.Prenume, COUNT(s.CarID) AS TotalCarsBought
FROM Customers cu
INNER JOIN Sales s ON cu.ID = s.CustomerID
GROUP BY cu.ID, cu.Nume, cu.Prenume
HAVING COUNT(s.CarID) > 1;


---Selectarea detaliilor despre finanțare pentru vânzările cu rate lunare mai mari de 1000:12
SELECT *
FROM FinancingDetailsView
WHERE Rate > 1000;


--- Selectarea numărului total de mașini vândute pentru fiecare brand:13
SELECT b.Denumire AS BrandName, COUNT(s.CarID) AS TotalCarsSold
FROM Brands b
INNER JOIN Cars c ON b.ID = c.BrandID
INNER JOIN Sales s ON c.ID = s.CarID
GROUP BY b.Denumire;


---Selectarea detaliilor testelor de conducere pentru mașinile de culoare albă:14
SELECT *
FROM TestDrivesDetailsView
WHERE CarColor = 'alb';


--- Selectarea ultimelor 5 vânzări în ordine descrescătoare după dată:15
SELECT TOP 5 *
FROM SalesDetailsView
ORDER BY SaleDate DESC;


--- Interogare pentru a obține o listă JSON cu toate caracteristicile mașinii cu un anumit ID:16
DECLARE @CarID INT = 1; -- Înlocuiește 1 cu ID-ul real al mașinii

SELECT (SELECT Nume
        FROM Features
        WHERE ID IN (SELECT ID FROM Features WHERE ID= @CarID)
        FOR JSON PATH) AS CarFeatures;
