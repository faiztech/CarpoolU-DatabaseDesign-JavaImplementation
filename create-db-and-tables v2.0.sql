#Mohammed Faizuddin
#Carpool-u - A carpool designed for universities.
CREATE DATABASE db_cs415;
GRANT ALL PRIVILEGES ON db_cs415.* TO 'student'@'localhost';
FLUSH PRIVILEGES;
USE db_cs415;

#Creating University Table
CREATE TABLE University(
  universityName VARCHAR(100),
  address VARCHAR(50),
  city VARCHAR(20),
  state VARCHAR(20),
  zipcode INTEGER(5),
  PRIMARY KEY (universityName,zipcode)
);


#Creating User Table
CREATE TABLE User(
  userName VARCHAR(20) PRIMARY KEY,
  password VARCHAR(50),
  universityName VARCHAR(100),
  lastName VARCHAR(20),
  firstName VARCHAR(20),
  phoneNo INTEGER(10),
  email VARCHAR(30),
  licenceNumber VARCHAR(15),
  FOREIGN KEY (universityName) REFERENCES University(universityName)
);



#Creating Car Table
CREATE TABLE Car(
  registrationNo VARCHAR(10) PRIMARY KEY ,
  owner VARCHAR(20),
  make VARCHAR(15),
  model VARCHAR(15),
  year INTEGER(4),
  color VARCHAR(10),
  luxury BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (owner) REFERENCES User(userName)
);

#Creating Table Ride
CREATE TABLE Ride(
  rideID INTEGER(10) AUTO_INCREMENT PRIMARY KEY ,
  registrationNo VARCHAR(10),
  sourceZip INTEGER(5),
  destZip INTEGER(5),
  seatsAvl INTEGER(1) DEFAULT 1,
  FOREIGN KEY (registrationNo) REFERENCES Car(registrationNo)
);

#Creating Table RideRequest
CREATE TABLE RideRequest(
  requestID INTEGER(10) AUTO_INCREMENT PRIMARY KEY ,
  requestedBy VARCHAR(20) ,
  rideID INTEGER(10) REFERENCES Ride(rideID),
  requestStatus BOOLEAN DEFAULT FALSE ,
  seatsRequired INTEGER(1) DEFAULT 1,
  FOREIGN KEY (requestedBy) REFERENCES User(userName)
);

#**********DONE CREATING TABLES**********

#Inserting Supported Universities -PRELOADING MOCK DATA OF 200 Universities Including Northeastern Illinois University
insert into University (universityName, address, city, state, zipcode) values ('Northeastern Illinois University', '5500 North St. Louis Avenue', 'Chicago', 'Illinois', '60625');
insert into University (universityName, address, city, state, zipcode) values ('Sanjay Gandhi Postgraduate lnstitute of Medical Sciences', '72343 Dexter Hill', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('Jaramogi Oginga Odinga University of Science and Technology', '14 Merry Crossing', 'Springfield', 'Illinois', '62764');
insert into University (universityName, address, city, state, zipcode) values ('Jomo Kenyatta University of Agriculture and Technology', '80660 Oxford Lane', 'Springfield', 'Illinois', '62711');
insert into University (universityName, address, city, state, zipcode) values ('California Baptist College', '5 Northport Place', 'Peoria', 'Illinois', '61651');
insert into University (universityName, address, city, state, zipcode) values ('University of the East, Ramon Magsaysay Memorial Medical Center', '4 Mifflin Place', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('University of Dundee', '750 Hoepker Street', 'Joliet', 'Illinois', '60435');
insert into University (universityName, address, city, state, zipcode) values ('Hazara University', '16107 Northwestern Alley', 'Springfield', 'Illinois', '62756');
insert into University (universityName, address, city, state, zipcode) values ('Hokuriku University', '08224 American Lane', 'Champaign', 'Illinois', '61825');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Autónoma de Chihuahua', '915 Caliangt Circle', 'Chicago', 'Illinois', '60674');
insert into University (universityName, address, city, state, zipcode) values ('University “Pavaresia” Vlore', '13600 Division Way', 'Carol Stream', 'Illinois', '60158');
insert into University (universityName, address, city, state, zipcode) values ('Estonian Academy of Arts', '94 Columbus Point', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Colegio de Estudios Superiores de Administración (CESA)', '8 Leroy Hill', 'Bloomington', 'Illinois', '61709');
insert into University (universityName, address, city, state, zipcode) values ('Beth-El College of Nursing and Health Sciences', '7386 Moulton Crossing', 'Chicago', 'Illinois', '60652');
insert into University (universityName, address, city, state, zipcode) values ('University of Hull', '815 Pleasure Junction', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('University of Bahrain', '20610 Derek Plaza', 'Springfield', 'Illinois', '62723');
insert into University (universityName, address, city, state, zipcode) values ('University of Southeastern Philippines', '14409 Sullivan Point', 'Springfield', 'Illinois', '62723');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Abierta Interamericana', '899 Continental Alley', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('University of Richmond', '79928 Orin Terrace', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Karnataka State Open University', '016 Thompson Junction', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('Vitebsk State Technological University', '57 Corry Hill', 'Chicago', 'Illinois', '60657');
insert into University (universityName, address, city, state, zipcode) values ('University of Texas at Austin', '53041 Myrtle Trail', 'Rockford', 'Illinois', '61110');
insert into University (universityName, address, city, state, zipcode) values ('Troy University, Dothan', '0 Northfield Pass', 'Carol Stream', 'Illinois', '60158');
insert into University (universityName, address, city, state, zipcode) values ('Johns Hopkins University', '878 Goodland Avenue', 'Peoria', 'Illinois', '61640');
insert into University (universityName, address, city, state, zipcode) values ('Ecole Nationale Supérieure des Industries Textiles de Mulhouse', '31858 Mayer Lane', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Central', '16 Brentwood Avenue', 'Schaumburg', 'Illinois', '60193');
insert into University (universityName, address, city, state, zipcode) values ('Wadi International University', '30152 Hovde Junction', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('California State University, Dominguez Hills', '576 Onsgard Way', 'Chicago', 'Illinois', '60657');
insert into University (universityName, address, city, state, zipcode) values ('Estonian Academy of Music and Theatre', '23 Melby Pass', 'Bloomington', 'Illinois', '61709');
insert into University (universityName, address, city, state, zipcode) values ('Nova Southeastern University', '360 Sloan Circle', 'Peoria', 'Illinois', '61656');
insert into University (universityName, address, city, state, zipcode) values ('Dalian Martime University', '157 Gulseth Point', 'Chicago', 'Illinois', '60624');
insert into University (universityName, address, city, state, zipcode) values ('Hochschule Bremerhaven', '25096 Hoepker Circle', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Sardar Patel University', '2 3rd Hill', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Mutesa 1 Royal University', '08885 Linden Point', 'Rockford', 'Illinois', '61105');
insert into University (universityName, address, city, state, zipcode) values ('Australian Defence Force Academy', '5432 Lyons Lane', 'Champaign', 'Illinois', '61825');
insert into University (universityName, address, city, state, zipcode) values ('I-Shou University', '358 Chive Junction', 'Rockford', 'Illinois', '61110');
insert into University (universityName, address, city, state, zipcode) values ('Western International University', '26 Gale Park', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('European Business School Schloß Reichartshausen', '6 Manufacturers Place', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('Jalalabad State University Kyrgyzstan', '38696 Arizona Center', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('Yerevan Haibusak University', '62945 Cardinal Lane', 'Chicago', 'Illinois', '60681');
insert into University (universityName, address, city, state, zipcode) values ('Livingstone College', '258 Johnson Place', 'Springfield', 'Illinois', '62776');
insert into University (universityName, address, city, state, zipcode) values ('Indiana University - Southeast', '68731 Lakewood Junction', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('Islamic Azad University, Lahijan', '2601 Claremont Avenue', 'Chicago', 'Illinois', '60630');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Nacional Experimental de los Llanos Occidentales "Ezequiel Zamora"', '87070 Hoard Junction', 'Chicago', 'Illinois', '60697');
insert into University (universityName, address, city, state, zipcode) values ('University of Wamia and Masuria in Olsztyn', '73 Dawn Circle', 'Schaumburg', 'Illinois', '60193');
insert into University (universityName, address, city, state, zipcode) values ('Hamamatsu University School of Medicine', '90 Schlimgen Park', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Shimer College', '07 Pine View Crossing', 'Springfield', 'Illinois', '62705');
insert into University (universityName, address, city, state, zipcode) values ('Zhanjiang Ocean University', '2619 Westridge Terrace', 'Peoria', 'Illinois', '61629');
insert into University (universityName, address, city, state, zipcode) values ('Alvernia College', '6589 Johnson Pass', 'Chicago', 'Illinois', '60630');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Ma Chung', '58 Welch Place', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('North Carolina School of the Arts', '926 Glacier Hill Trail', 'Chicago', 'Illinois', '60604');
insert into University (universityName, address, city, state, zipcode) values ('Princess Sumaya University for Technology', '88452 Sauthoff Point', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Armstrong Atlantic State University', '8766 Shopko Crossing', 'Aurora', 'Illinois', '60505');
insert into University (universityName, address, city, state, zipcode) values ('Kazan State Music Conservatory', '59 Stoughton Road', 'East Saint Louis', 'Illinois', '62205');
insert into University (universityName, address, city, state, zipcode) values ('Kwangju University', '53 Northfield Parkway', 'Chicago', 'Illinois', '60697');
insert into University (universityName, address, city, state, zipcode) values ('DeVry Institute of Technology', '64 Tennyson Place', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('Rezekne Higher School', '34 Emmet Court', 'Chicago', 'Illinois', '60663');
insert into University (universityName, address, city, state, zipcode) values ('Gyeongju University', '76 Jackson Way', 'Chicago', 'Illinois', '60686');
insert into University (universityName, address, city, state, zipcode) values ('Nigerian Defence Academy', '00 Muir Road', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Ecole Supérieure d''Electricité', '10614 Farwell Way', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Texila American University', '67171 American Ash Alley', 'Peoria', 'Illinois', '61656');
insert into University (universityName, address, city, state, zipcode) values ('Universidad César Vallejo', '54 Sunbrook Plaza', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('Yashawantrao Chavan Maharashtra Open University', '47290 Garrison Court', 'Rockford', 'Illinois', '61110');
insert into University (universityName, address, city, state, zipcode) values ('East-West University, Mohakhali', '2 Sunbrook Parkway', 'Chicago', 'Illinois', '60669');
insert into University (universityName, address, city, state, zipcode) values ('Fundación Universitaria de Boyacá', '0172 Ronald Regan Court', 'Bloomington', 'Illinois', '61709');
insert into University (universityName, address, city, state, zipcode) values ('Université de la Manouba', '96872 Michigan Drive', 'Chicago', 'Illinois', '60669');
insert into University (universityName, address, city, state, zipcode) values ('Växjö University', '295 Waywood Street', 'Peoria', 'Illinois', '61629');
insert into University (universityName, address, city, state, zipcode) values ('York College of Pennsylvania', '6 Cascade Plaza', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('Ecole Supérieure d''Informatique et de Management', '98431 Clemons Trail', 'Chicago', 'Illinois', '60686');
insert into University (universityName, address, city, state, zipcode) values ('Missouri Tech', '93 Warbler Alley', 'Chicago', 'Illinois', '60657');
insert into University (universityName, address, city, state, zipcode) values ('University of Akron', '1 Merry Court', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Suleyman Demirel University', '54989 Gerald Parkway', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Yantai University', '504 Canary Plaza', 'Chicago', 'Illinois', '60674');
insert into University (universityName, address, city, state, zipcode) values ('Instituto Superior de Ciências Empresariais e de Turismo', '3 Calypso Center', 'East Saint Louis', 'Illinois', '62205');
insert into University (universityName, address, city, state, zipcode) values ('Albion College', '141 Merry Center', 'Chicago', 'Illinois', '60681');
insert into University (universityName, address, city, state, zipcode) values ('Arizona Christian University', '395 Kipling Junction', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('University of Evansville', '6 Norway Maple Point', 'Springfield', 'Illinois', '62723');
insert into University (universityName, address, city, state, zipcode) values ('Ilsa Independent College', '66 Northridge Road', 'Springfield', 'Illinois', '62756');
insert into University (universityName, address, city, state, zipcode) values ('Baker College of Cadillac', '7594 Bashford Plaza', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Mount Senario College', '5 Northland Park', 'Chicago', 'Illinois', '60686');
insert into University (universityName, address, city, state, zipcode) values ('Evangelische Fachhochschule Nürnberg', '9 Fair Oaks Place', 'Springfield', 'Illinois', '62711');
insert into University (universityName, address, city, state, zipcode) values ('Universidad de Concepción del Uruguay', '93 Springs Way', 'Springfield', 'Illinois', '62723');
insert into University (universityName, address, city, state, zipcode) values ('Yanbu Industrial College', '8566 Carberry Lane', 'Chicago', 'Illinois', '60674');
insert into University (universityName, address, city, state, zipcode) values ('Universidade Catolica Portuguesa', '201 Johnson Point', 'Chicago', 'Illinois', '60609');
insert into University (universityName, address, city, state, zipcode) values ('Universiteit Doesburg (UNDO)', '53310 Loeprich Park', 'Bloomington', 'Illinois', '61709');
insert into University (universityName, address, city, state, zipcode) values ('Faculdades Integradas Toledo', '07143 Porter Road', 'Chicago', 'Illinois', '60624');
insert into University (universityName, address, city, state, zipcode) values ('Shippensburg University of Pennsylvania', '9 Anniversary Drive', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('London Metropolitan University', '7615 Washington Center', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Occidental College', '17 Lakewood Gardens Hill', 'Chicago', 'Illinois', '60604');
insert into University (universityName, address, city, state, zipcode) values ('Fachhochschule Hof', '26955 Rutledge Avenue', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('Pontifcia Università Urbaniana', '60 Judy Crossing', 'Peoria', 'Illinois', '61656');
insert into University (universityName, address, city, state, zipcode) values ('University of Agriculture Makurdi', '83917 American Drive', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('Christchurch Polytechnic Institute of Technology', '96 Hayes Street', 'Aurora', 'Illinois', '60505');
insert into University (universityName, address, city, state, zipcode) values ('Belarussian State Polytechnical Academy', '36 Paget Plaza', 'Carol Stream', 'Illinois', '60351');
insert into University (universityName, address, city, state, zipcode) values ('Thames Valley University', '28593 Stuart Parkway', 'Chicago', 'Illinois', '60624');
insert into University (universityName, address, city, state, zipcode) values ('Tibet Agricultural and Animal Husbandry College', '09 Shoshone Street', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Islamic College for Sciences and Technologies', '1 Cody Drive', 'Springfield', 'Illinois', '62718');
insert into University (universityName, address, city, state, zipcode) values ('Nara Women''s University', '85 East Street', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('Universität Vienna', '60854 Red Cloud Plaza', 'Chicago', 'Illinois', '60691');
insert into University (universityName, address, city, state, zipcode) values ('Whitworth College', '47178 Sheridan Road', 'Decatur', 'Illinois', '62525');
insert into University (universityName, address, city, state, zipcode) values ('Riga Teacher Training and Educational Management Academy', '4 Superior Center', 'Chicago', 'Illinois', '60604');
insert into University (universityName, address, city, state, zipcode) values ('University of Central Florida', '29828 International Avenue', 'Springfield', 'Illinois', '62705');
insert into University (universityName, address, city, state, zipcode) values ('DeVry Institute of Technology, Pomona', '545 Canary Court', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Avondale College', '38031 Kipling Pass', 'Chicago', 'Illinois', '60669');
insert into University (universityName, address, city, state, zipcode) values ('Liaoning Normal University', '499 Kim Street', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('China Foreign Affairs University', '27 East Junction', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Dongbei University of Finance And Economics', '7331 Crowley Hill', 'Chicago', 'Illinois', '60674');
insert into University (universityName, address, city, state, zipcode) values ('Institute of Business Administration Sukkur', '3504 Comanche Place', 'Springfield', 'Illinois', '62776');
insert into University (universityName, address, city, state, zipcode) values ('Bangalore University', '1 Jana Court', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Southeast University', '1 Ridgeway Junction', 'Peoria', 'Illinois', '61629');
insert into University (universityName, address, city, state, zipcode) values ('Franklin Pierce College', '7459 Lawn Way', 'Springfield', 'Illinois', '62711');
insert into University (universityName, address, city, state, zipcode) values ('Yaroslavl International University of Business and New Technologies', '829 Harper Street', 'Chicago', 'Illinois', '60691');
insert into University (universityName, address, city, state, zipcode) values ('Westmont College', '43 Hoard Terrace', 'Joliet', 'Illinois', '60435');
insert into University (universityName, address, city, state, zipcode) values ('University of Charleston South Carolina', '8 Golf View Trail', 'Joliet', 'Illinois', '60435');
insert into University (universityName, address, city, state, zipcode) values ('Mahatma Gandhi University Meghalaya ', '52969 Graedel Street', 'Chicago', 'Illinois', '60681');
insert into University (universityName, address, city, state, zipcode) values ('Soonchunhyang University', '55 Coleman Lane', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Católica de Santa Fé', '34 Barby Way', 'Aurora', 'Illinois', '60505');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Paramadina Mulya', '8 Sheridan Trail', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Wilmington College', '3816 Larry Alley', 'Chicago', 'Illinois', '60609');
insert into University (universityName, address, city, state, zipcode) values ('Catholic University of Korea', '69671 Moose Way', 'Carol Stream', 'Illinois', '60158');
insert into University (universityName, address, city, state, zipcode) values ('Loras College', '2138 Elka Crossing', 'Carol Stream', 'Illinois', '60158');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Negeri Yogyakarta', '72912 Moland Pass', 'Springfield', 'Illinois', '62756');
insert into University (universityName, address, city, state, zipcode) values ('Hochschule Wismar, Fachhochschule für Technik, Wirtschaft und Gestaltung', '51451 Vera Court', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Tecnológica San Antonio de Machala', '91 Oriole Point', 'Joliet', 'Illinois', '60435');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Persada Indonesia Y.A.I', '52 Hoffman Parkway', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('SASTRA Deemed University', '09797 Holy Cross Park', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Saad College of Nursing and Allied Health Sciences', '17 Larry Road', 'Peoria', 'Illinois', '61651');
insert into University (universityName, address, city, state, zipcode) values ('North Carolina Central University', '492 Debs Plaza', 'Champaign', 'Illinois', '61825');
insert into University (universityName, address, city, state, zipcode) values ('University of Szeged', '21 Spohn Street', 'Champaign', 'Illinois', '61825');
insert into University (universityName, address, city, state, zipcode) values ('Sofia University "St. Kliment Ohridski"', '28 Merry Hill', 'Springfield', 'Illinois', '62711');
insert into University (universityName, address, city, state, zipcode) values ('Nagoya University', '04637 Colorado Point', 'Springfield', 'Illinois', '62705');
insert into University (universityName, address, city, state, zipcode) values ('Nevsky Institute of Language and Culture', '10502 Debs Lane', 'Peoria', 'Illinois', '61635');
insert into University (universityName, address, city, state, zipcode) values ('University of Colorado at Boulder', '29147 8th Avenue', 'Rockford', 'Illinois', '61105');
insert into University (universityName, address, city, state, zipcode) values ('Centro Universitário Plinio Leite', '85 Corben Alley', 'Decatur', 'Illinois', '62525');
insert into University (universityName, address, city, state, zipcode) values ('Université de Sherbrooke', '671 Talmadge Trail', 'Springfield', 'Illinois', '62794');
insert into University (universityName, address, city, state, zipcode) values ('Escola Nautica Infante D. Henrique', '6 Eliot Court', 'Chicago', 'Illinois', '60604');
insert into University (universityName, address, city, state, zipcode) values ('Austin College', '32 Gateway Hill', 'Chicago', 'Illinois', '60624');
insert into University (universityName, address, city, state, zipcode) values ('Moscow State University of Ecological Engineering', '3 Hagan Court', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Pedagogical State University "Ion Creanga"', '049 Sutherland Terrace', 'Springfield', 'Illinois', '62794');
insert into University (universityName, address, city, state, zipcode) values ('Mother Teresa Women''s University', '0135 Ronald Regan Center', 'Chicago', 'Illinois', '60686');
insert into University (universityName, address, city, state, zipcode) values ('Université de Bretagne Sud', '79 Corry Alley', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('San Juan Bautista School of Medicine', '8185 Victoria Way', 'Peoria', 'Illinois', '61629');
insert into University (universityName, address, city, state, zipcode) values ('Polytechnic Ibadan', '56660 Rutledge Parkway', 'Peoria', 'Illinois', '61635');
insert into University (universityName, address, city, state, zipcode) values ('Dominican University', '050 Trailsway Terrace', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('Fukui University of Technology', '75 Morrow Way', 'Springfield', 'Illinois', '62718');
insert into University (universityName, address, city, state, zipcode) values ('Southeastern Oklahoma State University', '43 Fieldstone Avenue', 'Springfield', 'Illinois', '62756');
insert into University (universityName, address, city, state, zipcode) values ('National Academy of Music "Pantcho Vladigerov"', '0171 Twin Pines Trail', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('University of East London', '8 Northland Alley', 'Peoria', 'Illinois', '61629');
insert into University (universityName, address, city, state, zipcode) values ('Loyola University New Orleans', '71 Cody Terrace', 'Carol Stream', 'Illinois', '60351');
insert into University (universityName, address, city, state, zipcode) values ('Florida University of Medicine', '64085 Russell Way', 'Chicago', 'Illinois', '60681');
insert into University (universityName, address, city, state, zipcode) values ('Aktau State University', '0 Hudson Pass', 'Aurora', 'Illinois', '60505');
insert into University (universityName, address, city, state, zipcode) values ('Hastings College', '40 Talmadge Crossing', 'Carol Stream', 'Illinois', '60351');
insert into University (universityName, address, city, state, zipcode) values ('University of Idaho', '3334 Summit Trail', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Timirjazev Moscow Academy of Agricultutre', '79527 Merchant Drive', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Comunera', '2 Anthes Pass', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Bunkyo University', '257 Duke Park', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Mordovian State University', '4 Canary Terrace', 'Chicago', 'Illinois', '60657');
insert into University (universityName, address, city, state, zipcode) values ('Sugiyama Jogakuen University', '493 Everett Plaza', 'Chicago', 'Illinois', '60663');
insert into University (universityName, address, city, state, zipcode) values ('American University of Paris', '8800 Duke Trail', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Shreemati Nathibai Damodar Thackersey Women''s University', '31349 Doe Crossing Plaza', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Vassar College', '14 Pepper Wood Lane', 'Chicago', 'Illinois', '60641');
insert into University (universityName, address, city, state, zipcode) values ('Universidad de San Andres', '80 Ohio Road', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('Baker College of Owosso', '229 Shoshone Plaza', 'Chicago', 'Illinois', '60646');
insert into University (universityName, address, city, state, zipcode) values ('Academia Nacional Superior de Orquesta', '9926 Goodland Court', 'Naperville', 'Illinois', '60567');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Latinoamericana de Ciencia y Tecnologia, Panamá', '684 Forest Run Circle', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Universidad de San Miguel', '9155 Village Hill', 'Chicago', 'Illinois', '60691');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Autonoma  de Durango', '6088 Monica Alley', 'Peoria', 'Illinois', '61656');
insert into University (universityName, address, city, state, zipcode) values ('West Bengal University of Animal and Fishery Sciences', '83971 Steensland Parkway', 'Chicago', 'Illinois', '60604');
insert into University (universityName, address, city, state, zipcode) values ('St. Vincent College', '6561 Butternut Road', 'Peoria', 'Illinois', '61651');
insert into University (universityName, address, city, state, zipcode) values ('St. Mary''s College Indiana', '701 Messerschmidt Center', 'Peoria', 'Illinois', '61640');
insert into University (universityName, address, city, state, zipcode) values ('St. Michael''s College', '8 Dottie Drive', 'Joliet', 'Illinois', '60435');
insert into University (universityName, address, city, state, zipcode) values ('Islamic Azad University, Shirvan', '9 Delaware Center', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('University of Maine, Farmington', '312 Holy Cross Hill', 'Peoria', 'Illinois', '61635');
insert into University (universityName, address, city, state, zipcode) values ('Instituto Tecnológico de Morelia', '86113 Schiller Hill', 'Champaign', 'Illinois', '61825');
insert into University (universityName, address, city, state, zipcode) values ('University of Bradford', '227 Grim Hill', 'Chicago', 'Illinois', '60614');
insert into University (universityName, address, city, state, zipcode) values ('Narendra Deva University of Agriculture and Technology', '2613 Old Shore Circle', 'Palatine', 'Illinois', '60078');
insert into University (universityName, address, city, state, zipcode) values ('Ilia Chavchavadze State University', '22566 Killdeer Drive', 'Chicago', 'Illinois', '60636');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Muhammadiyah Mataram', '40 Schlimgen Terrace', 'Springfield', 'Illinois', '62794');
insert into University (universityName, address, city, state, zipcode) values ('Ochanomizu Women''s University', '01 Melby Drive', 'Chicago', 'Illinois', '60686');
insert into University (universityName, address, city, state, zipcode) values ('Université Catholique de Lille', '780 Springview Parkway', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('Tokyo University of Agriculture and Technology', '1 Harbort Hill', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('Reed College', '00695 Pawling Pass', 'Peoria', 'Illinois', '61605');
insert into University (universityName, address, city, state, zipcode) values ('Siauliai University', '22123 School Alley', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('St. Luke''s College', '7750 Hintze Center', 'Schaumburg', 'Illinois', '60193');
insert into University (universityName, address, city, state, zipcode) values ('Southern University - Shreveport', '43651 Stoughton Pass', 'Chicago', 'Illinois', '60609');
insert into University (universityName, address, city, state, zipcode) values ('Universitas Proklamasi 45', '993 Farragut Trail', 'Chicago', 'Illinois', '60657');
insert into University (universityName, address, city, state, zipcode) values ('Jawaharlal Nehru Technological University', '991 Longview Circle', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('Tumaini University - Iringa University College', '36 Morning Place', 'Springfield', 'Illinois', '62776');
insert into University (universityName, address, city, state, zipcode) values ('Rose-Hulman Institute of Technology', '1 Susan Trail', 'Chicago', 'Illinois', '60624');
insert into University (universityName, address, city, state, zipcode) values ('Ajou University', '0 Trailsway Park', 'Rockford', 'Illinois', '61105');
insert into University (universityName, address, city, state, zipcode) values ('Jamia Millia Islamia University', '32 Rutledge Drive', 'Chicago', 'Illinois', '60619');
insert into University (universityName, address, city, state, zipcode) values ('South Asian Institute of Technology And Medicine (SAITM) ', '8 6th Way', 'East Saint Louis', 'Illinois', '62205');
insert into University (universityName, address, city, state, zipcode) values ('Universidad Libre de Costa Rica', '48732 Elka Way', 'Springfield', 'Illinois', '62718');
insert into University (universityName, address, city, state, zipcode) values ('Hampshire College', '45 Moulton Road', 'Rockford', 'Illinois', '61110');
insert into University (universityName, address, city, state, zipcode) values ('Fachhochschule Kempten, Hochschule für Technik und Wirtschaft', '02 Victoria Drive', 'Peoria', 'Illinois', '61614');
insert into University (universityName, address, city, state, zipcode) values ('Technological University (Hpaan)', '8581 Carey Avenue', 'East Saint Louis', 'Illinois', '62205');
insert into University (universityName, address, city, state, zipcode) values ('Universidad de Cuautitlan Izcalli', '8 Northridge Junction', 'Evanston', 'Illinois', '60208');
insert into University (universityName, address, city, state, zipcode) values ('Shizuoka Prefectural University', '6 Heffernan Street', 'Carol Stream', 'Illinois', '60158');
insert into University (universityName, address, city, state, zipcode) values ('European Regional Educational Academy of Armenia', '377 La Follette Way', 'Peoria', 'Illinois', '61656');
insert into University (universityName, address, city, state, zipcode) values ('Uzima University College ', '988 Onsgard Parkway', 'Chicago', 'Illinois', '60697');
insert into University (universityName, address, city, state, zipcode) values ('Namik Kemal University', '790 Golf Avenue', 'Chicago', 'Illinois', '60619');

#Selecting currently supported Universities
SELECT universityName FROM University ;

#Selecting Supporting Universities with zipcodes
SELECT universityName, zipcode FROM University ;

#Inserting jdoe in the User Table
INSERT INTO User(userName, password, universityName, lastName, firstName, phoneNo, email, licenceNumber)
VALUES ('jdoe1',sha('jdoe'),'Northeastern Illinois ', 'Doe', 'John', '0000000000', 'jdoe@gmail.com','L-100-000');

#Error codes for reference
# Code 1062: Duplicate User
# Code 1452: No University exists for user
