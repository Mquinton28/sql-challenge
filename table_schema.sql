-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mhshFr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE department (
    dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_staff (
    emp_no BIGINT NOT NULL,
    dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES staff(emp_no),
	PRIMARY KEY (emp_no, dept_no)
	);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,
    emp_no BIGINT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES staff(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE staff (
    emp_no BIGINT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title(emp_title_id)
);

CREATE TABLE salary (
    emp_no BIGINT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES staff(emp_no),
    salary BIGINT NOT NULL
);

CREATE TABLE title (
   emp_title_id VARCHAR(50) NOT NULL PRIMARY KEY,
   title VARCHAR(50) NOT NULL
);