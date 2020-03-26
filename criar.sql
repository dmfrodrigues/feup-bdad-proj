-- TODO:
-- Check Constrains / consistency / references / foreign keys
-- Check table declaration "order"

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
    zipCode         CHAR   ( 12)            ,   -- Postal code
    country         CHAR   (  2)            ,   -- Country code
    streetName      VARCHAR(255) NOT NULL   ,   -- Street name
    streetNumber    VARCHAR( 15) NOT NULL   ,   -- Street number (main door number, may not have number: s/n)
    doorNumber      VARCHAR( 15)            ,   -- Door number if in an appartment block
    personName      VARCHAR(255)            ,   -- Addresser or addressee if applicable
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
    address         INT          REFERENCES Address(id),
    postalService   CHAR   ( 15) NOT NULL REFERENCES PostalService(vat)
);

CREATE TABLE Vehicle (
    plate           CHAR(15)    PRIMARY KEY                         ,
    postOffice      INT         REFERENCES PostOffice(id)           ,
    maxWeight       FLOAT       CHECK (maxWeight > 0)               ,
    type           CHAR(15)    CHECK (type in ('motorbike', 'van'))
);

CREATE TABLE Person (
    vat             CHAR   ( 15) PRIMARY KEY            ,
    name            VARCHAR(255) NOT NULL               ,
    address         INT          REFERENCES Address(id),
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
    supervisor      CHAR(15) REFERENCES Manager
);

CREATE TABLE Postman (
    vat             CHAR(15) PRIMARY KEY REFERENCES Employee,
    supervisor      CHAR(15) REFERENCES Manager
);

CREATE TABLE Delivery (
    id              INT         PRIMARY KEY                 ,
    from_           INT         NULL REFERENCES Address(id),
    to_             INT         REFERENCES Address(id)     ,
    registeredBy    CHAR(15)    REFERENCES ShopKeeper(vat)  ,
    order_          INT         NULL REFERENCES Order_(id)  ,
    timeRegister    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   ,
    weight          FLOAT       CHECK (weight > 0)          ,
    service         VARCHAR(31) REFERENCES Service(name)
);

CREATE TABLE Category (
    name            VARCHAR(31) NOT NULL                    ,
    maxWeight       FLOAT       UNIQUE CHECK(maxWeight > 0)
);

CREATE TABLE Service (
    name            VARCHAR(31) NOT NULL
);

CREATE TABLE Order_ (
    id          INT         PRIMARY KEY                                     ,
    timeBegin   CHAR(19)                ,               -- "DD-MM-YYYY HH:MM:SS"
    timeEnd     CHAR(19)                ,
    type        CHAR   (12) CHECK (type in ('generalOrder', 'lightOrder')) ,
    vehicle     VARCHAR(31) REFERENCES Vehicle(plate)                       ,
    postman     CHAR   (15) REFERENCES Postman(vat)
);

CREATE TABLE Bill (
    numBill         INT                                         ,
    seller          CHAR(15)    REFERENCES PostalService(vat)   ,
    timeIssue       CHAR(19)                                    ,
    price           INT                                         ,
    consumer        CHAR(15)    REFERENCES Client(vat)          ,
    issuer          CHAR(15)    REFERENCES ShopKeeper(vat)      ,
    PRIMARY KEY     (numBill, seller)
);

CREATE TABLE CatalogItem (
    idCatalogItem   INT         PRIMARY KEY ,
    description     VARCHAR(255)            ,
    price           INT
);

CREATE TABLE BillItem (
    numBill         INT     ,
    seller          CHAR(15),
    catalogItem     INT     ,
    priceThen       INT     ,
    amount          INT     ,
    FOREIGN KEY (numBill, seller)   REFERENCES Bill(numBill, seller)  ,
    FOREIGN KEY (catalogItem)       REFERENCES CatalogItem(idCatalogItem) ,
    PRIMARY KEY (numBill, seller, catalogItem)
);

CREATE TABLE Price (
    category        VARCHAR(31)     REFERENCES Category     ,
    service         VARCHAR(31)     REFERENCES Service(name),
    price           INT                                 ,
    PRIMARY KEY     (category, service)
);