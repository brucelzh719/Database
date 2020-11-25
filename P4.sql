-- Database Implementation

CREATE TABLE dbo.Membership
(
    MembershipId INT IDENTITY NOT NULL PRIMARY KEY,
    CustomerId INT NOT NULL 
        REFERENCES dbo.Customer(CustomerId),
    MembershipType VARCHAR(45) NOT NULL
)

CREATE TABLE dbo.Discount
(
    DiscountId INT IDENTITY NOT NULL PRIMARY KEY,
    DiscountType VARCHAR(45) NOT NULL,
    [Value] FLOAT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL
)

CREATE TABLE dbo.BestSeller
(
    BestSellerId INT IDENTITY NOT NULL PRIMARY KEY,
    Rating FLOAT NOT NULL,
    Recommendation VARCHAR(50),
    SoldQuantity INT 
)

-----
Create table Book
(
BookId INT primary key NOT NULL,
BookName VARCHAR(50) NOT NULL,
Used TinyINT,
GenreId INT,
Price float,
Pages INT,
ISBN VARCHAR(50),
DiscountId INT,
BestSellerId INT,
StockId INT FOREIGN KEY REFERENCES Stock(StockId)
)

CREATE TABLE Stock
(
StockId INT constraint PK_Stock  primary key not null,
QuantityInStock int,
StockType varchar(50)
)

Create table Author(
AuthorId INT constraint PK_Author  primary key not null,
AuthorFirstName varchar(45),
AuthorLastName varchar(45),
AuthorNation varchar(45),
)

Create table Genre(
GenreId INT constraint PK_Genre  primary key not null,
GenreName varchar(45)
)


ALTER TABLE Book
ADD FOREIGN KEY (DiscountId) REFERENCES Discount(DiscountId);

Alter TABLE Book
ADD FOREIGN KEY (BestSellerId) REFERENCES BestSeller(BestSellerId);

Alter TABLE Book
ADD FOREIGN KEY (GenreId) REFERENCES Genre(GenreId);

CREATE TABLE dbo.Customer (
    CustomerId INT IDENTITY NOT NULL PRIMARY KEY,
    CustomerFirstName VARCHAR(45),
    CustomerLastName VARCHAR(45),
    CustomerBirthDate DATETIME,
    StreetNumber VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    ZipCode INT,
    Email VARCHAR(45)
);

INSERT dbo.Customer VALUES (13524,'Joshua','Hinckley',1980-01-08,'555 Route 87,','Columbia','CT','06237','Joshua@P3.com'),
                            (13525,'Lincoln','Jepson',1988-07-09,'1107 High School Way,','Mountain View','CA','94041','Lincoln@P3.com'),
                            (13526,'Alex','Vikati',1990-03-30,'115 E Putnam Ave,','Greenwich','CT','06830','Alex@P3.com'),
                            (13527,'Cory','Kraft',1996-09-18,'12935 N 40 Dr,','Saint Louis','MO','63141','Cory@P3.com'),
                            (13528,'Tony','Anthony',1954-12-22,'214 Janes Ave,','Saginaw','MI','48607','Tony@P3.com'),
                            (13529,'Matt','Tompkins',1997-01-24,'1810 E Belvidere Rd,','Grayslake','IL','60030','Matt@P3.com'),
                            (13520,'Ed','Betts',1995-06-14,'74 Woodcleft Ave','Freeport','NY','11520','Ed@P3.com'),
                            (23524,'Michael','Amon',1977-05-09,'50 S Providence Rd','Media','PA','19063','Michael@P3.com'),
                            (23525,'Richard','Gardiner',1993-08-31,'12740 Misty Creek Ln','Fairfax','VA','22033','Richard@P3.com'),
                            (23526,'Andrew','Chaves',1999-03-03,'185 Arena Rd','Cabot','AR','72023','Andrew@P3.com'),
                            (23527,'Ed','Limberg',1992-04-20,'14 Riata Dr','Magnolia','TX,','77354','Ed@P3.com'),
                            (23528,'Robert','Fuller',1991-10-22,'915 W Imperial Hwy','Brea','CA','92821','Robert@P3.com')

CREATE TABLE dbo.[Order] (
    OrderId INT NOT NULL PRIMARY KEY,
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES dbo.Customer(CustomerId),
    OrderDate DATETIME,
    Total FLOAT
);
ALTER TABLE dbo.[Order] DROP COLUMN Total;
SELECT*FROM dbo.[Order] 
DROP TABLE dbo.[Order]
-- INSERT dbo.[Order] VALUES(1001,13523,2019-07-21,)
INSERT dbo.[Stock] VALUES (1001,298,'In stock'),
                            (1002,0,'Out of stock'),
                             (1003,0,'Out of stock'),
                             (1004,0,'Out of stock'),
                             (1005,43,'In stock'),
                             (1006,213,'In stock'),
                             (1007,891,'In stock'),
                             (1008,12,'In stock'),
                             (1009,490,'In stock'),
                             (1010,21,'In stock'),
                             (1011,29,'In stock'),
                             (1012,300,'In stock')
SELECT*FROM dbo.[Discount]
INSERT dbo.[Vendor] VALUES (51701,'3M Library Systems'),
                            (51702,'Baker & Taylor, Inc'),
                            (51703,'Brodart Automation'),
                            (51704,'Cambridge Scientific Abstracts'),
                            (51705,'Ebsco Information Services'),
                            (51706,'Ex Libris Group'),
                            (51707,'Innovative Interfaces, Inc'),
                            (51708,'LexisNexis'),
                            (51709,'Library Associates'),
                            (51710,'Mandarin Library Automation'),
                            (51711,'Online Computer Library Center'),
                            (51712,'Pro Libra Associates, Inc')

INSERT dbo.[Genre] VALUES (101,'Classic'),
                            (102,'Technology'),
                            (103,'biography'),
                            (104,'Business'),
                            (105,'Arts'),
                            (106,'Horror'),
                            (107,'Romance'),
                            (108,'Historical fiction'),
                            (109,'Mystery'),
                            (110,'Epic'),
                            (111,'Short story'),
                            (112,'Memoir')
INSERT dbo.[Discount] VALUES    ('Cashback',5,'2019-07-29 09:06:20','2021-07-29 09:06:20'),  
                                ('Cashback',10,'2020-07-19 09:06:53','2021-07-29 09:06:53'),
                                ('Cashback',15,'2020-04-20 09:07:13','2020-12-26 09:07:13'),
                                ('PercentageOff', 0.1, DATEADD(YEAR, -10, GETDATE()), DATEADD(day, 10, GETDATE())),
                                ('PercentageOff', 0.2, DATEADD(YEAR, -100, GETDATE()), DATEADD(year, 90, GETDATE())),
                                ('CashBack', 15, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 2, GETDATE())),
                                ('CashBack', 20, DATEADD(day, -1, GETDATE()), DATEADD(YEAR, 2, GETDATE())),
                                ('CashBack', 10, DATEADD(day, -200, GETDATE()), DATEADD(YEAR, 3, GETDATE())),
                                ('PercentageOff', 0.15, DATEADD(YEAR, -1, GETDATE()), DATEADD(day, 3, GETDATE())),
                                ('PercentageOff', 0.25, DATEADD(YEAR, -2, GETDATE()), DATEADD(year, -1, GETDATE())                  

INSERT dbo.[Order] VALUES (6001,13524,2019-07-02),
                            (6002,13525,2020-02-09),
                            (6003,13526,2018-12-31),
                            (6004,13527,2017-09-29),
                            (6005,13528,2019-11-04),
                            (6006,13529,2019-04-08),
                            (6007,13520,2020-05-17),
                            (6008,23524,2020-02-11),
                            (6009,23525,2019-11-20),
                            (6010,23526,2019-08-03),
                            (6011,23527,2019-03-06),
                            (6012,23528,2019-01-02)
ALTER TABLE dbo.[Order] ADD Total FLOAT;
ALTER TABLE dbo.[Order] DROP CONSTRAINT DF__Order__Total__693CA210     
ALTER TABLE dbo.[Order] DROP COLUMN Total;


CREATE TABLE dbo.[OrderItem] (
    OrderId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Order](OrderId),
    BookId INT NOT NULL  FOREIGN KEY REFERENCES dbo.[book](BookId),
    UnitPrice FLOAT,
    Quantity INT
)

DROP TABLE dbo.OrderItem
SELECT*FROM dbo.[OrderItem]
INSERT dbo.[OrderItem] VALUES (6001,123456001,12.99,8),
                                (6002,123456002,21.99,8),
                                (6003,123456003,8.99,2),
                                (6004,123456004,2.99,1),
                                (6005,123456005,12.49,2),
                                (6006,123456006,13.49,3),
                                (6007,123456007,16.99,4),
                                (6008,123456008,12.99,12),
                                (6009,123456009,12.99,9),
                                (6010,123456010,12.99,1),
                                (6011,123456011,12.99,3),
                                (6012,123456012,12.99,6)
-----
CREATE TABLE dbo.OrderItem(
	BookId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Book](BookId),
	OrderId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Order](OrderId),
	UnitPrice Float NOT NULL,
	Quantity INT NOT NULL,
	CONSTRAINT PKs PRIMARY KEY CLUSTERED(BookId, OrderId)
);

CREATE TABLE dbo.Vendor(
	VendorId INT NOT NULL PRIMARY KEY,
	VendorName VARCHAR(45)
);

CREATE TABLE dbo.Publisher(
	PublisherId INT NOT NULL PRIMARY KEY,
	PublisherName VARCHAR(45)
);

CREATE TABLE dbo.BookAuthorPublisherVendor(
	BookId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Book](BookId),
	AuthorId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Author](AuthorId),
	PublisherId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Publisher](PublisherId),
	VendorId INT NOT NULL FOREIGN KEY REFERENCES dbo.[Vendor](VendorId),
	CONSTRAINT PK PRIMARY KEY CLUSTERED(BookId, AuthorId, PublisherId, VendorId)
);
							 
INSERT dbo.Membership VALUES (13524,'No-Membership'),
							 (13525,'VIP1'),
							 (13526,'VIP2'),
							 (13527,'No-Membership'),
							 (13528,'VIP1'),
							 (13529,'VIP2'),
							 (13520,'No-Mebership'),
							 (23524,'VIP1'),
							 (23525,'VIP2'),
							 (23526,'No-Mebership'),
							 (23527,'VIP1'),
							 (23528,'VIP2')


INSERT dbo.BestSeller VALUES (7,'High',15),
						     (8,'High',9),
						     (5,'Medium',12),
						     (6,'Medium',4),
						     (1,'Low',2),
						     (9,'High',22),
						     (3,'Low',11),
						     (2,'Low',3),
						     (4,'Medium',6),
						     (9,'High',33),
						     (5,'Medium',5),
						     (7,'High',17)
						     
INSERT dbo.Author VALUES (3829,'Marign','Haverbeke','Germany'),
						 (3840,'Addy','Osmani','South Australia'),
						 (3841,'Axel','Rauschmayer','Russia'),
						 (3842,'Eric','Elliott','United States'),
						 (3843,'Nicholas','Zakas','United Kingdom'),
						 (3844,'Kyle','Simpson','France'),
						 (3845,'Richard','Silverman','United States'),
						 (3846,'Glenn','Block','Iceland'),
						 (3847,'Michelle','Obama','United States'),
						 (3848,'Dave','Ramsey','United States'),
						 (3850,'Celia','Stahr','United States'),
						 (3851,'RaeAnne','Thayne','United States')
						 

						 
INSERT dbo.Publisher VALUES (294061,'No Starch Press'),
							(294062,'O Reilly Media,Inc'),
							(294063,'Harlequin'),
							(294064,'St. Martin''s Publishing Group'),
							(294065,'Nelson, Thomas, Inc.'),
							(294066,'Crown Publishing Group'),
							(294067,'Simon & Schuster, Inc.'),
							(294068,'Scholastic, Inc.'),
							(294069,'Nature America'),
							(294070,'HarperCollins Publishers'),
							(294071,'DC Comics'),
							(294072,'National Geographic Society')
							
INSERT dbo.Book VALUES (123456001,'Eloquent JavaScript, Second Edition',0,102,25.00,472,'9781593275846',2,5,1012)
INSERT dbo.Book VALUES (123456002,'Learning JavaScript Design Patterns',1,102,22.99,254,'9781449331818',2,3,1011)
INSERT dbo.Book VALUES (123456003,'Speaking JavaScript',0,102,42.99,460,'9781449365035',3,1,1002),
					   (123456004,'Programming JavaScript Applications',1,102,17.27,254,'9781491950296',4,2,1003),
					   (123456005,'Understanding ECMAScript 6',0,102,20.99,352,'9781593277574',5,4,1001),
					   (123456006,'You Dont Know JS',1,102,29.99,278,'9781491904244',8,6,1004),
					   (123456007,'Git Pocket Guide',0,102,9.59,234,'9781449325862',7,8,1005),
					   (123456008,'Designing Evolvable Web APIs with ASP.NET',1,102,17.27,538,'9781449337711',8,7,1006),
					   (123456009,'Becoming',0,103,27.49,448,'9781524763152',9,9,1007),
					   (123456010,'The Total Money Makeover',1,104,23.99,272,'9781595555274',10,11,1008),
					   (123456011,'Frida in America',0,105,29.99,400,'9781250113382',11,10,1009),
					   (123456012,'The Cliff House',1,107,26.99,384,'9781488096396',12,12,1010)
					  


INSERT dbo.BookAuthorPublisherVendor VALUES (123456001,3829,294061,51701)
INSERT dbo.BookAuthorPublisherVendor VALUES (123456002,3840,294062,51702),
											(123456003,3841,294063,51703),
											(123456004,3842,294064,51704),
											(123456005,3843,294065,51705),
											(123456006,3844,294066,51706),
											(123456007,3845,294067,51707),
											(123456008,3846,294068,51708),
											(123456009,3847,294069,51709),
											(123456010,3848,294070,51710),
											(123456011,3850,294071,51711),
											(123456012,3851,294072,51712)

ALTER TABLE dbo.[Order] ADD Total FLOAT;


-- Discount Constraint Applicable function

CREATE FUNCTION CheckDiscountValid(@OrderId INT, @BookId INT)
RETURNS INT
AS
BEGIN
    DECLARE @DiscountId INT
    SET @DiscountId = ( SELECT b.DiscountId 
                        FROM dbo.OrderItem oi INNER JOIN dbo.Book b ON oi.BookId = b.BookId
                        INNER JOIN dbo.Discount d ON b.DiscountId = d.DiscountId
                        INNER JOIN dbo.[Order] o ON oi.OrderId = o.OrderId
                        WHERE o.OrderDate BETWEEN d.StartDate AND d.EndDate
                        AND oi.OrderId = @OrderId AND oi.BookId = @BookId
                        )

    RETURN ISNULL(@DiscountId, 0)
END

-- Check Discount Type function

CREATE FUNCTION CheckDiscountType(@DiscountId INT)
RETURNS VARCHAR(45)
AS
BEGIN
    DECLARE @DiscountType VARCHAR(45)
    SET @DiscountType = (   SELECT DiscountType 
                            FROM dbo.Discount
                            WHERE DiscountId = @DiscountId
                        )

    RETURN @DiscountType
END


-- Calculate Subtotal for OrderItem function（Computed Column)

CREATE FUNCTION CalculateSubTotal(@OrderId INT, @BookId INT)
RETURNS FLOAT
AS 
BEGIN
    DECLARE @SubTotal FLOAT
    DECLARE @DiscountId INT = dbo.CheckDiscountValid(@OrderId, @BookId)
    DECLARE @DiscountType VARCHAR(45) = dbo.CheckDiscountType(@DiscountId)

    SET @SubTotal =
        CASE @DiscountType WHEN 'Cashback' THEN
                    (
                        SELECT (Quantity * UnitPrice - d.[Value])
                        FROM dbo.OrderItem oi
                        INNER JOIN dbo.Book b ON oi.BookId = b.BookId
                        INNER JOIN dbo.Discount d ON b.DiscountId = d.DiscountId
                        WHERE oi.OrderId = @OrderId AND oi.BookId = @BookId
                    )
        WHEN 'PercentageOff' THEN
                    (
                        SELECT (Quantity * UnitPrice * (1 - d.[Value]))
                        FROM dbo.OrderItem oi
                        INNER JOIN dbo.Book b ON oi.BookId = b.BookId
                        INNER JOIN dbo.Discount d ON b.DiscountId = d.DiscountId
                        WHERE oi.OrderId = @OrderId AND oi.BookId = @BookId
                    )

        ELSE
                    (
                        SELECT Quantity * UnitPrice
                        FROM dbo.OrderItem
                        WHERE OrderId = @OrderId AND BookId = @BookId
                    )
        END                   
    RETURN @SubTotal
END

-- Calculate Total for Order function

CREATE FUNCTION CalculateTotal(@OrderId INT)
RETURNS FLOAT
AS 
BEGIN
    DECLARE @Total FLOAT
    SET @Total = (  SELECT SUM(dbo.CalculateSubTotal(o.OrderId, BookId))
                    FROM dbo.[Order] o INNER JOIN dbo.OrderItem oi ON o.OrderId = oi.OrderId
                    WHERE o.OrderId = @OrderId
                    )
    RETURN @Total
END


ALTER TABLE dbo.[Order] ADD TotalValue AS (dbo.CalculateTotal(OrderId))


-- Encryption for SteetNumber Column in Customer table

-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'P3_Test Certificate',
EXPIRY_DATE = '2020-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

UPDATE dbo.[Customer] 
SET StreetNumber = (EncryptByKey(Key_GUID('TestSymmetricKey'), CONVERT(varbinary, '74 Woodcleft Ave')))
WHERE CustomerId = 13520;

SELECT CONVERT(VARCHAR, DecryptByKey(StreetNumber))
FROM dbo.Customer
WHERE CustomerId = 23527; 

-- Views

Create view [dbo].[vwValidDiscount]
AS
SELECT * FROM Discount
WHERE startdate<=GETDATE() and EndDate>=GETDATE()
GO

--

CREATE VIEW Book_Sold AS
SELECT BookId, SUM(Quantity) AS TotalSoldQuantity
FROM dbo.[Order] o 
JOIN dbo.OrderItem oi 
ON o.OrderId = oi.OrderId 
GROUP BY BookId 

SELECT * FROM Book_Sold 
ORDER BY TotalSoldQuantity DESC
