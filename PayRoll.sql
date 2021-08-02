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

--UC6-Alter and Update the table
ALTER TABLE PayRollTable ADD gender varchar(10)
UPDATE PayRollTable set gender ='Female' where name='Soubarnika' or  name='Geminika'

--UC7-Finding sum avg,min,max
select sum(salary) as totalsalary,gender from PayRollTable group by gender
select avg(salary) as averagesalary,gender from PayRollTable group by gender
select min(salary) as minsalary,gender from PayRollTable group by gender
select max(salary) as maxsalary,gender from PayRollTable group by gender

--UC8-Adding Employee information
ALTER TABLE PayRollTable ADD phonenumber bigint
ALTER TABLE PayRollTable ADD address varchar(200) DEFAULT('INDIA')
ALTER TABLE PayRollTable ADD department varchar(20) not null DEFAULT('Engineering')
update PayRollTable 
set phonenumber = 8738475839 , address='chennai', department='Engineering'
where name='Shanthi'
update PayRollTable 
set phonenumber = 8664729247 , address='Salem', department='Intelligence'
where name='Soubarnika'
update PayRollTable 
set phonenumber = 9327836727 , address='madurai', department='Intelligence'
where name='Geminika'
update PayRollTable 
set phonenumber = 8362736265 , address='chennai', department='Engineering'
where name='venkat'

--UC9-Altering employee table to add netpay,basic pag,Income tax,Taxable pay
ALTER TABLE PayRollTable drop column salary
ALTER TABLE PayRollTable Add BasicPay int, Deduction float, TaxablePay float, Tax float,NetPay float