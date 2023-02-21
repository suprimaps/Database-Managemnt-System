# Database-Managemnt-System
Database Design Project: Hotel Reservation System 
spool 'C:\Users\ Shrestha\Desktop\Project2_sps.txt'
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
--Suprima Pote Shrestha 
--INSY 3304-001
--Karen Scott

  spool 'C:\Users\Adarsha Shrestha\Desktop\sql\project\project(2).txt'
set echo on

--Part I

--1,2,3


SET LINESIZE 150 

--Format column heading (varchar and char columns only) 
COLUMN ProdName FORMAT a12
COLUMN Avg_Price FORMAT a10
COLUMN OrderDate FORMAT a10
COLUMN "Order Date" FORMAT a10
COLUMN "SalesRepFirstName" FORMAT a17
COLUMN "SalesRepLastName" FORMAT a17
COLUMN "Customer ID" FORMAT a12
COLUMN CommClass FORMAT a12
COLUMN DeptName FORMAT a12
COLUMN SalesRepFName FORMAT a17
COLUMN SalesRepLName FORMAT a17
COLUMN CustID FORMAT a12
COLUMN "Cust ID" FORMAT a7
COLUMN CustFName FORMAT a14  
COLUMN CustLName FORMAT a14  




--4.  Adding a New Customer

 INSERT INTO CUSTOMER_sps VALUES
 ('T104','Wes','Thomas','469-555-1215',22);
 

--5.  Adding a New Product

INSERT INTO PRODUCT_sps
VALUES(246,'Milwaukee Power Dril1',2, 179.00);


--6. Add a new Order.  Generate the OrderID by incrementing the max OrderID by 1

INSERT INTO ORDER_sps
VALUES ((SELECT ((MAX(OrderID))+1) FROM ORDER_sps),'28-JAN-2022', 'T104');

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 618, 1,( SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID=618));

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 407,2, (SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID= 407));

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 124,1, (SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID= 124));


--7.

INSERT INTO ORDER_sps
VALUES ((SELECT (MAX(OrderID)+1) FROM ORDER_sps),'29-JAN-2022', 'S100');

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 535,3,( SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID=535));

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 246, 1,(SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID=246));

INSERT INTO ORDERDETAIL_sps
VALUES ((SELECT MAX(ORDERID) FROM ORDER_sps), 610, 2, (SELECT ProdPrice FROM PRODUCT_sps WHERE ProdID=610));



--8. Change Cust Phone Number

UPDATE CUSTOMER_sps
   SET CustPhone = '817-555-8918'
 WHERE CustID = 'B200' ;

 --9.

--Save changes to disk (in memory only until you COMMIT)
COMMIT ;


-- PART II

 --1.

SELECT (SalesRepFName || ' ' ||  SalesRepLName) AS "SalesRep Name" , 
SalesRepID AS "Sales Rep ID", C.CommClass AS "Commission Class" , CommRate AS "Commission Rate" 
FROM SALESREP_sps S INNER JOIN COMMISSION_sps C ON S.CommClass = C.CommClass 
ORDER BY  SalesRepLName ;

--2

SELECT OrderID AS "Order ID", ProdID AS "Product ID", ProdQty AS "Qty",TO_CHAR(ProdPrice, '$999.99') AS "Price"
FROM ORDERDETAIL_sps
ORDER BY OrderID ASC, ProdID ASC;

 --3. 
 SELECT CustID , CustFName AS "CustFirstName", CustLName AS "CustLastName", SUBSTR(CustPhone,1,3) ||'-'|| SUBSTR(CustPhone,4,3) || '-'|| SUBSTR(CustPhone,7,4) AS "CustPhone", S.SalesRepID, SalesRepFName AS "SalesRepFirstName", SalesRepLName AS "SalesRepLastName"
 FROM CUSTOMER_sps C, SALESREP_sps S
   WHERE S.SalesRepID= C.SalesRepID
   ORDER BY CustID;


--4.
SELECT DE.DeptID AS "Dept_ID", DE.DeptName AS "Dept_Name", SR.SalesRepID AS "Sales_Rep_ID", 
SR.SalesRepFName AS "First_Name", SR.SalesRepLName AS "Last_Name", 
SR.CommClass AS "Commission_Class", C.CommRate AS "Commission_Rate"
   FROM DEPARTMENT_sps DE, SALESREP_sps SR, COMMISSION_sps C
WHERE C.CommClass = SR.CommClass AND
   DE.DeptID = SR.DeptID AND 
   (DE.DeptID, CommRate) IN
      (SELECT DeptID, MAX(CommRate) 
            FROM SALESREP_sps
            GROUP BY DeptID);


--5

SELECT OD.ProdID AS "Product_ID", PR.ProdName AS "Product_Name", PR.ProdCatID AS "Category",
TO_CHAR(PR.ProdPrice, '$999.99' ) AS "Price"
FROM PRODUCT_sps PR, ORDER_sps O, ORDERDETAIL_sps OD
WHERE PR.ProdID = OD.ProdID AND
   O.OrderID = OD.OrderID AND
   O.OrderID = 100 AND
   PR.ProdPrice = (SELECT MAX(ProdPrice)
      FROM ORDERDETAIL_sps OD
      WHERE OrderID = 100) ;

--6
SELECT DeptName AS "Dept_Name", COUNT(SalesRepID) AS "Sales_Rep_Count"
FROM DEPARTMENT_sps D, SALESREP_sps SR
WHERE D.DeptID = SR.DeptID
GROUP BY DeptName
ORDER BY COUNT(SalesRepID);



--7
SELECT SalesRepID AS "Sales_Rep_ID", SalesRepFName AS "First_Name", SalesRepLName AS "Last_Name",
CONCAT(TO_CHAR((CommRate*100), '99'),'%') AS "Commission_Rate" 
FROM SALESREP_sps S , COMMISSION_sps C
   WHERE S.CommClass = C.CommClass AND
   CommRate>0 AND
   CommRate<=0.5
ORDER BY CommRate DESC;

--8.

SELECT O.OrderID, TO_CHAR(O.OrderDate, 'mm/dd/yy') AS "OrderDate", C.CustFName, C.CustLName, S.SalesRepID, S.SalesRepFName, S.SalesRepLName
FROM ORDER_sps O, CUSTOMER_sps C, SALESREP_sps S
WHERE O.CustID = C.CustID AND
C.SalesRepID = S.SalesRepID
ORDER BY OrderID;


--9.
SELECT O.OrderID, P.ProdID, P.ProdName, P.ProdCatID AS "CatID",
O.ProdPrice AS "Price", O.ProdQty AS "Qty", (O.ProdPrice*O.ProdQty) AS "ExtPrice"
FROM ORDERDETAIL_sps O, PRODUCT_sps P
WHERE O.ProdID = P.ProdID AND
OrderID = 104
ORDER BY "ExtPrice";


--10 
SELECT D.DeptID AS "DeptID", DeptName AS "DeptName",
COUNT(SalesRepID) AS "SalesRepCount", CONCAT(TO_CHAR(AVG(CommRate)*100, '99.9'),'%') AS "AvgCommRate"
FROM DEPARTMENT_sps D, SALESREP_sps S, COMMISSION_sps C
   WHERE D.DeptID = S.DeptID AND
   S.CommClass = C.CommClass
GROUP BY D.DeptID, DeptName
ORDER BY "AvgCommRate";


--11
SELECT S.SalesRepID, S.SalesRepFName, S.SalesRepLName,
CONCAT(TO_CHAR(C.CommRate*100, '99.9'),'%') AS "CommRate" 
FROM SALESREP_sps S , COMMISSION_sps C
WHERE S.CommClass = C.CommClass AND
CommRate >0 
ORDER BY SalesRepID;


--12
SELECT S.SalesRepID, (SalesRepFName || ' ' || SalesRepLName) AS "SalesRep_Name", D.DeptName
FROM SALESREP_sps S, DEPARTMENT_sps D, COMMISSION_sps C 
   WHERE S.DeptID = D.DeptID AND
   S.CommClass = C.CommClass AND
   C.CommClass = 'A'
ORDER BY D.DeptID, SalesRepID;




--13.

SELECT OrderID AS "Order_ID", TO_CHAR(SUM(ProdPrice* ProdQty), '$9999.99') AS "Order_Total"
FROM ORDERDETAIL_sps
   WHERE OrderID= 104
   GROUP BY OrderID;



--14.
SELECT TO_CHAR(AVG(ProdPrice),'$999.99') AS "Avg_Price"
   FROM PRODUCT_sps
   "Avg_Price";


--15.
   SELECT OD.ProdID AS "ProductID",ProdName AS "Name", TO_CHAR(P.ProdPrice, '$999.00') AS "Price"
   FROM ORDERDETAIL_sps OD, PRODUCT_sps P
WHERE P.ProdID= OD.ProdID 
GROUP BY OD.ProdID,ProdName, P.ProdPrice
HAVING COUNT(OrderID) =
   (SELECT  MAX(COUNT(OrderID))
     FROM ORDERDETAIL_sps
   GROUP BY ProdID);



--16.
SELECT ProdCatID AS "Cat_ID", ProdID AS "Prod_ID", ProdName AS "Prod_Name", TO_CHAR(ProdPrice, '$999.99') AS " Price"
FROM PRODUCT_sps 
WHERE (ProdCatID, ProdPrice) IN
      (SELECT ProdCatID, MIN(ProdPrice)
         FROM PRODUCT_sps
         GROUP BY ProdCatID);
      --17.
SELECT ProdID AS "Product_ID", ProdName AS "Product_Name",ProdCatName AS "Category",TO_CHAR(ProdPrice, '$999.99') AS "Avg_Price"
FROM PRODUCT_sps P
INNER JOIN PRODCAT_sps PC ON PC.ProdCatID = P.ProdCatID
WHERE ProdPrice > (SELECT AVG(ProdPrice) 
               FROM PRODUCT_sps);
 

--18.
SELECT  (C.CustFName || ' ' || C.CustLName) AS "Name", C.CustPhone AS "Phone", TO_CHAR(O.OrderDate, 'mm/dd/yy') AS "Order Date", O.OrderID AS "Order ID", O.CustID AS "Cust ID"
FROM ORDER_sps O, CUSTOMER_sps C
   WHERE C.CustID= O.CustID AND 
   O.OrderDate <= '26-JAN-2022' 
ORDER BY O.OrderDate, O.CustID; 
 

--19.
SELECT CustID, CustFName AS "FirstName", CustLName AS "LastName"
FROM CUSTOMER_sps
   WHERE CustFName LIKE 'A%'
ORDER BY CustLName;


--20
SELECT CustID AS "Customer ID", (CustFName || ' ' || CustLName) AS "Name", SUBSTR(CustPhone,1,3) ||'-'|| SUBSTR(CustPhone,4,3) || '-'||SUBSTR(CustPhone,7,4) AS "Phone"
FROM CUSTOMER_sps 
   WHERE SalesRepID = 12;

set echo off

spool off 
      
           
