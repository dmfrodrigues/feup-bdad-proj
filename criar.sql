

-- TODO:
-- Finish tables
-- Figure out what to do with the postman->Postman type relations
-- Check table declaration "order"

DROP TABLE IF EXISTS ZipCode;
DROP TABLE IF EXISTS Address_;      -- Address was highlighted but doesn't appear to be a reserved keyword
DROP TABLE IF EXISTS PostalService;
DROP TABLE IF EXISTS PostOffice;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS ShopKeeper;
DROP TABLE IF EXISTS Postman;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Order_;        -- Order is a reserved keyword
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS CatalogItem;
DROP TABLE IF EXISTS BillItem;
DROP TABLE IF EXISTS Price;


CREATE TABLE ZipCode (
    country varchar(255),
    number_ int,                    -- Number is a reserved keyword
    town varchar(255),
    -- postman
);

CREATE TABLE Address_ (             -- Address
    idAddress int,
    -- zipNumber, country
    streetName varchar(255),
    streetNumber int,
    doorNumber int,
    personName varchar(255),        -- Person that lives at this address?
);

CREATE TABLE PostalService (
    vat int,
    name varchar(255),              -- Name is a reserved keyword
    -- headquarters
);

