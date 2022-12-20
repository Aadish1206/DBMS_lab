Create database Supplier;
use supplier;

Create table supplier(sid int, sname varchar(30),city varchar(20),
Primary key(sid));

insert into supplier values(10001,'Acme Widget','Bangalore');
insert into supplier values(10002,'Johns','Kolkata');
insert into supplier values(10003,'Vimal','Mumbai');
insert into supplier values(10004,'Reliance','Delhi');

Create table Parts(pid int, pname varchar(30),color varchar(20),
Primary key(pid));

insert into Parts values(20001,'Book','Red');
insert into Parts values(20002,'Pen','Red');
insert into Parts values(20003,'Pencil','Green');
insert into Parts values(20004,'Mobile','Green');
insert into Parts values(20005,'Charger','Black');

Create table Catalog(sid int, pid int,cost int,
Primary key(pid,sid),
Foreign Key(sid) references supplier(sid),
Foreign Key(pid) references parts(pid)  );

insert into Catalog values(10001,20001,10);
insert into Catalog values(10001,20002,10);
insert into Catalog values(10001,20003,30);
insert into Catalog values(10001,20004,10);
insert into Catalog values(10001,20005,10);
insert into Catalog values(10002,20001,10);
insert into Catalog values(10002,20002,20);
insert into Catalog values(10003,20003,30);
insert into Catalog values(10004,20003,40);


SELECT DISTINCT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;

select sname from supplier where sid in
(select sid from catalog c group by sid having count(sid)=(select count(pid) from parts));

select sname from supplier where sid in
(select sid from catalog where pid in(select pid from parts where color='Red'));


SELECT pname
FROM Parts P, Catalog C, Supplier S
WHERE P.pid = C.pid AND C.sid = S.sid
AND S.sname = 'Acme Widget'
AND NOT EXISTS ( SELECT *
FROM Catalog CA, Supplier SA
WHERE P.pid = CA.pid AND CA.sid = SA.sid AND
SA.sname!='Acme Widget' );



SELECT DISTINCT C.sid
FROM Catalog C
WHERE C.cost > ( SELECT AVG (C1.cost)
FROM Catalog C1
WHERE C1.pid = C.pid );

SELECT P.pid, S.sname
FROM Parts P, Supplier S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT max(C1.cost)
FROM Catalog C1
WHERE C1.pid = P.pid);
