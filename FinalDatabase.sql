-- COMMENT
/*This is the most dangerous line of sql code*/
CREATE DATABASE 201FinalProject;
USE 201FinalProject;

CREATE TABLE user(
	user_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NULL,
    username VARCHAR(50) NOT NULL,
    _password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    image_url VARCHAR(50) NULL,
    enrolled_date DATETIME NULL,
    typeID INT(11) NOT NULL
);

INSERT INTO user (fname, lname)
	VALUES ('Sheldon', 'Cooper','cooper','cooperSheld','sheldon@usc.edu',NULL, NULL, 1),
				   ('Leonard', 'Hofstadter','leonard','hofstadterLeo','Leo@usc.edu',NULL, NULL, 2),
				   ('Howard', 'Wolowitz', 'howard','wolowitzH','howard@usc.edu',NULL, NULL, 3),
                   ('Rajesh', 'Koothrapalli', 'Kooth','rajeshKOO','KOO@usc.edu',NULL, NULL, 1);

CREATE TABLE Course (
	course_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    prefix VARCHAR(4) NOT NULL,
    num INT(3) NOT NULL
);

INSERT INTO Course(prefix, num)
	VALUES('CSCI', 103),
				  ('CSCI', 104),
                  ('CSCI', 201),
                  ('EE', 109),
                  ('EE', 209);
CREATE TABLE post(
	post_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    question_id INT(11) NOT NULL,
    course_id INT(11) NOT NULL
);
CREATE TABLE ANNOUNCEMENT(
	announcement_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    time TIME(45) NOT NULL,
    user_id INT(11),
    course_id INT(11) 
);
CREATE TABLE Question (
	question_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    content VARCHAR(45) NOT NULL,
    time time(45) NOT NULL,
    user_asking_id INT(11) NOT NULL,
    FOREIGN KEY fk1(category_id) REFERENCES Category(category_id)
    
);

CREATE TABLE Category(
	category_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(45) NOT NULL
);
INSERT INTO Category(type)
 VALUES('C++'),
			   ('Java'),
               ('Data Structure'),
               ('Algorithm design'),
               ('Network theory');
               

CREATE TABLE answer(
	answer_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    time TIME(45) NOT NULL,
    content VARCHAR(45) NULL,
    user_answering_id INT(11) NOT NULL,
    related_post_id INT(11) NOT NULL,
    related_announcement_id INT(11) NOT NULL
);

CREATE TABLE comment(
	comment_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	time TIME(45) NOT NULL,
    user_id INT(11) NOT NULL,
    content VARCHAR(45) NULL,
    answer_commented_id INT(11)
);

CREATE TABLE course_user(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    FOREIGN KEY fk1(course_id) REFERENCES Course(course_id),
    FOREIGN KEY fk2(user_id) REFERENCES user(user_id)
);

CREATE TABLE user_endorse_answer(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    answer_id iNT(11) NOT NULL,
    FOREIGN KEY fk1(user_id) REFERENCES user(user_id),
    FOREIGN KEY fk2(answer_id) REFERENCES answer(answer_id)
);

CREATE TABLE user_endorse_question(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    question_id iNT(11) NOT NULL,
    FOREIGN KEY fk1(user_id) REFERENCES user(user_id),
    FOREIGN KEY fk2(question_id) REFERENCES Question(answer_id)
);

    

