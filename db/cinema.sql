DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds NUMERIC(5,2)
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price NUMERIC(5,2)
);

CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id),
  start_time TIME,
  finish_time TIME,
  screening_date DATE,
  tickets_sold INT4
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE,
  bought_on TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
