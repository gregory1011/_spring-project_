create table Towns (
                       id serial unique not null,
                       code varchar(10) not null, -- not unique
                       article text,
                       name text not null  -- not null
);

insert into towns
(code, article, name)
select
    left(md5(i::text), 10),
    md5(random()::text),
    md5(random()::text)
from generate_series(1, 1000000) s(i);


select count(*) from towns;

select * from towns;

EXPLAIN ANALYSE
select * from towns
where name ='4c3fd6b9c3cf94d4aa021b1b34e61f6b';

EXPLAIN ANALYSE
select * from towns
where id = 100;

create index idx_towns_name on towns(name);

drop index if exists idx_towns_name;

select
    tableName,
    indexname,
    indexdef
from
    pg_indexes
where
    schemaname ='public'
order by
    tablename,
    indexname;





