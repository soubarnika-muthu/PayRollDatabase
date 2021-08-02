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
INSERT INTO PayRollTable VALUES('Soubarnika',10000,'2021-07-30')
INSERT INTO PayRollTable VALUES('Geminika',50000,'2021-08-01')
INSERT INTO PayRollTable VALUES('Shanthi',60000,'2021-06-11')
INSERT INTO PayRollTable VALUES('venkat',40000,'2020-08-01')

--UC4-Retriving the data from the table
SELECT * FROM PayRollTable

--UC5-Retriving data Based on condition
SELECT salary FROM PayRollTable where name='venkat'
SELECT salary FROM PayRollTable where startDate between CAST('2021-01-01' as date) and GETDATE()
