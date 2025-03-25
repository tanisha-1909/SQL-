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


/*update row */
UPDATE user
SET followers=0 , email="@admin.com"
where following>300; 

/*safe mode*/
SET SQL_SAFE_UPDATES=0;

/*deleterow*/
DELETE from user
where age=14;

/*update table schema*/
ALTER TABLE user
ADD COLUMN city varchar(50) default "INDIA";

/*DELETE TABLE SCHEMA*/
ALTER TABLE user
DROP column city;

/*modify table name */
ALTER TABLE user
RENAME TO user_data;

show tables;

/*ALTER  COLUMN*/
ALTER TABLE post
CHANGE COLUMN user_id user_id int DEFAULT 0;

/*-ALTER CONSTRAINTS*/ 
ALTER TABLE post
ADD CONSTRAINT user_id
foreign key (user_id) references user_data(id) ON DELETE CASCADE;

/*ANOTHER WAY TO MODIFY CONSTRAINT/DATATYPE*/
ALTER TABLE post
MODIFY content varchar(200) DEFAULT ""; 


