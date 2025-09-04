department_contain_emp = ("""
    select 
            d.name AS DEPARTMENT,
            count(u.id) AS Total_employees
    from accounts_customuser u
    left join employee_employee e on e.user_id = u.id 
    left join deparment_department d ON  e.department_id =d.id
    group by d.id
    order by Total_employees,u.id desc;
    
""")
    