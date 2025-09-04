-- Creating a view to list female staff in the table 

create  view female_staff_employee as
select 
id as Emp_id,
concat(first_name, ' ', last_name),
gender
from accounts_customuser
where gender = 'female'
group by id;

drop view female_staff_employee;

select * from female_staff_employee;


select 
count(*) as Total_count
from female_staff_employee;



-- Creating a view to count employee whose first_name start with V that have same name in db 
create view double_name as
select 
first_name as Employee_name,count(first_name)
from accounts_customuser
where first_name like 'V%'
group by first_name
having count(first_name) > 1
;

Drop view double_name;

select * from double_name;


-- Creating view to see list of employee in computer_science dept 
create view employee_computer_science_department as
select
u.id as Emp_id,
concat(u.first_name, ' ', u.last_name) as Employee_name,
u.email as Email,
d.name as Departmnent
from accounts_customuser u
right join employee_employee e on e.user_id = u.id
right join deparment_department d on e.department_id = d.id
where name = 'Computer Science';

drop view employee_computer_science_department;

select * from employee_computer_science_department;

