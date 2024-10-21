--Task1--
create table Person(
person_id  VARCHAR(20),
first_name VARCHAR(50),
last_name VARCHAR(50),
address VARCHAR(100),
age INTEGER,
city VARCHAR(20),

PRIMARY KEY(person_id)
);
INSERT INTO Person VALUES(1,'HUDA','ATTARIA','123STREET',21,'KARACHI');
INSERT INTO Person VALUES(2,'MAHAM','FATMA','1453STREET',24,'KARACHI');
INSERT INTO Person VALUES(3,'AIMAN','HAMEED','143STREET',25,'KARACHI');
INSERT INTO Person VALUES(4,'HOOR','LAIN','163STREET',26,'KARACHI');
INSERT INTO Person VALUES(5,'HADIA','SYED','183STREET',27,'KARACHI');

SAVEPOINT1;

INSERT INTO Person VALUES(6,'UROOJ','SYEED','183STREET',28,'KARACHI');
INSERT INTO Person VALUES(7,'MAHNOOR','SYED','163STREET',29,'KARACHI');
INSERT INTO Person VALUES(8,'TAHURA','NAFEES','1673STREET',30,'KARACHI');
INSERT INTO Person VALUES(9,'RIMSHA','MAJED','198STREET',31,'KARACHI');
INSERT INTO Person VALUES(10,'RANIA','ALTAF','183STREET',32,'KARACHI');

--Query to verify the changes after rollback
SELECT * FROM Person;

UPDATE Person
SET first_name='sahar'
WHERE person_id = 7;

ROLLBACK TO SAVEPOINT1;
-- Query to verify the changes after rollback
SELECT * FROM Person;


--Task 2--
--  new transaction without commit
UPDATE Person SET Age = 30 WHERE personID = 8;
SELECT * FROM Person;
--The reason behind no update is that Oracle implements a default transaction isolation level known as "read committed." In this isolation level, a transaction sees only committed data. 
--When the second session tries to update the record with personID = 8, it sees that the record is currently being 
--modified by an uncommitted transaction in the first session. As a result, the second session is blocked until the first session either commits or rolls back its changes.

