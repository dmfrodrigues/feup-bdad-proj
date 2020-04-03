INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (0, "1999-001", "PT", "Avenida Dom João II", "13");
INSERT INTO PostOffice(id, name, address, postalService) VALUES (1, "Parque das Nações", 0, "500077568");

INSERT INTO Vehicle(plate, postOffice, maxWeight, type) VALUES 
("AB-89-ZX", 1, 3.62, "motorbike"),
("56-DG-JH", 1, 1028, "van");

UPDATE PostalService SET hq=1 WHERE vat="500077568";
