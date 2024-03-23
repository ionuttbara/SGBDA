-- View pentru Detalii Vânzări
CREATE VIEW SalesDetailsView AS
SELECT s.ID AS SaleID, 
       c.ID AS CarID, 
       c.BrandID, 
       c.ModelID, 
       c.An AS CarYear, 
       c.Culoare AS CarColor, 
       c.Pret AS CarPrice, 
       c.Disponibilitate AS CarAvailability, 
       cu.ID AS CustomerID, 
       cu.Nume AS CustomerLastName, 
       cu.Prenume AS CustomerFirstName, 
       cu.Varsta AS CustomerAge, 
       cu.Sex AS CustomerGender, 
       cu.Adresa AS CustomerAddress, 
       cu.Telefon AS CustomerPhone, 
       cu.Email AS CustomerEmail, 
       e.ID AS EmployeeID, 
       e.Nume AS EmployeeLastName, 
       e.Prenume AS EmployeeFirstName, 
       e.Pozitie AS EmployeePosition, 
       e.Vechime AS EmployeeExperience, 
       s.Data_vanzare AS SaleDate, 
       s.Suma AS SaleAmount
FROM Sales s
INNER JOIN Cars c ON s.CarID = c.ID
INNER JOIN Customers cu ON s.CustomerID = cu.ID
INNER JOIN Employees e ON s.DealerID = e.ID;
