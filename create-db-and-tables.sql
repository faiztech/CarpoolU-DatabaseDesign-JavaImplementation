#Mohammed Faizuddin
#Carpool-u - A carpool designed for universities.
CREATE DATABASE db_cs415;
GRANT ALL PRIVILEGES ON db_cs415.* TO 'student'@'localhost';
FLUSH PRIVILEGES;
USE db_cs415;


#Creating User Table
CREATE TABLE User(
  userName VARCHAR(20) PRIMARY KEY,
  password VARCHAR(50),
  universityName VARCHAR(100) REFERENCES University(universityName),
  lastName VARCHAR(20),
  firstName VARCHAR(20),
  phoneNo INTEGER(10),
  email VARCHAR(30),
  licenceNumber VARCHAR(15)
);

#Creating Second table University
CREATE TABLE University(
  universityName VARCHAR(50),
  address VARCHAR(50),
  city VARCHAR(20),
  state VARCHAR(20),
  zipcode INTEGER(5),
  PRIMARY KEY (universityName,zipcode)
);

#Creating Car Table
CREATE TABLE Car(
  registrationNo VARCHAR(10) PRIMARY KEY ,
  OWner VARCHAR(20) REFERENCES User(userName),
  make VARCHAR(15),
  model VARCHAR(15),
  year INTEGER(4),
  color VARCHAR(10),
  luxury BOOLEAN DEFAULT FALSE
);

#Creating Table Ride
CREATE TABLE Ride(
  rideID INTEGER(10) AUTO_INCREMENT PRIMARY KEY ,
  registrationNo VARCHAR(10) REFERENCES Car(registrationNo),
  sourceZip INTEGER(5),
  destZip INTEGER(5),
  seatsAvl INTEGER(1) DEFAULT 1
);

#Creating Table RideRequest
CREATE TABLE RideRequest(
  requestID INTEGER(10) AUTO_INCREMENT PRIMARY KEY ,
  requestedBy VARCHAR(20) REFERENCES User(userName),
  rideID INTEGER(10) REFERENCES Ride(rideID),
  requestStatus BOOLEAN DEFAULT FALSE ,
  seatsRequired INTEGER(1) DEFAULT 1
);









