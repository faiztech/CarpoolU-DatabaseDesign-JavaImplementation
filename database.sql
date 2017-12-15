#Mohammed Faizuddin
#Carpool-u - A carpool designed for universities.
CREATE DATABASE db_cs415;
GRANT ALL PRIVILEGES ON db_cs415.* TO 'student'@'localhost';
FLUSH PRIVILEGES;
USE db_cs415;

#Creating University Table
CREATE TABLE University(
  universityName VARCHAR(100),
  city VARCHAR(20),
  state VARCHAR(20),
  zipcode INTEGER(5),
  PRIMARY KEY (universityName,zipcode),
  KEY (zipcode)
);


#Creating User Table
CREATE TABLE User(
  userName VARCHAR(20) PRIMARY KEY,
  password VARCHAR(50),
  universityName VARCHAR(100),
  lastName VARCHAR(20),
  firstName VARCHAR(20),
  phoneNo INTEGER(10),
  licenseNumber VARCHAR(15),
  FOREIGN KEY (universityName) REFERENCES University(universityName) ON DELETE CASCADE ON UPDATE CASCADE
);



#Creating Car Table
CREATE TABLE Car(
  registrationNo VARCHAR(10) PRIMARY KEY ,
  owner VARCHAR(20),
  make VARCHAR(15),
  model VARCHAR(15),
  year INTEGER(4),
  color VARCHAR(10),
  FOREIGN KEY (owner) REFERENCES User(userName) ON DELETE CASCADE ON UPDATE CASCADE
);

#Creating Table Ride
CREATE TABLE Ride (
  rideID         INTEGER(10) AUTO_INCREMENT PRIMARY KEY,
  registrationNo VARCHAR(10),
  date           DATE,
  sourceZip      INTEGER(5),
  destZip        INTEGER(5),
  seatsAvl       INTEGER(1)  DEFAULT 1,
  FOREIGN KEY (registrationNo) REFERENCES Car (registrationNo) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (destZip) REFERENCES University (zipcode) ON DELETE CASCADE ON UPDATE CASCADE
);


#Creating Table RideRequest
CREATE TABLE RideRequest(
  requestID INTEGER(10) AUTO_INCREMENT PRIMARY KEY ,
  requestedBy VARCHAR(20) ,
  rideID INTEGER(10) ,
  requestStatus BOOLEAN DEFAULT FALSE ,
  FOREIGN KEY (requestedBy) REFERENCES User(userName) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (rideID)REFERENCES Ride(rideID) ON DELETE CASCADE ON UPDATE CASCADE
);

#**********DONE CREATING TABLES**********

#Inserting Supported Universities -PRELOADING MOCK DATA OF 200 Universities Including Northeastern Illinois University
insert into University (universityName, city, state, zipcode) values ('Northeastern Illinois University', 'Chicago', 'Illinois', '60625');
insert into University (universityName, city, state, zipcode) values ('Sanjay Gandhi Postgraduate lnstitute of Medical Sciences', 'Naperville', 'Illinois', '60567');
insert into University (universityName, city, state, zipcode) values ('Jaramogi Oginga Odinga University of Science and Technology', 'Springfield', 'Illinois', '62764');
insert into University (universityName, city, state, zipcode) values ('Jomo Kenyatta University of Agriculture and Technology', 'Springfield', 'Illinois', '62711');
insert into University (universityName, city, state, zipcode) values ('California Baptist College', 'Peoria', 'Illinois', '61651');
insert into University (universityName, city, state, zipcode) values ('University of the East, Ramon Magsaysay Memorial Medical Center', 'Chicago', 'Illinois', '60636');
insert into University (universityName, city, state, zipcode) values ('University of Dundee', 'Joliet', 'Illinois', '60000');
insert into University (universityName, city, state, zipcode) values ('Hazara University', 'Springfield', 'Illinois', '62756');
insert into University (universityName, city, state, zipcode) values ('Hokuriku University', 'Champaign', 'Illinois', '61825');
insert into University (universityName, city, state, zipcode) values ('Universidad Autónoma de Chihuahua', 'Chicago', 'Illinois', '60674');

#Test User
INSERT INTO User (userName, password, universityName, lastName, firstName, phoneNo, licenseNumber)
VALUES ('test',sha('000000'),'Northeastern Illinois University','man','super','0000000000','123456');


# LOGIN
SELECT COUNT(*) FROM User WHERE userName='test' AND password = SHA('000000');



#1 ADD A CAR
INSERT INTO Car (registrationNo, owner, make, model, year, color)
  VALUES ('12345','test','honda','accord','2005','silver');


#2  CREATE A RIDE [DRIVER]
INSERT INTO Ride (registrationNo, date, sourceZip, destZip, seatsAvl)
    VALUES ('12345','2018-01-01','60000','60000','4');



#3 REQUEST A RIDE [RIDER]

  #3.1 VIEW AVAILABLE RIDES
        SELECT rideID AS 'RideID', date AS 'Date of trip', sourceZip AS 'Pickup Address', destZip AS 'Drop Off Address',seatsAvl AS 'Number of Seats Available'
          FROM Ride;

  #3.2 VIEW AVAILABLE RIDES WITH ZIPCODE
        SELECT rideID AS 'RideID', date AS 'Date of trip', sourceZip AS 'Pickup Address', destZip AS 'Drop Off Address',seatsAvl AS 'Number of Seats Available'
          FROM Ride WHERE (sourceZip = '60000'&& destZip = '60000' && date = '2018-01-01');


  #3.3 REQUEST AVAILABLE RIDE
        INSERT INTO RideRequest (requestedBy, rideID)
          VALUES ('test','1');


#4 VIEW PREVIOUS RIDES [RIDER / DRIVER] FILTERED BY USER LOGGED IN
SELECT RideRequest.rideID, Ride.date AS 'Date of Trip', Ride.sourceZip AS 'Pickup Address', Ride.destZip AS 'Drop Off Address'
FROM Ride, RideRequest
WHERE Ride.rideID = RideRequest.rideID && RideRequest.requestedBy ='test';


#5 VIEW RIDE REQUEST STATUS
SELECT RideRequest.requestID AS 'RequestID', RideRequest.rideID AS 'RideID', Ride.date AS 'Date of Trip', RideRequest.requestedBy AS 'Requested By', Ride.sourceZip AS 'Pickup Address', Ride.destZip AS 'Drop Off Address',
IF(RideRequest.requestStatus,'Accepted','Available') AS 'Status'
FROM Ride, RideRequest
WHERE Ride.rideID = RideRequest.rideID && RideRequest.requestedBy ='test';

  #5.1 ACCEPT A RIDE [DRIVER]
    UPDATE RideRequest
      SET requestStatus = TRUE
        WHERE requestID = '1';


#6 SIGN UP

  #6.1 SIGN UP USERS
     INSERT INTO User (userName, password, universityName, lastName, firstName, phoneNo, licenseNumber)
      VALUES ('test2',sha('000000'),'Northeastern Illinois University','man','super','0000000000','123456');

  #6.2 SEARCH UNIVERSITIES BY ZIP
      SELECT universityName FROM University
        WHERE zipcode = '60000';

  #6.3 ADD A NEW UNIVERSITY
      INSERT INTO University (universityName, city, state, zipcode)
        VALUES ('Universidad Autónoma de Chihuahua', 'Chicago', 'Illinois', '60000');




#*******************DEBUGGINGS


#DELETE FROM University WHERE universityName = "Northeastern Illinois University";

#SELECT * FROM University WHERE universityName = "Northeastern Illinois University";




#DELETE FROM User WHERE userName = "test"


#Error codes for reference
# Code 1062: Duplicate User
# Code 1452: No University exists for user

#
#SELECT sys.col FROM University;




#select  Column_name,TABLE_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, COLUMN_KEY, EXTRA
#from Information_schema.columns
#where (Table_name like 'University' OR Table_name like 'User' OR Table_name like 'Car' OR Table_name like 'Ride' OR Table_name like 'RideRequest');



