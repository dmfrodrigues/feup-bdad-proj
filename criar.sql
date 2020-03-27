-- TODO:
-- Check Constrains / consistency / references / foreign keys
-- Check order of tables' declaration

-- SQLite keyworks: https://www.sqlite.org/lang_keywords.html

PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS ZipCode;
DROP TABLE IF EXISTS Address;                  -- Address was highlighted but doesn't appear to be a reserved keyword
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
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Order_;                    -- Order is a reserved keyword
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS CatalogItem;
DROP TABLE IF EXISTS BillItem;
DROP TABLE IF EXISTS Price;

PRAGMA foreign_keys=ON;

CREATE TABLE ZipCode (
    country CHAR   ( 2)                         ,   -- ISO 3166-1 alpha-2 country code (PT for Portugal)
    code    CHAR   (12)                         ,   -- Postal code (alphanumeric and dashes)
    town    VARCHAR(63) NOT NULL                ,   -- Town name
    postman CHAR   (15) REFERENCES Postman(vat) ,   -- Postman VAT number
    PRIMARY KEY (country, code)
);

CREATE TABLE Address (
    id              INT          PRIMARY KEY,
    zipCode         CHAR   ( 12) NOT NULL   ,   -- Postal code
    country         CHAR   (  2) NOT NULL   ,   -- Country code
    streetName      VARCHAR(255) NOT NULL   ,   -- Street name
    streetNumber    VARCHAR( 15) NOT NULL   ,   -- Street number (main door number, may not have number: s/n)
    doorNumber      VARCHAR( 15) NULL       ,   -- Door number if in an appartment block
    personName      VARCHAR(255) NULL       ,   -- Addresser or addressee if applicable
    FOREIGN KEY (zipCode, country) REFERENCES ZipCode(code, country)
);

CREATE TABLE PostalService (
    vat             CHAR   ( 15) PRIMARY KEY,
    name            VARCHAR(255) NOT NULL   ,   -- Name is a reserved keyword (?)
    hq              INT          REFERENCES PostOffice(id)
);

CREATE TABLE PostOffice (
    id              INT          PRIMARY KEY    ,
    name            VARCHAR(255) NOT NULL UNIQUE,
    address         INT          NOT NULL REFERENCES Address(id),
    postalService   CHAR   ( 15) NOT NULL REFERENCES PostalService(vat)
);

CREATE TABLE Vehicle (
    plate           CHAR(15)    PRIMARY KEY                         ,
    postOffice      INT         REFERENCES PostOffice(id)           ,
    maxWeight       FLOAT       CHECK (maxWeight > 0)               ,
    type           CHAR(15)     CHECK (type in ('motorbike', 'van'))
);

CREATE TABLE Person (
    vat             CHAR   ( 15) PRIMARY KEY            ,
    name            VARCHAR(255) NOT NULL               ,
    address         INT          NOT NULL REFERENCES Address(id),
    phoneNumber     CHAR   ( 31)                        
);

CREATE TABLE Client (
    vat             CHAR(15) PRIMARY KEY REFERENCES Person
);

CREATE TABLE Employee (
    vat             CHAR   (15)     PRIMARY KEY REFERENCES Person       ,
    postOffice      INT             NOT NULL REFERENCES PostOffice(id)  ,
    salary          DECIMAL(38, 2)  NOT NULL CHECK (salary >= 0)
);

CREATE TABLE Manager (
    vat             CHAR(15) PRIMARY KEY REFERENCES Employee
);

CREATE TABLE ShopKeeper (
    vat             CHAR(15) PRIMARY KEY REFERENCES Employee,
    supervisor      CHAR(15) NOT NULL REFERENCES Manager
);

CREATE TABLE Postman (
    vat             CHAR(15) PRIMARY KEY REFERENCES Employee,
    supervisor      CHAR(15) NOT NULL REFERENCES Manager
);

CREATE TABLE Delivery (
    id              INT         PRIMARY KEY                 ,
    from_           INT         NULL REFERENCES Address(id),
    to_             INT         NOT NULL REFERENCES Address(id)     ,
    registeredBy    CHAR(15)    NOT NULL REFERENCES ShopKeeper(vat)  ,
    order_          INT         NULL REFERENCES Order_(id)  ,
    timeRegister    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
    weight          FLOAT       CHECK (weight > 0)          ,
    service         VARCHAR(31) NOT NULL REFERENCES Service(name)
);

CREATE TABLE Category (
    name            VARCHAR(31) PRIMARY KEY                 ,
    maxWeight       FLOAT       UNIQUE CHECK(maxWeight > 0)
);

CREATE TABLE Service (
    name            VARCHAR(31) PRIMARY KEY
);

CREATE TABLE Price (
    category        VARCHAR(31)     NOT NULL REFERENCES Category(name)   ,
    service         VARCHAR(31)     NOT NULL REFERENCES Service(name)    ,
    price           DECIMAL(12, 2)                              ,
    PRIMARY KEY     (category, service)
);

CREATE TABLE Order_ (
    id          INT         PRIMARY KEY                                     ,
    timeBegin   CHAR(19)                ,               -- "DD-MM-YYYY HH:MM:SS"
    timeEnd     CHAR(19)                ,
    type        CHAR   (12) CHECK (type in ('generalOrder', 'lightOrder')) ,
    vehicle     VARCHAR(31) NULL REFERENCES Vehicle(plate)                       ,
    postman     CHAR   (15) NOT NULL REFERENCES Postman(vat),
    CHECK (timeBegin < timeEnd)
);

CREATE TABLE Bill (
    numBill         INT                                                  ,
    seller          CHAR(15)    REFERENCES PostalService(vat)            ,
    timeIssue       CHAR(19)    NOT NULL                                 ,
    price           DECIMAL(12, 2) NOT NULL                              ,
    consumer        CHAR(15)    NOT NULL REFERENCES Client(vat)          ,
    issuer          CHAR(15)    NOT NULL REFERENCES ShopKeeper(vat)      ,
    PRIMARY KEY     (numBill, seller)
);

CREATE TABLE CatalogItem (
    id              INT         PRIMARY KEY ,
    description     VARCHAR(255)            ,
    price           DECIMAL(12, 2) NOT NULL
);

CREATE TABLE BillItem (
    numBill         INT             ,
    seller          CHAR(15)        ,
    catalogItem     INT             NOT NULL REFERENCES CatalogItem(idCatalogItem),
    priceThen       DECIMAL(12, 2)  ,
    amount          INT             CHECK(amount > 0),
    PRIMARY KEY (numBill, seller, catalogItem),
    FOREIGN KEY (numBill, seller)   REFERENCES Bill(numBill, seller)
);
