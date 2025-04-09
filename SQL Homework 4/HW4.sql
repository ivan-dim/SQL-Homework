--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable
--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same




DECLARE @FirstName nvarchar(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE Student.FirstName = @FirstName

DECLARE @FemaleStudents TABLE (StudentId nvarchar(100),StudentName nvarchar(100),DateOfBirth date)
INSERT INTO @FemaleStudents
SELECT Student.ID, Student.FirstName , Student.DateOfBirth from Student
WHERE Student.Gender = 'F'


SELECT *
FROM @FemaleStudents

CREATE TABLE #MaleStudents (LastName nvarchar(100), EnrolledDate date)
INSERT INTO #MaleStudents
SELECT Student.LastName, Student.EnrolledDate FROM Student
WHERE Student.Gender = 'M' AND Student.FirstName LIKE 'A%' AND LEN(Student.LastName) = 7

SELECT *
FROM #MaleStudents

SELECT *
FROM Teacher
WHERE LEN(Teacher.FirstName) < 5 AND LEFT(FirstName,3) = LEFT(LastName,3)