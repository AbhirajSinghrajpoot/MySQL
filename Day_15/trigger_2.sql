use trigger_db;

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(follower_id, followee_id)
);

DELIMITER $$

CREATE TRIGGER prevent_self_follows
BEFORE INSERT ON follows
FOR EACH ROW
BEGIN
    IF NEW.follower_id = NEW.followee_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You cannot follow yourself!';
    END IF;
END$$

DELIMITER ;

SHOW TRIGGERS;