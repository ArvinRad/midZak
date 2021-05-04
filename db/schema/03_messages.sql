-- Drop and recreate Message table (Example)

DROP TABLE IF EXISTS messages CASCADE;
CREATE TABLE messages (
  id SERIAL PRIMARY KEY NOT NULL,
  message VARCHAR(3000) NOT NULL,
  sender_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  receiver_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  thread_master_id INTEGER NOT NULL REFERENCES thread_masters(id) ON DELETE CASCADE,
  time TIMESTAMP
);

DROP TABLE IF EXISTS thread_masters CASCADE;
CREATE TABLE thread_masters (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  user1_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  user2_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  is_dealt Boolean DEFAULT false
);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA TO labber;
GRANT USAGE, SELECT ON sequence messages_id_seq TO labber;
GRANT USAGE, SELECT ON sequence thread_masters_id_seq TO labber;




