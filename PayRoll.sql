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

--UC10-Adding Terrisa as part of marketing and Sale department
Insert into PayRollTable values('Terissa','2020-07-06','Female',9737847733,'Marketting and sale','mumbai',20000,2000,1000,200,18000)
select * from PayRollTable where name='Terissa'

---UC11- Modifiying the tables uing er diagrams
--creating employee table which contains employee details
create table Employee 
(
 emp_Id int identity(1,1) primary key,
 emp_name varchar(200),
 company_id int,
 dept_id int,
 phoneNumber bigint,
 address varchar(300),
 city varchar(100),
 state varchar(100),
 startDate date
)
--creating the company table which contains company name and company id
create table Company
(
  company_id int primary key,
  company_name varchar(200)
)
--creating the department table that conains Department id and name
create table Department
(
  Dept_id int primary key,
  Dept_name varchar(200)
)
--creating the payRoll table that contains salary details
create table PayRoll
(
  Emp_id int,
  BasicPay int, 
  Deduction float, 
  TaxablePay float, 
  Tax float,
  NetPay float
)
--creating employee department table that links both employee and department
create table Employee_Department
(
  Emp_id int,
  Dept_id int
)

insert into Department values(1,'Engineering')
insert into Department values(2,'HR')
insert into Department values(3,'Sales')
insert into Department values(4,'Marketing')
insert into Department values(5,'Intelligence')
select * from Department

Alter table Employee_Department ADD FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
Alter table PayRoll add foreign key(Emp_id) references Employee(Emp_id)

insert into Company values(1,'TVSNext')
insert into Company values(2,'CTS')
insert into Company values(3,'TCS')

Alter table Employee drop column dept_id
select * from Employee
--inserting the values inthe employee table
insert into Employee values('sou',1,737337795,'kknager','chennai','Tamilnadu','2017-06-15')
insert into Employee values('gem',1,737337795,'anna nagar','maduari','Tamilnadu','2017-06-15')
insert into Employee values('sri',1,737337795,'t nagar','chennai','Tamilnadu','2017-06-15')
insert into Employee values('terissa',1,737337795,'pudhur','madurai','Tamilnadu','2017-06-15')
insert into Employee values('vijay',3,2564635458,'pudur','salem','Tamilnadu','2016-07-29')


update Employee set phoneNumber=8564215015 where emp_name='terissa'
update Employee set phoneNumber=8694235665 where emp_name='sri'

update Employee set startDate='2019-01-29' where emp_id=3
update Employee set startDate='2021-07-27' where emp_Id=4

alter table Employee add gender varchar(1)
update Employee set gender='M' where emp_name='vijay' or emp_name='sri'
update Employee set gender='F' where emp_name='sou' or emp_name='gem' or emp_name='terissa'

--insering the department of the employee
insert into Employee_Department values(1,3)
insert into Employee_Department values(2,2)
insert into Employee_Department values(3,1)
insert into Employee_Department values(4,4)
insert into Employee_Department values(5,5)

select * from Employee_Department

--Adding the salary details in the pay roll table
insert into PayRoll(Emp_id,BasicPay,Deduction,TaxablePay,Tax) values((select emp_id from Employee where emp_name='sou'),20000,2000,1500,500)
insert into PayRoll(Emp_id,BasicPay,Deduction,TaxablePay,Tax) values(2,50000,10000,500,200),(3,35000,4500,300,245),(4,29000,5640,789,409),(5,45000,789,3456,300)
update PayRoll set NetPay=(BasicPay-Deduction)

select * from PayRoll

select * from PayRoll where Emp_id in (select Emp_id from Employee_Department where Dept_id=4)

--Redo UC7-Finding sum avg,min,max
select sum(PayRoll.NetPay) as totalsalary,Employee.gender from PayRoll,Employee group by gender
select max(PayRoll.NetPay) as Minsalary,Employee.gender from PayRoll,Employee group by gender
select min(PayRoll.NetPay) as Maxsalary,Employee.gender from PayRoll,Employee group by gender
select avg(PayRoll.NetPay) as Avgsalary,Employee.gender from PayRoll,Employee group by gender

select * from PayRoll