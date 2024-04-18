# SQL-project-

USE AdventureWorks2014
GO

SELECT  e.BusinessEntityID,
		e.NationalIDNumber AS [პირადობა],
		e.BirthDate as N'დაბადების თარიღი',
		e.Gender AS "სქესი",
		e.HireDate AS [danishvnis tarigi]
FROM HumanResources.Employee AS E


--MIN() MAX()
SELECT MIN(E.BirthDate) AS [min birthdate],
       MAX(E.BirthDate) AS [max birthdate]
FROM HumanResources.Employee AS E;
