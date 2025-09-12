-- Insert sample users. Passwords are hashed versions of 'password123'
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
(UUID_TO_BIN('11111111-1111-1111-1111-111111111111'), 'John', 'Doe', 'john.doe@email.com', '$2b$10$abc123def456ghi789jkl0', '+1234567890', 'host'),
(UUID_TO_BIN('22222222-2222-2222-2222-222222222222'), 'Jane', 'Smith', 'jane.smith@email.com', '$2b$10$abc123def456ghi789jkl0', '+1987654321', 'host'),
(UUID_TO_BIN('33333333-3333-3333-3333-333333333333'), 'Alice', 'Johnson', 'alice.j@email.com', '$2b$10$abc123def456ghi789jkl0', '+1555666777', 'guest'),
(UUID_TO_BIN('44444444-4444-4444-4444-444444444444'), 'Bob', 'Williams', 'bob.w@email.com', '$2b$10$abc123def456ghi789jkl0', '+1444333222', 'guest'),
(UUID_TO_BIN('55555555-5555-5555-5555-555555555555'), 'Charlie', 'Brown', 'charlie.b@email.com', '$2b$10$abc123def456ghi789jkl0', '+1222333444', 'admin');


-- Insert sample properties (owned by John Doe (id:1) and Jane Smith (id:2))
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
(UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'), 1, 'Seaside Villa', 'A beautiful villa with stunning ocean views, a private pool, and a modern kitchen. Perfect for a relaxing getaway.', 'Miami Beach, FL', 350.00),
(UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'), 1, 'Cozy Mountain Cabin', 'A warm and inviting cabin nestled in the woods. Features a fireplace, hot tub, and easy access to hiking trails.', 'Aspen, CO', 195.50),
(UUID_TO_BIN('cccccccc-cccc-cccc-cccc-cccccccccccc'), 2, 'Downtown Loft', 'A stylish and modern loft in the heart of the city. Walking distance to restaurants, bars, and museums.', 'New York, NY', 275.00);


-- Insert sample bookings
-- Alice (id:3) books the Seaside Villa (id:1) for 5 nights: 5 * 350 = 1750
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(UUID_TO_BIN('dddddddd-dddd-dddd-dddd-dddddddddddd'), 1, 3, '2024-06-01', '2024-06-06', 1750.00, 'confirmed');

-- Bob (id:4) books the Mountain Cabin (id:2) for 3 nights: 3 * 195.50 = 586.50
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(UUID_TO_BIN('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee'), 2, 4, '2024-07-15', '2024-07-18', 586.50, 'confirmed');

-- Alice (id:3) also books the Downtown Loft (id:3) for a weekend: 2 * 275 = 550
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(UUID_TO_BIN('ffffffff-ffff-ffff-ffff-ffffffffffff'), 3, 3, '2024-08-20', '2024-08-22', 550.00, 'pending');

-- Bob (id:4) tries to book the Seaside Villa (id:1) for a week: 7 * 350 = 2450 (but cancels)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(UUID_TO_BIN('99999999-9999-9999-9999-999999999999'), 1, 4, '2024-09-10', '2024-09-17', 2450.00, 'cancelled');


-- Insert sample payments for the confirmed bookings
-- Payment for Alice's Seaside Villa booking (booking_id:1)
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
(UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 1, 1750.00, 'credit_card');

-- Payment for Bob's Mountain Cabin booking (booking_id:2)
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
(UUID_TO_BIN('88888888-8888-8888-8888-888888888888'), 2, 586.50, 'paypal');
-- Note: The pending and cancelled bookings do not have payments yet.


-- Insert sample reviews
-- Alice (id:3) reviews the Seaside Villa (id:1) after her stay
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
(UUID_TO_BIN('12121212-1212-1212-1212-121212121212'), 1, 3, 5, 'Absolutely breathtaking views! The villa was even better than the pictures. Will definitely return.');

-- Bob (id:4) reviews the Mountain Cabin (id:2) after his stay
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
(UUID_TO_BIN('23232323-2323-2323-2323-232323232323'), 2, 4, 4, 'Incredibly cozy and peaceful. The hot tub under the stars was the highlight. The wifi was a bit spotty, but that was almost a plus!');


-- Insert sample messages
-- A question from Alice (id:3) to John (id:1) about his property
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
(UUID_TO_BIN('34343434-3434-3434-3434-343434343434'), 3, 1, 'Hi John, your villa looks amazing! Is the pool heated year-round?');

-- John's reply to Alice
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
(UUID_TO_BIN('45454545-4545-4545-4545-454545454545'), 1, 3, 'Hi Alice! Yes, the pool is heated and comfortable to use even in the winter months. Let me know if you have any other questions!');

-- A message from the admin (Charlie, id:5) to a host (Jane, id:2)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
(UUID_TO_BIN('56565656-5656-5656-5656-565656565656'), 5, 2, 'Hi Jane, just a heads-up that your listing is performing very well in search results! Keep up the great photos.');
