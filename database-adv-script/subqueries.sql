-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT review_id, (SELECT p.name from property where p.id = property_id) as property_name, user_id, rating, comment FROM `reviews` GROUP BY property_id having AVG(rating) >= 4

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT 
    u.id as user_id,
    u.first_name,
    u.last_name,
    b.booking_id as booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    (SELECT COUNT(*) FROM bookings b2 WHERE b2.user_id = u.id) as total_bookings_by_user
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
ORDER BY u.id, b.start_date;