.mode columns
.headers on
PRAGMA foreign_keys=ON;

CREATE TRIGGER bill_price BEFORE INSERT ON BillItem
FOR EACH ROW
BEGIN
    UPDATE Bill
    SET price=price+NEW.priceThen*NEW.amount
    WHERE numBill=NEW.numBill AND seller=NEW.seller;
END
