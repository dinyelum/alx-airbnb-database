-- Placeholder submission

review_id, property_id, user_id, rating, comment
property_id, host_id, name, description, location, price_per_night

-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT review_id, (SELECT p.name from property where p.id = property_id) as property_name, user_id, rating, comment from reviews WHERE rating > 4

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT booking_id, property_id, (SELECT u.first_name from users where u.id = user_id) as user_firstname, start_date, end_date, total_price, status from bookings WHERE count(rating) > 3