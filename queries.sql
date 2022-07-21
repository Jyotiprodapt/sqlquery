mysql -u root -p

-- CRUD oper

-- 1.show database
show databases;
SHOW DATABASES;

............................

-- cretae db
CREATE DATABASE dbname
CREATE DATABASE prodapt

.............
-- show tables/list tables
SHOW TABLES;

................
-- CREATE TABLE
CREATE TABLE TABLENAME(FIELDS DATATYPE)
CREATE TABLE course_list(
    c_id INT NOT NULL AUTO_INCREMENT,
    c_name VARCHAR(20) NOT NULL,
    c_author VARCHAR(30) NOT NULL,
    c_date DATE,
    PRIMARY KEY(c_id)
);

CREATE TABLE employee(
    e_id INT NOT NULL AUTO_INCREMENT,
    e_name VARCHAR(30) NOT nULL,
    e_dept VARCHAR(50) NOT nULL,
    e_date DATE,
    PRIMARY KEY(e_id)
);

...................
-- DROP TABLE
DROP TABLE TABLENAME
DROP TABLE employee;

...........................
-- INSERT ONE DATA IN TABLE
INSERT INTO TABLENAME
INSERT INTO course_list(c_name,c_author,c_date) VALUES("JAVA","JAY",NOW());

-- INSERT MULTIPLE DATA
INSERT INTO employee(e_name,e_dept,e_date) 
VALUES("JAY","JAVA",NOW()),
("AVI","SQL",NOW()),
("MANISHA","ANGULAR",NOW());

.................................
-- SELECT DATA FORM TABLE
SELECT * FROM TABLENAME;
SELECT * FROM employee;

SELECT e_dept FROM employee;
SELECT CONCAT('JAY','','ALIAS') AS FULLNAME;

..................................
-- UPDATING RECORDS
UPDATE TABLENAME SET FIELDS="";
UPDATE employee SET e_dept="HTML";
UPDATE employee SET e_dept="HTML" WHERE e_id=3;

............................
-- DELETING RECORDS
DELETE FROM TABLENAME WHERE CONDITION;
DELETE FROM course_list WHERE c_id=2;

............................
-- RENAME
RENAME TABLE employee TO employee_details;

...............................
-- ALTER

ALTER TABLE TABLENAME
ADD  new_col_name col_definition;

ALTER TABLE employee_details
ADD e_loc VARCHAR(100) NOT NULL;

ALTER TABLE employee_details
ADD e_loc VARCHAR(100) NOT NULL,
ADD e_loc VARCHAR(100) Not NULL;

.....................................
-- DESCRIBE table
DESCRIBE employee_details;

.....................................
-- MODIFY COL type
ALTER TABLE employee
MODIFY e_dept VARCHAR(100) NOT NULL;

-- MODIFY/RENAME COL NAME
ALTER TABLE TABLENAME CHANGE COLUMN COLNAME1 COLNAME2 DATATYPE
ALTER TABLE employee CHANGE COLUMN e_date e_doj INT NOT NULL;
..................................
-- DELETE COL
ALTER TABLE employee DROP COLUMN col_name;

.......................................
-- relationships


CREATE TABLE Orders(
    Orderid INT NOT NULL,
    Orderno INT NOT NULL,
    Personid INT,
    PRIMARY KEY(Orderid)
    FOREIGN kEY(Personid) REFERENCES Persons(Personid)
)

CREATE TABLE Project(
    Projectid INT NOT NULL,
    Projectname VARCHAR NOT NULL,
    e_id INT,
    PRIMARY KEY(Projectid),
    FOREIGN KEY(e_id) REFERENCES employee(e_id)
)

.................................
-- ALTER FOREIGN KEY
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY(Personid)
REFERENCES Persons(Personid)

...................
-- ḌROP FOREIGN KEY
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder;

..........................
-- source path/mysql filename
......................


-- SELECT fieldname FROM TABLENAME
SELECT lastName FROM employee;
SELECT firstName,lastName FROM employee;
SELECT * FROM employee;
SELECT expression AS col_alias;

................................
SELECT(2)
    fieldname
FROM(1)
    TABLENAME
ORDER By(3)
    COL1[ASC/DESC],
    COL2[ASC/DESC];

...................
-- USER CUSTOMER TABLE TO PRACTICE SORT
-- ORDERBY LASTNAME

SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName;



SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName DESC;


SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName DESC,
    contactFirstName ASC;

.....................................
SELECT
    jobTitle
FROM
    customers
ORDERBY
    jobTitle;

...................................
-- ORDERDETAILS TABLE
SELECT
    orderLineNumber,orderNumber,quantityOrdered
    * priceEach AS subtotal
FROM
    orderdetails
ORDER BY
    subtotal DESC;

-- SELECT * FROM orderdetails limit 3;

........................................
-- status
--     In Progress
--     on hold
--     Cancelled
--     Resolved
--     Disputed
--     Shipped

SELECT
    orderNumber,status
FROM
    orders
ORDER BY FIELD(status,
    "In Process",
    " on hold",
    " Cancelled",
    "Resolved",
     "Disputed",
     "Shipped" );


SELECT
    firstName,
    lastName,
    reportsTo
FROM
    orders
ORDER BY reportsTo DESC;

...................................
-- filtering data
WHERE
SELECT DISTINCT
And
NOT IN
BETWEEN
Limit
IS NULL

-- FROM-WHERE-SELECT-ORDER BY

SELECT
    firstName,
    lastName,
    jobTitle,officeCode
FROM
    employees
WHERE
    jobTitle="Sales Rep" AND
    officeCode=1;



SELECT
    firstName,
    lastName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle="Sales Rep" OR
    officeCode=1
ORDER BY
    officeCode,
    jobTitle;



SELECT
    firstName,
    lastName,
    officeCode

FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3

ORDER BY officeCode;
....................................
-- LIKE CLAUSE

SELECT
    firstName,
    lastName
FROM
    employees
WHERE 
    lastName like '%son'
ORDER BY firstName;

SELECT
    firstName,
    lastName
FROM
    employees
WHERE 
    lastName like 'Tho%'
ORDER BY firstName;

......................................
-- in operator
SELECT
    firstName,
    lastName,
    officeCode
FROM 
    employees
WHERE
    officeCode IN(1,2,3)
ORDER BY
    officeCode;

.....................................
-- LIMIT
SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;


SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit ASC
LIMIT 6;

SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC,customerNumber
LIMIT 6;

...................
-- paging query
SELECT
    customerName,
    customerNumber
FROM
    customers
ORDER BY
    customerName
LIMIT
    10;
    -- LIMIT 20,10;
.................................
-- DISTINCT
SELECT DISTINCT
    state
FROM customers;

................................

SELECT
    CONCAT_ws(',',firstName,lastName) AS FULLNAME
FROM
    employees;
..............................
SELECT
    quantityOrdered * priceEach AS total 
FROM
    orderdetails
ORDER BY
    total<4000
LIMIT 5;

SELECT
    orderNumber `orderno`,
    SUM(quantityOrdered * priceEach) subtotal 
FROM
    orderdetails
GROUP BY
        `orderno`
HAVING
    subtotal > 60000;
.......................................

-- joins
-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


SELECT employees.employeeNumber
FROM employees
INNER JOIN offices ON employees.officeCode=offices.officeCode;


SELECT orders.orderDate,customers.customerName
FROM orders
INNER JOIN customers ON orders.customerNumber=customers.customerNumber;

SELECT orders.orderDate,customers.customerName
FROM orders
LEFT JOIN customers ON orders.customerNumber=customers.customerNumber;

SELECT orders.orderDate,customers.customerName
FROM customers
RIGHT JOIN orders ON orders.customerNumber=customers.customerNumber;

SELECT orders.orderDate,customers.customerName
FROM customers
CROSS JOIN orders ON orders.customerNumber=customers.customerNumber;
..........................................................

-- to get the whole org str , you can join the employess table to itself using the employmeNumber and reportsTo the columns
-- the table employees has two roles:one is the Manager and other is Direct Reports

SELECT 
    CONCAT(m.lastName,',',m.firstName) AS Manager,
    CONCAT(e.lastName,',',e.firstName) AS 'Direct report'
FROM 
    employees e
INNER JOIN employees m ON
    m.employeeNumber=e.reportsTo

ORDER BY
    Manager;
    ..............................................

    create table project(id INT,name VARCHAR(45));
    INSERT INTO project VALUES(1,"java"),(2,"html")

    create table user(id INT,media_id INT,name VARCHAR(45));
    INSERT INTO user
     VALUES(1,121,"AMRITA"),
     (1,122,"ANAMIKA"),
     (1,123,"DIVYA"),
     (1,124,"ANISH");

     CREATE TABLE project_has_user(project_id INT,user_id INT,manager TINYINT(1),FOREIGN KEY (project_id) REFERENCES
     project(id),FOREIGN KEY (user_id) REFERENCES user(id));
     INSERT INTO project_has_user 
     VALUES(1,121,0001),
     (2,122,0002),
     (3,123,0003),
     (4,124,0004);

     CREATE TABLE bug(id INT,project_id INT,name VARCHAR(45) ,FOREIGN KEY(project_id) REFERENCES project(id));
     INSERT INTO bug VALUES(1,1,"ARRAY OUT OF BOUND"),
     (2,2,"EOF"),
     (3,3,"ARRAY OUT OF BOUND"),
     (4,4,"EXCEPTION");

     CREATE TABLE comment(id INT,bug_project_id INT,bug_id INT,text TEXT,FOREIGN KEY(bug_id) REFERENCES bug(id));
     INSERT INTO comment VALUES(1,080,1,"improve"),
     (1,081,2,"rebuild project"),
     (1,082,3,"improve"),
     (1,083,4,"improve"),

     CREATE TABLE bug_has_media(bug _id INT,bug_project_id INT,media_id INT,FOREIGN KEY(bug_project_id) REFERENCES bug(project_id));
     INSERT INTO bug_has_media VALUES() 
