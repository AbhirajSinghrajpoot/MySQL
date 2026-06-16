-- 📸 Instagram Clone SQL Challenge Solutions


-- 🔹 Query 1: Find the 5 Oldest Users

select * from users 
order by created_at
limit 5;


-- 🔹 Query 2: Find the Most Popular Registration Day

select 
	dayname(created_at) AS day,
	count(*) AS total
from users
group by day
order by total desc
limit 2;


-- 🔹 Query 3: Identify Inactive Users

select username 
from users
left join photos
     on users.id = photos.user_id
where photos.id is NULL;


-- 🔹 Query 4: Find the Most Popular Photo

select 
   username ,
   photos.id,
   photos.image_url,
   count(*) AS total
from photos
inner join likes 
    on likes.photo_id = photos.id
inner join users
    on photos.user_id = users.id
group by photos.id
order by total desc
limit 1;

-- 🔹 Query 5: Calculate Average Photos Per User

select 
   (select count(*) from photos) / (select count(*) from users) as avg;


-- 🔹 Query 6: Find Top 5 Most Used Hashtags

select 
   tags.tag_name,
   count(*) as total
from photo_tags 
join tags 
    on photo_tags.tag_id = tags.id
group by tags.id
order by total desc
limit 5;

-- 🔹 Query 7: Find Potential Bot Accounts

SELECT
    username,
    COUNT(*) AS num_likes
FROM users
INNER JOIN likes
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


