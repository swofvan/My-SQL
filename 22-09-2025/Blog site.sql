CREATE TABLE `user` (
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    username varchar(100) NOT NULL UNIQUE,
    phone varchar(100) UNIQUE,
    email varchar(100) NOT NULL UNIQUE
    );

INSERT INTO `user` (username, phone, email)
VALUES ('Ronaldo','+91 8964 604 777', 'cr7@gmail.com'),
       ('Messi', '+91 2024 741 010', 'lm10@gmail.com'),
       ('Naymer', '+91 4560 3410 111', 'njr@gmail.com');

-- blogs table

CREATE TABLE Blogs (
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    user_id int NOT NULL,
    title varchar(100),
    content varchar(100),
    `date` varchar(100) NOT null,
    FOREIGN KEY (user_id) REFERENCES `user`(id)
);

ALTER TABLE blogs
AUTO_INCREMENT=101;

INSERT INTO blogs (user_id, title, content, `date`)
VALUES (3, 'My First Blog', 'This is the content of my first blog post.', '13-10-2025'),
       (2, 'Python Tips', 'Here are some tips for learning Python programming.', '25-05-2024'),
       (1, 'Travel Adventures', 'Sharing my recent travel experiences.', '10-07-2025');

-- comments table

#CREATE TABLE Comments (
#    id int PRIMARY KEY AUTO_INCREMENT NOT null,
#    blog_id int NOT NULL,
#    user_id int NOT NULL,
#    comment_text varchar(100),
#    `date` varchar(100),
#    FOREIGN KEY (blog_id) REFERENCES blogs(id),
#    FOREIGN KEY (user_id) REFERENCES `User`(id)
#    );
    
INSERT INTO comments (blog_id, user_id, comment_text,`date`)
VALUES (101, 1, 'Great post, John!', '14-10-2025'),
       (101, 3, 'Really enjoyed reading this!', '25-05-2024'),
       (102, 1, 'Thanks for the Python tips, Jane!', '15-07-2025');
