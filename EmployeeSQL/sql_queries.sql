--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
select 
em.emp_no as "employee number"
, em.last_name as "last name"
, em.first_name as "first name"
, em.gender
, sa.salary 
from employees em, salaries sa
where em.emp_no = sa.emp_no
order by em.emp_no

--2. List employees who were hired in 1986.
select *
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select 
dm.dept_no as "department number"
, dp.dept_name as "department name"
, em.emp_no as "employee number"
, em.last_name as "last name"
, em.first_name as "first name"
, tt.from_date as "start employment" 
, tt.to_date as "end employment"
from departments dp, dept_manager dm,  employees em, titles tt
where dp.dept_no = dm.dept_no and dm.emp_no = em.emp_no and dm.emp_no = tt.emp_no
and tt.title = 'Manager'
order by dm.dept_no , em.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select em.emp_no as "employee number"
, em.last_name as "last name"
, em.first_name as "first name"
, dp.dept_name as "department name"
from employees em, dept_emp de, departments dp
where em.emp_no = de.emp_no and de.dept_no = dp.dept_no
order by em.emp_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where first_name like 'Hercules'
and last_name like 'B%'
order by first_name, last_name

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select em.emp_no as "employee number"
, em.last_name as "last name"
, em.first_name as "first name"
, dp.dept_name as "department name"
from employees em, dept_emp de, departments dp
where em.emp_no = de.emp_no and de.dept_no = dp.dept_no 
and dp.dept_name = 'Sales'
order by em.emp_no

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select em.emp_no as "employee number"
, em.last_name as "last name"
, em.first_name as "first name"
, dp.dept_name as "department name"
from employees em, dept_emp de, departments dp
where em.emp_no = de.emp_no and de.dept_no = dp.dept_no 
and dp.dept_name in ('Sales','Development')
order by em.emp_no

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name 
order by last_name desc



