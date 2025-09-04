SELECT name, marks
FROM student
WHERE marks = (
    SELECT MAX(marks)
    FROM student
);


select  
concat(u.first_name, ' ', u.last_name ) as Employee_Name,
u.email as Email,
u.role as Role
from accounts_customuser u (
	where role = "Employee";
	d.name as Department,
	a.check_in,a.check_out,a.worked_hours,
datediff(lr.end_date, lr.start_date) +1 as Total_leave_Days

left join employee_employee e on e.user_id = u.id
left join 

