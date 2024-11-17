-- ------------------------< jadvalni ochirish >---------------------------

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS course_assignments;

-- ------------------------< Jadval Yaratish >----------------------------

CREATE TABLE IF NOT EXISTS students(
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(50) NOT NULL, 
	student_age INTEGER CHECK(student_age >= 18 and student_age <= 24),
	student_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS courses(
	course_id SERIAL PRIMARY KEY,
	course_code UNIQUE NOT NULL,
	credits INTEGER CHECK(credits >= 1 AND credits <= 5)
);

CREATE TABLE IF NOT EXISTS enrollments(
	enrollment_id SERIAL PRIMARY KEY,
	student_id INTEGER REFERENCES studets(student_id) ON DELETE SET NULL,
	course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS teachers(
	teacher_id SERIAL PRIMARY KEY,
	teacher_name VARCHAR(50) NOT NULL,
	experience_years CHECK(experience_years >= 0)	
);

CREATE TABLE IF NOT EXISTS course_assignments(
	assignment_id SERIAL PRIMARY KEY,
	teacher_id INTEGER DEFAULT 2 REFERENCES teachers(teacher_id) ON DELETE SET DEFAULT,
	course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE
);

-- -----------------------------------< Ma'lumot Qo'shish >-----------------------------------

INSERT INTO students(student_name, student_age, student_email) VALUES
('Nozima', 18, 'AliyevaNozi@gmail.com'),
('Doston', 19, 'DostonSalimov@gmail.com'),
('Ali', 21, 'AliBekmirzayev@gmail.com'),
('Sobir', 24, 'SobirOlm@gmail.com'),
('Qahramon', 19, 'QahramonQosh@gmail.com'),
('Shahzod', 18, 'ShahzodSordorov@gmail.com'),
('Salim', 23, 'Salim@gmail.com'),
('Gozal', 20, 'GozalSodiqova@gmail.com');

INSERT INTO courses(course_code, credits) VALUES
('C++', '3'),
('C##', '1'),
('Python', '4'),
('JavaScript', '2'),
('Java', '5'),
('PHP', '3'),
('C', '4');

INSERT INTO teachers(teacher_name, experience_years) VALUES
('Nozima', '5'),
('Alisher', '2'),
('Sardor', '4'),
('Samir', '1'),
('Nargiza', '7');

INSERT INTO course_assignments(teacher_id, course_id) VALUES
(3, 5),
(1, 2),
(4, 6);

-- ------------------------< Jadvalni o’zgartirish >-----------------------------

ALTER TABLE students
RENAME TO talabalar;

ALTER TABLE talabalar
RENAME COLUMN studen_name TO talabalar_ismi;

-- ----------------------------< Malumotlarni ozgartirish >--------------------------------

UPDATE talabalar SET student_age = 23 WHERE student_id = 1;
UPDATE talabalar SET student_age = 19 WHERE student_id = 7;

-- ------------------------------< Malumotlarni ochirish >-------------------------------

DELETE FROM talabalar WHERE student_id = 4;
DELETE FROM talabalar WHERE student_id = 8;
