-- Join
--Self Join

SELECT E.BusinessEntityID,
       E.NationalIDNumber,
	   E.BirthDate,
	   E.MaritalStatus,
	   E.Gender,
	   E.HireDate,
	   E.VacationHours,
	   D.Name AS [department name],
	   D.GroupName,
	   S.Name AS [shift name],
	   P.FirstName,
	   P.MiddleName,
	   P.LastName
FROM HumanResources.Employee AS E
    JOIN HumanResources.EmployeeDepartmentHistory AS EDH
        ON EDH.BusinessEntityID = E.BusinessEntityID
    JOIN HumanResources.Department AS D
        ON D.DepartmentID = EDH.DepartmentID
    JOIN HumanResources.Shift AS S
        ON S.ShiftID = EDH.ShiftID
	JOIN Person.Person AS P
		ON P.BusinessEntityID = E.BusinessEntityID


--Self Join

SELECT e.BusinessEntityID AS EmployeeID,
       e.JobTitle AS EmployeeJobTitle,
	   e.FirstName,
	   e.LastName,
       m.BusinessEntityID AS ManagerID,
       m.JobTitle AS ManagerJobTitle,
	   m.FirstName,
	   m.LastName
FROM dbo.Employee_self AS e
LEFT JOIN dbo.Employee_self m ON e.ManagerID = m.BusinessEntityID
