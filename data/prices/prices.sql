INSERT INTO Category(name, maxWeight) VALUES
("Document", 0.100),
("Parcel", 2.000),
("Overweight", 10.000);

INSERT INTO Service(name) VALUES
("Economy"),
("Express"),
("Registered");

INSERT INTO Price(category, service, price) VALUES
("Document"  , "Economy",  0.85), ("Document"  , "Express",  1.15), ("Document"  , "Registered",  2.55),
("Parcel"    , "Economy",  3.50), ("Parcel"    , "Express",  5.00), ("Parcel"    , "Registered",  5.90),
("Overweight", "Economy", 10.10), ("Overweight", "Express", 15.15), ("Overweight", "Registered", 17.10);
