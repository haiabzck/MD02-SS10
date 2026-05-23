USE ss10;
DELIMITER //
CREATE TRIGGER BeforeProductDelete 
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
	IF OLD.quantity > 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='sản phẩm có số lượng lớn hơn 10 không được xóa';
    END IF;
END //
DELIMITER ;
-- DROP TRIGGER BeforeProductDelete;
-- DELETE FROM products WHERE product_id =2;
