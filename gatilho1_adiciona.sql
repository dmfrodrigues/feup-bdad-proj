.mode columns
.headers on
PRAGMA foreign_keys=ON;

CREATE TRIGGER bill_price_insert AFTER INSERT ON BillItem
FOR EACH ROW
BEGIN
    UPDATE Bill SET price = price + NEW.priceThen*NEW.amount WHERE numBill=NEW.numBill AND seller=NEW.seller;
END;

CREATE TRIGGER bill_price_update AFTER UPDATE ON BillItem
FOR EACH ROW
BEGIN
    UPDATE Bill SET price = price - OLD.priceThen*OLD.amount WHERE numBill=OLD.numBill AND seller=OLD.seller;
    UPDATE Bill SET price = price + NEW.priceThen*NEW.amount WHERE numBill=NEW.numBill AND seller=NEW.seller;
END;

CREATE TRIGGER bill_price_delete AFTER DELETE ON BillItem
FOR EACH ROW
BEGIN
    UPDATE Bill SET price = price - OLD.priceThen*OLD.amount WHERE numBill=OLD.numBill AND seller=OLD.seller;
END;
