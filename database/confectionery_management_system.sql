Create DATABASE Bakery_SYSTEM;

## drop database Bakery_SYSTEM;

USE Bakery_SYSTEM;

CREATE TABLE Customer(
	Customer_ID VARCHAR(25) NOT NULL,
    Name varchar(50),
    Phone_Nimber varchar(25),
    Home_Number varchar(10),
    Street varchar(25),
    City varchar(25),
    primary key(Customer_ID)
    );
    
CREATE TABLE Transaction(
	Order_ID VARCHAR(25),
    Order_Date DATE,
    Status varchar(25),
    Total_Amount INT,
    Customer_ID varchar(25),
    primary key(Order_ID)
    );
    
CREATE TABLE Order_Product(
	Order_ID VARCHAR(25) not null,
    Product_ID varchar(25) 
    );   
    
CREATE TABLE PRODUCT(
	Product_ID VARCHAR(25) NOT NULL,
    Stock_Quantity INT,
    Name varchar(50),
    Price_of_One_Item INT,
    primary key(Product_ID)
    );
    
CREATE TABLE DELIVERY(
	Delivery_ID VARCHAR(25) NOT NULL,
    Name varchar(50),
    Contact_Info varchar(50),
    primary key(Delivery_ID)
    );
    
CREATE TABLE DELIVERY_PRODUCT(
	Delivery_ID VARCHAR(25) NOT NULL,
    Product_ID varchar(25) NOT NULL
    ); 
    
CREATE TABLE Employee(
	Employee_ID VARCHAR(25) NOT NULL,
    Employee_Name varchar(50),
    Position varchar(25),
    Salary INT,
    Branches_ID varchar(25),
    primary key(Employee_ID)
    );
    
CREATE TABLE BRANCHES(
	Branches_ID VARCHAR(25) NOT NULL,
    Location varchar(50),
    Contact_Info varchar(25),
    Number_of_Employees INT,
    Manger_ID varchar(25),
    primary key(Branches_ID)
    );

CREATE TABLE MANAGER(
	Manger_ID VARCHAR(25) NOT NULL,
    Manager_Name varchar(25) NOT NULL,
    primary key(Manger_ID)
    );
    
CREATE TABLE SUPPLER_INFO(
	Supply_ID VARCHAR(25) NOT NULL,
    Name varchar(50),
    Ingredients varchar(25),
    Quantity INT,
    Contact_Number varchar(25),
    primary key(Supply_ID)
    );
    
CREATE TABLE TAKE_AWAY(
	Order_No VARCHAR(25) NOT NULL,
    Branch_ID varchar(25) NOT NULL
    );



ALTER TABLE Order_Product
ADD CONSTRAINT FK_Ord
FOREIGN KEY (Order_ID) REFERENCES Transaction(Order_ID) on update cascade on delete cascade;

ALTER TABLE Order_Product
ADD CONSTRAINT FK_Pro1
FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID) on update cascade on delete cascade;

ALTER TABLE DELIVERY_PRODUCT
ADD CONSTRAINT FK_Pro2
FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID) on update cascade on delete cascade;

ALTER TABLE DELIVERY_PRODUCT
ADD CONSTRAINT FK_Del
FOREIGN KEY (Delivery_ID) REFERENCES DELIVERY(Delivery_ID) on update cascade on delete cascade;


ALTER TABLE Transaction
ADD CONSTRAINT FK_Cus
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) on update cascade on delete cascade;



ALTER TABLE Employee
ADD CONSTRAINT FK_Bra
FOREIGN KEY (Branches_ID) REFERENCES BRANCHES(Branches_ID) on update cascade on delete cascade;

ALTER TABLE BRANCHES
ADD CONSTRAINT FK_Man
FOREIGN KEY (Manger_ID) REFERENCES MANAGER(Manger_ID) on update cascade on delete cascade;

ALTER TABLE TAKE_AWAY
ADD CONSTRAINT FK_Tak
FOREIGN KEY (Branch_ID) REFERENCES BRANCHES(Branches_ID) on update cascade on delete cascade;


INSERT INTO Customer values 
	('A001', 'Namal', '0702345678', 'No 12', 'Main road', 'Kandy'),
    ('A002', 'Kamal', '0765890234', 'No 9', 'School road', 'Katugasthota'),
    ('A003', 'Arun', '0712340987', 'No 4', 'temple road', 'Peradeniya'),
    ('A004', 'Nimal', '0702386794', 'No 5', 'ABC road', 'Peradeniya'),
    ('A005', 'Amal', '0701253689', 'No 234', 'Camus Road', 'Kandy'),
    ('A006', 'Amal', '0709285473', 'No 13', 'temple road', 'Katugasthota'),
    ('A007', 'Bimal', '0703498572', 'No 354', 'temple road', 'Kandy');
    
INSERT INTO Transaction(Order_ID, Order_Date, Status, Total_Amount, Customer_ID)values 
	('W001', '2024-10-03', 'Delivery', 70, 'A001'),
    ('W002', '2024-10-03', 'Delivery', 70, 'A002'),
    ('W003', '2024-10-03', 'Delivery', 120, 'A002'),
    ('W004', '2024-10-04', 'Take away', 100, 'A003'),
    ('W005', '2024-10-05', 'Delivery', 70, 'A005'),
    ('W006', '2024-10-06', 'Take away', 100, 'A004'),
    ('W007', '2024-10-07', 'Take away', 60, 'A006');
    
    
INSERT INTO Product (Product_ID, Stock_Quantity, Price_of_one_item, Name)
VALUES 
    ('P001', 80, 70, 'Egg bun'),
    ('P002', 40, 120, 'Chicken bun'),
    ('P003', 50, 100, 'Fish bun'),
    ('P004', 50, 60, 'Jam bun'),
    ('P005', 46, 120, 'Cake'),
    ('P006', 73, 65, 'Bread'),
    ('P007', 80, 50, 'Gato');
  
  
  
INSERT INTO Order_Product(Order_ID, Product_ID)
VALUES 
    ('W001', 'P001'),
    ('W001', 'P003'),
    ('W001', 'P007'),
    ('W002', 'P001'),
    ('W003', 'P002'),
    ('W004', 'P003'),
    ('W005', 'P001'),
    ('W006', 'P003'),
    ('W007', 'P004');
    
INSERT INTO Delivery (Delivery_ID, Name, Contact_Info)
VALUES 
    ('D001', 'Namal', '0702345678'),
    ('D002', 'Kamal', '0765890234'),
    ('D003', 'Amal', '0702386794'),
    ('D004', 'Sunil', '0701253689'),
    ('D005', 'Amith', '0709285473'),
    ('D006', 'Sunith', '0703498572'),
    ('D007', 'Nisal', '0734345262');
    
    
    
    
    
    
    
    
    
    
INSERT INTO Delivery_Product (Delivery_ID, Product_ID)
VALUES 
    ('D001', 'P001'),
    ('D002', 'P007'),
    ('D003', 'P001'),
    ('D004', 'P001'),
    ('D005', 'P002'),
    ('D005', 'P003'),
    ('D005', 'P004'),
    ('D006', 'P004'),
    ('D007', 'P001');
    
INSERT INTO MANAGER (Manger_ID, Manager_Name)
VALUES 
    ('M001', 'Kamal'),
    ('M002', 'Sunil'),
    ('M003', 'Nisha'),
    ('M004', 'Senith'),
    ('M005', 'Dehemi'),
    ('M006', 'Wasan'),
    ('M007', 'Akalanka');
    
    
    
    
    
    
INSERT INTO BRANCHES (Branches_ID, Location, Contact_Info, Manger_ID, Number_of_Employees)
VALUES 
    ('B001', 'HAPUGALA', '0765890234', 'M001', 5),
    ('B002', 'GALLE JUNCTION', '0702386794', 'M002', 7),
    ('B003', 'WAKWELLA', '0701253689', 'M003', 3),
    ('B004', 'BATUWANTUDA', '0709285473', 'M004', 2),
    ('B005', 'WIJERAMA', '074552522', 'M005', 5),
    ('B006', 'KALEGANA', '071324352', 'M006', 3),
    ('B007', 'HAPUGALA', '070553542', 'M007', 4);
    
INSERT INTO Employee (Employee_ID, Employee_Name, Position, Salary, Branches_ID)
VALUES 
    ('E001', 'Susil', 'chef', 80000, 'B001'),
    ('E002', 'Anil', 'chef', 60000, 'B001'),
    ('E003', 'Malith', 'Delivery boy', 30000, 'B001'),
    ('E004', 'Jagath', 'worker', 40000, 'B002'),
    ('E005', 'Malathi', 'worker', 40000, 'B001'),
    ('E006', 'Gayani', 'Cashier', 50000, 'B001'),
    ('E007', 'Nalaka', 'chef', 60000, 'B002');
    
INSERT INTO SUPPLER_INFO (Supply_ID, Name, Ingredients, Quantity, Contact_Number)
VALUES 
    ('S001', 'SENITH', 'sugar', 40, '0765664588'),
    ('S002', 'Kamal', 'Flour', 73, '0723344246'),
    ('S003', 'Sunil', 'flour', 63, '0794352546'),
    ('S004', 'KOSALA', 'egg', 15, '0724346545'),
    ('S005', 'PASAN', 'sugar', 40, '0736344524'),
    ('S006', 'PASIDH', 'egg', 20, '0714356442'),
    ('S007', 'SUNETHI', 'sugar', 40, '0746778959');
    
INSERT INTO Take_Away (Order_No, Branch_ID)
VALUES 
    ('W001', 'B002'),
    ('W003', 'B001'),
    ('W005', 'B002'),
    ('W006', 'B004'),
    ('W007', 'B002'),
    ('W008', 'B005'),
    ('W009', 'B007');
    



UPDATE Customer SET Name='NISHAN',  Home_Number='No 304' WHERE Customer_ID = 'A001';
UPDATE Customer SET Phone_Nimber='0763452348',  City='kagugasthota' WHERE Customer_ID = 'A005';
DELETE FROM Customer WHERE Customer_ID = 'A003';

UPDATE Transaction SET Status ='Take away',  Total_Amount=90 WHERE Order_ID = 'W001';
UPDATE Transaction SET Order_Date='2024-11-03',  Customer_ID='A005' WHERE Order_ID = 'W005';
DELETE FROM Transaction WHERE Order_ID = 'W003';

UPDATE Order_Product SET Product_ID ='P005' WHERE Product_ID = 'P001' and Order_ID='W002';
UPDATE Order_Product SET Product_ID='P004' WHERE Product_ID = 'P001' and Order_ID='W005';
DELETE FROM Order_Product WHERE  Product_ID = 'P003' and Order_ID='W006';

UPDATE Product SET Stock_Quantity =90,  Price_of_one_item=90 WHERE Product_ID = 'P001';
UPDATE Product SET Name='bun' WHERE Product_ID = 'P005';
DELETE FROM Product WHERE Product_ID = 'P003';

UPDATE Delivery SET Name ="SUMUTH" WHERE Delivery_ID = 'D001';
UPDATE Delivery SET Contact_Info='07643536216' WHERE Delivery_ID = 'D005';
DELETE FROM Delivery WHERE Delivery_ID = 'D003';

UPDATE Delivery_Product SET Product_ID ="P004" WHERE Delivery_ID = 'D001';
UPDATE Delivery_Product SET Product_ID='P007' WHERE Delivery_ID = 'D005';
DELETE FROM Delivery_Product WHERE Delivery_ID = 'D003';









UPDATE Employee SET Employee_Name ="SUMUTH" WHERE Employee_ID = 'E001';
UPDATE Employee SET Position='Cashier' WHERE Employee_ID = 'E005';
DELETE FROM Employee WHERE Employee_ID = 'E003';


UPDATE BRANCHES SET Location ="WIJERAMA" WHERE Branches_ID = 'B001';
UPDATE BRANCHES SET Contact_Info='0713827492' WHERE Branches_ID = 'B005';
DELETE FROM BRANCHES WHERE Branches_ID = 'B003';

UPDATE MANAGER SET Manager_Name ="SUSIL" WHERE Manger_ID = 'M001';
UPDATE MANAGER SET Manager_Name='KASUN' WHERE Manger_ID = 'M005';
DELETE FROM MANAGER WHERE Manger_ID = 'M003';

UPDATE SUPPLER_INFO SET Name ="KASUN" WHERE Supply_ID = 'S001';
UPDATE SUPPLER_INFO SET Ingredients='flour' WHERE Supply_ID = 'S005';
DELETE FROM SUPPLER_INFO WHERE Supply_ID = 'S003';

UPDATE Take_Away SET Branch_ID ="B005" WHERE Order_No = 'W001' AND Branch_ID ="B002";
UPDATE Take_Away SET Branch_ID ='B007' WHERE Order_No = 'W005' AND Branch_ID ="B002";
DELETE FROM Take_Away WHERE Order_No = 'W003' AND Branch_ID ="B001" ;


-- 1) select operation
SELECT * FROM Customer;
SELECT * FROM Employee WHERE Position="chef";


-- 2) The project operation
SELECT Employee_ID, Position FROM Employee;
SELECT Name, Stock_quantity FROM product WHERE price_of_one_item>100;


-- 3) cartesian product operation
SELECT * FROM delivery CROSS JOIN delivery_product;  
SELECT * FROM product CROSS JOIN take_away;  


-- 4) creating a user view 
CREATE VIEW Kandy_custumer AS
SELECT Customer_ID, Phone_Nimber
FROM Customer
WHERE city = 'Kandy';
SELECT * FROM Kandy_custumer;


-- 5) renaming operation
 /* ALTER TABLE Customer RENAME COLUMN Phone_Nimber TO Contact_Info; */
 ALTER TABLE Customer CHANGE COLUMN Phone_Nimber Contact_Info VARCHAR(255);
 SELECT *  FROM Customer;
 
 
 -- 6) aggregation function 
SELECT Customer_ID, COUNT(*) AS NumberOfOrders
FROM Transaction
GROUP BY Customer_ID;
 
 
 -- 7) LIKE operations 
SELECT * FROM Employee WHERE Employee_Name LIKE '%th';
SELECT * FROM Customer WHERE Name LIKE 'ni%';


 -- 8) union operations 
(SELECT * FROM Employee WHERE Position = 'Delivery boy') UNION (SELECT * FROM Employee WHERE salary>50000); 
(SELECT * FROM Transaction WHERE status = 'Delivery') UNION (SELECT * FROM Transaction WHERE Total_Amount>=100); 


 -- 9) intersection operations 
/* SELECT * FROM Customer WHERE city = 'kandy' INTERSECT SELECT * FROM Customer WHERE name='amal'; */
SELECT * FROM Customer 
WHERE city = 'kandy' 
AND name = 'amal';

/* SELECT * FROM product WHERE Price_of_One_Item >= 100 INTERSECT SELECT * FROM product WHERE Stock_Quantity >= 50; */
SELECT * FROM product 
WHERE Price_of_One_Item >= 100 
AND Stock_Quantity >= 50;
 
 
 -- 10) difference operations 
/* (SELECT * FROM Employee WHERE Position = "chef") EXCEPT (SELECT * FROM Employee WHERE Branches_ID='B002'); */
SELECT * FROM Employee 
WHERE Position = 'chef' 
AND Branches_ID NOT IN (SELECT Branches_ID FROM Employee WHERE Branches_ID = 'B002');

/* (SELECT * FROM Transaction WHERE Status = "Delivery") EXCEPT (SELECT * FROM Transaction WHERE Total_Amount>=100); */
SELECT * FROM Transaction 
WHERE Status = 'Delivery' 
AND Transaction_ID NOT IN (SELECT Transaction_ID FROM Transaction WHERE Total_Amount >= 100);


-- 11) division operations
/* SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    EXCEPT
    SELECT OP.Product_ID
    FROM Transaction T
    JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
    WHERE T.Customer_ID = C.Customer_ID
); */
SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    WHERE P.Product_ID NOT IN (
        SELECT OP.Product_ID
        FROM `Transaction` T
        JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
        WHERE T.Customer_ID = C.Customer_ID
    )
);


 -- 12) inner join  operations 
SELECT * FROM branches AS B INNER JOIN manager AS M ON B.Manger_ID = M.Manger_ID;


 -- 13) natural join  operations 
SELECT * FROM branches natural JOIN manager;


 -- 14) left outer join  operations 
SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID;


 -- 15) right  outer join  operations 
SELECT * FROM PRODUCT AS P right  OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID;


 -- 16) full  outer join  operations 
(SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID)
union
(SELECT * FROM PRODUCT AS P right  OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID);


 -- 17) outer union relational algebraic operations by using user views
CREATE VIEW customer_view AS
SELECT Customer_ID, Name, City
FROM Customer;

CREATE VIEW delivery_view AS
SELECT Delivery_ID, Name, Contact_Info
FROM Delivery;

(SELECT * FROM  customer_view)
UNION
(SELECT * FROM delivery_view);


 -- 18) nested queries1
SELECT Name
FROM Customer
WHERE Customer_ID IN (
    SELECT DISTINCT T.Customer_ID
    FROM Transaction T
    INNER JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
    INNER JOIN Product P ON OP.Product_ID = P.Product_ID
    WHERE P.Stock_Quantity > 50
);


 -- 19) nested queries2
SELECT Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Transaction
    WHERE Order_Date >= '2024-10-05'
);


 -- 20) nested queries3
SELECT Name
FROM Customer
WHERE Customer_ID IN (
    SELECT DISTINCT T.Customer_ID
    FROM Transaction T
    INNER JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
    INNER JOIN Product P ON OP.Product_ID = P.Product_ID
    WHERE P.Product_ID IN (
        SELECT DISTINCT DP.Product_ID
        FROM Delivery_Product DP
    )
);

EXPLAIN (SELECT * FROM Employee WHERE Position = 'Delivery boy') UNION (SELECT * FROM Employee WHERE salary>50000); 

CREATE INDEX idx_position ON Employee(Position);
CREATE INDEX idx_salary ON Employee(Salary);

EXPLAIN (SELECT * FROM Employee WHERE Position = 'Delivery boy') UNION (SELECT * FROM Employee WHERE salary>50000); 

DROP INDEX idx_position ON Employee;
DROP INDEX idx_salary ON Employee;

EXPLAIN (SELECT * FROM Transaction WHERE status = 'Delivery') UNION (SELECT * FROM Transaction WHERE Total_Amount>=100); 

CREATE INDEX idx_status ON Transaction(status);
CREATE INDEX idx_total_amount ON Transaction(Total_Amount);

EXPLAIN (SELECT * FROM Transaction WHERE status = 'Delivery') UNION (SELECT * FROM Transaction WHERE Total_Amount>=100); 

DROP INDEX idx_status ON Transaction;

/* EXPLAIN SELECT * FROM Customer WHERE city = 'kandy' INTERSECT SELECT * FROM Customer WHERE name='amal';  */ 
SELECT * 
FROM Customer 
WHERE city = 'kandy' 
  AND name = 'amal';

CREATE INDEX idx_city ON Customer(city);
CREATE INDEX idx_name ON Customer(name);

/* EXPLAIN SELECT * FROM Customer WHERE city = 'kandy' INTERSECT SELECT * FROM Customer WHERE name='amal'; */
EXPLAIN 
SELECT * 
FROM Customer 
WHERE city = 'kandy' 
  AND name = 'amal';

DROP INDEX idx_city ON Customer;
DROP INDEX idx_name ON Customer;

/* EXPLAIN SELECT * FROM product WHERE Price_of_One_Item >= 100 INTERSECT SELECT * FROM product WHERE Stock_Quantity >= 50; */
EXPLAIN 
SELECT * 
FROM product 
WHERE Price_of_One_Item >= 100 
  AND Stock_Quantity >= 50;

CREATE INDEX idx_price_quantity ON Product(Price_of_One_Item, Stock_Quantity);

/* EXPLAIN SELECT * FROM product WHERE Price_of_One_Item >= 100 INTERSECT SELECT * FROM product WHERE Stock_Quantity >= 50; */
EXPLAIN 
SELECT * 
FROM product 
WHERE Price_of_One_Item >= 100 
  AND Stock_Quantity >= 50;

DROP INDEX idx_price_quantity ON Product;

/* EXPLAIN (SELECT * FROM Employee WHERE Position = "chef") EXCEPT (SELECT * FROM Employee WHERE Branches_ID='B002'); */
EXPLAIN 
SELECT * 
FROM Employee 
WHERE Position = 'chef'
  AND NOT EXISTS (
      SELECT 1 
      FROM Employee 
      WHERE Branches_ID = 'B002' 
        AND Employee.Employee_ID = Employee.Employee_ID
  );

CREATE INDEX idx_position ON Employee(Position);

/* EXPLAIN (SELECT * FROM Employee WHERE Position = "chef") EXCEPT (SELECT * FROM Employee WHERE Branches_ID='B002'); */
EXPLAIN 
SELECT * 
FROM Employee 
WHERE Position = 'chef'
  AND Employee_ID NOT IN (
      SELECT Employee_ID 
      FROM Employee 
      WHERE Branches_ID = 'B002'
  );

DROP INDEX idx_position ON Employee;

/* EXPLAIN (SELECT * FROM Transaction WHERE Status = "Delivery") EXCEPT (SELECT * FROM Transaction WHERE Total_Amount>=100); */
EXPLAIN 
SELECT * 
FROM Transaction 
WHERE Status = 'Delivery'
  AND Transaction_ID NOT IN (
      SELECT Transaction_ID 
      FROM Transaction 
      WHERE Total_Amount >= 100
  );

CREATE INDEX idx_status ON Transaction(Status);
CREATE INDEX idx_total_amount2 ON Transaction(Total_Amount);

/* EXPLAIN (SELECT * FROM Transaction WHERE Status = "Delivery") EXCEPT (SELECT * FROM Transaction WHERE Total_Amount>=100); */
EXPLAIN 
SELECT * 
FROM Transaction 
WHERE Status = 'Delivery'
  AND Transaction_ID NOT IN (
      SELECT Transaction_ID 
      FROM Transaction 
      WHERE Total_Amount >= 100
  );

DROP INDEX idx_status ON Transaction;

/* EXPLAIN SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    EXCEPT
    SELECT OP.Product_ID
    FROM `Transaction` T
    JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
    WHERE T.Customer_ID = C.Customer_ID
); */
EXPLAIN 
SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    WHERE NOT EXISTS (
        SELECT OP.Product_ID
        FROM `Transaction` T
        JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
        WHERE T.Customer_ID = C.Customer_ID
        AND OP.Product_ID = P.Product_ID
    )
);

CREATE INDEX idx_product_id_product ON Product(Product_ID);
CREATE INDEX idx_product_id_order_product ON Order_Product(Product_ID);
CREATE INDEX idx_order_id ON `Transaction`(Order_ID);
CREATE INDEX idx_customer_id ON `Transaction`(Customer_ID);

/* EXPLAIN SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    EXCEPT
    SELECT OP.Product_ID
    FROM `Transaction` T
    JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
    WHERE T.Customer_ID = C.Customer_ID
); */
EXPLAIN 
SELECT C.Name
FROM Customer C
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM Product P
    WHERE NOT EXISTS (
        SELECT OP.Product_ID
        FROM `Transaction` T
        JOIN Order_Product OP ON T.Order_ID = OP.Order_ID
        WHERE T.Customer_ID = C.Customer_ID
        AND OP.Product_ID = P.Product_ID
    )
);

DROP INDEX idx_product_id_product ON Product;
DROP INDEX idx_order_id ON `Transaction`;

EXPLAIN SELECT * FROM branches AS B INNER JOIN manager AS M ON B.Manger_ID = M.Manger_ID;

CREATE INDEX idx_manger_id ON branches(Manger_ID);

EXPLAIN SELECT * FROM branches AS B INNER JOIN manager AS M ON B.Manger_ID = M.Manger_ID;

EXPLAIN SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID;

CREATE INDEX idx_product_id_product ON PRODUCT(Product_ID);
CREATE INDEX idx_product_id_order_product2 ON order_product(Product_ID);

EXPLAIN SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID;

DROP INDEX idx_product_id_product ON PRODUCT;
DROP INDEX idx_product_id_order_product ON order_product;

EXPLAIN (SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID) UNION (SELECT * FROM PRODUCT AS P right  OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID);

CREATE INDEX idx_product_id_product ON PRODUCT(Product_ID);

EXPLAIN (SELECT * FROM PRODUCT AS P LEFT OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID) UNION (SELECT * FROM PRODUCT AS P right  OUTER JOIN order_product AS O ON o.Product_ID = P.Product_ID);

DROP INDEX idx_product_id_product ON PRODUCT;
