CREATE TABLE IF NOT EXISTS building(
    building_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    longitude DECIMAL NOT NULL,
    latitude DECIMAL NOT NULL,
    favourite INTEGER (CHECK favourite == 0 OR favourite == 1)
);
