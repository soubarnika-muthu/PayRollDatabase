--UC1-Creating Database for the employee payroll  
create database Emp_Payroll_Database

--UC2-Creating table for employee payroll with attributes columns id,name, salary and start date
create table PayRollTable
(
id int identity(1,1) primary key,
name varchar(100) not null,
salary float,
startDate date
)
--UC3-Inserting the data into the table
INSERT INTO PayRollTable VALUES('JEBA',10000,'2021-07-30')