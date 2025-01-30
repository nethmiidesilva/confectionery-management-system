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


