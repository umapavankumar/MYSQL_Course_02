use employees;
select emp_no,first_name,last_name,
case 
	when gender='M' then 'Male'
    else 'Female'
end as gender 
from employees;

select emp_no,first_name,last_name,
case gender 
	when 'M' then 'Male'
    else 'Female'
end as gender
from
	employees;
select * from employees;

select emp_no,first_name,last_name,
if(gender='M','Male','Female') as gender
from employees;

