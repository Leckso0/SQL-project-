--2024_03
--===========================================================
--Aliases
--MIN()
--MAX()
--SUM()
--AVG()
--COUNT()
--GROUP BY
--HAVING
--ROW_NUMBER()
--SUBQUERY
--NESTED QUERY
--===========================================================
SELECT Employee.BusinessEntityID,
		Employee.NationalIDNumber AS [პირადობა],
		Employee.BirthDate as N'დაბადების თარიღი',
		Employee.Gender AS "სქესი",
		Employee.HireDate AS [danishvnis tarigi]
FROM HumanResources.Employee


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

--SELECT * FROM HumanResources.Employee AS E


SELECT MIN(E.BirthDate) AS [min birthdate],
       MAX(E.BirthDate) AS [max birthdate]
FROM HumanResources.Employee AS E
WHERE E.MaritalStatus = 'M';


--Sum(), Avg(), Count()
SELECT * FROM Sales.SalesOrderDetail AS SOD

--56423747.6147
SELECT SUM(SOD.UnitPrice) AS [სრული ჯამი] FROM Sales.SalesOrderDetail AS SOD


--465.0934
SELECT AVG(SOD.UnitPrice) AS [საშუალო არითმეტიკული] FROM Sales.SalesOrderDetail AS SOD

--121317
SELECT COUNT(*) AS [რაოდენობა] FROM Sales.SalesOrderDetail AS SOD


SELECT	SUM(SOD.UnitPrice) AS [სრული ჯამი],
		AVG(SOD.UnitPrice) AS [საშუალო არითმეტიკული], 
		COUNT(*) AS [რაოდენობა] 
FROM Sales.SalesOrderDetail AS SOD


