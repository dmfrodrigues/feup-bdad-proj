.mode columns
.headers on
PRAGMA foreign_keys=ON;

SELECT * FROM Bill WHERE numBill=876 AND seller=500077568;
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount)
VALUES (876, 500077568, 2, 0.3, 4);
SELECT * FROM Bill WHERE numBill=876 AND seller=500077568;
