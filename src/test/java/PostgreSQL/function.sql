select * from employees;

create or replace function get_departments_count_by_name(dep_name varchar)
    returns int
    language plpgsql
as
$$
declare
    department_count integer;
begin
    select count(*)
    into department_count
    from employees
    where department =dep_name;

    return department_count;
end;
$$;
select get_departments_count_by_name('Furniture');


-- to drop of a function
      drop function get_departments_count_by_name(dep_name varchar);




create  or replace function get_department(p_pathern varchar)
    returns table(

                     employee_name varchar,
                     employee_email varchar
                 )
    language plpgsql
as
$$
BEGIN
    return query
        select first_name, email from employees
        where department ilike p_pathern;
end;
$$;

select * from get_department('%G');


