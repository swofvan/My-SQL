INSERT INTO `user_performance` (`id`,`name`,`city`,`score`,`bonus`,`challenge`)
VALUES (1, 'Raj', 'Chennai', 88, 5, 'Fitness'),
       (2, 'Anu','Mumbai', 91, NULL, 'Diet'),
       (3, 'Ravi', 'Chennai', 78, 3, 'Fitness'),
       (4, 'Meena', 'Delhi', 82, NULL, 'Diet'),
       (5, 'Farah', 'Mumbai', 95, 4, 'Fitness'),
       (6, 'Kiran', 'Pune', 70, NULL, 'Yoga'),
       (7, 'Latha', 'Pune', 87, NULL, 'Fitness');

SELECT * FROM user_performance
WHERE score > (SELECT AVG(score) FROM user_performance);

SELECT name
FROM user_performance
WHERE `challenge` IN (SELECT challenge 
             FROM user_performance 
             WHERE name = 'Farah');