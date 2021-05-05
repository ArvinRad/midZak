DROP TABLE IF EXISTS favourites CASCADE;
CREATE TABLE favourites (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER  REFERENCES users(id) ON DELETE CASCADE,
  product_id INTEGER  REFERENCES products(id) ON DELETE CASCADE 
);
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO labber;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO labber;