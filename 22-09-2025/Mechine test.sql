-- Write a query to get the list of employees who took more than 5 leaves and are in the sales department.

-- Write a query to get the number of employees working in operations department.

-- Write a single query to get the count of employees working in each department.

-- Write a query to list the departments where all its employees altogether took more than 10 leaves.

-- Write a query to list all the employee names who have passed the exam.

-- Write a query to list all the employee names who have not attended the exam.

CREATE TABLE `employee` (
       id int AUTO_INCREMENT NOT null,
       name varchar(100) NOT null,
       department varchar(100),
       `leave` int,
       PRIMARY KEY (id)
       );

INSERT INTO employee (name, department, `leave`)
VALUES ('raju', 'sales', 1),
       ('sangeetha', 'sales', 3),
       ('vinay', 'operations', 8),
       ('abey', 'packing', 2),
       ('thomas', 'packing', 1),
       ('muneer', 'operations', 7),
       ('aparna', 'sales', 3),
       ('abid', 'operations', 9),
       ('fathima', 'sales', 11),
       ('varghese', 'operations', 14);

CREATE TABLE exam (
       id int AUTO_INCREMENT NOT null,
       employee_id int,
       exam_status varchar(100),
       PRIMARY KEY (id),
       FOREIGN KEY (employee_id) REFERENCES employee(id)
       );

INSERT INTO exam (employee_id, exam_status)
VALUES (2, 'pass'),
       (5, 'fail'),
       (1, 'fail'),
       (8, 'pass'),
       (3, 'pass'),
       (1, 'pass'),
       (6, 'fail'),
       (9, 'pass'),
       (10, 'pass');

SELECT name, `leave`
FROM employee
WHERE `leave` > 5 AND department = 'sales'; 

SELECT COUNT(name)
FROM employee
WHERE department = 'operations';

SELECT department, COUNT(id) AS total_employee
FROM employee
GROUP BY department;

SELECT department
FROM employee
GROUP BY department
HAVING SUM(`leave`) > 10;

SELECT employee.name, exam.exam_status
FROM employee
INNER JOIN exam
ON employee.id = exam.employee_id
WHERE exam_status = 'pass';

SELECT employee.name
FROM employee
LEFT JOIN exam
ON employee.id = exam.employee_id
WHERE exam_status IS null;