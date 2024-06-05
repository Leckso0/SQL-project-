--Concat()
SELECT CONCAT('MS', ' ', 'SQL', ' ', 'Server'),
		'MS'+' '+'SQL'+' '+'Server'

--Reverse()
SELECT sod.CarrierTrackingNumber, REVERSE(sod.CarrierTrackingNumber) AS [reversed] 
FROM Sales.SalesOrderDetail AS sod

--Charindex()
SELECT	sod.CarrierTrackingNumber,
		CHARINDEX('-', sod.CarrierTrackingNumber) AS [pirveli defisi],
		CHARINDEX('-', sod.CarrierTrackingNumber, 1) AS [1],
		CHARINDEX('-', sod.CarrierTrackingNumber, 2) AS [2],
		CHARINDEX('-', sod.CarrierTrackingNumber, 3) AS [3],
		CHARINDEX('-', sod.CarrierTrackingNumber, 4) AS [4],
		CHARINDEX('-', sod.CarrierTrackingNumber, 5) AS [5],
		CHARINDEX('-', sod.CarrierTrackingNumber, 5 + 1) AS [6],
		CHARINDEX('-', sod.CarrierTrackingNumber, 
			CHARINDEX('-', sod.CarrierTrackingNumber)+ 1) AS [meore defisi]

FROM Sales.SalesOrderDetail AS sod


--Substring()
SELECT	sod.CarrierTrackingNumber,
		SUBSTRING(sod.CarrierTrackingNumber, 1, 4),
		LEN(sod.CarrierTrackingNumber),
		SUBSTRING(sod.CarrierTrackingNumber, LEN(sod.CarrierTrackingNumber) - 1, 2)
FROM Sales.SalesOrderDetail AS sod


SELECT	sod.CarrierTrackingNumber,
		CHARINDEX('-', sod.CarrierTrackingNumber) AS [pirveli defisi],
		CHARINDEX('-', sod.CarrierTrackingNumber, CHARINDEX('-', sod.CarrierTrackingNumber)+1) AS [meore defisi],
		SUBSTRING(sod.CarrierTrackingNumber,CHARINDEX('-', sod.CarrierTrackingNumber)+1, 10-(5+1)),
		SUBSTRING(sod.CarrierTrackingNumber,CHARINDEX('-', sod.CarrierTrackingNumber)+1, CHARINDEX('-', sod.CarrierTrackingNumber, CHARINDEX('-', sod.CarrierTrackingNumber)+1)-(CHARINDEX('-', sod.CarrierTrackingNumber)+1))
FROM Sales.SalesOrderDetail AS sod
