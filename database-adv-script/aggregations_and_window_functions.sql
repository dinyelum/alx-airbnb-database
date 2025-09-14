-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT id, booking_id, property_id, user_id, start_date, end_date, total_price, status, count(user_id) as bookings_by_user from bookings GROUP BY user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
select p.id, p.name, b.booking_id, b.property_id, ROW_NUMBER() over (partition by b.property_id ) as row_nums, RANK() over (partition by p.id ORDER BY b.property_id) as rank_nums from properties p left join bookings b on b.property_id=p.id