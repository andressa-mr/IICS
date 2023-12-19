-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-12-19 17:39:36 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE "CATEGORIES " (
    categoryid   INTEGER NOT NULL,
    creationdate DATE,
    categoryname VARCHAR2(50)
);

ALTER TABLE "CATEGORIES " ADD CONSTRAINT categories_pk PRIMARY KEY ( categoryid );

CREATE TABLE customers (
    customerid   INTEGER NOT NULL,
    creationdate DATE,
    customername VARCHAR2(100),
    birthday     DATE,
    contactemail VARCHAR2(50),
    phone        VARCHAR2(30),
    address      VARCHAR2(100),
    city         VARCHAR2(50),
    state        VARCHAR2(50),
    postalcode   VARCHAR2(50),
    country      VARCHAR2(50),
    title        VARCHAR2(50),
    department   VARCHAR2(100)
);

COMMENT ON COLUMN customers.creationdate IS
    'DATA DA CRIACAO DO REGISTRO';

COMMENT ON COLUMN customers.phone IS
    'TELEFONE';

COMMENT ON COLUMN customers.address IS
    'Endereco';

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customerid );

CREATE TABLE employees (
    employeeid   INTEGER NOT NULL,
    creationdate DATE,
    employeename VARCHAR2(100),
    title        VARCHAR2(50),
    department   VARCHAR2(50)
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( employeeid );

CREATE TABLE "INVENTORY " (
    inventoryid    INTEGER NOT NULL,
    creationdate   DATE,
    productid      INTEGER NOT NULL,
    stockquantity  INTEGER,
    lastupdatedate DATE
);

COMMENT ON COLUMN "INVENTORY ".creationdate IS
    'DATA DA CRIACAO DO REGISTRO';

ALTER TABLE "INVENTORY " ADD CONSTRAINT inventory_pk PRIMARY KEY ( inventoryid );

CREATE TABLE payments (
    paymentid        INTEGER NOT NULL,
    creationdate     DATE,
    paymentdate      DATE,
    saleid           INTEGER NOT NULL,
    "PAYMENTAMOUNT " NUMBER(2, 1),
    paymentmethod    VARCHAR2(50)
);

ALTER TABLE payments ADD CONSTRAINT payments_pk PRIMARY KEY ( paymentid );

CREATE TABLE products (
    productid     INTEGER NOT NULL,
    creationdate  DATE,
    productname   VARCHAR2(50),
    categoryid    INTEGER NOT NULL,
    supplierid    INTEGER NOT NULL,
    price         NUMBER(2, 1),
    stockquantity INTEGER
);

ALTER TABLE products ADD CONSTRAINT products_pk PRIMARY KEY ( productid );

CREATE TABLE "PROMOTIONS " (
    promotionid  INTEGER NOT NULL,
    creationdate DATE,
    description  VARCHAR2(100),
    "STARTDATE " DATE,
    "ENDDATE "   DATE
);

ALTER TABLE "PROMOTIONS " ADD CONSTRAINT promotions_pk PRIMARY KEY ( promotionid );

CREATE TABLE sales (
    saleid             INTEGER NOT NULL,
    creationdate       DATE,
    "SALEDATE "        DATE,
    productid          INTEGER NOT NULL,
    customerid         INTEGER NOT NULL,
    quantitysold       INTEGER,
    "TOTALSALEAMOUNT " NUMBER(2, 1)
);

ALTER TABLE sales ADD CONSTRAINT sales_pk PRIMARY KEY ( saleid );

CREATE TABLE supplier (
    supplierid   INTEGER NOT NULL,
    creationdate DATE,
    suppliername VARCHAR2(100),
    contactname  VARCHAR2(100),
    contactemail VARCHAR2(30),
    phone        VARCHAR2(30),
    address      VARCHAR2(100),
    city         VARCHAR2(50),
    state        VARCHAR2(50),
    postalcode   VARCHAR2(30),
    country      VARCHAR2(50),
    isactive     CHAR(1),
    dateadded    DATE,
    notes        VARCHAR2(100)
);

ALTER TABLE supplier ADD CONSTRAINT supplier_pk PRIMARY KEY ( supplierid );

ALTER TABLE "INVENTORY "
    ADD CONSTRAINT "INVENTORY _PRODUCTS_FK" FOREIGN KEY ( productid )
        REFERENCES products ( productid );

ALTER TABLE payments
    ADD CONSTRAINT payments_sales_fk FOREIGN KEY ( saleid )
        REFERENCES sales ( saleid );

ALTER TABLE products
    ADD CONSTRAINT "PRODUCTS_CATEGORIES _FK" FOREIGN KEY ( categoryid )
        REFERENCES "CATEGORIES " ( categoryid );

ALTER TABLE products
    ADD CONSTRAINT products_supplier_fk FOREIGN KEY ( supplierid )
        REFERENCES supplier ( supplierid );

ALTER TABLE sales
    ADD CONSTRAINT sales_customers_fk FOREIGN KEY ( customerid )
        REFERENCES customers ( customerid );

ALTER TABLE sales
    ADD CONSTRAINT sales_products_fk FOREIGN KEY ( productid )
        REFERENCES products ( productid );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
