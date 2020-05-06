.mode columns
.headers on
PRAGMA foreign_keys=ON;

SELECT * FROM Postman;
INSERT INTO Postman(vat, supervisor)
VALUES             ("643378204", "224692997");
SELECT * FROM Postman;

SELECT * FROM ShopKeeper;
INSERT INTO ShopKeeper(vat, supervisor)
VALUES                ("418687874", "224692997");
SELECT * FROM ShopKeeper;

SELECT * FROM Manager;
INSERT INTO Manager(vat)
VALUES             ("334547958");
SELECT * FROM Manager;
