spool 'C:\Users\Adarsha Shrestha\Desktop\sql\project\project(2).txt'
--Include the full path. This will start logging to the specified file.

set echo on
-- This will ensure that all input and output is logged to the file.

--Suprima Pote Shrestha 
--INSY 3304-001
--Karen Scott

--DROP all tables (to start , empty databse each time we run the file to avoid errors caused when trying to recreate tables that already exist.)

DROP TABLE ORDERDETAIL_sps ;
DROP TABLE PRODUCT_sps ;
DROP TABLE ORDER_sps ;
DROP TABLE CUSTOMER_sps ;
DROP TABLE SALESREP_sps ;
DROP TABLE DEPARTMENT_sps ;
DROP TABLE COMMISSION_sps ;
DROP TABLE PRODCAT_sps ; 

--Part IA
--Create all tables

CREATE TABLE PRODCAT_sps (
ProdCatID	NUMBER(2),
ProdCatName	VARCHAR(25)	NOT NULL,
PRIMARY KEY (ProdCatID)
) ;

CREATE TABLE COMMISSION_sps (
CommClass	CHAR(1),
CommRate	NUMBER(2,2)	NOT NULL,
PRIMARY KEY (CommClass)
) ;

CREATE TABLE DEPARTMENT_sps (
DeptID		NUMBER(2),
DeptName	VARCHAR(15)	NOT NULL,
PRIMARY KEY (DeptID)
) ;

CREATE TABLE SALESREP_sps (
SalesRepId	    Number(4),
SalesRepFName	VARCHAR(15)	NOT NULL,
SalesRepLName   VARCHAR(15) NOT NULL,
CommClass		CHAR(1)     NOT NULL,
DeptID			Number(2)  NOT NULL,
PRIMARY KEY (SalesRepId),
FOREIGN KEY (CommClass) REFERENCES COMMISSION_sps,
FOREIGN KEY (DeptID) REFERENCES DEPARTMENT_sps
) ;

CREATE TABLE CUSTOMER_sps (
CustID		CHAR(4),
CustFName	VARCHAR(15)	NOT NULL,
CustLName	VARCHAR(15)	NOT NULL,
CustPhone   CHAR(15),
SalesRepId  Number(4) NOT NULL,
PRIMARY KEY (CustID),
FOREIGN KEY (SalesRepId) REFERENCES SALESREP_sps
) ;


CREATE TABLE ORDER_sps (
ORDERID 	NUMBER(5),
OrderDate	DATE NOT NULL,
CustID      CHAR(4),
PRIMARY KEY (OrderID),
FOREIGN KEY (CustID) REFERENCES CUSTOMER_sps
) ;


                                                                                          
CREATE TABLE PRODUCT_sps (
ProdID 		NUMBER(4),
ProdName	VARCHAR(25)	NOT NULL,
ProdCatID	NUMBER(2)	NOT NULL,
ProdPrice   NUMBER(5,2) NOT NULL,
PRIMARY KEY (ProdID),
FOREIGN KEY (ProdCatID) REFERENCES PRODCAT_sps
) ;



CREATE TABLE ORDERDETAIL_sps (
OrderID 	NUMBER(4),
ProdID 		NUMBER(4),
ProdQty		NUMBER(4) NOT NULL,
ProdPrice	NUMBER(5,2),
PRIMARY KEY (OrderID, ProdID),
FOREIGN KEY (OrderID) REFERENCES ORDER_sps,
FOREIGN KEY (ProdID) REFERENCES PRODUCT_sps
) ;

--IB
--Describe all tables

DESCRIBE PRODCAT_sps
DESCRIBE COMMISSION_sps
DESCRIBE DEPARTMENT_sps
DESCRIBE SALESREP_sps
DESCRIBE CUSTOMER_sps
DESCRIBE ORDER_sps
DESCRIBE PRODUCT_sps
DESCRIBE ORDERDETAIL_sps

--IIA
--Insert data into each table, one table at a time, in the same order the tables were created.
-- For Prodcat
INSERT INTO PRODCAT_sps
VALUES (1, 'Hand Tools') ;

INSERT INTO PRODCAT_sps
VALUES (2, 'Power Tools') ;

INSERT INTO PRODCAT_sps
VALUES (4, 'Fasteners')  ;    

INSERT INTO PRODCAT_sps
VALUES (6, 'Misc')  ;

INSERT INTO PRODCAT_sps
VALUES (3, 'Measuring Tools')  ;

INSERT INTO PRODCAT_sps
VALUES (5, 'Hardware')  ;

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;

--For Commission
INSERT INTO COMMISSION_sps
VALUES ('A', 0.10 )  ;

INSERT INTO COMMISSION_sps
VALUES ('B', 0.08 )  ;

INSERT INTO COMMISSION_sps
VALUES ('Z', 0 )  ;

INSERT INTO COMMISSION_sps
VALUES ('C', 0.05 )  ;

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;

-- For Department
INSERT INTO DEPARTMENT_sps
VALUES(10, 'Store Sales')  ;

INSERT INTO DEPARTMENT_sps
VALUES(14, 'Corp Sales')  ;

INSERT INTO DEPARTMENT_sps
VALUES(16, 'Web Sales')  ;

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


-- For SalesRep
INSERT INTO SALESREP_sps
VALUES(10, 'Alice', 'Jones', 'A', 10)  ;

INSERT INTO SALESREP_sps
VALUES(12, 'Greg', 'Taylor', 'B', 14)  ;

INSERT INTO SALESREP_sps
VALUES(14,'Sara','Day', 'Z', 10)  ;

INSERT INTO SALESREP_sps
VALUES(8,'Kay','Price', 'C', 14)  ;

INSERT INTO SALESREP_sps
VALUES(20,'Bob','Jackson', 'B', 10);

INSERT INTO SALESREP_sps
VALUES(22,'Micah','Moore', 'Z', 16);

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


--For Customer
INSERT INTO CUSTOMER_sps 
VALUES ('S100', 'John', 'Smith', '2145551212', 10) ;

INSERT INTO CUSTOMER_sps
VALUES ('A120', 'Jane', 'Adams', '8175553434', 12) ;

INSERT INTO CUSTOMER_sps
VALUES ('J090', 'Tim', 'Jones', NULL, 14) ;

INSERT INTO CUSTOMER_sps
VALUES('B200', 'Ann' , 'Brown' , '9725557979' , 8) ;

INSERT INTO CUSTOMER_sps
VALUES('G070', 'Kate', 'Green', '8175551034' , 20) ;

INSERT INTO CUSTOMER_sps
VALUES('S120', 'Nicole', 'Sims', NULL , 22);

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


-- For Order 
INSERT INTO ORDER_sps
VALUES (100, '24-JAN-2022', 'S100') ;

INSERT INTO ORDER_sps
VALUES (101, '25-JAN-2022', 'A120') ;

INSERT INTO ORDER_sps
VALUES(102, '25-JAN-2022', 'J090');

INSERT INTO ORDER_sps
VALUES(103, '26-JAN-2022', 'B200');

INSERT INTO ORDER_sps
VALUES(104, '26-JAN-2022', 'S100');

INSERT INTO ORDER_sps
VALUES(105, '26-JAN-2022', 'B200');

INSERT INTO ORDER_sps
VALUES(106, '27-JAN-2022', 'G070');

INSERT INTO ORDER_sps
VALUES(107, '27-JAN-2022', 'J090');

INSERT INTO ORDER_sps
VALUES(108, '27-JAN-2022', 'S120');

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


INSERT INTO PRODUCT_sps
VALUES(121,'BD Hammer',1, 7.00);

INSERT INTO PRODUCT_sps
VALUES(228,'Makita Power Drill',2, 65.00);

INSERT INTO PRODUCT_sps
VALUES(235, 'Makita Power Drill',1, 65.00);

INSERT INTO PRODUCT_sps
VALUES(480,'1#BD Nails',4, 3.00);

INSERT INTO PRODUCT_sps
VALUES(407,'1#BD Screws',4, 4.25);

INSERT INTO PRODUCT_sps
VALUES(610,'3M Duct Tape',6, 1.75);

INSERT INTO PRODUCT_sps
VALUES(618,'3M Masking Tape',6, 1.25);

INSERT INTO PRODUCT_sps
VALUES(380,'Acme Yard Stick',3, 1.25);

INSERT INTO PRODUCT_sps
VALUES(535,'Schlage Door Knob',5, 7.50);

INSERT INTO PRODUCT_sps
VALUES(123,'Acme Pry Bar',1, 5.00);

INSERT INTO PRODUCT_sps
VALUES(229,'BD Power Drill',2, 59.00);

INSERT INTO PRODUCT_sps
VALUES(124,'Acme Hammer',1, 6.50);


--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


INSERT INTO ORDERDETAIL_sps
VALUES (100, 121, 2, 8.00) ;

INSERT INTO ORDERDETAIL_sps
VALUES (100, 228, 1, 65.00) ;

INSERT INTO ORDERDETAIL_sps
VALUES (100, 480, 2, 3.00) ;

INSERT INTO ORDERDETAIL_sps
VALUES (100, 407, 1, 4.25) ;

INSERT INTO ORDERDETAIL_sps
VALUES (101, 610, 200, 1.75) ;

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


--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


--Part IIB
--Show the contents of each table using SELECT statements

SELECT * FROM PRODCAT_sps ;
SELECT * FROM COMMISSION_sps ;
SELECT * FROM DEPARTMENT_sps ;
SELECT * FROM SALESREP_sps ;
SELECT * FROM CUSTOMER_sps ;
SELECT * FROM ORDER_sps ;
SELECT * FROM PRODUCT_sps ;
SELECT * FROM ORDERDETAIL_sps ;

--Part III
--Modify and add to table contents

UPDATE CUSTOMER_sps
   SET CustPhone = '2145551234'
 WHERE CustID = 'B200' ;

 INSERT INTO CUSTOMER_sps
VALUES('G119', 'Amanda', 'Green', NULL, 14);

UPDATE ORDER_sps
   SET OrderDate = '28-JAN-2022'
 WHERE OrderID = 108 ;

 INSERT INTO ORDER_sps
VALUES(109, '28-Jan-2022', 'G119');

UPDATE ORDERDETAIL_sps
 SET ProdPrice = 62.00
 WHERE OrderID = 108 AND ProdID = 235;

 INSERT INTO ORDERDETAIL_sps
VALUES(108, 407, 1, 5.25);

INSERT INTO ORDERDETAIL_sps
VALUES(108, 618, 2, 2.15);

INSERT INTO ORDERDETAIL_sps
VALUES(109, 121, 1, 8.25);

INSERT INTO ORDERDETAIL_sps
VALUES(109, 480, 1, 3.75);


COMMIT ;

--Part IV
--Show the contents of each table using SELECT statements that sort by the Primary Key

SELECT * FROM PRODCAT_sps
 ORDER BY ProdCatID ;

SELECT * FROM COMMISSION_sps
 ORDER BY CommClass ;

SELECT * FROM DEPARTMENT_sps
 ORDER BY DeptID ;

SELECT * FROM SALESREP_sps
 ORDER BY SalesRepID; 

SELECT * FROM CUSTOMER_sps
 ORDER BY CustID ; 

SELECT * FROM ORDER_sps
 ORDER BY OrderID ; 

SELECT * FROM PRODUCT_sps
 ORDER BY ProdID ; 

SELECT * FROM ORDERDETAIL_sps
 ORDER BY OrderID, ProdID ;


--stop logging to output (.txt) file
set echo off

--save and close output (.txt) file
spool off
