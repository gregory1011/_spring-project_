select * from employees;


drop table if exists mentors;

create table mentors(
   id int generated always as identity,
   first_name varchar(40) not null,
   last_name varchar(40) not null,
   primary key(id)
);

drop table if exists mentor_audit;

create table mentor_audit (
    id int generated always as identity,
    mentor_id int not null,
    last_name varchar(40) not null,
    changed_on timestamp(6) not null,
    primary key(id)
);

insert into mentors (first_name, last_name) values ('Harold', 'Finch');
insert into mentors (first_name, last_name) values ('Severus', 'Snap');

create or replace function log_last_name_changes()
returns trigger
language plpgsql
as
    $$
    begin
        if NEW.last_name <> old.last_name then
            insert into mentor_audit(mentor_id, last_name, changed_on)
            values (old.id, old.last_name, now());
        end if;

        return NEW;
    end;
    $$;


create trigger last_name_change
    before update
    on mentors
    for each row
    execute procedure log_last_name_changes();



update mentors
set last_name ='ABC'
where id = 2;
