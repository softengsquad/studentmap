CREATE TABLE building(
    building_id INTEGER PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    addressline1 VARCHAR(64) NOT NULL,
    addressline2 VARCHAR(64),
    postcode VARCHAR(7) NOT NULL,
    type VARCHAR(16) NOT NULL,
    latitude DECIMAL NOT NULL,
    longitude DECIMAL NOT NULL,
    favourited INTEGER NOT NULL CHECK (favourited IN (0, 1))
);
