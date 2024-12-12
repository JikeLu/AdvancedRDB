DROP TABLE VIEWING;
DROP TABLE PROPERTYFORRENT;
DROP TABLE REGISTRATION;
DROP TABLE STAFF;
DROP TABLE client;
DROP TABLE PRIVATEOWNER;
DROP TABLE BRANCH;
CREATE TABLE branch
(
branchno	varchar2(4)  CONSTRAINT branch_bno_pk PRIMARY KEY,
street		varchar2(20),
city		varchar2(10),
postcode	varchar2(10));
CREATE TABLE staff
(
staffno		varchar2(4) CONSTRAINT staff_sno_pk PRIMARY KEY,
fname		varchar2(10),
lname		varchar2(15) CONSTRAINT staff_lname_nn NOT NULL,
position	varchar2(10),
sex		char(1),
dob		date,
salary		number(6),
branchno	varchar2(4) CONSTRAINT staff_bno_fk REFERENCES branch(branchno)
);
CREATE TABLE privateowner
(
ownerno		varchar2(4) CONSTRAINT owner_clientno_pk PRIMARY KEY,
fname		varchar2(10),
lname		varchar2(15) CONSTRAINT owner_lname_nn NOT NULL,
address		varchar2(80),
telno		varchar2(15),
email		varchar2(25),
password	varchar2(25)
);
CREATE TABLE propertyforrent
(
propertyno	varchar2(4) CONSTRAINT propertyforrent_propertyno_pk PRIMARY KEY,
street		varchar2(20),
city		varchar2(10),
postcode	varchar2(10),
type		varchar2(6),
rooms		number(2),
rent		number(7,2),
ownerno		varchar2(4) CONSTRAINT propertyforrent_ownerno_fk REFERENCES privateowner(ownerno),
staffno		varchar2(4) CONSTRAINT propertyforrent_staffno_fk REFERENCES staff(staffno),
branchno	varchar2(4) CONSTRAINT propertyforrent_branchno_fk REFERENCES branch(branchno)
);
CREATE TABLE client
(
clientno 	VARCHAR2(4) CONSTRAINT client_clientno_pk PRIMARY KEY,
fname 		VARCHAR2(30),
lname 		VARCHAR2(30) CONSTRAINT client_lname_nn NOT NULL,
telno 		VARCHAR2(13) CONSTRAINT client_telno_nn NOT NULL,
preftype 	VARCHAR2(5),
maxrent 	number(5),
email		varchar2(25)
);
CREATE TABLE viewing
(
clientno	varchar2(4) CONSTRAINT viewing_clientno_fk REFERENCES client(clientno),
propertyno	varchar2(4) CONSTRAINT viewing_propretyno_fk REFERENCES propertyforrent(propertyno),
viewdate	date CONSTRAINT viewing_viewdate_nn NOT NULL,
view_comment	varchar2(60),
CONSTRAINT viewing_pk PRIMARY KEY (clientno, propertyno, viewdate)
);
CREATE TABLE registration
(
clientno	varchar2(4) CONSTRAINT registration_clientno_fk REFERENCES client(clientno),
branchno	varchar2(4) CONSTRAINT registration_branchno_fk REFERENCES branch(branchno),
staffno		varchar2(4) CONSTRAINT registration_staffno_fk REFERENCES staff(staffno),
datejoined	date CONSTRAINT registration_datejoined_nn NOT NULL,
CONSTRAINT registration_pk PRIMARY KEY (clientno, branchno, staffno)
);
--- inserting records into BRANCH
INSERT INTO branch VALUES
('B005', '22 Deer Rd.', 'London', 'SW1 4EH');
INSERT INTO branch VALUES
('B007', '16 Argyll St.', 'Aberdeen', 'AB2 3SU');
INSERT INTO branch VALUES
('B003', '163 Main St.', 'Glasgow', 'G11 9QX');
INSERT INTO branch VALUES
('B004', '32 Manse Rd.', 'Bristol', 'BS99 1NZ');
INSERT INTO branch VALUES
('B002', '56 Clover Dr.', 'London', 'NW10 6EU');
commit;
--- inserting records into STAFF
INSERT INTO STAFF VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1-oct-1945', 30000,'B005');
INSERT INTO STAFF VALUES
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-nov-1960', 12000,'B003');
INSERT INTO STAFF VALUES
('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-mar-1958', 18000, 'B003');
INSERT INTO STAFF VALUES
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-feb-1970', 9000, 'B007');
INSERT INTO STAFF VALUES
('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-jun-1940', 24000, 'B003');
INSERT INTO STAFF VALUES
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-jun-1965', 9000, 'B005');
commit;
--- inserting records into PRIVATEOWNER
INSERT INTO PRIVATEOWNER VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr., Aberdeen AB2 7SX', '01224-861212', 'jkeogh@lhh.com','ABC123');
INSERT INTO PRIVATEOWNER VALUES
('CO87', 'Carol', 'Farrel', '6 Achray St., Glasgow G32 9DX', '0141-357-7419', 'cfarrel@gmail.om', 'DEF456');
INSERT INTO PRIVATEOWNER VALUES
('CO40', 'Tina', 'Murphy', '63 Well St., Glasgow G42', '0141-943-1728', 'tinam@hotmail.com','GHI789');
INSERT INTO PRIVATEOWNER VALUES
('CO93', 'Tony', 'Shaw', '12 Park Pl., Glasgow G4 0QR', '0141-225-7025', 'tony.shaw@ark.com','JKL012');
commit;
--- inserting records into PROPERTYFORRENT
INSERT INTO PROPERTYFORRENT VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007');
INSERT INTO PROPERTYFORRENT VALUES
('PL94', '6 Argyll St. ', 'London', 'NW2', 'Flat',4, 400, 'CO87', 'SL41', 'B005');
INSERT INTO PROPERTYFORRENT VALUES
('PG4', '6 Lawrence St.', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', null, 'B003');
INSERT INTO PROPERTYFORRENT VALUES
('PG36', '2 Manor Rd. ', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003');
INSERT INTO PROPERTYFORRENT VALUES
('PG21', '18 Dale Rd.', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003');
INSERT INTO PROPERTYFORRENT VALUES
('PG16', '5 Novar Dr. ', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');
commit;
--- inserting records into CLIENT
INSERT INTO CLIENT VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com');
INSERT INTO CLIENT VALUES
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com');
INSERT INTO CLIENT VALUES
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750,'mritchie01@yahoo.com');
INSERT INTO CLIENT VALUES
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');
commit;
--- inserting records into VIEWING
INSERT INTO VIEWING VALUES
('CR56', 'PA14', to_date('24-may-2013 01:30:00','DD-MON-YYYY HH:MI:SS'), 'too small');
INSERT INTO VIEWING VALUES
('CR76', 'PG4', to_date('20-apr-2013 12:10:00','DD-MON-YYYY HH:MI:SS'), 'too remote');
INSERT INTO VIEWING VALUES
('CR56', 'PG4', to_date('26-may-2013 11:15:00','DD-MON-YYYY HH:MI:SS'), NULL);
INSERT INTO VIEWING VALUES
('CR62', 'PA14', to_date('14-may-2013 08:19:00','DD-MON-YYYY HH:MI:SS'), 'no dining room');
INSERT INTO VIEWING VALUES
('CR56', 'PG36', to_date('28-apr-2013 06:50:00','DD-MON-YYYY HH:MI:SS'), NULL);
COMMIT;
--- inserting records into REGISTRATION
INSERT INTO REGISTRATION VALUES
('CR76', 'B005', 'SL41', '02-JAN-2013');
INSERT INTO REGISTRATION VALUES
('CR56', 'B003', 'SG37', '11-APR-2013');
INSERT INTO REGISTRATION VALUES
('CR74', 'B003', 'SG37', '16-NOV-2011');
INSERT INTO REGISTRATION VALUES
('CR62', 'B007', 'SA9', '07-MAR-2012');
COMMIT;