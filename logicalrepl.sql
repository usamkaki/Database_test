
//Publisher running on port:5433

CREATE DATABASE employee;

CREATE TABLE employees(Id INT,Name VARCHAR(100),Salary INT); //To create the table

CREATE ROLE repuser REPLICATION LOGIN PASSWORD 'password'; // To create a user

CREATE PUBLICATION my_pub FOR TABLE employees; //To create a publisher

GRANT SELECT ON employees TO repuser; // To grant the priviliges 

INSERT INTO employee VALUES(1,'Tahir',13500);

INSERT INTO employee VALUES(2,'Teysir',15000);

INSERT INTO employee VALUES(3,'Shariq',12000);

INSERT INTO employee VALUES(4,'Fazil',16000);

SELECT * FROM employees;

//Subscriber running on port:5434

CREATE DATABASE employee;

CREATE TABLE employees(Id INT,Name VARCHAR(100),Salary INT); //To create the table

CREATE SUBSCRIPTION my_sub CONNECTION 'host=localhost port=5433 password=password user=repuser dbname=employee' PUBLICATION my_pub; // To subscribe  the publisher node

SELECT * FROM employees;

 

