-- dish (name,image_url,location,creater)

CREATE DATABASE catfishbeer;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR (300),
  email VARCHAR (300) NOT NULL,
  password_digest VARCHAR(400)
);


CREATE TABLE beers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  company VARCHAR(255),
  beer_type VARCHAR(255),
  image_url VARCHAR (400)
);

CREATE TABLE favourites (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  beer_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (beer_id) REFERENCES beers(id)
  ON DELETE RESTRICT
  );

fixation beer
https://untappd.akamaized.net//site/beer_logos/beer-1343276_8bccb_sm.jpeg

kaiju! beer
https://untappd.akamaized.net//site/beer_logos/beer-_251368_sm_81b05fb9929ddd9fa070f67d845a8f.jpeg

moondog craft brewery
https://untappd.akamaized.net/site/brewery_logos/brewery-4170_616fa.jpeg

two birds brewing
https://untappd.akamaized.net//site/beer_logos/beer-1952103_dff38_sm.jpeg

hop nation brewing co
https://untappd.akamaized.net/site/brewery_logos/brewery-205876_e6298.jpeg

mountain goat
https://untappd.akamaized.net/site/beer_logos/beer-2419701_10da7_sm.jpeg

wolf of the willows
https://untappd.akamaized.net/site/beer_logos/beer-2389136_a28d7_sm.jpeg

3 ravens brewery
https://untappd.akamaized.net/site/brewery_logos/brewery-3324_00cef.jpeg

batch brewing company
https://untappd.akamaized.net/site/beer_logos/beer-535499_dc794_sm.jpeg
