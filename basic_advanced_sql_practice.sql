--  --Counting repeted/duplicate name from table 
select 
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
count(u.first_name) as Counting_Name 
from accounts_customuser u
group by (u.first_name)
having count(u.first_name) > 1;


-- Filtering the employee whose name start with L and whose salary > 40000 and belongs to IT department using Joins
select 
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
u.email as Email,
e.current_salary as Salary,
d.name as Department_Name
from accounts_customuser u
Left join employee_employee e
on  e.user_id = u.id
right join deparment_department d 
on e.department_id = d.id
where e.current_salary > 40000 and d.name = 'IT department' and first_name like "L%";

-- Joining mutliple table and filtering data by status,remarks and date
select
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
u.email as Email,
a.status as Status,
a.remarks as Remarks,
a.date as Today_date
from accounts_customuser u
inner join employee_employee e
on e.user_id = u.id
inner join attendance_attendance a
on a.employee_id = e.id
where a.status = "Present" and a.remarks = "Late" and a.date = "2025-06-18"
group by(u.id)
;



-- counting by id,filtering by deparment,status,remarks,date and joining multiple table(user,employee,deparment,salary)
select 
count(distinct u.id) Total_Late_Emp,
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
d.name as Department,
a.status as Status,
a.remarks as Remarks,
a.date as Today_date
from accounts_customuser u
inner join employee_employee e on e.user_id = u.id
inner join deparment_department d on e.department_id = d.id
inner join attendance_attendance a on a.employee_id = e.id
where a.status = "Present" and a.remarks="Late" and d.name = 'Computer Science' and a.date = "2025-06-18"
group by(u.id); 

-- Finding the employee whose check_in,check_out and worked_hours is Null and filtering by whose department is Engineering  
select
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
d.name as Department,
a.check_in,
a.check_out,
a.worked_hours
from accounts_customuser u
left join employee_employee e on e.user_id = u.id
left join deparment_department d on e.department_id = d.id
left join attendance_attendance a on a.employee_id = e.id 
where a.check_in is null and a.worked_hours is null and a.check_out is null and d.name = "Engineering Department"
group by(u.id);


-- finding top 3 highest paid employee
select 
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
u.email as Email,
e.current_salary as Highest_Salary_Paid
from accounts_customuser u
right join employee_employee e on e.user_id = u.id
order by (e.current_salary) desc
limit 3;

-- finding top 4 lowest paid employee
select 
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
u.email as Email,
e.current_salary as Lowest_Salary_Paid
from accounts_customuser u
right join employee_employee e on e.user_id = u.id
where e.current_salary is not null
order by (e.current_salary) asc
limit 4;

-- finding top 4 employee who take most absent and status is Approved 
select
concat(u.first_name, ' ',  u.last_name) as Employee_Name,
datediff(lr.end_date,lr.start_date) +1 as Highest_Absent_Days,
lr.status as Status
from accounts_customuser u 
left join employee_employee e
on e.user_id = u.id
left join leave_request_leaverequest lr 
on lr.employee_id = e.id
where lr.status = "Approved"
order by lr.start_date desc,lr.end_date asc
limit 4;








