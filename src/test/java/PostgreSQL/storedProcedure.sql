select * from employees;

select * from employees
where employee_id = 11;

create or replace procedure update_department (emp_id int)
language plpgsql
as
    $$
    begin
        update employees set department ='Toys'
        where employee_id = emp_id;
        commit ;
    end
    $$;

call update_department(10);
select * from employees
where employee_id = 10;


call update_department(11);
select * from employees
where employee_id = 11;


