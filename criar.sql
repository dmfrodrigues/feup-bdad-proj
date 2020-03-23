

-- TODO:
-- Finish tables
-- Figure out what to do with the postman->Postman type relations
-- Add Constrains
-- Check table declaration "order"

DROP TABLE IF EXISTS ZipCode;
DROP TABLE IF EXISTS Address_;                  -- Address was highlighted but doesn't appear to be a reserved keyword
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
DROP TABLE IF EXISTS Order_;                    -- Order is a reserved keyword
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS CatalogItem;
DROP TABLE IF EXISTS BillItem;
DROP TABLE IF EXISTS Price;


CREATE TABLE ZipCode (
    country         varchar(255),
    number_         int,                        -- Number is a reserved keyword
    town            varchar(255),
    postman     Postman,                        -- Is this correct?
    PRIMARY KEY (country, number_)              -- Number is a reserved keyword

);

CREATE TABLE Address_ (                         -- Address
    idAddress       int PRIMARY KEY,
    -- zipNumber, country
    streetName      varchar(255),
    streetNumber    int,
    doorNumber      int,
    personName      varchar(255),               -- Person that lives at this address?
);

CREATE TABLE PostalService (
    vat             int PRIMARY KEY,
    name_           varchar(255),               -- Name is a reserved keyword
    -- headquarters
);

CREATE TABLE PostalOffice (
    idPostOffice    int PRIMARY KEY,
    name_           varchar(255),               -- Name is a reserved keyword
    -- address
    -- postalService
);

CREATE TABLE Vehicle (
    licensePlate    varchar(6) PRIMARY KEY,     -- 6 chars, right?
    -- postOffice
    maxWeight       int,
    type_           varchar(255),               -- type is a reserved keyword
);

CREATE TABLE Person (
    vat             int PRIMARY KEY,
    name_           varchar(255),               -- Name is a reserved keyword
    -- address
    phoneNumber     int                         -- Any contraint here?
);

CREATE TABLE Client (
    -- vat
);

CREATE TABLE Employee (
    -- vat
    -- postOffice
    salary          int
);

CREATE TABLE Manager (
    -- vat
);

CREATE TABLE ShopKeeper (
    -- vat
    -- supervisor
);

CREATE TABLE Postman (
    -- vat
    -- supervisor
);

CREATE TABLE Delivery (
    idDelivery      int PRIMARY KEY,
    -- from
    -- to
    -- registeredBy
    -- order
    timeRegister    time,
    weight_         int,        
);