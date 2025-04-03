--Find all Students with FirstName = Antonio
--Find all Students with DateOfBirth greater than ‘01.01.1999’
--Find all Students with LastName starting With ‘J’ enrolled in January/1998
--List all Students ordered by FirstName
--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
--Create Foreign key constraints from diagram or with script
--List all possible combinations of Courses names and AchievementType names that can be passed by student 
--List all Teachers without exam Grade


SELECT * FROM Student
WHERE FirstName = 'Antonio'

SELECT * FROM Student
WHERE DateOfBirth > '1999.01.01'

SELECT * FROM Student
WHERE LastName like 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate <= '1998.01.31'

SELECT * FROM Student
ORDER BY FirstName ASC

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID)
REFERENCES Course (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID)
REFERENCES Teacher (ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID)
REFERENCES Grade (ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID)
REFERENCES AchievementType (ID)

SELECT Course.[Name], AchievementType.[Name]
FROM Course
CROSS JOIN AchievementType

SELECT * FROM Teacher
LEFT OUTER JOIN Grade
ON Teacher.ID = TeacherID
WHERE Grade.ID IS NULL

