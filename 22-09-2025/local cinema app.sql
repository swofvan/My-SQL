INSERT INTO `movies`(`id`, `title`, `genre`, `release_year`, `rating`, `box_office`)
VALUES (1, 'Inception', 'Sci-Fi', 2010, 8.8, 825 +' Cr'),
       (2, 'The Dark Knight', 'Action', 2008, 9.0, 1004 + ' Cr'),
       (3, 'Interstellar', 'Sci-Fi', 2014, 8.6, 677 + ' Cr'),
       (4, 'Joker', 'Drama', 2019, 8.4, 1074 + 'Cr'),
       (5, 'Dunkirk', 'War', 2017, 7.9, 527 + 'Cr');
SELECT title, box_office AS 'Earnings_(in Cr)'
FROM movies;
SELECT title AS 'Movie Title', genre AS 'Category'
FROM movies;
SELECT *, rating AS 'IMDb Score'
FROM movies
WHERE genre IN ('Sci-Fi','Action');
SELECT *, release_year AS 'Release'
FROM movies
WHERE release_year BETWEEN 2008 AND 2015;
SELECT COUNT(*) AS 'High Rated Movies'
FROM movies
WHERE rating > 8.5;