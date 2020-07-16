-- View table of department
SELECT * FROM department

-- View table of employee numbers and department numbers
SELECT * FROM department_employee

-- View table of department and managers
SELECT * FROM department_manager

-- View table of employees
SELECT * FROM employee

-- View table of salaries
SELECT * FROM salary

-- View table of titles
SELECT * FROM title

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee.emp_no,last_name,first_name,sex,salary
FROM employee
INNER JOIN salary ON employee.emp_no=salary.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
ALTER TABLE employee ADD hire_year VARCHAR;

UPDATE employee
SET hire_year=RIGHT(hire_date,4);

SELECT first_name,last_name,hire_date
FROM employee
WHERE hire_year='1986'

-- 3. List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
SELECT department_manager.dept_no,dept_name,department_manager.emp_no,last_name,first_name
FROM department_manager
INNER JOIN department ON department_manager.dept_no=department.dept_no
INNER JOIN employee ON department_manager.emp_no=employee.emp_no

-- 4. List the department of each employee with the following information: employee number,
-- last name, first name, and department name.
SELECT employee.emp_no,last_name,first_name,dept_name
FROM employee
INNER JOIN department_employee ON employee.emp_no=department_employee.emp_no
INNER JOIN department ON department_employee.dept_no=department.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules"
-- and last names begin with "B."
SELECT first_name,last_name,sex
FROM employee
WHERE first_name='Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name,
-- and department name.
-- From the Department Table, we know the department number of Sales department is d007.
SELECT employee.emp_no,last_name,first_name,dept_name
FROM employee
INNER JOIN department_employee ON employee.emp_no=department_employee.emp_no
INNER JOIN department ON department_employee.dept_no=department.dept_no
WHERE dept_name='Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT employee.emp_no,last_name,first_name,dept_name
FROM employee
INNER JOIN department_employee ON employee.emp_no=department_employee.emp_no
INNER JOIN department ON department_employee.dept_no=department.dept_no
WHERE dept_name='Sales' OR dept_name='Development'

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS frequency_count
FROM employee
GROUP BY last_name
ORDER BY frequency_count DESC