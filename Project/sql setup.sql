CREATE TABLE Sales (
  salesID               INTEGER NOT NULL PRIMARY KEY, 
  tax                   float(10) NOT NULL, 
  cashPayment           double NOT NULL, 
  creditCardPayment     double NOT NULL, 
  paymentReceived       blob NOT NULL, 
  generationDate        date NOT NULL, 
  sumPriceLocalCurrency float(10) NOT NULL, 
  sumPriceUSD           float(10) NOT NULL, 
  commissionRateID      float(10) NOT NULL, 
  customerEmail         varchar(255) NOT NULL, 
  exchangerRateID       integer NOT NULL, 
  note                  varchar(255), 
  BlankblankID          integer NOT NULL);


CREATE TABLE CommissionRate (
  commissionRateID float(10) NOT NULL PRIMARY KEY , 
  commissionRate   float(7) NOT NULL);
CREATE TABLE Customer (
  customerEmail    varchar(255) NOT NULL , 
  name             varchar(255) NOT NULL, 
  customerType     blob NOT NULL, 
  encryptionSaltID integer NOT NULL, 
  PRIMARY KEY (customerEmail));

CREATE TABLE EncryptionSalt (
  encryptionSaltID INTEGER NOT NULL PRIMARY KEY , 
  encryptionSalt   integer NOT NULL);
CREATE TABLE ExchangeRate (
  exchangerRateID INTEGER NOT NULL PRIMARY KEY , 
  exchangeRate    float(9) NOT NULL, 
  country         varchar(255) NOT NULL);
CREATE TABLE Blank (
  blankID           INTEGER NOT NULL PRIMARY KEY , 
  blankType         integer NOT NULL, 
  departureLocation varchar(255) NOT NULL, 
  arrivalLocation   varchar(255) NOT NULL, 
  blankStatus       varchar(8) NOT NULL, 
  departureDate     date NOT NULL, 
  arrivalDate       date NOT NULL, 
  departureTime     time NOT NULL, 
  arrivalTime       time NOT NULL);
CREATE TABLE Assignment (
  assignmentID   INTEGER NOT NULL PRIMARY KEY , 
  blankID        integer NOT NULL, 
  staffID        integer NOT NULL, 
  assignmentDate date NOT NULL);
CREATE TABLE Staff (
  staffID          INTEGER NOT NULL PRIMARY KEY , 
  staffEmail       varchar(255) NOT NULL, 
  name             varchar(255) NOT NULL, 
  password         varchar(64) NOT NULL, 
  staffType        integer NOT NULL, 
  encryptionSaltID integer NOT NULL);
CREATE TABLE Coupon (
  couponID           INTEGER NOT NULL PRIMARY KEY , 
  departure          varchar(100) NOT NULL, 
  arrivalLocation    varchar(100) NOT NULL, 
  priceUSD           float(10) NOT NULL, 
  priceLocalCurrency float(10) NOT NULL, 
  blankID            integer NOT NULL, 
  departureDate      date NOT NULL, 
  arrivalDate        date NOT NULL, 
  departureTime      time NOT NULL, 
  arrivalTime        time NOT NULL);





ALTER TABLE Sales ADD FOREIGN KEY (commissionRateID) REFERENCES CommissionRate(commissionRateID);
ALTER TABLE Sales ADD FOREIGN KEY (customerEmail) REFERENCES Customer(customerEmail);
ALTER TABLE Sales ADD FOREIGN KEY (exchangerRateID) REFERENCES ExchangeRate(exchangerRateID);
ALTER TABLE Sales ADD FOREIGN KEY (BlankblankID)  REFERENCES Blank(blankID);

ALTER TABLE Customer ADD FOREIGN KEY (encryptionSaltID)  REFERENCES EncryptionSalt(encryptionSaltID);

ALTER TABLE Assignment ADD FOREIGN KEY (blankID)  REFERENCES Blank(blankID);
ALTER TABLE Assignment ADD FOREIGN KEY (blankID)  REFERENCES Staff(staffID);

ALTER TABLE Staff ADD FOREIGN KEY (encryptionSaltID)  REFERENCES EncryptionSalt(encryptionSaltID);

ALTER TABLE Coupon ADD FOREIGN KEY (blankID)  REFERENCES Blank(blankID);
