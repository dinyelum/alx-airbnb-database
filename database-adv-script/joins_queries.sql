SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, b.booking_id, b.total_price, b.status from users as u INNER JOIN booking as b on b.user_id = u.id
SELECT p.property_id, p.host_id, p.name, p.description, p.location, p.price_per_night, r.rating, r.comment from property as p LEFT JOIN reviews as r on r.property_id = p.id
-- Since MySQL does not directly support FULL OUTER JOIN
SELECT u.*
FROM users as u
LEFT JOIN bookings as b ON u.id = b.user_id
UNION
SELECT u.*
FROM users as u
RIGHT JOIN bookings as b ON u.id = b.user_id