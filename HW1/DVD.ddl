-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2024-09-09 13:44:54 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE branch (
    branchid          NUMBER(7) NOT NULL,
    street            VARCHAR2(40),
    city              VARCHAR2(25),
    state             VARCHAR2(2),
    zip               VARCHAR2(10),
    phonenumber       NUMBER(10),
    manager_staffid   NUMBER(7) NOT NULL
);

CREATE UNIQUE INDEX branch__idx ON
    branch (
        manager_staffid
    ASC );

ALTER TABLE branch ADD CONSTRAINT branch_pk PRIMARY KEY ( branchid );

CREATE TABLE dvd_catalog (
    catalognumber   NUMBER(7) NOT NULL,
    title           VARCHAR2(50),
    category        VARCHAR2(20 CHAR),
    director        VARCHAR2(25),
    mainactors      VARCHAR2(25),
    cost            NUMBER(11, 2)
);

ALTER TABLE dvd_catalog ADD CONSTRAINT dvd_catalog_pk PRIMARY KEY ( catalognumber );

CREATE TABLE dvd_copies (
    dvdnumber                   NUMBER(7) NOT NULL,
    status                      VARCHAR2(10 CHAR),
    dailyrentals                NUMBER(3),
    branch_branchid             NUMBER(7),
    dvd_catalog_catalognumber   NUMBER(7)
);

ALTER TABLE dvd_copies ADD CONSTRAINT dvd_copies_pk PRIMARY KEY ( dvdnumber );

CREATE TABLE manager (
    staffid           NUMBER(7) NOT NULL,
    branch_branchid   NUMBER(7) NOT NULL
);

CREATE UNIQUE INDEX manager__idx ON
    manager (
        branch_branchid
    ASC );

ALTER TABLE manager ADD CONSTRAINT manager_pk PRIMARY KEY ( staffid );

CREATE TABLE member (
    memberid           NUMBER(7) NOT NULL,
    firstname          VARCHAR2(25),
    lastname           VARCHAR2(25),
    address            VARCHAR2(40),
    registrationdate   DATE,
    branch_branchid    NUMBER(7)
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( memberid );

CREATE TABLE rental (
    rentalnumber      NUMBER(7) NOT NULL,
    renntaldate       DATE,
    returndate        DATE,
    dailyrental       NUMBER(3),
    member_memberid   NUMBER(7)
);

ALTER TABLE rental ADD CONSTRAINT rental_pk PRIMARY KEY ( rentalnumber );

CREATE TABLE staff (
    staffid           NUMBER(7) NOT NULL,
    name              VARCHAR2(25),
    position          VARCHAR2(50),
    salary            NUMBER(10, 2),
    branch_branchid   NUMBER(7) NOT NULL
);

ALTER TABLE staff ADD CONSTRAINT staff_pk PRIMARY KEY ( staffid );

ALTER TABLE branch
    ADD CONSTRAINT branch_manager_fk FOREIGN KEY ( manager_staffid )
        REFERENCES manager ( staffid );

ALTER TABLE dvd_copies
    ADD CONSTRAINT dvd_copies_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE dvd_copies
    ADD CONSTRAINT dvd_copies_dvd_catalog_fk FOREIGN KEY ( dvd_catalog_catalognumber )
        REFERENCES dvd_catalog ( catalognumber );

ALTER TABLE manager
    ADD CONSTRAINT manager_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE member
    ADD CONSTRAINT member_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE rental
    ADD CONSTRAINT rental_member_fk FOREIGN KEY ( member_memberid )
        REFERENCES member ( memberid );

ALTER TABLE staff
    ADD CONSTRAINT staff_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE branch
    ADD CONSTRAINT branch_manager_fk FOREIGN KEY ( manager_staffid )
        REFERENCES manager ( staffid );

ALTER TABLE dvd_copies
    ADD CONSTRAINT dvd_copies_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE dvd_copies
    ADD CONSTRAINT dvd_copies_dvd_catalog_fk FOREIGN KEY ( dvd_catalog_catalognumber )
        REFERENCES dvd_catalog ( catalognumber );

ALTER TABLE manager
    ADD CONSTRAINT manager_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE member
    ADD CONSTRAINT member_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );

ALTER TABLE rental
    ADD CONSTRAINT rental_member_fk FOREIGN KEY ( member_memberid )
        REFERENCES member ( memberid );

ALTER TABLE staff
    ADD CONSTRAINT staff_branch_fk FOREIGN KEY ( branch_branchid )
        REFERENCES branch ( branchid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             2
-- ALTER TABLE                             21
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
