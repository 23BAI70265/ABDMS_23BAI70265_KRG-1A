-- minimum number of tables required to establish foriegn key is 1.
-- Same for the joins (Self Join)

Create database Exp2 ;

use Exp2 ;

--Design two tables one for author and books 
CREATE TABLE TBL_AUTHOR
(
	AUTHOR_ID INT PRIMARY KEY,
	AUTHOR_NAME VARCHAR(MAX),
	COUNTRY VARCHAR(MAX)
)

CREATE TABLE TBL_BOOKS
(	
	BOOK_ID INT PRIMARY KEY,
	BOOK_TITLE VARCHAR(MAX),
	AUTHORID INT
	FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
)
/*
	TYPES:
		1. INNER JOIN (MATCHING RECORDS: BASED COMMON COLUMN)
		2. LEFT OUTER JOIN (LEFT TABLE WHOLE DATA + COMMON DATA)
		3. RIGHT OUTER JOIN(RIGHT TABLE WHOLE DATA + COMMON DATA)
		4. FULL OUTER JOIN (L + R + COMMON DATA)
		5. SELF JOIN (1)
		6. LEFT EXCLUSIVE JOIN
		7. RIGHT EXCLUSIVE JOIN
*/

-- Syntax :
-- 'Book Name' or [Book Name]

Select b.BOOK_TITLE as 'Book Name',A.author_name, A.country 
from TBL_BOOKS b
Inner join
TBL_AUTHOR a
on a.AUTHOR_ID = b.AUTHORID ;

/* 


*/
--drop table TBL_Department ;


/* 
	DCL : Grant and Revoke 
	Employee - Select ,Insert Update and Delete and commands 

*/

Create Table TBL_Department(
	Department_id int Primary Key ,
	Deparment_Name varchar(MAX), 
)
Create Table TBL_Course(
	Course_id int Primary Key,
	Course_Name varchar(MAX),
	DepartmentID int
	Foreign key (DepartmentID) references TBL_Department(Department_id)
) ;



-- Insert Departments
INSERT INTO TBL_Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO TBL_Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5)


-- Count the number of courses under every deparment 
SELECT COUNT(*) AS course_count, d.Deparment_Name
FROM TBL_Course c
INNER JOIN TBL_Department d ON c.DepartmentID = d.Department_ID
GROUP BY d.Deparment_Name;


-- filter out only those row which have number of course greater than 2.

Select Count(*) as Courses_count
From TBL_Course c 
inner join TBL_Department d
on c.DepartmentID = d.Department_id 
group by d.department_id 
Having Count(*) >= 2 ;

--IN ORDER TO CREATE USER
-- 1. TO CREATE THE LOGIN - ADMIN
-- 2. TO CREATE THE USER


-- 1. TO CREATE THE LOGIN - ADMIN

CREATE LOGIN TEST_LOGIN
WITH PASSWORD = 'TESTLOGIN@123';

CREATE USER TEST_USER
FOR LOGIN TEST_LOGIN


EXECUTE AS USER = 'TEST_USER'

GRANT SELECT, UPDATE ON COURSE TO TEST_USER



-- Read about Joins