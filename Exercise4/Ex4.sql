USE ss10;

CREATE TABLE employees  (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	salary DECIMAL(10,2),
	email VARCHAR(100) UNIQUE,
	phone_number VARCHAR(15)
);

CREATE TABLE salary_log  (
	log_id  INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    old_salary  DECIMAL(10,2) ,
	new_salary   DECIMAL(10,2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(employee_id) REFERENCES employees(id)
);

INSERT INTO employees 
VALUE
(null,'NGUYỄN','VĂN A',15000000,'1233@gmail.com','0987654321'),
(null,'NGUYỄN','THỊ A',10000000,'1232@gmail.com','0987654321'),
(null,'NGUYỄN','VĂN B',9000000,'1234@gmail.com','0987654321'),	
(null,'NGUYỄN','THỊ B',7000000,'1213@gmail.com','0987654321'),	
(null,'NGUYỄN','VĂN C',8000000,'1123@gmail.com','0987654321'),	
(null,'NGUYỄN','THỊ C',14000000,'1223@gmail.com','0987654321'),	
(null,'NGUYỄN','VĂN D',12000000,'1423@gmail.com','0987654321'),	
(null,'NGUYỄN','THỊ D',5000000,'1231@gmail.com','0987654321'),	
(null,'NGUYỄN','VĂN E',5000000,'1253@gmail.com','0987654321'),
(null,'NGUYỄN','THỊ E',5000000,'1153@gmail.com','0987654321')			
;

DELIMITER //
CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
	INSERT INTO salary_log 
    VALUE(null,OLD.id,OLD.salary,NEW.salary,NOW());
END //
DELIMITER ;

-- UPDATE employees
-- SET salary = 10000000
-- WHERE id = 10;