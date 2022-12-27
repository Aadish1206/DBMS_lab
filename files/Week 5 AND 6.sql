Create database Employee;
Use Employee;

create table Project  (Pno int, Ploc Varchar(30), Pname varchar(20), primary key(Pno));

insert into Project values(1,'Bengaluru','Xmas');
insert into Project values(2,'Bengaluru', 'Xceed');
insert into Project values(3, 'Hyderabad', 'Smile');
insert into Project values(4, 'Mysuru','Brake');
insert into Project values(5, 'Delhi', 'Psych');

create table Dept (Deptno int, Dname Varchar(30), Dloc varchar(30), primary key(Deptno));

insert into Dept values(1, 'IT', 'Bengaluru');
insert into Dept values(2, 'Backend', 'Mysore');
insert into Dept values(3, 'Webpage','Hyderabad');
insert into Dept values(4,'Service','Bengaluru');
insert into Dept values(5, 'Marketing', 'Delhi');

create table Employee (Empno int, Ename varchar(30), Mgr_No int, Hiredate date, sal int, Deptno int,
primary key (Empno),
foreign key (Deptno) references Dept(Deptno));

insert into Employee values(101,'Deli', 11, '2017-07-11', 25000,1);
insert into Employee values(102, 'Bhavana', 12, '2018-06-17', 50000,2);
insert into Employee values(103, 'Hush', 11, '2016-02-12',40000,3);
insert into Employee values(104, 'Abhi', 13, '2019-06-11', 25000, 2);
insert into Employee values(105, 'Akshay', 14, '2015-08-26',50000,4);
insert into Employee values(106, 'Nidhi', 13, '2018-12-08', 40000, 5);
insert into Employee values(107, 'Betan', 12, '2019-03-12',30000, 2);
insert into Employee values(11, 'fruk', 20, '2018-05-12',10000, 5);
insert into Employee values(12, 'yaazi', 20, '2017-03-11',120000, 2);
insert into Employee values(13, 'shawn', 20, '2018-12-12',14000, 1);
insert into Employee values(14, 'mendes', 20, '2019-06-24',300000, 4);
insert into Employee values(20, 'Beast', Null, '2019-06-24',300000, Null);


create table Incentives (Empno int, Incentive_Date date, Incentive_Amount int,
primary key (Empno,Incentive_Date),
foreign key (Empno) references Employee(Empno));

insert into Incentives values(101,'2020-01-01',5000);
insert into Incentives values(103,'2021-01-18', 7000);
insert into Incentives values(106,'2021-04-20',9000);
insert into Incentives values(102,'2022-07-24',8000);
insert into Incentives values(104,'2022-01-08',12000);

create table Assigned_To (Empno int, Pno int, Job_Role varchar(20),
primary key (Empno,Pno),
foreign key (Empno) references Employee(Empno),
foreign key (Pno) references Project(Pno));

insert into Assigned_to values(101, 1, 'Software enginneer');
insert into Assigned_to values(102, 2, 'Developer');
insert into Assigned_to values(103, 3, 'Developer');
insert into Assigned_to values(104, 1, 'Tech Lead');
insert into Assigned_to values(105, 4, 'Supervisor');
insert into Assigned_to values(106, 5, 'Senior Salesman');
insert into Assigned_to values(107, 4, 'Junior head');



select empno
from employee
where empno in (select empno
        from Assigned_To
        wHERE Assigned_to.Pno in
        (select pno
        from project
        where ploc='Bengaluru' or ploc='Hyderabad' or ploc='Mysuru'));
        
        
select empno
From employee
where Empno Not in (Select empno
from Incentives);


Select distinct employee.Ename,employee.Empno,employee.Deptno,
assigned_to.Job_Role,Dept.Dloc,Project.Ploc
From Employee,Assigned_to,Dept,Project
Where Dept.Dloc=Project.Ploc
 And DEPT.DEPTNO=Employee.Deptno
 And Project.pno=Assigned_to.Pno 
And Assigned_to.Empno=Employee.Empno ;

select ename from employee 
where empno =
(select mgr_no 
from employee 
group by mgr_no having count(empno)=
(select count(empno) 
from employee 
group by mgr_no 
order by count(empno) desc limit 1));


select a.ename 
from employee a
 where a.sal> 
 (select avg(e.sal) 
 from employee e 
 where e.mgr_no=a.empno 
 group by e.mgr_no);
 
 
 
 select * from employee 
 where empno =
 ( select empno 
 from incentives 
 where incentive_date between '2019-01-01' and '2019-12-31'
 and incentive_amount!=
 (select max(incentive_amount) 
 from incentives 
 where incentive_date between '2019-01-01' and '2019-12-31'));
 
 


 select e.ename from employee e where e.deptno=
 (select deptno 
 from employee 
 where e.mgr_no=empno);
 
 
SELECT ENAME FROM EMPLOYEE WHERE EMPNO IN (select DISTINCT MGR_NO 
FROM EMPLOYEE E 
WHERE EMPNO IN(SELECT DISTINCT MGR_NO FROM EMPLOYEE));
 
 SELECT ENAME FROM EMPLOYEE WHERE EMPNO IN
 (SELECT EMPNO FROM INCENTIVES WHERE EMPNO!=
 (SELECT EMPNO FROM INCENTIVES HAVING MAX(INCENTIVE_AMOUNT)) 
 HAVING MAX(INCENTIVE_AMOUNT));
 
 
SELECT ENAME FROM EMPLOYEE WHERE EMPNO IN(select DISTINCT MGR_NO 
FROM EMPLOYEE E 
group by(E.MGR_NO) 
HAVING COUNT(E.MGR_NO)>=
ALL(SELECT COUNT(F.MGR_NO) FROM EMPLOYEE F
 WHERE E.MGR_NO!=F.MGR_NO GROUP BY(F.MGR_NO) )) ;
 
 select ename
from employee
where empno= (select mgr_no from (select mgr_no, max(mgr_no) from (select mgr_no, count(mgr_no) from employee group by mgr_no)as a1)as a2);
 
 
 SELECT ENAME FROM EMPLOYEE WHERE EMPNO IN(select DISTINCT MGR_NO 
FROM EMPLOYEE E 
group by(E.MGR_NO) 
HAVING COUNT(E.MGR_NO)>=ALL(SELECT COUNT(F.MGR_NO) FROM EMPLOYEE F WHERE E.MGR_NO!=F.MGR_NO GROUP BY(F.MGR_NO) )) ;
