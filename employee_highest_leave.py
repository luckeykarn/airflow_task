
most_absent_employee = ("""
    
            SELECT 
            concat(u.first_name, " ", u.last_name) as Emp_Name,
            datediff(lr.end_date,lr.start_date) as Number_leave_days,
            lr.status

    FROM accounts_customuser u
    left join employee_employee e on e.user_id = u.id
    left join leave_request_leaverequest lr on lr.employee_id = e.id
    where status = "Approved" 
    group by u.id, u.first_name, u.last_name
    order by Number_leave_days Desc
    limit 10
    
    
""")
    

