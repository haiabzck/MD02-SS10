USE ss10;

CREATE TABLE orders   (
	id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
	total_amount DECIMAL(10, 2),
	order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(50) CHECK(status IN('Pending', 'Shipping', 'Completed', 'Cancelled'))
);

CREATE TABLE order_logs  (
	log_id  INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    old_status VARCHAR(50) ,
	new_status VARCHAR(50) ,
	log_date TIMESTAMP ,
    FOREIGN KEY(order_id) REFERENCES orders(id)
);

DELIMITER //
CREATE TRIGGER after_order_status_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
	IF OLD.status <> NEW.status THEN
    INSERT INTO order_logs VALUE(null,OLD.id,OLD.status,NEW.status,NOW());
    END IF;
END//
DELIMITER ;

INSERT INTO orders VALUE(null,'ANH HÀO',12000000,DEFAULT,'Pending');
UPDATE orders SET status = 'Shipping' WHERE id = 1;
UPDATE orders SET customer_name = 'VĂN A' WHERE id = 1;