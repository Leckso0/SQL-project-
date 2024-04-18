--COUNT()
--GROUP BY
--HAVING

=============================================================================
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

===============================================================================
  
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

  =====================================================================================
--HAVING
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

