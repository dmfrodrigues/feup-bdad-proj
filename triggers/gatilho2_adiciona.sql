.mode columns
.headers on
PRAGMA foreign_keys=ON;

CREATE TRIGGER delivery_stamp_insert BEFORE INSERT ON Delivery
FOR EACH ROW
WHEN (NEW.numBill IS NULL OR NEW.seller IS NULL) AND (
    SELECT name FROM (
        SELECT name,min(maxWeight) FROM Category WHERE maxWeight>=NEW.weight
    )
) != 'Document'
BEGIN
    SELECT raise(rollback, 'Only documents can have stamp');
END;

CREATE TRIGGER delivery_stamp_update BEFORE UPDATE ON Delivery
FOR EACH ROW
WHEN (NEW.numBill IS NULL OR NEW.seller IS NULL) AND (
    SELECT name FROM (
        SELECT name,min(maxWeight) FROM Category WHERE maxWeight>=NEW.weight
    )
) != 'Document'
BEGIN
    SELECT raise(rollback, 'Only documents can have stamp');
END;
