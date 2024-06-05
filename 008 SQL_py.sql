--len()
SELECT 'MS SQL SERVER',  LEN('MS SQL SERVER')

SELECT  DISTINCT LEN(e.NationalIDNumber), COUNT(*) FROM HumanResources.Employee AS e
WHERE LEN(e.NationalIDNumber)<>9
GROUP BY LEN(e.NationalIDNumber)


SELECT  * FROM HumanResources.Employee AS e
WHERE LEN(e.NationalIDNumber)<>9


--LTRIM()
--RTRIM()
SELECT  '               MS SQL',
		LTRIM('               MS SQL') AS [ltrim],
		'MS SQL                ', 
		 RTRIM('MS SQL                ') AS [rtrim],
		 '             MS SQL                ',
		 LTRIM(RTRIM('             MS SQL                ')) AS [both in use ]

--Left()
--Right()
SELECT sod.CarrierTrackingNumber, LEFT(sod.CarrierTrackingNumber, 4) AS [left 4],
RIGHT(sod.CarrierTrackingNumber, 2) AS [right 2 ]
FROM Sales.SalesOrderDetail AS sod


--Replace()
SELECT 'MS SQL Server', REPLACE('MS SQL Server', 'S', 'R')

--UPPER()
--LOWER()
SELECT 'ms sql server', UPPER('ms sql server') AS [UPPER], 
'MS SQL SERVER',
LOWER('MS SQL SERVER') AS [lower]
