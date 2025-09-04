
filter_salary = ("""
    SELECT 
            concat(u.first_name, " ", u.last_name) as Emp_name,
            e.current_salary, e.created_at 
    FROM accounts_customuser u
    left join employee_employee e on e.user_id = u.id
    WHERE e.current_salary > 75000 
""")
    
    