

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
    country VARCHAR( 2)                         ,   -- ISO 3166-1 alpha-2 country code (PT for Portugal)
    code    VARCHAR(12)                         ,   -- Postal code (alphanumeric and dashes)
    town    VARCHAR(63) NOT NULL                ,   -- Town name
    postman VARCHAR(15) REFERENCES Postman(vat) ,   -- Postman VAT number
    PRIMARY KEY (country, code)
);

CREATE TABLE Address_ (             -- Address
    id              INT          PRIMARY KEY,
    zipCode         VARCHAR( 12)            ,   -- Postal code
    country         VARCHAR(  2)            ,   -- Country code
    streetName      VARCHAR(255) NOT NULL   ,   -- Street name
    streetNumber    VARCHAR( 15) NOT NULL   ,   -- Street number (main door number, may not have number: s/n)
    doorNumber      VARCHAR( 15)            ,   -- Door number if in an appartment block
    personName      VARCHAR(255)            ,   -- Addresser or addressee if applicable
    FOREIGN KEY (zipCode, country) REFERENCES ZipCode(code, country)
);

CREATE TABLE PostalService (
    vat             VARCHAR( 15) PRIMARY KEY,
    name            VARCHAR(255) NOT NULL   ,   -- Name is a reserved keyword (?)
    hq              INT          REFERENCES PostOffice(id)
);

CREATE TABLE PostOffice (
    id              INT          PRIMARY KEY    ,
    name            VARCHAR(255) NOT NULL UNIQUE,
    address         INT          REFERENCES Address_(id),
    postalService   VARCHAR( 15) REFERENCES PostalService(vat)
);

CREATE TABLE Vehicle (
    plate       VARCHAR(15) PRIMARY KEY                         ,
    postOffice  INT         REFERENCES PostOffice(id)           ,
    maxWeight   FLOAT       CHECK (maxWeight > 0)               ,
    type        VARCHAR(15) CHECK (type in ('motorbike', 'van'))
);

CREATE TABLE Person (
    vat         VARCHAR( 15) PRIMARY KEY            ,
    name        VARCHAR(255) NOT NULL               ,
    address     INT          REFERENCES Address_(id),
    phoneNumber VARCHAR( 31)                        
);

CREATE TABLE Client (
    vat         VARCHAR(15) PRIMARY KEY REFERENCES Person
);

CREATE TABLE Employee (
    vat         VARCHAR(15)     PRIMARY KEY REFERENCES Person   ,
    postOffice  INT             REFERENCES PostOffice(id)       ,
    salary      DECIMAL(38, 2)  NOT NULL CHECK (salary >= 0)
);

CREATE TABLE Manager (
    vat         VARCHAR(15) PRIMARY KEY REFERENCES Employee
);

CREATE TABLE ShopKeeper (
    vat         VARCHAR(15) PRIMARY KEY REFERENCES Employee,
    supervisor  VARCHAR(15) REFERENCES Manager
);

CREATE TABLE Postman (
    vat         VARCHAR(15) PRIMARY KEY REFERENCES Employee,
    supervisor  VARCHAR(15) REFERENCES Manager
);
