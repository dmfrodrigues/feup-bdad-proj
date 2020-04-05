INSERT INTO Bill(numBill, seller, price, consumer, issuer) VALUES
(0876,"500077568", 0.00, "2211998877", "643378204");
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount) VALUES
(0876, "500077568", 1, 0.45, 2);
UPDATE Bill SET price=0.90 WHERE numBill=0876 AND seller="500077568";

INSERT INTO Bill(numBill, seller, price, consumer, issuer) VALUES
(1894, "500077568", 0.00, "2211998877", "643378204");
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount) VALUES
(1894, "500077568", 2, 0.30, 2);
UPDATE Bill SET price=0.60 WHERE numBill=1894 AND seller="500077568";

INSERT INTO Bill(numBill, seller, price, consumer, issuer) VALUES
(4498, "500077568", 0.00, "123456789", 	"643378204");
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount) VALUES
(4498, "500077568", 3, 1.05, 5);
UPDATE Bill SET price=5.25 WHERE numBill=4498 AND seller="500077568";

INSERT INTO Bill(numBill, seller, price, consumer, issuer) VALUES
(8743, "500077568", 0.00, "123456789", "987264567");
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount) VALUES
(8743, "500077568", 4, 0.50, 5);
UPDATE Bill SET price=2.50 WHERE numBill=8743 AND seller="500077568";

INSERT INTO Bill(numBill, seller, price, consumer, issuer) VALUES
(9922, "500077568", 0.00, "2211998877", "223456483");
INSERT INTO BillItem(numBill, seller, catalogItem, priceThen, amount) VALUES
(9922, "500077568", 5, 0.99, 1);
UPDATE Bill SET price=0.99 WHERE numBill=9922 AND seller="500077568";