--ROW_NUMBER()
--SUBQUERY
--NESTED QUERY
--====================================================================================

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
