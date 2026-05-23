CREATE DATABASE ss10;
USE ss10;

CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK(quantity >0)
);

CREATE TABLE InventoryChanges (
	change_id  INT PRIMARY KEY AUTO_INCREMENT,
    product_id  INT,
    old_quantity  INT NOT NULL,
	new_quantity  INT NOT NULL,
    change_date DATETIME,
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

DELIMITER //
CREATE TRIGGER AfterProductUpdate 
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
	INSERT INTO InventoryChanges 
    VALUE(null,OLD.product_id,OLD.quantity,NEW.quantity,NOW());
END //
DELIMITER ;
