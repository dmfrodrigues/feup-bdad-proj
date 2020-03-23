

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
    country varchar( 2)         ,   -- ISO 3166-1 alpha-2 country code (PT for Portugal)
    code    varchar(12)         ,   -- Postal code (alphanumeric and dashes)
    town    varchar(63) NOT NULL,   -- Town name
    postman varchar(15)         ,   -- Postman VAT number
    CONSTRAINT PK_ZipCode PRIMARY KEY (country, code),
    CONSTRAINT FK_ZipCode_Postman FOREIGN KEY (postman) REFERENCES Postman(vat)
);

CREATE TABLE Address_ (             -- Address
    idAddress       int                     ,
    zipCode         varchar( 12)            ,   -- Postal code
    country         varchar(  2)            ,   -- Country code
    streetName      varchar(255) NOT NULL   ,   -- Street name
    streetNumber    varchar( 15) NOT NULL   ,   -- Street number (main door number, may not have number: s/n)
    doorNumber      varchar( 15)            ,   -- Door number if in an appartment block
    personName      varchar(255)            ,   -- Addresser or addressee if applicable
    CONSTRAINT PK_Address PRIMARY KEY (idAddress),
    CONSTRAINT FK_Address_ZipCode FOREIGN KEY (zipCode, country) REFERENCES ZipCode(code, country)
);

CREATE TABLE PostalService (
    vat             varchar( 15)                ,
    name            varchar(255) NOT NULL UNIQUE,           -- Name is a reserved keyword
    headquarters    int                         ,
    CONSTRAINT PK_PostalService PRIMARY KEY (vat),
    CONSTRAINT FK_PostalService_PostOffice FOREIGN KEY (headquarters) REFERENCES PostOffice(idPostOffice)
);

