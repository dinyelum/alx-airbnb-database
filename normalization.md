Table-by-Table 3NF Analysis

** USERS Table **
user_id
first_name
last_name
email
password_hash
phone_number
role
created_at
deleted_at
all depend on the ID property which is the Primary Key.

** PROPERTY Table **
host_id	Identifies which user owns this property, thus depends on the ID of the User from the Users Table.
property_id
name
description
location
all depend on the ID on the property table which is the Primary Key.

** BOOKINGS Table **
property_id	Identifies which property is booked. Depends on the property(id).
user_id	Identifies which user made the booking. Depends on the user(id).
booking_id
start_date
end_date
total_price
status
created_at
all depend on the ID on the bookings table which is the Primary Key.

** PAYMENTS Table **
booking_id	Identifies which booking this payment is for. Depends on the bookings(id).
payment_id
amount
payment_date
payment_method
all depend on the ID on the payments table which is the Primary Key.

** REVIEWS Table **
property_Identifies which property is reviewed. Depends on the property(id).
user_id Identifies which user wrote the review. Depends on the users(id).
review_id
rating
comment
created_at
deleted_at
all depend on the ID on the reviews table which is the Primary Key.

** MESSAGES Table **
sender_id Identifies who sent the message. Depends on the users(id).
recipient_id Identifies who received the message. Depends on the users(id).
message_id
message_body
sent_at
deleted_at
all depend on the ID on the messages table which is the Primary Key.