CREATE DATABASE [SEDCACADEMYDB]

USE SEDCACADEMYDB


CREATE TABLE Students(
Id int NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL, 
DateOfBirth date NOT NULL,
EnrolledDate date NOT NULL,
Gender nvarchar(1) NOT NULL,
NationalIDNumber int NOT NULL,
StudentCardNumber int NOT NULL
);

CREATE TABLE Teachers(
Id int NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL, 
DateOfBirth date NOT NULL,
AcademicRank int NOT NULL,
HireDate date NOT NULL
);

CREATE TABLE Grades(
Id int NOT NULL,
StudentID int NOT NULL,
CourseID int NOT NULL,
TeacherID int NOT NULL,
Grade int NOT NULL,
Comment nvarchar(4000),
CreatedDate date NOT NULL
);

CREATE TABLE Courses(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
Credit int NOT NULL,
AcademicYear int NOT NULL,
Semester int NOT NULL
);

CREATE TABLE AchievementTypes(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(4000),
ParticipationRate int NOT NULL
);

CREATE TABLE GradeDetails(
Id int NOT NULL,
GradeId int NOT NULL,
AchievementTypeID int NOT NULL,
AchievementPoints int NOT NULL,
AchievementMaxPoints int NOT NULL,
AchievementDate date NOT NULL
);