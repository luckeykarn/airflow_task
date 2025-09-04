emp_without_department = ("""
    
        select 
        u.id as Emp_ID,
        concat(u.first_name, " ", u.last_name) as Emp_Name,
        IFNULL(d.name, 'NULL') AS Department
    from accounts_customuser u
    left join employee_employee e on e.user_id = u.id 
    left join deparment_department d ON  e.department_id =d.id
    where d.name is null
    group by Emp_Name, d.name
    order by u.id asc ;
    
""")
    
    
