CREATE TABLE `students` (
             student_id int PRIMARY KEY NOT null, 
             name text NOT null,
             email text NOT null, 
             UNIQUE (student_id)
             );

CREATE TABLE `courses` (
             course_id int PRIMARY KEY NOT null,
             course_name text NOT null
             );

CREATE TABLE `enrollments` (
             student_id int NOT null,
             course_id int NOT null,
             FOREIGN KEY (student_id) REFERENCES students(student_id),
             FOREIGN KEY (course_id) REFERENCES courses(course_id)
             );