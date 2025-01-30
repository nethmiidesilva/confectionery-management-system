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
 ALTER TABLE Customer RENAME COLUMN Phone_Nimber TO Contact_Info;
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
