
-- View pentru Detalii Test Drives
CREATE VIEW TestDrivesDetailsView AS
SELECT td.ID AS TestDriveID, 
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
       s.ID AS ShowroomID, 
       s.Nume AS ShowroomName, 
       s.Adresa AS ShowroomAddress, 
       td.Data AS TestDriveDate, 
       td.Feedback AS TestDriveFeedback
FROM TestDrives td
INNER JOIN Cars c ON td.CarID = c.ID
INNER JOIN Customers cu ON td.CustomerID = cu.ID
INNER JOIN Showrooms s ON td.DealershipID = s.ID;