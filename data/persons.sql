INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (1, "4475-617", "PT", "Rua de S. João", "42");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("2211998877", "Atílio Pinto Valido", 1, "+351 919198211");
INSERT INTO Client(vat) VALUES ("2211998877");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (2, "6120-111", "PT", "Rua da Aboboreira", "317");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("123456789", "Lurdes Cipriano Bensaúde", 2, "+351 914732918");
INSERT INTO Client(vat) VALUES ("123456789");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (23, "2750-232", "PT", "Rua D. Manuel", "1");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("928502953", "Abrão Reino Perigão", 23, "+351 926312222");
INSERT INTO Client(vat) VALUES ("928502953");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (24, "2705-089", "PT", "Avenida Perdida", "20");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("222999873", "Rui Calçada Zarco", 24, "+351 945666777");
INSERT INTO Client(vat) VALUES ("222999873");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (3, "4980-792", "PT", "Rua da Fortaleza", "12");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("224692997", "Elias Fortes Marreiro", 3, "+351 784701869");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("224692997", 1, 1550.27);
INSERT INTO Manager(vat) VALUES ("224692997");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, doorNumber) VALUES (4, "7500-027", "PT", "Rua dos Castelinhos", "127", "R/C Esq.");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("418687874", "Fernanda Souto Lustosa", 4, "+351 108364572");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("418687874", 1, 980.15);
INSERT INTO Postman(vat, supervisor) VALUES ("418687874", "224692997");
INSERT INTO Client(vat) VALUES ("418687874");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber, doorNumber) VALUES (5, "7500-170", "PT", "Avenida Torta", "2", "19o Dir.");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("334547958", "Inácio Agostinho Gomes", 5, "+351 917712345");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("334547958", 1, 769.00);
INSERT INTO Postman(vat, supervisor) VALUES ("334547958", "224692997");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (25, "2660-423", "PT", "Rua da Raposa", "444");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("998765222", "Gabriela Pêssego Inácio", 25, "+351 922222444");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("998765222", 1, 900.00);
INSERT INTO Postman(vat, supervisor) VALUES ("998765222", "224692997");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (6, "2620-216", "PT", "Rua da Ramada Comprida", "1810");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("643378204", "Abrão Paiva Brum", 6, "+351 178343902");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("643378204", 1, 690.95);
INSERT INTO ShopKeeper(vat, supervisor) VALUES ("643378204", "224692997");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (13, "2415-139", "PT", "Rua Amarela", "34");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("223456483", "Francisca Joaquina Ramalde", 13, "+351 990223166");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("223456483", 1, 659.80);
INSERT INTO ShopKeeper(vat, supervisor) VALUES ("223456483", "224692997");

INSERT INTO Address(id, zipCode, country, streetName, streetNumber) VALUES (14, "2420-414", "PT", "Avenida Azul", "99");
INSERT INTO Person(vat, name, address, phoneNumber) VALUES ("987264567", "Sebastião Alvim Santos", 14, "+351 917732456");
INSERT INTO Employee(vat, postOffice, salary) VALUES ("987264567", 1, 765.45);
INSERT INTO ShopKeeper(vat, supervisor) VALUES ("987264567", "224692997");