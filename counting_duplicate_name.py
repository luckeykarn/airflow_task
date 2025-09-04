duplicate_name_query = """

    SELECT 
            u.first_name AS Emp_Name,
            COUNT(u.first_name) AS Duplicate_Name_Count
        FROM accounts_customuser u
        GROUP BY u.first_name
        HAVING COUNT(u.first_name) > 1 AND u.first_name LIKE "V%" 


"""