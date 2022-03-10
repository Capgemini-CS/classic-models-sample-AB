--------------------SELECT ALL EMPLOYEES WHERE LAST NAME STARTS WITH C----------------------------------


SELECT * FROM classicmodels.employees WHERE lastName LIKE 'c%';


--------------------SELECT ALL EMPLOYEES WHERE FIRST NAME CONTAINS AR-----------------------------------


SELECT * FROM classicmodels.employees WHERE firstName LIKE '%ar%';


--------------------SELECT ALL EMPLOYEES WHERE C IS THE SECOND LETTER IN LAST NAME----------------------


SELECT * FROM classicmodels.employees WHERE lastName LIKE '_i%';


--------------------------------------SELECT THE PRODUCT WITH THE LOWEST PRICE--------------------------


 SELECT p.productName AS 'PRODUCT_NAME', p.productLine AS 'PRODUCT_LINE', MIN(p.buyPrice) AS 'PRICE'
 FROM classicmodels.products p;


 --------------------------------------SELECT THE TOTAL NUMBER OF DISTINCT PRODUCTS---------------------


SELECT COUNT(DISTINCT productName) AS 'NUMBER_OF_PRODUCTS' FROM classicmodels.products;


 --------------------------------------SELECT EACH CUSTOMER WITH TOTAL NUMBER OF ORDERS-----------------


SELECT o.customerNumber AS 'CUSTOMER_NUMBER',
	   c.customerName AS 'CUSTOMER_NAME',
	   c.phone AS 'CUSTOMER_PHONE_NUMBER',
	   COUNT(o.orderNumber) AS 'NUMBER_OF_ORDERS'
FROM classicmodels.orders o LEFT JOIN classicmodels.customers c ON o.customerNumber = c.customerNumber
GROUP BY o.customerNumber;


 --------------------------------------VIEW - SELECT THE CUSTOMER WHO BOUGHT THE MOST EXPENSIVE PRODUCT-----------------


 SELECT c.customerName AS 'CUSTOMER_NAME', MAX(p.buyPrice) AS 'PRODUCT_PRICE'
 FROM customers c
 LEFT JOIN orders o ON c.customerNumber = o.customercustomer_orders_priceNumber
 LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
 LEFT JOIN products p ON od.productCode = p.productCode);


--------------------------------------SELECT THE NUMBER OF PRODUCTS FOR EACH PRODUCT LINE-------------------------------


 SELECT COUNT(p.productCode) AS 'NUMBER_OF_PRODUCTS', p.productLine AS "PRODUCT_LINE"
 FROM products p
 GROUP BY productLine
 ORDER BY NUMBER_OF_PRODUCTS DESC;


 --------------------------------------SELECT THE EMPLOYEE WHO HAS JOB TITLE PRESIDENT----------------------------------


 SELECT firstName AS "FIRST_NAME", lastName AS "LAST_NAME"
 FROM employees
 WHERE jobTitle = (SELECT jobTitle FROM employees WHERE employeeNumber = 1002)


--------------------------------------SELECT CUSTOMERS FROM USA WITH CREDIT LIMIT UNDER 45300.00------------------------


 SELECT * FROM customers
 WHERE country = 'USA' AND creditLimit < 45300.00
 ORDER BY creditLimit DESC;


-----------------------------------------SELECT QUANTITY FOR EACH ORDERED PRODUCT---------------------------------------


SELECT productCode AS "PRODUCT_CODE",quantityOrdered AS "QUANTITY_ORDERED"
FROM orderdetails
WHERE productCode IN (
SELECT productCode FROM products
);


 --------------------------- SELECT ALL EMPLOYEES WITH OFFICE AND PHONE NUMBER -----------------------------------------
 SELECT
 employees.lastName AS "LAST_NAME", employees.firstName AS "LAST_NAME",
 offices.city AS "OFFICE" , offices.phone AS "PHONE_NUMBER"
 FROM classicmodels.employees
 LEFT JOIN classicmodels.offices ON employees.officeCode = offices.officeCode;


  ------------------------------------ SELECT ALL PRODUCTS WITH THEIR PRODUCT LINE -------------------------------------
  SELECT products.productName, products.quantityInStock, productlines.textDescription
  FROM products
  LEFT JOIN productlines ON products.productLine = productlines.productLine;


------------------------------- SELECT CUSTOMER NAME WITH TOTAL NUMBER OF PRODUCTS  ------------------------------------
  SELECT customerName AS CUSTOMER,
  COUNT(productCode) AS `TOTAL PRODUCTS`
  FROM  customers
  LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
  LEFT JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
  GROUP BY (customers.customerNumber);

----------------------------------------SELECT ALL RECORDS FROM VIEW ---------------------------------------------------
 SELECT * FROM select_payments_view