create table delete_student_logs(
	id int primary key auto_increment,
    message text,
    deleted_at datetime default current_timestamp
);


DELIMITER $$
create procedure student_log_delete(
in s_id int,
in s_firstname varchar(50),
in s_lastname varchar(50),
in fa_id int,
in s_email varchar(255)
)
begin
	delete from student
    where S_ID = s_id or First_Name = s_firstname  and Email = s_email;
end$$
DELIMITER ;

DELIMITER $$
create trigger student_delete_log
after delete on student
for each row
begin
		insert into delete_student_logs(message) 
        value(concat("Student deleted successfully:",old.First_Name));
end$$
DELIMITER ;

drop trigger student_delete_log;


call student_log_delete(1,"Ram","Sharma", 1, "amit.sharma@example.com");


DELETE FROM admission WHERE S_ID = 1;

SELECT * FROM admission WHERE S_ID = 1;
SELECT * FROM faculty WHERE S_ID = 1;

DESCRIBE admission;

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'sql_basic_practice' 
  AND TABLE_NAME = 'admission' 
  AND REFERENCED_TABLE_NAME = 'student'
  AND COLUMN_NAME = 'S_ID';
  
ALTER TABLE admission
DROP FOREIGN KEY admission_ibfk_1; 


ALTER TABLE admission
ADD CONSTRAINT admission_ibfk_1 
FOREIGN KEY (S_ID)
REFERENCES student(S_ID)
ON DELETE CASCADE; 


