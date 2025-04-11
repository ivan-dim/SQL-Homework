--Create new procedure called CreateGrade;
--Procedure should create only Grade header info (not Grade Details); 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade);
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course).

CREATE PROCEDURE CreateGrade
(
    @StudentID int,
    @CourseID int,
    @TeacherID int,
    @Grade int,
    @CreatedDate datetime
)
AS
BEGIN
    INSERT INTO Grade(StudentID, CourseID, TeacherID, Grade, CreatedDate)
    VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @CreatedDate);

    SELECT COUNT(*) AS TotalNumberGrades
    FROM Grade
    WHERE StudentID = @StudentID;

    SELECT MAX(Grade) AS MaxGrade
    FROM Grade
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;
END;
GO

EXEC CreateGrade 12, 4, 5, 92, '2025-04-11'
EXEC CreateGrade 7, 2, 3, 76, '2025-04-11'
GO

--Create new procedure called CreateGradeDetail;
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade);
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE CreateGradeDetail
(
    @GradeID int,
    @AchievementTypeID int,
    @AchievementPoints int,
    @AchievementMaxPoints int,
    @Achievementdate datetime
)
AS
BEGIN
    INSERT INTO GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

    SELECT SUM(CAST(gd.AchievementPoints AS DECIMAL(5,2)) / CAST(gd.AchievementMaxPoints AS DECIMAL(5,2)) * a.ParticipationRate) AS GradePointsSum, a.[Name]
    FROM GradeDetails gd
    INNER JOIN AchievementType a ON a.ID = gd.AchievementTypeID
    WHERE gd.GradeID = @GradeID
    GROUP BY a.[Name];
END;
GO

EXEC CreateGradeDetail 3, 1, 30, 40, '2025-04-11'
EXEC CreateGradeDetail 2, 4, 70, 100, '2025-04-11'
GO