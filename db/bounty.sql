DROP TABLE IF EXISTS bounty_hunters;

CREATE TABLE bounty_hunters (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT,
  danger_level VARCHAR(255),
  homeworld VARCHAR(255)

);
