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
