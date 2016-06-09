DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;


CREATE TABLE colleges
(
	college_name       VARCHAR(30)    PRIMARY KEY
);

CREATE TABLE students 
(
	student_id         INT            PRIMARY KEY,
	first_name 		   VARCHAR(30)    NOT NULL, 
	last_name 		   VARCHAR(30)    NOT NULL,
	college_name       VARCHAR(30)    NOT NULL,
	CONSTRAINT college_name_fk
		FOREIGN KEY (college_name)
		REFERENCES colleges (college_name)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE group_admin
(
	student_id        INT             PRIMARY KEY, 
	CONSTRAINT student_id_fk
		FOREIGN KEY (student_id)
		REFERENCES students (student_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE notes
(
	student_from_id INT		 	NOT NULL,
    student_to_id 	INT			NOT NULL,
    note_id 		INT			PRIMARY KEY 	UNIQUE,
    note_text		MEDIUMTEXT,
    CONSTRAINT student_from_fk
		FOREIGN KEY (student_from_id)
		REFERENCES students (student_id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT student_to_fk
		FOREIGN KEY (student_to_id)
		REFERENCES students (student_id)
		ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE table groups
(
	group_name			VARCHAR(50) NOT NULL,
    group_id			INT			PRIMARY KEY,
    college_name		VARCHAR(30),
    purpose_statement	TEXT,
    CONSTRAINT college_name_groups_fk
		FOREIGN KEY (college_name)
		REFERENCES colleges (college_name)
		ON UPDATE SET NULL ON DELETE CASCADE
);

CREATE TABLE groups_to_students
(
	group_id 		INT				NOT NULL,
    student_id		VARCHAR(30)		NOT NULL,
    PRIMARY KEY (group_id, student_id),
    CONSTRAINT group_id_reference_fk
		FOREIGN KEY (group_id)
        REFERENCES groups (group_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT student_id_reference_fk
		FOREIGN KEY (student_id)
        REFERENCES students (student_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
    

    
    
    
    
	