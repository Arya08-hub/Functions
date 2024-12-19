CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);



INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'India', 1380000000, 3287263),
(4, 'China', 1440000000, 9596961),
(5, 'Brazil', 213000000, 8515767),
(6, 'Australia', 25600000, 7692024),
(7, 'Russia', 146000000, 17098246),
(8, 'UK', 67000000, 243610),
(9, 'France', 65000000, 551695),
(10, 'Germany', 83000000, 357022);

ALTER TABLE Persons
ADD DOB DATE;

CREATE FUNCTION CalculateAge(@DOB DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DOB, GETDATE()) 
           - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, @ DOB, GETDATE()), @DOB) > GETDATE() THEN 1 ELSE 0 END;
END;



SELECT Name, 
       dbo.CalculateAge(DOB) AS Age
FROM Persons;


SELECT CountryName, 
       LEN(CountryName) AS LengthOfCountryName
FROM Country;


SELECT CountryName, 
       LEFT(CountryName, 3) AS FirstThreeCharacters
FROM Country;



SELECT CountryName, 
       UPPER(CountryName) AS UpperCaseName,
       LOWER(CountryName) AS LowerCaseName
FROM Country;