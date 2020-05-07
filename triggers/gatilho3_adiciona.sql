.mode columns
.headers on
PRAGMA foreign_keys=ON;

CREATE TRIGGER postman_role_insert BEFORE INSERT ON Postman
FOR EACH ROW
WHEN EXISTS(SELECT * FROM Manager WHERE vat=NEW.vat) OR
     EXISTS(SELECT * FROM ShopKeeper WHERE vat=NEW.vat)
BEGIN
    SELECT raise(rollback, 'Employee can only have one role');
END;

CREATE TRIGGER manager_role_insert BEFORE INSERT ON Manager
FOR EACH ROW
WHEN EXISTS(SELECT * FROM Postman WHERE vat=NEW.vat) OR
     EXISTS(SELECT * FROM ShopKeeper WHERE vat=NEW.vat)
BEGIN
    SELECT raise(rollback, 'Employee can only have one role');
END;

CREATE TRIGGER shopkeeper_role_insert BEFORE INSERT ON ShopKeeper
FOR EACH ROW
WHEN EXISTS(SELECT * FROM Postman WHERE vat=NEW.vat) OR
     EXISTS(SELECT * FROM Manager WHERE vat=NEW.vat)
BEGIN
    SELECT raise(rollback, 'Employee can only have one role');
END;
