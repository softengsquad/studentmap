CREATE TABLE building(
    building_id INTEGER PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    longitude DECIMAL NOT NULL,
    latitude DECIMAL NOT NULL,
    favourite INTEGER NOT NULL CHECK (favourite IN (0, 1))
);
