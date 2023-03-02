CREATE TABLE a_departments (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE b_titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);

CREATE TABLE c_employees (
	emp_no VARCHAR(20) PRIMARY KEY NOT NULL,
	title_id VARCHAR(20) NOT NULL,
	birth_date VARCHAR(12),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(10),
	hire_date VARCHAR(12) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES b_titles(title_id)
);

CREATE TABLE d_dept_emp (
	emp_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES c_employees(emp_no),
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES a_departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE e_dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES a_departments(dept_no),
	emp_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES c_employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE f_salaries (
	emp_no VARCHAR(20) NOT NULL,
	salary VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES c_employees(emp_no),
	PRIMARY KEY (emp_no, salary)
);