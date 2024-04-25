INSERT INTO FacultyAndDepartment(FacultyName,DepartmentName) VALUES ('Komputer Elmleri','Texnologiya')
INSERT INTO FacultyAndDepartment(FacultyName,DepartmentName) VALUES ('Komputer Elmleri','Texniki elmler')
INSERT INTO FacultyAndDepartment(FacultyName,DepartmentName) VALUES ('Tabiyyat','Fizika ve Kimya')
INSERT INTO FacultyAndDepartment(FacultyName,DepartmentName) VALUES ('Tabiyyat','Riyaziyyat ve informatika')
INSERT INTO FacultyAndDepartment(FacultyName,DepartmentName) VALUES ('Iqtisadiyyat','Maliyye ve idareetme')

INSERT INTO BachelorGroups(GroupName,StudentsInGroup) VALUES('Informasiya texnologiyalari 1',20)
INSERT INTO BachelorGroups(GroupName,StudentsInGroup) VALUES('Informasiya tehlukesizliyi 2',24)
INSERT INTO BachelorGroups(GroupName,StudentsInGroup) VALUES('Riyaziyyat ve Informatika muellimliyi 4B',26)
INSERT INTO BachelorGroups(GroupName,StudentsInGroup) VALUES('Fizika muellimliyi 3',19)
INSERT INTO BachelorGroups(GroupName,StudentsInGroup) VALUES('Muhasibat Ucotu 3',34)

INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Dave McQueen',2,1500)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Jack Underhill',1,1000)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Maria Kully',3,500)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Gifford Bob',1,1200)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Jess Tyler',1,900)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Jackson Teylor',4,1030)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Thomas Darin',3,700)
INSERT INTO Teachers(TeacherFullName,FacultyAndDepartmentId,TeacherSalary) VALUES('Diana Harris',5,1100)


INSERT INTO WeeklySchedule(FacultyId,DepartmentId,TeacherId,GroupId,RoomsNumber,SubjectName,WeekDays) 
VALUES (1,1,2,1,201,'Verilenlerin emali texnologiyasi','Monday'),
       (2,2,1,2,203,'Sebeke texnologiyalari','Monday'),
	   (3,3,3,4,201,'Kvant Nezeriyyesi','Tuesday'),
	   (1,1,4,1,204,'Veb Proqramlasdirma','Tuesday'),
	   (2,2,1,1,201,'Alqoritmler nezeriyyesi','Wednesday'),
	   (1,1,5,1,205,'Verilenler bazasi idareetme sistemleri','Wednesday'),
	   (4,4,6,3,201,'Hesablama riyaziyyati','Thursday'),
	   (3,3,7,4,203,'Mexanika','Thursday'),
	   (5,5,8,5,202,'Idareetmenin prinsipleri','Friday')

     (2,1,5,1,205,'Verilenler bazasi idareetme sistemleri','Friday')
	   




SELECT DepartmentName,Count(TeacherFullName) as TeacherCount
FROM Teachers
JOIN FacultyAndDepartment ON FacultyAndDepartmentId=FacultyAndDepartment.Id            --1--
WHERE DepartmentName='Texnologiya'
GROUP BY DepartmentName


SELECT FacultyName, AVG(TeacherSalary) as OrtaEmekHaqqi
FROM Teachers
JOIN FacultyAndDepartment ON FacultyAndDepartmentId=FacultyAndDepartment.Id           --6--
WHERE FacultyName='Komputer Elmleri'
GROUP BY FacultyName


SELECT *
FROM BachelorGroups
WHERE StudentsInGroup IN (SELECT MIN(StudentsInGroup) FROM BachelorGroups)    

SELECT *                                                                             --7--
FROM BachelorGroups
WHERE  StudentsInGroup IN  (SELECT MAX(StudentsInGroup) FROM BachelorGroups)     


SELECT DepartmentName, AVG(TeacherSalary) as OrtaMaliyyelesdirme
FROM Teachers
JOIN FacultyAndDepartment ON FacultyAndDepartmentId=FacultyAndDepartment.Id          --8--
GROUP BY DepartmentName
		
		
SELECT TeacherFullName, COUNT(SubjectName) as MuhazireSayi
FROM Teachers
JOIN  WeeklySchedule ON TeacherId=Teachers.Id                          --2--
WHERE TeacherFullName='Dave McQueen'
GROUP BY TeacherFullName

SELECT RoomsNumber, COUNT(SubjectName) as MuhazireSayi
FROM WeeklySchedule                                                        --3--
WHERE RoomsNumber=201
GROUP BY RoomsNumber


SELECT RoomsNumber, COUNT(SubjectName) as MuhazireSayi
FROM WeeklySchedule                                                        --4--
GROUP BY RoomsNumber

SELECT TeacherFullName,COUNT(SubjectName) as DerslerinSayi
FROM Teachers
JOIN  WeeklySchedule ON TeacherId=Teachers.Id                          --9--
GROUP BY TeacherFullName

SELECT WeekDays,COUNT(SubjectName) as MuhazireSayi
FROM WeeklySchedule                                                     --10--
GROUP BY WeekDays


SELECT RoomsNumber,COUNT(DepartmentName) as KafedralarUzre
FROM FacultyAndDepartment
JOIN  WeeklySchedule ON DepartmentId =FacultyAndDepartment.Id                          --11--
GROUP BY RoomsNumber


SELECT FacultyName, COUNT(SubjectName) AS FenlerinSayi
FROM FacultyAndDepartment                                                            --12--
JOIN  WeeklySchedule ON FacultyId=FacultyAndDepartment.Id
GROUP BY FacultyName
 

 SELECT TeacherFullName,RoomsNumber,COUNT(SubjectName) AS MuhazirlerinSayi
 FROM Teachers
 JOIN  WeeklySchedule ON TeacherId=Teachers.Id
 GROUP BY TeacherFullName,RoomsNumber