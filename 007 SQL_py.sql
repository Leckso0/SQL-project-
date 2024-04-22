--union and union ALL
SELECT th.ProductID, SUM(TH.ActualCost), 
'current' AS [table status] 
FROM Production.TransactionHistory AS TH
GROUP BY TH.ProductID
--ORDER BY 1
UNION all
SELECT THA.ProductID, SUM(THA.ActualCost),
'archive' AS [table status] 
FROM Production.TransactionHistoryArchive AS THA
GROUP BY THA.ProductID
ORDER BY 1
