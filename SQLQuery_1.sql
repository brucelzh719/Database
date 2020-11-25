USE P3_TEST
-- GO
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

INSERT dbo.Customer VALUES (13524,'Joshua','Hinckley',1980-01-08,'555 Route 87,','Columbia','CT',06237,'Joshua@P3.com'),
                            (13525,'Lincoln','Jepson',1988-07-09,'1107 High School Way,','Mountain View','CA',94041,'Lincoln@P3.com'),
                            (13526,'Alex','Vikati',1990-03-30,'115 E Putnam Ave,','Greenwich','CT',06830,'Alex@P3.com'),
                            (13527,'Cory','Kraft',1996-09-18,'12935 N 40 Dr,','Saint Louis','MO',63141,'Cory@P3.com'),
                            (13528,'Tony','Anthony',1954-12-22,'214 Janes Ave,','Saginaw','MI',48607,'Tony@P3.com'),
                            (13529,'Matt','Tompkins',1997-01-24,'1810 E Belvidere Rd,','Grayslake','IL',60030,'Matt@P3.com'),
                            (13520,'Ed','Betts',1995-06-14,'74 Woodcleft Ave','Freeport','NY',11520,'Ed@P3.com'),
                            (23524,'Michael','Amon',1977-05-09,'50 S Providence Rd','Media','PA',19063,'Michael@P3.com'),
                            (23525,'Richard','Gardiner',1993-08-31,'12740 Misty Creek Ln','Fairfax','VA',22033,'Richard@P3.com'),
                            (23526,'Andrew','Chaves',1999-03-03,'185 Arena Rd','Cabot','AR',72023,'Andrew@P3.com'),
                            (23527,'Ed','Limberg',1992-04-20,'14 Riata Dr','Magnolia','TX,',77354,'Ed@P3.com'),
                            (23528,'Robert','Fuller',1991-10-22,'915 W Imperial Hwy','Brea','CA',92821,'Robert@P3.com')
SELECT*FROM dbo.Customer
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1980-01-08')
WHERE CustomerId = 13524
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1988-07-09')
WHERE CustomerId = 13525
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1990-03-30')
WHERE CustomerId = 13526
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1996-09-18')
WHERE CustomerId = 13527
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1954-12-22')
WHERE CustomerId = 13528
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1997-01-24')
WHERE CustomerId = 13529
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1995-06-14')
WHERE CustomerId = 13520
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1977-05-09')
WHERE CustomerId = 23524
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1993-08-31')
WHERE CustomerId = 23525
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1999-03-03')
WHERE CustomerId = 23526
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1992-04-20')
WHERE CustomerId = 23527
UPDATE dbo.Customer
SET CustomerBirthDate = CONVERT(datetime,'1991-10-22')
WHERE CustomerId = 23528


-- DROP TABLE dbo.Customer

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
INSERT dbo.[Discount] VALUES ('Cashback','$5',2019-01-01,2019-07-31),  
                                ('Cashback','$10',2019-01-01,2020-01-01),
                                ('Cashback','$15',2020-01-01,2020-05-01),
                                ('Coupon','$5',2020-01-01,2021-01-01),
                                ('Coupon','$10',2018-01-19,2019-07-19),
                                ('Coupon','$15',2021-01-01,2022-01-01),
                                ('Other','Get 1 free book for next order',2019-05-01,2020-05-01),
                                ('Other','Free gift card',2020-08-01,2020-12-31),
                                ('other','Free pen',2020-01-01,2020-09-01),
                                ('other','VIP for 1 year',2020-02-01,2020-10-01),
                                ('cashback','$50',2021-01-01,2022-01-01),
                                ('other','Free drink',2019-01-01,2019-11-01)
SELECT*FROM dbo.Discount
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2021-01-01'),EndDate = CONVERT(datetime, '2022-01-01')
WHERE DiscountId = 7
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2019-05-01'),EndDate = CONVERT(datetime, '2020-05-01')
WHERE DiscountId = 8
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2020-08-01'),EndDate = CONVERT(datetime, '2020-12-31')
WHERE DiscountId = 9
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2020-01-01'),EndDate = CONVERT(datetime, '2021-01-01')
WHERE DiscountId = 10
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2020-02-01'),EndDate = CONVERT(datetime, '2020-10-01')
WHERE DiscountId = 11
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2021-01-01'),EndDate = CONVERT(datetime, '2022-01-01')
WHERE DiscountId = 12
UPDATE dbo.Discount 
SET StartDate = CONVERT(datetime, '2019-01-01'),EndDate = CONVERT(datetime, '2022-11-01')
WHERE DiscountId = 13


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
SELECT*FROM dbo.[Order]
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2020-02-09')
WHERE OrderId = 6002
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2018-12-31')
WHERE OrderId = 6003
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2017-09-29')
WHERE OrderId = 6004
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-11-04')
WHERE OrderId = 6005
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-04-08')
WHERE OrderId = 6006
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2020-05-17')
WHERE OrderId = 6007
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2020-02-11')
WHERE OrderId = 6008
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-11-20')
WHERE OrderId = 6009
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-08-03')
WHERE OrderId = 6010
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-03-06')
WHERE OrderId = 6011
UPDATE dbo.[Order]
SET OrderDate = CONVERT(datetime,'2019-01-02')
WHERE OrderId = 6012







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
SELECT*FROM dbo.Discount
SELECT*FROM AvailableDiscount