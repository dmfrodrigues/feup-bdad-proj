.mode columns
.headers on
PRAGMA foreign_keys=ON;

SELECT * FROM Delivery;
INSERT INTO Delivery(id,    from_,  to_,    registeredBy,   weight, service,    numBill,    seller)
VALUES              (8,     9,      20,     223456483,      0.105,  "Economy",  NULL,       NULL);
SELECT * FROM Delivery;
UPDATE Delivery SET weight=2 WHERE id=5;
SELECT * FROM Delivery;
