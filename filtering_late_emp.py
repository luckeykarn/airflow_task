late_emp = ("""

    select
        concat(u.first_name, ' ',  u.last_name) as Employee_Name,
        u.email as Email,
        a.status as Status,
        a.remarks as Remarks,
        a.date as Today_date
            
    from accounts_customuser u
    inner join employee_employee e on e.user_id = u.id
    inner join attendance_attendance a on a.employee_id = e.id
    where a.status = "Present" and a.remarks = "Late" and a.date = "2025-06-18"
    group by(u.id)
    ;

""")