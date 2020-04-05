INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (0, "1999-001", "PT", "Avenida Dom João II", "13");
INSERT INTO PostOffice(id, name, address, postalService) VALUES (1, "Parque das Nações", 0, "500077568");

INSERT INTO Vehicle(plate, postOffice, maxWeight, type) VALUES 
("AB-89-ZX", 1, 3.62, "motorbike"),
("DD-11-JK", 1, 2.8, "motorbike"),
("45-AZ-95", 1, 5.5, "motorbike"),
("56-DG-JH", 1, 4.3, "motorbike"),
("70-HS-42", 1, 3.0, "motorbike"),
("30-HP-02", 1, 1250, "van"),
("BD-94-FD", 1, 1000, "van"),
("23-ER-76", 1, 500, "van");

UPDATE PostalService SET hq=1 WHERE vat="500077568";
