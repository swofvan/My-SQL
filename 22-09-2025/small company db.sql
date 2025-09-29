INSERT INTO `employees` (`id`, `name`)
VALUES (1, 'Anjali'),
      (2, 'Rohan'),
       (3, 'Meena');

INSERT INTO `departments` (`emp_id`, `department_name`)
VALUES (1, 'HR'),
       (2 ,'IT'),
       (4, 'Finance');

SELECT e.name, d.department_name 
FROM employees AS e
LEFT JOIN departments AS d
ON e.id = d.emp_id;

SELECT e.name, d.department_name 
FROM employees AS e
LEFT JOIN departments AS d
ON e.id = d.emp_id
WHERE d.department_name IS NOT null;

SELECT * FROM employees AS e
RIGHT JOIN departments AS d
ON e.id = d.emp_id;