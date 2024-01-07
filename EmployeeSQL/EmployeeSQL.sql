-- Drop the table if it exists
DROP TABLE IF EXISTS titles, employees, departments, 
dept_emp, dept_manager, salaries CASCADE;

-- Create the titles table
CREATE TABLE titles (
    title_id CHAR(5) NOT NULL,
    title VARCHAR(20) NOT NULL,
    PRIMARY KEY (title_id)
);

-- Select all rows from the titles table
SELECT * FROM titles;

-- Create the employees table
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

-- Select all rows from the employees table
SELECT * FROM employees;

-- Create the departments table
CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Select all rows from the departments table
SELECT * FROM departments;

-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Select all rows from the dept_emp table
SELECT * FROM dept_emp;

-- Create the dept_manager table
CREATE TABLE dept_manager (
	dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Select all rows from the dept_manager table
SELECT * FROM dept_manager;

-- Create the salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, salary)
);

-- Select all rows from the salaries table
SELECT * FROM salaries;