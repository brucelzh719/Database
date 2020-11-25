USE "AdventureWorks2008R2"
GO
-- Last Digit of your NUID: 5, 6 or 7

-- Your NUID: NUID 001066946
-- Your Name: Zehua Li

-- Question 1 (3 points)

/* Rewrite the following query to present the same data in a horizontal format,
   as listed below, using the SQL PIVOT command. */

select (p.LastName + ', ' + p.FirstName) FullName, year(sh.OrderDate) OrderYear, count(SalesOrderID) TotalOrder
from Sales.SalesOrderHeader sh
join Sales.Customer c
on sh.CustomerID = c.CustomerID
join Person.Person p
on c.PersonID = p.BusinessEntityID
where sh.CustomerID between 30000 and 30005
group by p.LastName + ', ' + p.FirstName, year(sh.OrderDate)
order by FullName;

/*
FullName				2005	2006	2007	2008
McCoy, James			0		2		4		2
McDonald, Christinia	0		0		1		1
McGuel, Alejandro		0		0		2		2
McKay, Yvonne			1		1		2		0
McLin, Nkenge			2		2		2		1
McPhearson, Nancy		0		0		2		2
*/
SELECT FullName, [1] AS [2005], [2] AS [2006], [3] AS [2007], [4] AS [2008] FROM
(select (p.LastName + ', ' + p.FirstName) FullName, year(sh.OrderDate) OrderYear, count(SalesOrderID) TotalOrder
from Sales.SalesOrderHeader sh
join Sales.Customer c
on sh.CustomerID = c.CustomerID
join Person.Person p
on c.PersonID = p.BusinessEntityID
where sh.CustomerID between 30000 and 30005
group by p.LastName + ', ' + p.FirstName, year(sh.OrderDate)
-- order by FullName
) srctable
PIVOT(
   count(SalesOrderID) FOR OrderYear in ([1],[2],[3],[4])
) AS pvt
order by FullName;




-- Question 2 (6 points)

/* Using AdventureWorks2008R2, write a query to retrieve the top 2 customers, 
   based on the total purchase, for each year. Use TotalDue of SalesOrderHeader 
   to calculate the total purchase. The top 2 customers have the two highest 
   total purchase amounts. If there is a tie your solution needs to retrieve the tie.

   Also calculate the top two customers' purchases as a percentage of the total
   yearly sale. 
   
   Return the data in the following format. The email address is the customer's email address.
   Sort the returned data by the year.

Year	% of Total Sale		Top2Customers
2005		4.16			29624  joseph0@adventure-works.com, 29861  phyllis1@adventure-works.com
2006		2.17			29614  ryan1@adventure-works.com, 29716  blaine0@adventure-works.com
2007		1.74			29913  anton0@adventure-works.com, 29818  roger0@adventure-works.com
2008		1.68			29923  edward1@adventure-works.com, 29641  raul0@adventure-works.com
*/
SELECT*FROM Sales.SalesOrderHeader
SELECT*FROM Sales.Customer
SELECT*FROM Person.Person
SELECT*FROM Person.EmailAddress
SELECT DISTINCT YEAR(OrderDate) AS [Date], SUM(TotalDue) AS Total , Customer = STUFF((
            SELECT TOP 2 WITH TIES ',' + RTRIM(CAST(CustomerID AS char))
            FROM Sales.SalesOrderHeader a
            WHERE a.OrderDate = b.OrderDate
            ORDER BY SalesPersonID
            FOR XML PATH('')
            ), 1, 1, '')
FROM Sales.SalesOrderHeader b
GROUP BY OrderDate












-- Question 3 (6 points)

/* The view below is based on multiple tables. Please write
   a trigger that can make the AppointmentDate column of the view updatable.
   Also, log a date change in the DateAudit table.
*/
CREATE DATABASE "Li_Zehua_QUIZ"
USE "Li_Zehua_QUIZ"
GO
CREATE TABLE Customer
(CustomerID INT IDENTITY PRIMARY KEY,
 LastName VARCHAR(50),
 FirstName VARCHAR(50));
--DROP TABLE Customer
CREATE TABLE Appointment
(AppointmentID INT IDENTITY PRIMARY KEY,
 CustomerID INT REFERENCES Customer(CustomerID),
 AppointmentDate DATE);

CREATE VIEW vAppointment
AS SELECT c.CustomerID, a.AppointmentID, a.AppointmentDate
   FROM Customer c
   JOIN Appointment a
   ON c.CustomerID = a.CustomerID;

CREATE TABLE DateAudit
(LogID INT IDENTITY,
 CustomerID INT,
 OldDate DATE,
 NewDate DATE,
 ChangedBy VARCHAR(50) DEFAULT original_login(),
 ChangeTime DATETIME DEFAULT GETDATE());

GO
CREATE TRIGGER LastChange
ON Appointment
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON
    BEGIN
    UPDATE DateAudit
        SET  ChangeTime = GETDATE()
        FROM DateAudit a
            INNER JOIN INSERTED INS ON INS.CustomerID = a.CustomerID
    END
END


