INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(7, "4495-447", "PT", "Cruzeiro das Avestruzes", "63", "Fernando Correia Marques"),
(8, "4620-022", "PT", "Avenida dos Enterrados", "99", "Fátima Lopes"); 
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES (1, 7, 8, "643378204", 2, 0.100, "Economy");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(9, "4620-200", "PT", "Alameda Alagada", "27", "José Condessa"),
(10, "4620-201", "PT", "Trilho Torto", "81", "Miguel Góis");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES (3, 10, 9, "643378204", 1, 12.500, "Express");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(11, "4785-095", "PT", "Caminho do Camilo", "12", "António Salazar"),
(12, "9400-025", "PT", "Rua do Doutor", "80", "Marquês de Pombal");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service, numBill, seller) VALUES
(2, 12, 11, "643378204", 2, 0.300, "Registered", 1894, "500077568");
