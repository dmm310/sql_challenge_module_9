-- List the employee number, last name, first name, sex, 
-- and salary of each employee.

SELECT 
c_employees.emp_no, 
c_employees.last_name, 
c_employees.first_name, 
c_employees.sex,
f_salaries.salary
FROM c_employees
INNER JOIN f_salaries ON
c_employees.emp_no=f_salaries.emp_no
LIMIT 15;

-- List the first name, last name, and hire date for the employees 
-- who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM c_employees
WHERE hire_date like '%_1986'
LIMIT 15;

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.

SELECT 
e_dept_manager.emp_no, 
e_dept_manager.dept_no, 
a_departments.dept_name, 
c_employees.last_name, 
c_employees.first_name
FROM e_dept_manager
INNER JOIN a_departments ON
e_dept_manager.dept_no=a_departments.dept_no
INNER JOIN c_employees ON
e_dept_manager.emp_no=c_employees.emp_no

-- List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.

SELECT  
d_dept_emp.dept_no, 
d_dept_emp.emp_no,
c_employees.last_name, 
c_employees.first_name,
a_departments.dept_name
FROM d_dept_emp
INNER JOIN c_employees ON
d_dept_emp.emp_no=c_employees.emp_no
INNER JOIN a_departments ON
d_dept_emp.dept_no=a_departments.dept_no
LIMIT 25;

-- List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM c_employees
WHERE first_name = 'Hercules'
AND last_name like 'B_%'

-- List each employee in the Sales department, including their 
-- employee number, last name, and first name.

SELECT 
d_dept_emp.emp_no,
d_dept_emp.dept_no,
a_departments.dept_name,
c_employees.last_name, 
c_employees.first_name
FROM d_dept_emp
INNER JOIN a_departments ON
d_dept_emp.dept_no=a_departments.dept_no
INNER JOIN c_employees ON
d_dept_emp.emp_no=c_employees.emp_no
WHERE d_dept_emp.dept_no = 'd007'

-- List each employee in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

SELECT 
d_dept_emp.emp_no,
d_dept_emp.dept_no,
a_departments.dept_name,
c_employees.last_name, 
c_employees.first_name
FROM d_dept_emp
INNER JOIN a_departments ON
d_dept_emp.dept_no=a_departments.dept_no
INNER JOIN c_employees ON
d_dept_emp.emp_no=c_employees.emp_no
WHERE d_dept_emp.dept_no = 'd007'
OR d_dept_emp.dept_no = 'd005'

-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*)
FROM c_employees
GROUP BY last_name
ORDER BY "count" DESC