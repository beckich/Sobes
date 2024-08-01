'TRUNCATE TABLE University;' 'для очистки таблицы'
'/* Создание таблицы с (ФИО, ID студента, Дата рождения, Пол, 
Дата поступления, Факультет, Специальность, Почта */'
CREATE TABLE University (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    EnrollmentDate DATE,
    Faculty VARCHAR(100),
    Major VARCHAR(100),
    Email VARCHAR(100)
);
'Вставка данных в таблицы'
INSERT INTO University (FirstName, LastName, MiddleName, DateOfBirth, Gender, EnrollmentDate, Faculty, Major, Email)
VALUES
('Ivan', 'Ivanov', 'Ivanovich', '2000-01-01', 'Male', '2018-09-01', 'Engineering', 'Computer Science', 'ivanov@example.com'),
('Petr', 'Petrov', 'Petrovich', '1999-05-12', 'Male', '2017-09-01', 'Engineering', 'Mechanical Engineering', 'petrov@example.com'),
('Beknur', 'Baigaltinov', 'Eduardovich', '2001-01-12', 'Male', '2018-09-01', 'Engineering', 'Nanoelectronics', 'baigaltinov@example.com'),
('Anna', 'Smirnova', 'Sergeevna', '2001-07-23', 'Female', '2016-09-01', 'Business', 'Finance', 'smirnova@example.com'),
('Polina', 'Komarova', 'Artemovna', '2000-02-15', 'Female', '2015-09-01', 'Marketing', 'Advertisement', 'Komarova@example.com');
'Изменение ФИО с ID студента'
UPDATE University
SET FirstName = 'Ayaz', LastName = 'Coach', MiddleName = 'QazaqTelecom'
WHERE StudentID = 1;

UPDATE University
SET FirstName = 'BEKS', LastName = 'BMSTU', MiddleName = 'MT11'
WHERE StudentID = 2;
'Проверка изменений'
SELECT * FROM University WHERE StudentID = 1;
'Выборка всех студентов, которые поступили после 1.08.2018'
SELECT FirstName, LastName, Faculty, EnrollmentDate
FROM University
WHERE Faculty = 'Engineering' AND EnrollmentDate > '2018-08-01';
'Выборка факультетов, на которых средний возраст студентов превышает 24 лет'
SELECT Faculty, AVG(YEAR(CURDATE()) - YEAR(DateOfBirth)) AS AverageAge
FROM University
GROUP BY Faculty
HAVING AVG(YEAR(CURDATE()) - YEAR(DateOfBirth)) > 23;

