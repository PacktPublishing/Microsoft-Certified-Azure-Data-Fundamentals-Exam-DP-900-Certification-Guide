CHAPTER 8

//STEP 1

CREATE TABLE student_data(
    studentID int PRIMARY KEY NOT NULL,
    student_name varchar(30),
    gender VARCHAR(1),
    course int,
    marks float,
    fees int,
    admission_year int
);

//STEP 2

CREATE TABLE course(
    courseID int PRIMARY KEY NOT NULL,
    course_name varchar(30)
);


//STEP 3

INSERT INTO student_data  VALUES ('1', 'Rahul','M', 1, 89.2, 15000, 2019);
INSERT INTO student_data  VALUES ('2', 'Riya', 'F',2, 68, 12000, 2018);
INSERT INTO student_data  VALUES ('3', 'Sagnik','M', 3, 96, 19000, 2019);
INSERT INTO student_data  VALUES ('4', 'Aditya', 'M',1, 95, 8000, 2018);
INSERT INTO student_data  VALUES ('5', 'Sunny', 'M',4, 78, 14000, 2019);
INSERT INTO student_data  VALUES ('6', 'Anshuman', 'M',4, 67, 6000, 2018);
INSERT INTO student_data  VALUES ('7', 'Soumya','M', 4, 86.8, 17000, 2019);
INSERT INTO student_data  VALUES ('8', 'Ravi', 'M',3, 87.9, 18000, 2018);
INSERT INTO student_data  VALUES ('9', 'Priya', 'F',1, 93, 12000, 2019);
INSERT INTO student_data  VALUES ('10', 'Ankita', 'F',2, 89.2, 14000, 2018);

INSERT INTO course  VALUES (1, 'BA English');
INSERT INTO course  VALUES (2, 'BA History');
INSERT INTO course  VALUES (3, 'MBBS');
INSERT INTO course  VALUES (4, 'Btech');


//STEP 4

SELECT TOP (1000) [studentID]
      ,[student_name]
      ,[gender]
      ,[course]
      ,[marks]
      ,[fees]
      ,[admission_year]
  FROM [dbo].[student_data]
//STEP 5

SELECT TOP (1000) S.[studentID]
      ,S.[student_name]
      ,S.[gender]
      ,C.[course_name]
      ,S.[marks]
      ,S.[fees]
      ,S.[admission_year] 
      FROM dbo.student_data S
      INNER JOIN [course] C
ON S.course=C.courseID



//STEP 4 POSTGRESQL
select  studentid
,student_name
,gender
,course
,marks
,fees
,admission_year
from public.student_data
LIMIT 1000

//STEP 5 POSTGRESQL
select  studentid
,student_name
,gender
, public.course.course_name
,marks
,fees
,admission_year
from public.student_data
inner join public.course
ON public.student_data.course= public.course.courseID
LIMIT 1000


