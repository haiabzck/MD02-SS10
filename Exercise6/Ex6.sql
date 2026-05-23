USE ss10;

CREATE TABLE cart_items  (
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT NOT NULL CHECK(quantity >0),
	FOREIGN KEY(product_id) REFERENCES products(product_id)
);

DELIMITER //
CREATE TRIGGER before_cart_add
BEFORE INSERT ON cart_items
FOR EACH ROW
BEGIN
	DECLARE old_quantity INT;
    SET old_quantity = (SELECT quantity FROM products WHERE product_id=NEW.product_id);
	IF NEW.quantity > old_quantity THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Số lượng hàng trong kho không đủ'; 
    END IF;
END //
DELIMITER ;

INSERT INTO products VALUE(null,'Iphone 15',5);

INSERT INTO cart_items(product_id,quantity) VALUE(5,2);
SELECT * FROM cart_items;

INSERT INTO cart_items(product_id,quantity) VALUE(5,6);
