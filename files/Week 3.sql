create database bank_008;
use bank_008;
create table branch(branchname varchar(30),
branchcity varchar(30),
assets real,
primary key(branchname));
 insert into branch values('SBI_JANTARMANTAR','DELHI',20000);
 insert into branch values('SBI_residencyroad','bangalore',10000);
 insert into branch values('SBI_shivajiroad','bombay',20000);
 insert into branch values('SBI_parlimentroad','delhi',10000);
 insert into branch values('SBI_chamrajpet','delhi',20000);
 create table bankaccount(accno int,
 branchname varchar(30),
 balance real,
 primary key(accno),
 foreign key(branchname) references branch(branchname));
 
create table bankcustomer(
customername varchar(30),
customerstreet varchar(30),
city varchar(30),
primary key(customername));

create table depositer(
customername varchar(30),
accno int,
primary key(customername,accno),
foreign key(customername) references bankcustomer(customername),
foreign key(accno) references bankaccount(accno));






insert into bankaccount values( 1,'SBI_CHAMRAJPET',2000);
insert into bankaccount values( 2,'SBI_RESIDENCYROAD',5000);
insert into bankaccount values( 3,'SBI_SHIVAJIROAD',6000);
insert into bankaccount values( 4,'SBI_PARLIMENTROAD',9000);
insert into bankaccount values( 5,'SBI_JANTARMANTAR',8000);
insert into bankaccount values( 6,'SBI_SHIVAJIROAD',4000);
insert into bankaccount values( 8,'SBI_RESIDENCYROAD',4000);
insert into bankaccount values( 9,'SBI_PARLIMENTROAD',3000);
insert into bankaccount values( 10,'SBI_RESIDENCYROAD',5000);
insert into bankaccount values( 11,'SBI_JANTARMANTAR',2000);

insert into bankcustomer values('avnisha','bull_temple_road','bangalore');
insert into bankcustomer values('dinesh','bannergatta_road','bangalore');
insert into bankcustomer values('mohan','nationalcollege_road','bangalore');
insert into bankcustomer values('nikil','akbar_road','delhi');
insert into bankcustomer values('ravi','prithviraj_road','delhi');


