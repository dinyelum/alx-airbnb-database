-- Create an index on the host_id for faster queries like "find all properties by host"
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Indexes for common queries
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);

-- Index for looking up payments for a booking
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Indexes for common queries
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- Indexes for fetching conversations
CREATE INDEX idx_messages_sender_recipient ON messages(sender_id, recipient_id, sent_at);
CREATE INDEX idx_messages_recipient_sender ON messages(recipient_id, sender_id, sent_at);