Table-by-Table 3NF Analysis
Objective: This document verifies 3NF compliance by analyzing both the internal functional dependencies within each table and the external foreign key relationships that define the business logic.

** USERS Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Candidate Key: user_id (BINARY(16)), email (VARCHAR(255))

| Attribute     | Functional Dep. on PK (id) | FK Relationship / Business Logic                                 |
|---------------|----------------------------|------------------------------------------------------------------|
| user_id       | Direct                     | A unique, public, non-sequential identifier for APIs and URLs.   |
| first_name    | Direct                     | The user's first name.                                           |
| last_name     | Direct                     | The user's last name.                                            |
| email         | Direct                     | The user's unique email address.                                 |
| password_hash | Direct                     | The cryptographic hash of the user's password.                   |
| phone_number  | Direct                     | The user's contact phone number.                                 |
| role          | Direct                     | The user's system role (e.g., 'guest', 'host', 'admin').         |
| created_at    | Direct                     | The timestamp of when the user account was created.              |
| deleted_at    | Direct                     | The timestamp for soft deletion of the account (NULL if active). |

** PROPERTY Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Foreign Key (FK): host_id -> users(id)

| Attribute       | Functional Dep. on PK (id) | FK Relationship / Business Logic                                                |
|-----------------|----------------------------|---------------------------------------------------------------------------------|
| property_id     | Direct                     | A unique, public identifier for the property.                                   |
| host_id         | Direct                     | FK: References users(id). Identifies the user who owns and lists this property. |
| name            | Direct                     | The name or title of the property listing.                                      |
| description     | Direct                     | The full description of the property and its amenities.                         |
| location        | Direct                     | The address or general location of the property.                                |
| price_per_night | Direct                     | The current cost to rent the property for one night.                            |
| created_at      | Direct                     | The timestamp of when the property listing was created.                         |
| updated_at      | Direct                     | The timestamp of the last update to the property listing.                       |
| deleted_at      | Direct                     | The timestamp for soft deletion of the listing (NULL if active).                |

** BOOKINGS Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Foreign Keys (FK): property_id -> properties(id), user_id -> users(id)

| Attribute   | Functional Dep. on PK (id) | FK Relationship / Business Logic                                                                                                                 |
|-------------|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| booking_id  | Direct                     | A unique, public identifier for the booking.                                                                                                     |
| property_id | Direct                     | FK: References properties(id). Identifies which property is booked.                                                                              |
| user_id     | Direct                     | FK: References users(id). Identifies which user made the booking.                                                                                |
| start_date  | Direct                     | The check-in date for this specific booking.                                                                                                     |
| end_date    | Direct                     | The check-out date for this specific booking.                                                                                                    |
| total_price | Direct                     | Snapshot Value: The total cost for this booking event. Calculated as price_per_night * nights at the time of booking. Preserves historical data. |
| status      | Direct                     | The current state of the booking (e.g., 'pending', 'confirmed', 'cancelled').                                                                    |
| created_at  | Direct                     | The timestamp of when the booking was created.                                                                                                   |

** PAYMENTS Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Foreign Key (FK): booking_id -> bookings(id)

| Attribute      | Functional Dep. on PK (id) | FK Relationship / Business Logic                                           |
|----------------|----------------------------|----------------------------------------------------------------------------|
| payment_id     | Direct                     | A unique, public identifier for the payment transaction.                   |
| booking_id     | Direct                     | FK: References bookings(id). Identifies which booking this payment is for. |
| amount         | Direct                     | The amount paid in this specific transaction. May be a partial payment.    |
| payment_date   | Direct                     | The timestamp of when the payment was processed.                           |
| payment_method | Direct                     | The method used for the payment (e.g., 'credit_card', 'paypal').           |

** REVIEWS Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Foreign Keys (FK): property_id -> properties(id), user_id -> users(id)
Unique Constraint: (property_id, user_id)

| Attribute   | Functional Dep. on PK (id) | FK Relationship / Business Logic                                         |
|-------------|----------------------------|--------------------------------------------------------------------------|
| review_id   | Direct                     | A unique, public identifier for the review.                              |
| property_id | Direct                     | FK: References properties(id). Identifies the property being reviewed.   |
| user_id     | Direct                     | FK: References users(id). Identifies the user who wrote the review.      |
| rating      | Direct                     | The numerical rating (1-5) given by the user for this specific property. |
| comment     | Direct                     | The textual review written by the user for this specific property.       |
| created_at  | Direct                     | The timestamp of when the review was submitted.                          |
| deleted_at  | Direct                     | The timestamp for soft deletion of the review (NULL if active).          |

** MESSAGES Table **
Primary Key (PK): id (BIGINT UNSIGNED, Surrogate)
Foreign Keys (FK): sender_id -> users(id), recipient_id -> users(id)

| Attribute    | Functional Dep. on PK (id) | FK Relationship / Business Logic                                        |
|--------------|----------------------------|-------------------------------------------------------------------------|
| message_id   | Direct                     | A unique, public identifier for the message.                            |
| sender_id    | Direct                     | FK: References users(id). Identifies the user who sent the message.     |
| recipient_id | Direct                     | FK: References users(id). Identifies the user who received the message. |
| message_body | Direct                     | The content of the message.                                             |
| sent_at      | Direct                     | The timestamp of when the message was sent.                             |
| deleted_at   | Direct                     | The timestamp for soft deletion of the message (NULL if active).        |