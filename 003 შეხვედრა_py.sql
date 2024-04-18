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


--Count()
SELECT * FROM Person.Person AS P
SELECT COUNT(*) FROM Person.Person AS P


SELECT COUNT(1),
       COUNT(P.Suffix),
       COUNT(DISTINCT P.Suffix),
       COUNT(   CASE
                    WHEN P.Suffix IS NULL THEN
                        1
                    ELSE
                        NULL
                END
            )
FROM Person.Person AS P;


SELECT P.Suffix, * FROM Person.Person AS P
WHERE P.Suffix IS NOT NULL



SELECT    CASE
                    WHEN P.Suffix IS NULL THEN
                        1
                    ELSE
                        NULL
                END
            ,
			P.Suffix
FROM Person.Person AS P;

--Group by
SELECT DISTINCT P.Suffix, COUNT(*) FROM Person.Person AS P
GROUP BY P.Suffix


SELECT SOD.ProductID, SUM(SOD.UnitPrice) FROM Sales.SalesOrderDetail AS SOD
GROUP BY SOD.ProductID


SELECT SOD.ProductID, avg(SOD.UnitPrice) FROM Sales.SalesOrderDetail AS SOD
GROUP BY SOD.ProductID


SELECT	SOD.ProductID,
		SUM(SOD.UnitPrice) AS [ჯამი],
		COUNT(SOD.UnitPrice) AS [რაოდენობა],
		avg(SOD.UnitPrice) AS [საშუალო არითმეტიკული]
		
FROM Sales.SalesOrderDetail AS SOD
GROUP BY SOD.ProductID


SELECT PP.PhoneNumber, COUNT(*) FROM Person.PersonPhone AS PP
GROUP BY PP.PhoneNumber
HAVING COUNT(*) =1 




SELECT PP.PhoneNumber, COUNT(*) FROM Person.PersonPhone AS PP
GROUP BY PP.PhoneNumber
HAVING COUNT(*) > 1 


SELECT PP.PhoneNumber, COUNT(*) FROM Person.PersonPhone AS PP
GROUP BY PP.PhoneNumber
HAVING COUNT(*) BETWEEN 100 AND 200

SELECT * FROM Person.PersonPhone AS PP
WHERE PP.PhoneNumber = '1 (11) 500 555-0110'



--Row_Number()
SELECT PP.*,
       ROW_NUMBER() OVER (ORDER BY PP.PhoneNumber) AS [only ordering],
       ROW_NUMBER() OVER (PARTITION BY PP.PhoneNumber ORDER BY PP.PhoneNumber) AS [partition by]
FROM Person.PersonPhone AS PP;



--SubQuery
SELECT *
FROM Sales.SalesOrderDetail AS SOD
WHERE SOD.UnitPrice >=
(
    SELECT AVG(SOD2.UnitPrice) FROM Sales.SalesOrderDetail AS SOD2
);


SELECT *
FROM Sales.SalesOrderDetail AS SOD
WHERE SOD.UnitPrice <=
(
    SELECT AVG(SOD2.UnitPrice) FROM Sales.SalesOrderDetail AS SOD2
);


--465.0934
SELECT AVG(SOD.UnitPrice) FROM Sales.SalesOrderDetail AS SOD


SELECT *
FROM Sales.SalesOrderDetail AS SOD
WHERE SOD.CarrierTrackingNumber = '4911-403C-98'
      AND SOD.UnitPrice <=
      (
          SELECT AVG(SOD2.UnitPrice) FROM Sales.SalesOrderDetail AS SOD2
      );


--1193.6426
SELECT *
FROM Sales.SalesOrderDetail AS SOD
WHERE SOD.UnitPrice <=
(
    SELECT AVG(SOD2.UnitPrice)
    FROM Sales.SalesOrderDetail AS SOD2
    WHERE SOD2.CarrierTrackingNumber = '4911-403C-98'
);



--Nested Query
SELECT r.ProductID,
       r.ჯამი,
       r.რაოდენობა,
       r.[საშუალო არითმეტიკული],
	   r.ჯამი/r.რაოდენობა AS [check 1 ],
	   IIF(r.ჯამი/r.რაოდენობა  = r.[საშუალო არითმეტიკული], N'სწორია', N'არასწორია') AS [check 2]
FROM 
(
SELECT	SOD.ProductID,
		SUM(SOD.UnitPrice) AS [ჯამი],
		COUNT(SOD.UnitPrice) AS [რაოდენობა],
		avg(SOD.UnitPrice) AS [საშუალო არითმეტიკული]
		
FROM Sales.SalesOrderDetail AS SOD
GROUP BY SOD.ProductID
) AS r 


--ამოცანა
/*
ყველაზე ახალგაზრდა თანამშრომელი გამოვიტანოთ, 
ველები - HumanResources.Employee ცხრილის აბსოლუტურად ყველა ველი და ბოლოში დაამატეთ ველი სახელად "თაობა", ხოლო ჩანაწერი - "ახალგაზრდა"


ყველაზე ხნიერი თანამშრომელი გამოვიტანოთ, ველები - HumanResources.Employee ცხრილის აბსოლუტურად ყველა ველი და ბოლოში დაამატეთ ველი სახელად "თაობა", ხოლო ჩანაწერი - "უხუცესი"
*/

SELECT E.*,
       N'ახალგაზრდა' AS [თაობა]
FROM HumanResources.Employee AS E
WHERE E.BirthDate =
(
    SELECT MAX(E2.BirthDate) FROM HumanResources.Employee AS E2
);


SELECT E.*,
       N'უხუცესი' AS [თაობა]
FROM HumanResources.Employee AS E
WHERE E.BirthDate =
(
    SELECT MIN(E2.BirthDate) FROM HumanResources.Employee AS E2
);