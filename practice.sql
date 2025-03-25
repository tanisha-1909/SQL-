CREATE DATABASE college;
CREATE DATABASE xyz;
DROP DATABASE xyz;
 
USE college;
CREATE TABLE student(
	roll_no int,
    name varchar(30),
    age INT
);

INSERT INTO student VALUES 
(101, "adam",12),
(102,"bob",14);

SHOW DATABASES;
USE college;
SHOW tables;

CREATE TABLE user(
	id INT UNIQUE,
    age INT,
    Name VARCHAR(30) NOT NULL,
    Email VARCHAR(60) UNIQUE,
    Followers INT DEFAULT 0,
    Following INT DEFAULT 0,
    CONSTRAINT age_check CHECK (age>=13),
    PRIMARY KEY (id,name)
);

CREATE TABLE post(
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

/* insert into table--*/ 
INSERT INTO user
(id ,age , Name, Email,Followers,Following)
VALUES
(1,14,"adam","adam@yahoo.com",123,145),
(2,15,"bob","bob123@gmail.com",200,200),
(3,16,"casey","casey@gmail.com",300,306),
(4,17,"donald","donald@gmail.com",202,105);

INSERT INTO post
VALUES
(101,"hellol!!" , 2),
(103,"bie bie" , 3),
(104, "namaste",2),
(102,"night" ,1);

/* select clause--*/ 
SELECT * FROM user;
SELECT * FROM post;
SELECT email,followers from user;
SELECT DISTINCT user_id from post;
DROP TABLE user;

/* where clause--*/ 
SELECT name from user where followers>=200 and age<=15;
SELECT email from user where following -10 <=300;
SELECT age from user where email!="bob123@gmail.com";
SELECT content from post where user_id=1 or user_id=2;
SELECT age from user where age between 15 and 17;


/* creating list - IN operator*/
SELECT name,age,followers from user
 where email IN
 ("donald@gmail.com","casey@gmail.com","abc&gmail.com");

/*NOT IN*/
SELECT name,age,followers from user
where email not IN
("donald@gmail.com","casey@gmail.com","abc&gmail.com");