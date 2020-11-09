-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mhshFr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE department (
    dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_staff (
    emp_no BIGINT NOT NULL PRIMARY KEY,
    dept_no VARCHAR(20) NOT NULL
	);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
    emp_no BIGINT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES dept_staff(emp_no)
);

CREATE TABLE staff (
    emp_no BIGINT NOT NULL PRIMARY KEY,
    employee_title_id VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salary (
    emp_no BIGINT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES dept_staff (emp_no),
    salary BIGINT NOT NULL
);

CREATE TABLE title (
   employee_title_id VARCHAR(50) NOT NULL PRIMARY KEY,
   title VARCHAR(50) NOT NULL
);

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM staff
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM staff
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM staff
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;