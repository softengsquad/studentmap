CREATE TABLE BuildingType (
  TypeID INTEGER PRIMARY KEY,
  Type TEXT(4)
);


CREATE TABLE Building (
  BuildingID INTEGER PRIMARY KEY,
  BuildingName TEXT,
  AddressLine1 TEXT,
  AddressLine2 TEXT,
  Postcode TEXT(8),
  TypeID INTEGER,
  FOREIGN KEY (TypeID) REFERENCES BuildingType(TypeID)
);

CREATE TABLE MapsReference (
  BuildingID INTEGER,
  Longitude REAL,
  Latitude REAL,
  FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID)
);

-- coordinates to be set to its real value not rounded

-- building details by types
INSERT INTO BuildingType (TypeID, Type)
VALUES (1, 'Main Campus'),
       (2, 'Administration'),
       (3, 'Residence'),
       (4, 'Cafe'),
    (5, 'Pubs'),
    (6, 'Markets'),
    (7, 'Bus Stops'),
    (8, 'Scooters'),  
    (9, 'Bikes');

-- present issue on scooters is to get real time availability.
-- one option for this usage: when the user chooses a desired location, clicking the point shall open 
-- the beryl and the breeze app. If possible direct the user to the specified location as well.

-- building details by address
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (1, 'Park Building', 'King Henry I St', 'PO1 2BZ', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (2, 'St George''s Building', '141 High St', 'PO1 2HY', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (3, 'Dennis Sciama Building', NULL, 'PO1 3FX', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (4, 'St Michael''s Building', NULL, 'PO1 2DT', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (5, 'Spinnaker Building', '2 Cambridge Rd', 'PO1 2EF', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (6, 'King Henry Building', NULL, 'PO1 2DY', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (7, 'University House', 'Winston Churchill Ave', 'PO1 2UP', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (8, 'Richmond Building', 'Portland St', 'PO1 3DE', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (9, 'Milldam Building', 'Burnaby Terrace, Burnaby Rd', 'PO1 3AS', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (10, 'University Learning Centre', 'Portsea Island', 'PO1 2DH', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (11, 'Portland Building', 'Portland St', 'PO1 3AH', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, Postcode, TypeID)
VALUES (12, 'Lion Gate Building', 'Lion Terrace', 'PO1 3HF', 1);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (17, 'Rosalind Franklin Halls', '28 Guildhall Walk', 'Portsmouth', 'PO1 2DF', 3);

INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (18, 'St James Street', '10 St James''s St', 'Portsea', 'PO1 3AP', 3);


INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (19, 'Stanhope House', '91-93 Commercial Rd', 'Portsmouth', 'PO1 1BQ', 3);


INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (20, 'Fountain Halls', '1 Fountain St', 'Portsmouth', 'PO1 1BW', 3);


INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (21, 'Catherine House', 'Stanhope Rd', 'Portsmouth', 'PO1 1DZ', 3);


INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (22, 'Crown Place', 'Station St', 'Portsmouth', 'PO1 1BZ', 3);


INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (23, 'Rees Hall', 'Southsea Terrace', 'Southsea', 'PO5 3AP', 3);


-- INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
-- VALUES (24, 'Murphy''s Halls', 'St George''s Way', 'Portsmouth', 'PO1 3AJ', 3);

-- INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
-- VALUES (25, 'Greetham Street', 'Greetham St', 'Portsmouth', 'PO5 4FB', 3);
-- Aldi
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (24, 'Aldi', '6 Dickinson Rd', 'Southsea', 'PO4 8SH', 4);

-- Sainsbury's Local 1
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (25, 'Sainsbury''s Local', '91-93 Commercial Rd', NULL, 'PO1 1BQ', 4);

-- Sainsbury's Local 2
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (26, 'Sainsbury''s Local', '5-7 Guildhall Walk', NULL, 'PO1 2RY', 4);

-- Sainsbury's Local 3
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (27, 'Sainsbury''s Local', '77-79 Palmerston Rd', 'Southsea', 'PO5 3PP', 4);

-- Tesco Superstore
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (28, 'Tesco Superstore', 'Crasswell St', NULL, 'PO1 1RS', 4);

-- Tesco Express 1
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (29, 'Tesco Express', 'Ground Floor, Round House', NULL, 'PO1 3SF', 4);

-- Tesco Express 2
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (30, 'Tesco Express', '5 Isambard Brunel Rd', NULL, 'PO1 2FT', 4);

-- Tesco Express 3
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (31, 'Tesco Express', '19 St George''s Rd', NULL, 'PO1 2EW', 4);

-- Tesco Express 4
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (32, 'Tesco Express', '10-12 Palmerston Rd', 'Southsea', 'PO5 3QH', 4);

-- Tesco Extra 1
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (33, 'Tesco Extra', 'Fratton Way', 'Southsea', 'PO4 8FD', 4);

-- Tesco Express 5
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (34, 'Tesco Express', '59-61 Elm Grove', 'Southsea', 'PO5 1JF', 4);

-- Tesco Express 6
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (35, 'Tesco Express', '13-17 Kingston Rd', NULL, 'PO1 5RX', 4);

-- Tesco Express 7
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (36, 'Tesco Express', '183-191 Albert Rd', 'Southsea', 'PO4 0JP', 4);

-- Tesco Extra 2
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (37, 'Tesco Extra', 'Clement Attlee Way', 'Cosham', 'PO6 4SR', 4);

-- Tesco Superstore 2
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (38, 'Tesco Superstore', '16 High St', 'Cosham', 'PO6 3BZ', 4);

-- Tesco Express 8
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (39, 'Tesco Express', '133-137 Goldsmith Ave', 'Southsea', 'PO4 8QZ', 4);

-- Tesco Express 9
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (40, 'Tesco Express', 'Eastney Rd', 'Southsea', 'PO4 9JB', 4);


-- for tescos, need to re write the shop names with their streetname/ addressLine1 as their second name
-- need to re write the tescos to buildingid 6 

-- now for the pubs around ports and southsea
-- The Dockyard Pub
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (41, 'The Dockyard Pub', '13-19 Guildhall Walk', 'Portsmouth', 'PO1 2RY', 5);

-- The Fleet
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (42, 'The Fleet', '1 King Henry I St', 'Portsmouth', 'PO1 2PT', 5);

-- The Old Customs House
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (43, 'The Old Customs House', 'Vernon Buildings', 'Portsmouth', 'PO1 3TY', 5);

-- The Wellington
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (44, 'The Wellington', '62 High St, Old Portsmouth', 'Portsmouth', 'PO1 2LY', 5);

-- The Pembroke
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (45, 'The Pembroke', '20 Pembroke Rd, Old Portsmouth', 'Portsmouth', 'PO1 2NR', 5);

-- Ship Anson
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (46, 'Ship Anson', '10 The Hard, Portsea', 'Portsmouth', 'PO1 3DT', 5);

-- Raven Pub
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (47, 'Raven Pub', 'Bedford St', 'Southsea', 'PO5 4BT', 5);

-- The Royal Standard (Ruby's)
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (48, 'The Royal Standard (Ruby''s)', '20 Edinburgh Rd', 'Portsmouth', 'PO1 1DE', 5);

-- The Isambard Kingdom Brunel - JD Wetherspoon
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (49, 'The Isambard Kingdom Brunel - JD Wetherspoon', '2 Guildhall Walk', 'Portsmouth', 'PO1 2DD', 5);

-- The Dolphin
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (50, 'The Dolphin', '41 High St, Old Portsmouth', 'Portsmouth', 'PO1 2LU', 5);

-- Brewhouse & Kitchen
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (51, 'Brewhouse & Kitchen', '51 Southsea Terrace', 'Southsea', 'PO5 3AU', 5);

-- The Ship & Castle
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (52, 'The Ship & Castle', '90 Rudmore Square', 'Portsmouth', 'PO2 8DR', 5);

-- The Lady Hamilton
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (53, 'The Lady Hamilton', '21 The Hard', 'Portsmouth', 'PO1 3DT', 5);

-- Clarence Pier Brewers Fayre
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (54, 'Clarence Pier Brewers Fayre', 'Long Curtain Rd', 'Southsea', 'PO5 3XX', 5);

-- O'Neill's Southsea
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (55, 'O''Neill''s Southsea', 'Albert Rd', 'Southsea, Portsmouth', 'PO5 2SX', 5);

-- Park Tavern
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (56, 'Park Tavern', '16 Edinburgh Rd', 'Portsmouth', 'PO1 1DE', 5);

-- The Phoenix
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (57, 'The Phoenix', '13 Duncan Rd', 'Southsea', 'PO5 2QU', 5);

-- The Still & West, Old Portsmouth
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (58, 'The Still & West, Old Portsmouth', 'Bath Square, Old Portsmouth', 'Portsmouth', 'PO1 2JL', 5);

-- The Lord Palmerston - JD Wetherspoon
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (59, 'The Lord Palmerston - JD Wetherspoon', '84-90 Palmerston Rd', 'Southsea', 'PO5 3PT', 5);

-- The Mars
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (60, 'The Mars', 'The Mars, 1 Church Path N', 'Portsmouth', 'PO1 4DG', 5);

-- The Liquorist Portsmouth
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (61, 'The Liquorist Portsmouth', 'Central Bldg Gunwharf Quays, R1 Boulevard', 'Portsmouth', 'PO1 3TD', 5);

-- All Bar One Portsmouth
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (62, 'All Bar One Portsmouth', 'Unit RO5A, Hampshire', 'Portsmouth', 'PO1 3TA', 5);

-- Slug & Lettuce - Portsmouth
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (63, 'Slug & Lettuce - Portsmouth', 'Unit R07', 'Portsmouth', 'PO1 3TR', 5);

-- Clarence Pier Brewers Fayre (Duplicate Entry)
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (64, 'Clarence Pier Brewers Fayre', 'Long Curtain Rd', 'Southsea', 'PO5 3XX', 5);

-- abarbistro
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (65, 'abarbistro', 'Lombard Terrace, 58 White Hart Rd, Old Portsmouth', 'Portsmouth', 'PO1 2JA', 5);

-- The Chambers
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (66, 'The Chambers', '27 Landport Terrace', 'Southsea', 'PO1 2RG', 5);

-- Bar + Block Steakhouse Portsmouth
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (67, 'Bar + Block Steakhouse Portsmouth', 'Queen St, Portsea', 'Portsmouth', 'PO1 3EE', 5);

-- Huis Belgian Bar & Kitchen
INSERT INTO Building (BuildingID, BuildingName, AddressLine1, AddressLine2, Postcode, TypeID)
VALUES (68, 'Huis Belgian Bar & Kitchen', '62 Elm Grove', 'Southsea', 'PO5 1JG', 5);



-- building details by latitude an dlongitude


INSERT INTO MapsReference (BuildingID, Latitude, Longitude)
VALUES 
    (1, 50.7974798, -1.0937787),
    (3, 50.7977360, -1.0986399),
    (4, 50.7962827, -1.0948516),
    (5, 50.7947893, -1.0967378),
    (6, 50.7972404, -1.0950940),
    (8, 50.7980935, -1.0994415),
    (9, 50.7956917, -1.0922994),
    (11, 50.7984341, -1.0992048),
    (12, 50.7988774, -1.0983891),
    (2, 50.7952526, -1.0937113),
    (14, 50.7885277, -1.0969346),
    (15, 50.7979855, -1.1004212),
    (17, 50.7964580, -1.0943155),
    (19, 50.7991826, -1.0912296),
    (20, 50.8003648, -1.0913563),
    (21, 50.7992304, -1.0924319),
    (22, 50.7990622, -1.0903240);

-- Aldi
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (24, 50.79715207263591, -1.0684944522606115);

-- Sainsbury's Local 1
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (25, 50.799050844181274, -1.091337832319381);

-- Sainsbury's Local 2
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (26, 50.796757563807255, -1.0925057324169154);

-- Sainsbury's Local 3
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (27, 50.78424229136856, -1.0887498900059216);

-- Tesco Superstore
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (28, 50.80121573839597, -1.08780832291325);

-- Tesco Express 1
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (29, 50.79575206844263, -1.103677584667023);

-- Tesco Express 2
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (30, 50.79784416652023, -1.0908275140968438);

-- Tesco Express 3
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (31, 50.79314401619453, -1.1011281029856985);

-- Tesco Express 4
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (32, 50.78624075942403, -1.088327801783233);

-- Tesco Extra 1
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (33, 50.796658059538395, -1.066176200945255);

-- Tesco Express 5
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (34, 50.79029836074134, -1.0882253515189184);

-- Tesco Express 6
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (35, 50.80743647699724, -1.0773518462989464);

-- Tesco Express 7
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (36, 50.78682504400021, -1.073980986811572);

-- Tesco Extra 2
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (37, 50.84489182757821, -1.0952757925883887);

-- Tesco Superstore 2
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (38, 50.845946416450374, -1.0677483491366293);

-- Tesco Express 8
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (39, 50.79420584287621, -1.0641744948598033);

-- Tesco Express 9
INSERT INTO MapsReference (BuildingID, Longitude, Latitude)
VALUES (40, 50.78872158232465, -1.0552905404384398);
