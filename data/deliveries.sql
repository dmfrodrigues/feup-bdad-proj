INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(7, "4495-446", "PT", "Cruzeiro das Avestruzes", "63", "Fernando Correia Marques"),
(8, "4620-022", "PT", "Avenida dos Enterrados", "99", "Fátima Eleutério Lopes"); 
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES 
(1, 7, 8, "643378204", 2, 0.100, "Economy");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(9, "4620-200", "PT", "Alameda Alagada", "27", "José Miguel Condessa"),
(10, "4620-201", "PT", "Trilho Torto", "81", "Miguel Vieira Góis");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES 
(3, 10, 9, "643378204", 1, 12.500, "Express");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(11, "4785-095", "PT", "Caminho do Camilo", "12", "António de Oliveira Salazar"),
(12, "9400-025", "PT", "Rua do Doutor", "80", "Marquês de Pombal");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service, numBill, seller) VALUES
(2, 12, 11, "643378204", 2, 0.300, "Registered", 1894, "500077568");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(15, "2520-268", "PT", "Avenida Franco Bastos", "56", "Francisca Gaspar Teixeira"),
(16, "2640-402", "PT", "Rua do Ornitorrinco", "112", "Gilberto Pontes Ramos");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES
(4, 15, 16, "223456483", 4, 0.100, "Economy");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(17, "2730-020", "PT", "Rua da Perca", "22", "Salvador Silveira Matias"),
(18, "2805-077", "PT", "Rua do Atum", "88", "Débora Bezerra Robalo");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES
(5, 17, 18, "987264567", 3, 0.050, "Economy");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(19, "2910-582", "PT", "Rua do Salmão", "74", "Manuela Calçada Ribas"),
(20, "3045-111", "PT", "Rua do Lagostim", "90", "Inácio Espírito Santo");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES
(6, 19, 20, "223456483", 4, 0.095, "Registered");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, personName) VALUES 
(21, "3250-333", "PT", "Rua Coreana", "22", "Mário Leitão Sousa"),
(22, "3515-174", "PT", "Rua da Japoneira", "120", "Igor Trigueiro Pinho");
INSERT INTO Delivery(id, from_, to_, registeredBy, order_, weight, service) VALUES
(7, 21, 22, "987264567", 2, 0.100, "Economy");