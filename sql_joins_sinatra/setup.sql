DROP DATABASE IF EXISTS students_example;
CREATE DATABASE students_example;
\c students_example

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name varchar(255),
    address text
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title varchar(255),
    teacher varchar(255)
);

CREATE TABLE courses_students (
    id SERIAL PRIMARY KEY,
    student_id integer,
    course_id integer
);

INSERT INTO students (name, address) VALUES ('Carl', '123 Blank St.');
INSERT INTO students (name, address) VALUES ('Patti', '124 Blank St.');
INSERT INTO students (name, address) VALUES ('Stu', '121 Blank St.');
INSERT INTO students (name, address) VALUES ('Monica', '119 Blank St.');
INSERT INTO students (name, address) VALUES ('Kyle', '118 Blank St.');
INSERT INTO students (name, address) VALUES ('Werner', '120 Blank St.');
INSERT INTO students (name, address) VALUES ('Fin', '117 Blank St.');


INSERT INTO courses (title, teacher) VALUES ('Algebra', 'Suzanne Collins');
INSERT INTO courses (title, teacher) VALUES ('English', 'Veronica Roth');
INSERT INTO courses (title, teacher) VALUES ('Calculus', 'J.K. Rowling');
INSERT INTO courses (title, teacher) VALUES ('Economics', 'Jane Austen');
INSERT INTO courses (title, teacher) VALUES ('History', 'F. Scott Fitzgerald');
INSERT INTO courses (title, teacher) VALUES ('Psychology', 'Charlotte Brontë');
INSERT INTO courses (title, teacher) VALUES ('Math', 'Albert Einstein');

INSERT INTO courses_students (student_id, course_id) VALUES (1, 1);
INSERT INTO courses_students (student_id, course_id) VALUES (1, 2);
-- INSERT INTO courses_students (student_id, course_id) VALUES (1, 3);
-- INSERT INTO courses_students (student_id, course_id) VALUES (1, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (1, 5);
INSERT INTO courses_students (student_id, course_id) VALUES (1, 6);
-- INSERT INTO courses_students (student_id, course_id) VALUES (1, 7);

INSERT INTO courses_students (student_id, course_id) VALUES (2, 1);
INSERT INTO courses_students (student_id, course_id) VALUES (2, 2);
INSERT INTO courses_students (student_id, course_id) VALUES (2, 3);
INSERT INTO courses_students (student_id, course_id) VALUES (2, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (2, 5);
-- INSERT INTO courses_students (student_id, course_id) VALUES (2, 6);

-- INSERT INTO courses_students (student_id, course_id) VALUES (3, 1);
-- INSERT INTO courses_students (student_id, course_id) VALUES (3, 2);
INSERT INTO courses_students (student_id, course_id) VALUES (3, 3);
INSERT INTO courses_students (student_id, course_id) VALUES (3, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (3, 5);
INSERT INTO courses_students (student_id, course_id) VALUES (3, 6);

-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 1);
-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 2);
-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 3);
-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 5);
-- INSERT INTO courses_students (student_id, course_id) VALUES (4, 6);

-- INSERT INTO courses_students (student_id, course_id) VALUES (5, 1);
-- INSERT INTO courses_students (student_id, course_id) VALUES (5, 2);
-- INSERT INTO courses_students (student_id, course_id) VALUES (5, 3);
INSERT INTO courses_students (student_id, course_id) VALUES (5, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (5, 5);
-- INSERT INTO courses_students (student_id, course_id) VALUES (5, 6);

INSERT INTO courses_students (student_id, course_id) VALUES (6, 1);
INSERT INTO courses_students (student_id, course_id) VALUES (6, 2);
INSERT INTO courses_students (student_id, course_id) VALUES (6, 3);
INSERT INTO courses_students (student_id, course_id) VALUES (6, 4);
-- INSERT INTO courses_students (student_id, course_id) VALUES (6, 5);
INSERT INTO courses_students (student_id, course_id) VALUES (6, 6);
