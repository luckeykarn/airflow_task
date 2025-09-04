-- Creating a logs table for triggers
create table logs(
id int primary key auto_increment,
message text,
created_at datetime default current_timestamp
);


-- creating after triggers while new user register in the db 
DELIMITER //

CREATE TRIGGER after_employee_creation
AFTER INSERT ON accounts_customuser
FOR EACH ROW
BEGIN
  INSERT INTO logs(message)
  VALUES (CONCAT("New User Register: ", NEW.first_name, " ", NEW.last_name));
END;
//

DELIMITER ;


-- Creating a logs table for triggers
create table blog_log(
id int primary key auto_increment,
message text,
created_at datetime default current_timestamp
);

-- creating after triggers while new blog is created in the db 
DELIMITER //
create trigger after_blog_creation
after insert on blog_blog
for each row
begin
insert into blog_log(message)
value(CONCAT("New blog posted by User ID: ", NEW.user_id, " - ", NEW.title));
end;
//

DELIMITER ;

-- Creating a logs table for deleted blog
CREATE TABLE IF NOT EXISTS delete_blog(
    id INT PRIMARY KEY AUTO_INCREMENT,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- creating before triggers while blog is deleted by user in the db 
DELIMITER //

CREATE TRIGGER before_blog_deletion
BEFORE DELETE ON blog_blog
FOR EACH ROW
BEGIN
    INSERT INTO delete_blog(message)
    VALUES (
        CONCAT(
            'Blog deleted: Title="', OLD.title, 
            '", UserID=', OLD.user_id, 
            ', BlogID=', OLD.id
        )
    );
END;
//

DELIMITER ;

Drop trigger delete_blog;
