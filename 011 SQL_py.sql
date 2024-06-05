--datediff()
SELECT	GETDATE() AS [curr date],
		DATEDIFF(DAY, GETDATE(), DATEADD(YEAR, 1, GETDATE()))


SELECT DATEDIFF(DAY, '2008-04-30', GETDATE())
SELECT DATEDIFF(DAY, GETDATE(), '2025-04-30')


SELECT e.BirthDate , DATEDIFF(DAY, e.BirthDate, GETDATE()),
DATEDIFF(DAY, e.BirthDate, DATEADD(YEAR, 1,e.BirthDate))
FROM HumanResources.Employee AS e


SELECT e.BirthDate, DATEDIFF(day,GETDATE(),
DATEADD(year,1 + DATEDIFF(year,e.BirthDate,GETDATE()),e.BirthDate))
FROM HumanResources.Employee AS e


--insert
IF OBJECT_ID('my_employees') IS NOT NULL
	DROP TABLE dbo.my_employees
GO

CREATE TABLE my_employees(
	BusinessEntityID INT NOT NULL UNIQUE,
	NationalIDNumber NVARCHAR(15) NOT NULL,
	Birthdate DATE NOT NULL,
	Gender CHAR(1) NOT NULL,
	Curr_date DATETIME
)
GO

INSERT INTO my_employees(BusinessEntityID, NationalIDNumber, Birthdate, Gender, Curr_date)
VALUES  (9, '12345678911', '1969-05-28', 'F', GETDATE()),
		(2, '12345678911', '1969-05-28', 'F', GETDATE()),
		(3, '12345678911', '1969-05-28', 'F', GETDATE()),
		(4, '12345678911', '1969-05-28', 'F', GETDATE()),
		(5, '12345678911', '1969-05-28', 'F', GETDATE()),
		(6, '12345678911', '1969-05-28', 'F', GETDATE()),
		(7, '12345678911', '1969-05-28', 'F', GETDATE()),
		(8, '12345678911', '1969-05-28', 'F', GETDATE())


SELECT * FROM dbo.my_employees AS me

INSERT INTO my_employees 
SELECT  e.BusinessEntityID, 
		e.NationalIDNumber,
		e.BirthDate,
		e.Gender,
		GETDATE()		
FROM HumanResources.Employee AS e
WHERE e.BusinessEntityID > 100



SELECT * FROM dbo.my_employees AS me

--Update

UPDATE dbo.my_employees SET Gender = 'F'


SELECT * 
--UPDATE me SET me.Gender = 'M'
FROM dbo.my_employees AS me
WHERE me.BusinessEntityID%2=0
AND YEAR(me.Birthdate)%2=0


