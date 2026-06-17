CREATE TABLE unfollows (
    follower_id INT,
    followee_id INT,
    created_at TIMESTAMP DEFAULT NOW()
);

DELIMITER $$

CREATE TRIGGER capture_unfollow
AFTER DELETE ON follows
FOR EACH ROW
BEGIN
    INSERT INTO unfollows
    SET
        follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;


delete from follows where follower_id = 2 and followee_id = 1;
select * from follows limit 5;

delete from follows where follower_id = 3;
select * from follows limit 5;




SELECT * FROM unfollows;