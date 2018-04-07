-- COMMENT
/*This is the most dangerous line of sql code*/
DROP DATABASE IF EXISTS 201FinalProject;
CREATE DATABASE 201FinalProject;
USE 201FinalProject;

CREATE TABLE Norm_user(
	norm_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NULL,
    username VARCHAR(50) NOT NULL,
    _password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    image_url VARCHAR(50) NULL,
    enrolled_date DATETIME NULL
);

CREATE TABLE Student_user(
	student_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NULL,
    username VARCHAR(50) NOT NULL,
    _password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    image_url VARCHAR(50) NULL,
    enrolled_date DATETIME NULL
);

CREATE TABLE Professor_user(
	prof_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NULL,
    username VARCHAR(50) NOT NULL,
    _password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    image_url VARCHAR(50) NULL,
    enrolled_date DATETIME NULL
);

INSERT INTO  Student_user(fname, lname,username,_password,email,image_url,enrolled_date)
	VALUES ('Sheldon', 'Cooper','cooper','cooperSheld','sheldon@usc.edu',NULL, NULL),
				   ('Leonard', 'Hofstadter','leonard','hofstadterLeo','Leo@usc.edu',NULL, NULL),
				   ('Howard', 'Wolowitz', 'howard','wolowitzH','howard@usc.edu',NULL, NULL),
                   ('Rajesh', 'Koothrapalli', 'Kooth','rajeshKOO','KOO@usc.edu',NULL, NULL);

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

CREATE TABLE Category(
	category_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(45) NOT NULL
);

CREATE TABLE Announcement(
	announcement_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    time DATETIME NOT NULL,
    prof_id INT(11),
    student_id INT(11),
    course_id INT(11),
	FOREIGN KEY fk1(student_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk2(prof_id) REFERENCES Professor_user(prof_id),
	FOREIGN KEY fk3(course_id) REFERENCES Course(course_id)
    
);


CREATE TABLE Question (
	question_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    content VARCHAR(45) NOT NULL,
	time DATETIME NOT NULL,
    student_asking_id INT(11) NULL,
    norm_asking_id INT(11) NULL,
    category_id INT(11) NOT NULL,
    FOREIGN KEY fk1(category_id) REFERENCES Category(category_id),
    FOREIGN KEY fk2(student_asking_id) REFERENCES Student_user(student_id),
	FOREIGN KEY fk3(norm_asking_id) REFERENCES Norm_user(norm_id)
);

CREATE TABLE Post(
	post_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    question_id INT(11) NOT NULL,
    course_id INT(11) NOT NULL,
    FOREIGN KEY fk1(course_id) REFERENCES Course(course_id),
    FOREIGN KEY fk2(question_id) REFERENCES Question(question_id)
);


INSERT INTO Category(type)
 VALUES('C++'),
			   ('Java'),
               ('Data Structure'),
               ('Algorithm design'),
               ('Network theory');

CREATE TABLE Preference(
	preference_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    category_id INT(11) NOT NULL,
    student_id INT(11) NULL,
    norm_id INT(11) NULL,
    prof_id INT(11) NULL,
    FOREIGN KEY fk1(category_id) REFERENCES Category(category_id),
    FOREIGN KEY fk2(student_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk3(norm_id) REFERENCES Norm_user(norm_id),
    FOREIGN KEY fk4(prof_id) REFERENCES Professor_user(prof_id)
);

CREATE TABLE Answer(
	answer_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    time DATETIME NOT NULL,
    content VARCHAR(45) NULL,
	student_answering_id INT(11) NULL,
    norm_answering_id INT(11) NULL,
    prof_answering_id INT(11) NULL,
    related_post_id INT(11) NULL,
    related_announcement_id INT(11) NULL,
    FOREIGN KEY fk1(student_answering_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk2(prof_answering_id) REFERENCES Norm_user(norm_id),
    FOREIGN KEY fk3(norm_answering_id) REFERENCES Professor_user(prof_id),
    FOREIGN KEY fk4(related_post_id) REFERENCES Post(post_id),
    FOREIGN KEY fk5(related_announcement_id) REFERENCES Announcement(announcement_id)
);

CREATE TABLE Comment(
	comment_id INT(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
	time DATETIME NOT NULL,
	student_id INT(11) NULL,
    norm_id INT(11) NULL,
    prof_id INT(11) NULL,
    content VARCHAR(45) NULL,
    answer_commented_id INT(11),
    FOREIGN KEY fk1(answer_commented_id) REFERENCES Answer(answer_id),
	FOREIGN KEY fk2(student_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk3(norm_id) REFERENCES Norm_user(norm_id),
    FOREIGN KEY fk4(prof_id) REFERENCES Professor_user(prof_id)
);

CREATE TABLE Course_professor(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_id INT(11) NOT NULL,
    prof_id INT(11) NULL,
    FOREIGN KEY fk1(course_id) REFERENCES Course(course_id),
    FOREIGN KEY fk2(prof_id) REFERENCES Professor_user(prof_id)
);

CREATE TABLE Course_student(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_id INT(11) NOT NULL,
    student_id INT(11) NULL,
    FOREIGN KEY fk1(course_id) REFERENCES Course(course_id),
    FOREIGN KEY fk2(student_id) REFERENCES Student_user(student_id)
);

CREATE TABLE Course_studentTA(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_id INT(11) NOT NULL,
    student_id INT(11) NULL,
    FOREIGN KEY fk1(course_id) REFERENCES Course(course_id),
    FOREIGN KEY fk2(student_id) REFERENCES Student_user(student_id)
);

CREATE TABLE User_endorse_answer(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    student_id INT(11) NULL,
    prof_id INT(11) NULL,
    norm_id INT(11) NULL,
    answer_id iNT(11) NOT NULL,
    FOREIGN KEY fk1(student_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk2(prof_id) REFERENCES Professor_user(prof_id),
    FOREIGN KEY fk3(norm_id) REFERENCES Norm_user(norm_id),
    FOREIGN KEY fk4(answer_id) REFERENCES Answer(answer_id)
	
);

CREATE TABLE User_endorse_question(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    student_id INT(11) NULL,
    prof_id INT(11) NULL,
    norm_id INT(11) NULL,
    question_id iNT(11) NOT NULL,
    FOREIGN KEY fk1(student_id) REFERENCES Student_user(student_id),
    FOREIGN KEY fk2(prof_id) REFERENCES Professor_user(prof_id),
    FOREIGN KEY fk3(norm_id) REFERENCES Norm_user(norm_id),
    FOREIGN KEY fk4(question_id) REFERENCES Question(question_id)
	
);

    

