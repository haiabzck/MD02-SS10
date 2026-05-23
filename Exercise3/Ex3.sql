USE ss10;
DELIMITER //
CREATE TRIGGER BeforeInsertProduct
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.quantity < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='sản phẩm có số lượng nhỏ hơn 0 không thêm được';
    END IF;
END //
DELIMITER ;

-- INSERT INTO products VALUE(null,'máy tính',-1);