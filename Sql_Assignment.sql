create database fisglobal
create table Clients(
	client_id numeric(4) primary key,
	cname varchar(40) not null,
	addres varchar(30),
	email varchar(30) unique,
	phone numeric(10),
	business varchar(20) not null
	--business=>manufacturer, reseller, consultant,professional

)

insert into Clients values(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing')
insert into Clients values(1002,'Trackon Consultants','Mumbai','contact@trackon.com',9567880090,'Consultant'),
(1003,'Money-saver','kolkata','save@money.com',8767880090,'Reseller'),
(1004,'Lawfull Corp','Chennai','justice@lawful.com',9563480090,'Professional')


select * from Clients
create table departments
(
	deptno 	numeric(2) primary key,
	dname varchar(15) not null,
	loc varchar(20)
)
insert into departments values(10,'Design','Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumbai')

select * from departments

create table Employess
(
	empno numeric(4) primary key,
	ename varchar(20) not null,
	job varchar(15),
	salary numeric(7) check(salary>0),
	deptno numeric(2) references Departments(deptno),

)

insert into Employess values(7001,'sandeep','analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),
(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),
(7005,'Abhay','Designer',35000,10),
(7006,'Uma','Tester',30000,30),
(7007,'Gita','Tech Writer',30000,40)

select * from Employess

Create table Projects(
	project_id numeric(3) primary key,
	Descr varchar(30) not null,
	start_dt date,
	planned_end_dt date,
	actual_end_dt date,
	budget numeric(10) check(budget>0),
	client_id numeric(4) references clients(client_id)
)

select * from projects
alter table projects
add constraint chkdate check(actual_end_dt>planned_end_dt)

insert into projects values(401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11',150000,1001),
(402,'Accounting','01-Aug-11','01-Jan-12',null,500000,1002),
(403,'Payroll','01-Oct-11','31-Dec-11',null,75000,1003),
(404,'Contact Mgmt','01-Nov-11','31-Dec-11',null,50000,1004)
select * from projects

create table EmpProjectsTasks(
	project_id numeric(3) not null,
	empno numeric(4) not null,
	start_dt date,
	end_dt date,
	task varchar(25) not null,
	Status varchar(15) not null 
)
alter table empprojectstasks
add foreign key(project_id) references projects(project_id)
alter table empprojectstasks
add foreign key(empno) references employess(empno)
alter table empprojectstasks
add primary key(project_id,empno)

sp_help empprojectstasks
insert into EmpProjectsTasks values(401,7001,'01-Apr-11','20-Apr-11','system Analysis','completed')
select * from EmpProjectsTasks