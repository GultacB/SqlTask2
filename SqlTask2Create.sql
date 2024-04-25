CREATE DATABASE UniversitySystem

CREATE TABLE FacultyAndDepartment(
 Id INT PRIMARY KEY IDENTITY(1,1),
 FacultyName NVARCHAR(50),
 DepartmentName NVARCHAR(80),
);


CREATE TABLE BachelorGroups(
 Id INT PRIMARY KEY IDENTITY(1,1),
 GroupName NVARCHAR(80),
 StudentsInGroup INT,
);


CREATE TABLE Teachers(
 Id INT PRIMARY KEY IDENTITY(1,1),
 TeacherFullName NVARCHAR(20),
 FacultyAndDepartmentId INT FOREIGN KEY REFERENCES FacultyAndDepartment(Id),
 TeacherSalary INT
);

CREATE TABLE WeeklySchedule(
 Id INT PRIMARY KEY IDENTITY(1,1),
 FacultyId INT FOREIGN KEY REFERENCES FacultyAndDepartment(Id),
 DepartmentId INT FOREIGN KEY REFERENCES FacultyAndDepartment(Id),
 TeacherId INT FOREIGN KEY REFERENCES Teachers(Id),
 GroupId INT FOREIGN KEY REFERENCES BachelorGroups(Id),
 RoomsNumber INT,
 SubjectName NVARCHAR(70),
 WeekDays NVARCHAR(15)
);