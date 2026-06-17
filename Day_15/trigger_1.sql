DELIMITER $$

CREATE TRIGGER must_be_adult
    BEFORE INSERT ON users
    FOR EACH ROW
BEGIN
    IF NEW.age < 18
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Must be an adult!';
    END IF;
END;
$$

INSERT INTO users(name, age)
VALUES("Yang", 14);


INSERT INTO users(name, age)
VALUES("Arpit", 20);

INSERT INTO users(name, age)
VALUES("Arpit", 17);