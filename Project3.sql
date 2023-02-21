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
      
           
