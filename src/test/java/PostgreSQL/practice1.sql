select * from employees;

select division from departments;
select first_name from employees;

select last_name from employees;

select * from employees
where department = 'Sports';

SELECT * FROM employees
WHERE department LIKE '%nit%';

-- show me departments starts with G
select * from employees
WHERE department LIKE 'G____';

select * from employees
where salary >= 100000;

select first_name, last_name, department, salary from employees
where department = 'Clothing' and salary > 90000
order by salary desc ;

select first_name, last_name, department, salary from employees
where salary < 40000 and (department = 'Clothing' or department = 'Pharmacy');

select first_name, email from employees
where gender = 'F' and department = 'Tools' and salary > 110000 and email is not null;

select * from employees
order by first_name
limit 5;

select * from employees
order by first_name
fetch first 5 row only;

select salary as annual_salary
from employees order by salary ;

select student_name as full_name, age from students
order by age desc
limit 4;

select first_name || ' ' || last_name as full_name from employees;

select salary, (salary > 110000) as booleanValues from employees; -- boolean values


-- substring(string, start_position, length)
select substring('Developer', 3, 5) as test_data;
select substring('Developer' from 3 for 5) as test_data;


select department, replace(department, 'Clothing', 'Clothes') from departments;

-- how many employees working in pharmacy department
select count(*) from employees
where department = 'Pharmacy';
select department, count(*) from employees
group by department;

---list the departments where they have more than 40 employees
select count(*), department from employees
group by department
having count(*) > 40
order by count(*);

-- show me the duplicate email and how many times they repeat
select count(*), substr(email, position('@' in email) +1) as email_domain from employees
where email is not null
group by email_domain
having count(*) > 1
order by count(*);



-- how to find duplicates names?
select first_name, salary,
       case
           when salary < 80000 then 'Under Paid'
           when salary > 80000 then 'Well Paid'
       end as category
from employees;



-- joining
select first_name, email, division from employees E
join departments D on E.department = D.department
where email is not null;

select first_name, email, division, country from employees E
join departments D on E.department = D.department
join regions R on E.region_id = R.region_id
where email is not null
order by country desc;


select D.department from employees E
join departments D on E.department = D.department
order by department;

select D.department from employees E
left join departments D on E.department = D.department
where D.department is null
order by department;

select D.department from employees E
full join departments D on E.department = D.department
order by department;

select * from employees e
join departments d on e.department = d.department
where division = 'Electronics'
order by e.salary desc;

select * from employees
where department in
(select department from departments where division = 'Electronics');

