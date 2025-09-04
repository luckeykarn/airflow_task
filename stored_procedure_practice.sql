-- Procedure without parameters 
DELIMITER $$
create procedure getallemp()
begin
	select 
    u.first_name,u.last_name,u.email,
    u.role,
    d.name
	from accounts_customuser u
	right join employee_employee e on e.user_id = u.id
    right join deparment_department d on e.department_id = d.id
	where u.role = 'Employee' and d.name = 'Marketing';
end$$

drop procedure getallemp;

call getallemp();



-- procedure with parameter creating department
DELIMITER $$

create procedure createdept(
    in dept_name VARCHAR(50)
)
begin
	insert into deparment_department(name)
	values(dept_name);
end$$


call createdept("Cleaning Department");

drop procedure createdept;


DELIMITER $$
create procedure delete_dept(
	in dept_name VARCHAR(50)
)
begin 
	delete from deparment_department
    where name = dept_name ;
end$$

call delete_dept("Cleaning Department");

drop procedure delete_dept;

select * from deparment_department;


DELIMITER $$
create procedure user_delete_log(
in user_id int,
in user_name varchar(50),
in user_email varchar(255)
)
 begin
	delete from accounts_customuser where id = user_id or username = user_name or email = user_email;
end$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER user_log_delete
AFTER DELETE ON accounts_customuser
FOR EACH ROW
BEGIN
    INSERT INTO delete_logs(id, created_at)
    VALUES (OLD.id, NOW());
END$$

DELIMITER ;

drop trigger user_log_delete;


SET SQL_SAFE_UPDATES = 0;
call user_delete_log(327, "luckeykarn", "luckeykarn0327@gmail.com");

SELECT * FROM blog_blog WHERE user_id = 327;

DESCRIBE accounts_customuser;

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hr_management' 
  AND TABLE_NAME = 'blog_blog' 
  AND REFERENCED_TABLE_NAME = 'accounts_customuser'
  AND COLUMN_NAME = 'user_id';
  
ALTER TABLE blog_blog
DROP FOREIGN KEY blog_blog_user_id_0e1a17e5_fk_accounts_customuser_id;



ALTER TABLE blog_blog
ADD CONSTRAINT blog_blog_user_id_0e1a17e5_fk_accounts_customuser_id
FOREIGN KEY (user_id)
REFERENCES accounts_customuser(id) 
ON DELETE CASCADE;


SHOW CREATE TABLE blog_blog;
SHOW CREATE TABLE accounts_customuser;