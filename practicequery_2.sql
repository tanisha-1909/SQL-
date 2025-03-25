CREATE DATABASE college; 
USE college;

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

INSERT INTO user
(id ,age , Name, Email,Followers,Following)
VALUES
(5,14,"adam","adam@hoo.com",13,220);

INSERT INTO post
VALUES
(101,"hellol!!" , 2),
(103,"bie bie" , 3),
(104, "namaste",2),
(102,"night" ,1);

/* select clause--*/ 
SELECT * FROM user;
SELECT * FROM post;

/* creating list - IN operator*/
SELECT name,age,followers from user
 where email IN
 ("donald@gmail.com","casey@gmail.com","abc&gmail.com");

/*NOT IN*/
SELECT name,age,followers from user
where email not IN
("donald@gmail.com","casey@gmail.com","abc&gmail.com");

/*limit*/
SELECT * from user LIMIT 3; 

/* order by - ASC , DESC*/
SELECT name,age 
FROM user
order by email asc;


SELECT name,age 
FROM user
order by name DESC;

/* aggregate functions*/

/*COUNT*/ 
SELECT count(age) from user;

/*MAX*/
SELECT max(followers) from user;

/*MIN*/
SELECT min(following) from user;

/*SUM*/
SELECT sum(age) from user;

/*AVG*/
SELECT avg(user_id) from post;     

/*GROUP BY*/
SELECT age, count(id)
FROM user
GROUP BY age; 

SELECT name,max(followers)
FROM user
GROUP BY name;


/*having*/
SELECT name, max(followers) 
FROM  user
GROUP BY name
HAVING max(followers)>200;


/*GENERAL ORDER*/  
SELECT name,age,max(following)
FROM user
where following>140
GROUP BY name,age
having max(following)
order by age desc;