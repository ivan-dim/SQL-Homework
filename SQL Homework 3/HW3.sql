--Calculate the count of all grades per Teacher in the system
--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade
--List Student First Name and Last Name next to the other details from previous query
--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
--Change the view to show Student First and Last Names instead of StudentID
--List all rows from view ordered by biggest Grade Count


SELECT TeacherID, FirstName, LastName, COUNT(Grade) AS TotalGrades
FROM Teacher T
LEFT JOIN Grade G 
ON T.ID = G.TeacherID
GROUP BY TeacherID, FirstName, LastName
GO

SELECT TeacherID, FirstName, LastName, COUNT(Grade) AS TotalGrades
FROM Teacher T
LEFT JOIN Grade G
ON T.ID = G.TeacherID
WHERE StudentID < 100
GROUP BY TeacherID, FirstName, LastName
GO

SELECT StudentID, FirstName, LastName, MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade
FROM Student S
INNER JOIN Grade G 
ON S.ID = StudentID
GROUP BY StudentID, FirstName, LastName
GO

SELECT TeacherID, FirstName, LastName, COUNT(Grade) AS TotalGrades
FROM Teacher T
LEFT JOIN Grade G
ON T.ID = G.TeacherID
GROUP BY TeacherID, FirstName, LastName
HAVING COUNT(Grade) > 200
GO


SELECT StudentID, FirstName, LastName, MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade
FROM Student S
INNER JOIN Grade G 
ON S.ID = StudentID
GROUP BY StudentID, FirstName, LastName
HAVING MAX(Grade) = AVG(Grade)
GO

CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(Grade) AS TotalGrades
FROM Grade G
GROUP BY StudentID
GO

ALTER VIEW vv_StudentGrades
AS
SELECT StudentID, FirstName, LastName, COUNT(Grade) AS TotalGrades
FROM Grade G
INNER JOIN Student S
ON StudentID = S.ID
GROUP BY StudentID, FirstName, LastName
GO

SELECT *
FROM vv_StudentGrades
ORDER BY TotalGrades DESC