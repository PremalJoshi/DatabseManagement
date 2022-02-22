USE mydb;


 -- ---1.---
SELECT c.first_name, c.last_name, c.client_ID, o.order_date, o.order_total
FROM Client c
INNER JOIN Orders o ON c.client_ID = o.Client_client_ID
WHERE o.order_total > (SELECT AVG(order_total) FROM Orders) AND o.order_date > '2000-11-30';

-- 2.---
SELECT  MIN(oi.quantity) AS least_sold_item, MAX(oi.quantity) AS most_sold_item
FROM Order_items oi
INNER JOIN Orders o ON oi.Order_order_id = o.order_id
WHERE o.order_date between '1998-1-20' and '1998-1-27';

-- ---3.---
SELECT MAX(t.price)AS max_price, g.genre
FROM Tracks t
INNER JOIN Genre g ON t.Genre_genre_id = g.genre_id
GROUP BY g.genre;

-- ----4. ----
SELECT CONCAT(c.first_name,' ',c.last_name)AS customer_name,ci.city_name,p.province_name,cu.country_name
FROM client c
INNER JOIN city ci ON c.City_city_id = ci.city_id
INNER JOIN province p ON ci.Province_province_id = p.province_id
INNER JOIN country cu ON p.Country_country_id = cu.country_id
ORDER BY cu.country_name,p.province_name,ci.city_name;

-- 5
SELECT COUNT(order_id) AS count
FROM  Orders
WHERE order_date BETWEEN '1998-01-01' AND '1998-01-31'
ORDER BY count;

-- 6
SELECT DISTINCT al.album_name AS number_of_album,CONCAT(a.first_name,' ',a.last_name)AS fullname 
FROM artist a
INNER JOIN tracks t ON a.artist_id = t.Artist_artist_id 
INNER JOIN album al ON al.album_id = t.Album_album_id
GROUP BY al.album_name;

-- 7
SELECT al.stock AS Available_copies,CONCAT(a.first_name,' ',a.last_name)AS fullname 
FROM artist a
INNER JOIN tracks t ON a.artist_id = t.Artist_artist_id 
INNER JOIN album al ON al.album_id = t.Album_album_id;

-- 8 
 -- question 1 by user: what is the top review given by user for albums 
SELECT r.reviewer_name,al.rating,al.review_date
FROM reviewer r
INNER JOIN album_has_review al ON r.reviewer_id = al.Reviewer_reviewer_id
ORDER BY al.rating DESC;

 -- 9
 -- question 2 by user: what is the top review given by user for tracks
SELECT r.reviewer_name,tr.rating,tr.review_date
FROM reviewer r
INNER JOIN tracks_has_review tr ON r.reviewer_id = tr.Reviewer_reviewer_id
ORDER BY tr.rating DESC;