spool 'C:\Users\Adarsha Shrestha\Desktop\Project2_sps.txt'
-- Include the full path.  This will start logging to the specified file.

set echo on
-- This will ensure that all input and output is logged to the file.

--Suprima Pote Shrestha 
--INSY 3304-001
--PROJECT 2


DROP TABLE ORDERDETAIL_sps;
DROP TABLE ORDER_sps;
DROP TABLE CUSTOMER_sps ;
DROP TABLE SALESREP_sps;
DROP TABLE PRODUCT_sps;
DROP TABLE COMMISSION_sps;
DROP TABLE DEPARTMENT_sps;
DROP TABLE PRODCAT_sps;


-- Part IA

CREATE TABLE PRODCAT_sps
(
ProdCatID    NUMBER(5),
ProdCatName  VARCHAR(20) NOT NULL,
PRIMARY KEY  (ProdCatID) 
);


CREATE TABLE DEPARTMENT_sps
(
DeptID         NUMBER(5),
DeptName       VARCHAR(15) NOT NULL,        
PRIMARY KEY    (DeptID)
);

CREATE TABLE COMMISSION_sps
(
CommClass       CHAR(1),
CommRate        NUMBER(3,2) NOT NULL,
PRIMARY KEY     (CommClass)
) ;

CREATE TABLE PRODUCT_sps
 (
ProdID          NUMBER(5),
ProdName        VARCHAR(20) NOT NULL,
ProdCatID       NUMBER(5) NOT  NULL,
ProdPrice       NUMBER(4,2) NOT NULL,
PRIMARY KEY     (ProdID),
FOREIGN KEY     (ProdCatID) REFERENCES PRODCAT_sps
);

 CREATE TABLE SALESREP_sps
(
SalesRepID          NUMBER(5),
SalesRepFName       VARCHAR(10) NOT NULL,
SalesRepLName       VARCHAR(10) NOT NULL,
CommClass           CHAR(1) NOT NULL,
DeptID              NUMBER(5) NOT NULL,
PRIMARY KEY         (SalesRepID),
FOREIGN KEY         (CommClass) REFERENCES COMMISSION_sps, 
FOREIGN KEY         (DeptID) REFERENCES DEPARTMENT_sps
);

CREATE TABLE CUSTOMER_sps
(
CustID              CHAR(5) NOT NULL,
CustFName           VARCHAR(15) NOT NULL,
CustLName           VARCHAR(15) NOT NULL,
CustPhone           CHAR(10),
SalesRepID          NUMBER(5) NOT NULL,
PRIMARY KEY         (CustID), 
FOREIGN KEY         (SalesRepID) REFERENCES SALESREP_sps
);



CREATE TABLE ORDER_sps 
(
OrderID             NUMBER(5),
OrderDate           DATE NOT NULL,
CustID              CHAR(5) NOT NULL,
PRIMARY KEY         (OrderID),
FOREIGN KEY         (CustID) REFERENCES CUSTOMER_sps 
);

CREATE TABLE ORDERDETAIL_sps
(
OrderID            NUMBER(5),
ProdID              NUMBER(5) NOT NULL,
ProdQty             NUMBER(5) NOT NULL,
ProdPrice           NUMBER(4,2) NOT NULL,
PRIMARY KEY         (OrderID,ProdID),
FOREIGN KEY         (OrderID) REFERENCES ORDER_sps,
FOREIGN KEY         (ProdID) REFERENCES PRODUCT_sps
);


--PART 1B 
DESCRIBE ORDERDETAIL_sps
DESCRIBE ORDER_sps
DESCRIBE CUSTOMER_sps
DESCRIBE SALESREP_sps
DESCRIBE PRODUCT_sps
DESCRIBE COMMISSION_sps
DESCRIBE DEPARTMENT_sps
DESCRIBE PRODCAT_sps

-- PART IIA

--Insert rows into PRODCAT table

INSERT INTO PRODCAT_sps
VALUES(1,'Hand Tools'); 

INSERT INTO PRODCAT_sps
VALUES (2, 'Power Tools'); 

INSERT INTO PRODCAT_sps
VALUES (3, 'Measuring Tools');

INSERT INTO PRODCAT_sps
VALUES (4, 'Fastners');

INSERT INTO PRODCAT_sps
VALUES (5, 'Hardware');

INSERT INTO PRODCAT_sps
VALUES(6,'MISC');




--Insert rows into DEPARTMENT table
INSERT INTO DEPARTMENT_sps
VALUES (10, 'Store Sales');

INSERT INTO DEPARTMENT_sps
VALUES(14, 'Corp Sales');

INSERT INTO DEPARTMENT_sps
VALUES (16, 'Web Sales');


--Insert rows into COMMISSION table
INSERT INTO COMMISSION_sps
VALUES ('A', 0.1);

INSERT INTO COMMISSION_sps
VALUES ('B', 0.08);

INSERT INTO COMMISSION_sps
VALUES('Z', 0);

INSERT INTO COMMISSION_sps
VALUES('C',0.05);


--Insert rows into PRODUCT table
INSERT INTO PRODUCT_sps
VALUES(121,'BD Hammer', 1, 7.00);

INSERT INTO PRODUCT_sps
VALUES(228,'Makita Power Drill', 2, 65.00);

INSERT INTO PRODUCT_sps
VALUES(480,'1# BD Nails',4,3.00);

INSERT INTO PRODUCT_sps
VALUES (407,'1# BD Screws',4,4.25);

INSERT INTO PRODUCT_sps
VALUES (610,'3M Duct Tape',6 , 1.75);

INSERT INTO PRODUCT_sps
VALUES (618,'3M Masking Tape', 6,1.25);

INSERT INTO PRODUCT_sps
VALUES (380,'Acme Yard Stick', 3,1.25);


INSERT INTO PRODUCT_sps
VALUES (535,'Schlage Door Knob', 5,6.50);

INSERT INTO PRODUCT_sps
VALUES (123,'Acme Pry Bar', 1, 5.00);

INSERT INTO PRODUCT_sps
VALUES (229,'BD Power Drill', 2,59.00);

INSERT INTO PRODUCT_sps
Values (124,'Acme Hammer', 1,6.50);

INSERT INTO PRODUCT_sps
VALUES (235,'Makita Power Drill', 2,65.00);


-- Insert rows into SALESREP table 
INSERT INTO SALESREP_sps
VALUES (10, 'Alice', 'Jones', 'A',10);

INSERT INTO SALESREP_sps
VALUES (12, 'Grey', 'Taylor', 'B', 14);

INSERT INTO SALESREP_sps
VALUES (14, 'Sara', 'Day', 'Z', 10);

INSERT INTO SALESREP_sps
VALUES (8, 'Kay', 'Price', 'C',14);

INSERT INTO SALESREP_sps
VALUES (20,'Bob', 'Jackson', 'B', 10);

INSERT INTO SALESREP_sps
VALUES (22, 'Micah', 'Moore', 'Z', 16);




-- Insert rows into CUTOMER table

INSERT INTO CUSTOMER_sps
VALUES( 'S100', 'John', 'Smith','2145551212', 10);

INSERT INTO CUSTOMER_sps
VALUES( 'A120', 'Jane', 'Adams','8175553434', 12);

INSERT INTO CUSTOMER_sps
VALUES ('J090', 'Tim', 'Jones', NULL, 14);

INSERT INTO CUSTOMER_sps
VALUES ('B200', 'Ann', 'Brown', '9725557979', 8);

INSERT INTO CUSTOMER_sps
VALUES ('G070', 'Kate', 'Green', '8175551034', 20);

INSERT INTO CUSTOMER_sps
VALUES ('S120', 'Nicole' , 'Sims', NULL, 22);
 
 
 -- Insert rows into ORDER table
INSERT INTO ORDER_sps
VALUES (100, '24-JAN-2022', 'S100');

INSERT INTO ORDER_sps
VALUES (101, '25-JAN-2022', 'A120');

INSERT INTO ORDER_sps
VALUES (102, '25-JAN-2022', 'J090');

INSERT INTO ORDER_sps
VALUES (103, '26-JAN-2022', 'B200');

INSERT INTO ORDER_sps
VALUES (104, '26-JAN-2022', 'S100');

INSERT INTO ORDER_sps
VALUES (105, '26-JAN-2022', 'B200');

INSERT INTO ORDER_sps
VALUES (106, '27-JAN-2022', 'G070');

INSERT INTO ORDER_sps
VALUES (107, '27-JAN-2022', 'J090');

INSERT INTO ORDER_sps
VALUES (108, '27-JAN-2022', 'S120');


--Inser rows into ORDERDETAIL table

INSERT INTO ORDERDETAIL_sps
VALUES (100, 121, 2, 8.00);

INSERT INTO ORDERDETAIL_sps
VALUES (100, 228, 1, 65.00);

INSERT INTO ORDERDETAIL_sps
VALUES (100, 480, 2, 3.00);

INSERT INTO ORDERDETAIL_sps
VALUES (100, 407, 1, 4.25);

INSERT INTO ORDERDETAIL_sps
VALUES (101, 610, 200, 1.75);

INSERT INTO ORDERDETAIL_sps
VALUES (101, 618, 100, 1.25);

INSERT INTO ORDERDETAIL_sps
VALUES (102, 380, 2, 1.25);

INSERT INTO ORDERDETAIL_sps
VALUES (102, 121, 1, 7.00);

INSERT INTO ORDERDETAIL_sps
VALUES (102, 535, 4, 7.50);

INSERT INTO ORDERDETAIL_sps
VALUES (103, 121, 50, 7.00);

INSERT INTO ORDERDETAIL_sps
VALUES (103, 123, 20, 6.25);

INSERT INTO ORDERDETAIL_sps
VALUES (104, 229, 1, 50.00);

INSERT INTO ORDERDETAIL_sps
VALUES (104, 610, 200, 1.75);

INSERT INTO ORDERDETAIL_sps
VALUES (104, 380, 2, 1.25);

INSERT INTO ORDERDETAIL_sps
VALUES (104, 535, 4, 7.50);

INSERT INTO ORDERDETAIL_sps
VALUES (105, 610, 200, 1.75);

INSERT INTO ORDERDETAIL_sps
VALUES (105, 123, 40, 5.00);

INSERT INTO ORDERDETAIL_sps
VALUES (106, 124, 1, 6.50);

INSERT INTO ORDERDETAIL_sps
VALUES (107, 229, 1, 59.00);

INSERT INTO ORDERDETAIL_sps
VALUES (108, 235, 1, 65.00);


--save all rows 
COMMIT; 

-- Part IIB

SELECT * FROM PRODCAT_sps;
SELECT * FROM PRODUCT_sps;
SELECT * FROM DEPARTMENT_sps;
SELECT * FROM COMMISSION_sps;
SELECT * FROM ORDERDETAIL_sps;
SELECT * FROM ORDER_sps;
SELECT * FROM CUSTOMER_sps;
SELECT * FROM SALESREP_sps;

-- PART III

--changing the phone number of a customer
UPDATE CUSTOMER_sps
    SET CustPhone = '2145551234'
WHERE CustID = 'B200';

INSERT INTO CUSTOMER_sps
VALUES('G119', 'Amanda', 'Green', NULL ,14);

--ORDER TABLE
UPDATE ORDER_sps 
    SET OrderDate = '28-JAN-2022'
WHERE OrderID = 108;

INSERT INTO ORDER_sps
VALUES (109,'28-JAN-2022','G119');

--Changing price of product

UPDATE ORDERDETAIL_sps
    SET ProdPrice= 62.00
WHERE ProdID = 235 AND OrderID = 108;

--Adding the Products
INSERT INTO ORDERDETAIL_sps
VALUES (108,407,1,5.25);

INSERT INTO ORDERDETAIL_sps
VALUES (108,618,2,2.15);

INSERT INTO ORDERDETAIL_sps
VALUES (109,121,1,8.25);

INSERT INTO ORDERDETAIL_sps
VALUES (109,480,1,3.75);

--save changes to disk
COMMIT;

--PART IV

SELECT * FROM PRODCAT_sps
ORDER BY ProdCatID;
SELECT * FROM DEPARTMENT_sps
ORDER BY DeptName;
SELECT * FROM COMMISSION_sps
ORDER BY CommClass;
SELECT * FROM PRODUCT_sps
ORDER BY ProdID;
SELECT * FROM SALESREP_sps
ORDER BY SalesRepID;
SELECT * FROM CUSTOMER_sps
ORDER BY CustID;
SELECT * FROM ORDER_sps
ORDER BY OrderID;
SELECT * FROM ORDERDETAIL_sps
ORDER BY OrderID, ProdID;



set echo off
-- This will turn off logging.

 spool off
-- This will close the file.
