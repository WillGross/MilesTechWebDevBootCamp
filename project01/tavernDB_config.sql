USE WGross_2019;

-- DOCUMENTATION:
-- Describes the structure of the relational Tavern Management database
-- Source this file to wipe the db and create a clean coppy
-- Author: Will Gross
-- Date:2/28/2019
-- Version: 1.0
-- -----------------------------------------------------

-- Drops tables in order of least dependency to most to avoid foreign key conflicts


 DROP TABLE IF EXISTS userInfo;
 DROP TABLE IF EXISTS serviceStatuses;
 DROP TABLE IF EXISTS serviceSupplies;
 DROP TABLE IF EXISTS sales;
 DROP TABLE IF EXISTS orders;
 DROP TABLE IF EXISTS inventory;
 DROP TABLE IF EXISTS rats;
 DROP TABLE IF EXISTS locations;
 DROP TABLE IF EXISTS units;
 DROP TABLE IF EXISTS statuses;
 DROP TABLE IF EXISTS services;
 DROP TABLE IF EXISTS supplies;
 DROP TABLE IF EXISTS roles;
 DROP TABLE IF EXISTS guests;
 DROP TABLE IF EXISTS users;
 DROP TABLE IF EXISTS taverns;


-- Creates tables in order of most dependency to least to create all necessary foreign keys before use

-- Table structure for table 'taverns'

CREATE TABLE taverns  (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(50) NOT NULL DEFAULT '' -- name of tavern or franchise
);

-- Dumping TEST data for table 'taverns'

INSERT INTO taverns (name) VALUES
  ('The Marchese Blue Light Pub'),
  ('Prospectors'),
  ('Paddys'),
  ('Train Wreck'),
  ('Tavern on Broad'),
  ('Firebird')
  ;




-- Table structure for table 'users'

CREATE TABLE users (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use   
	name varchar(25) NOT NULL DEFAULT '',
  );

-- Dumping TEST data for table 'users'

INSERT INTO users (name) VALUES
  ('Will Gross'),
  ('Chef Chris'),
  ('TR Mansfield'),
  ('Sheryl'),
  ('Shannon'),
  ('Frank Reynolds'),
  ('Charlie Kelly')
  ;




-- Table structure for table 'roles'

CREATE TABLE roles (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  role varchar(50) NOT NULL DEFAULT '', -- name of role in plain english
  description varchar(500) NOT NULL DEFAULT '', --brief description of the role
);





-- Dumping TEST data for table 'roles'

INSERT INTO roles (role, description) VALUES
  ('Owner', 'Owns the establishment'),
  ('General Manager','Runs the daily operations of the establishment'),
  ('Executive Chef','In charge of the menu and runs all back of the house operations'),
  ('Manager','Runs all of the front of the house operations'),
  ('Host','Greets customers, handles reservations'),
  ('Server','Communicates between customer, kitchen, and bar. Serves customer'),
  ('Head Bartender','In charge of creating specialty cocktails and runs all bar operations'),
  ('Bartender','Makes and serves drinks to customers'),
  ('Barback','Ensures bar is properly and consistantly stocked'),
  ('Line Cook','Prepares food in accordance with back of house standards'),
  ('Dish Washer','Cleans dishes and glass wear, cleans and maintains back of house')
  ;




-- Table structure for table 'guests'

CREATE TABLE guests (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(25) NOT NULL DEFAULT '',
  birthday DATE
  );

-- Dumping TEST data for table 'guests'

INSERT INTO guests (name, birthday) VALUES
  ('jimmy','1997-06-22'),
  ('timmy','1982-12-07'),
  ('john','2010-01-31'),
  ('Sheryl','1969-06-23'),
  ('Shannon','2000-10-10'),
  ('Frank','1997-06-22')
  ;




-- Table structure for table 'supplies'

CREATE TABLE supplies (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(30) NOT NULL DEFAULT ''
  );

-- Dumping TEST data for table 'supplies'

INSERT INTO supplies (name) VALUES
  ('pint glasses'),
  ('plates'),
  ('duclaw beer'),
  ('boulevard beer'),
  ('napkins'),
  ('onion rings'),
  ('burgers')
  ;




-- Table structure for table 'services'

CREATE TABLE services (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(30) NOT NULL DEFAULT ''
  );

-- Dumping TEST data for table 'services'

INSERT INTO services (name) VALUES
  ('duclaw 8oz'),
  ('duclaw pint'),
  ('burger'),
  ('onion rings'),
  ('live music cover'),
  ('pool')
  ;



-- Table structure for table 'statuses'

CREATE TABLE statuses (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(30) NOT NULL DEFAULT ''
  );

-- Dumping TEST data for table 'statuses'

INSERT INTO statuses (name) VALUES
  ('active'),
  ('discontinued'),
  ('suspended'),
  ('pending')
  ;



-- Table structure for table 'units'

CREATE TABLE units (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(30) NOT NULL DEFAULT ''
  );

-- Dumping TEST data for table 'units'

INSERT INTO units (name) VALUES
  ('item'),
  ('ounces- fluid'),
  ('ounces- weight'),
  ('pounds'),
  ('kegs'),
  ('cases'),
  ('cans'),
  ('bottles')
  ;



-- Table structure for table 'locations'

CREATE TABLE locations (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  streetAddress VARCHAR(40) NOT NULL DEFAULT '', --street adress of loctaion, including street number, name, and suite/apartment number
  city VARCHAR(21) NOT NULL DEFAULT '',
  state char(2) NOT NULL DEFAULT '', --two letter state abreviation
  zip int NOT NULL DEFAULT 0, --5 digit zip code of location
  numFloors int NOT NULL DEFAULT 0, --number of floors at location
  tavern_ID int FOREIGN KEY REFERENCES taverns (id) NOT NULL DEFAULT 0, --id of tavern at this location from taverns table
);


-- Dumping TEST data for table 'locations'

INSERT INTO locations (streetAddress, city, state, zip, numFloors, tavern_ID) VALUES
  ('4000 Mayflower Hill', 'Waterville', 'ME', 04901, 3, 1),
  ('200 S Broad Street', 'Philadelphia', 'PA', 19102, 23, 5),
  ('25 Madison Ave', 'Mt Holly', 'NJ', 08060, 1, 4),
  ('228 Race Street', 'Philadelphia', 'PA', 19160, 4, 3),
  ('3050 Route 38', 'Mt Laurel', 'NJ', 08054, 1, 2),
  ('400 Route 38', 'Moorestown', 'NJ', 08057, 1, 6)
  ;


-- Table structure for table 'rats'

CREATE TABLE rats (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  name varchar(25) NOT NULL DEFAULT '', --name of the rat
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NUll DEFAULT 0 --location of the rat, will also tie to the name of the tavern at the indicated location
 );

 	
 	-- Dumping TEST data for table 'rats'

INSERT INTO rats (name, location_ID) VALUES
  ('Remmy', 4),
  ('Spectre', 1),
  ('Rizzo', 2),
  ('Peter Pettigrew', 2),
  ('Splinter', 3)
  ;



-- Table structure for table 'inventory'

CREATE TABLE inventory (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0, --identifies the location where the inventory is  
  supply_ID int   FOREIGN KEY (supply_ID) REFERENCES supplies(id) NOT NULL DEFAULT 0, --identifies the supply being refrenced
  count int NOT NULL DEFAULT 0, --amount of supply in stock using stated units
  unit_ID int FOREIGN KEY (unit_ID) REFERENCES units (id) NOT NULL DEFAULT 0, --unit of measure for count
  date DATETIME
 );


-- Dumping TEST data for table 'inventory'

INSERT INTO inventory (location_ID, supply_ID, count, unit_ID, date) VALUES
  (1, 1, 250, 1, '2019-03-04 10:30:00'),
  (1, 2, 250, 1, '2019-03-04 10:30:00'),
  (1, 3, 2, 5, '2019-03-04 10:30:00'),
  (1, 5, 12, 6, '2019-03-04 10:30:00'),
  (1, 7, 150, 1, '2019-03-04 10:30:00')
  ;



-- Table structure for table 'orders'

CREATE TABLE orders (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0, --identifies the location where the inventory is  
  supply_ID int FOREIGN KEY (supply_ID) REFERENCES supplies (id) NOT NULL DEFAULT 0, --identifies the supply being refrenced
  count int NOT NULL DEFAULT 0, --amount of supply in stock using stated units
  unit_ID int FOREIGN KEY (unit_ID) REFERENCES units(id) NOT NULL DEFAULT 0, --unit of measure for count
  cost decimal(19,4) NOT NULL DEFAULT 0.0, --total cost of the order, from cost and count the unit price can be calculated
  date DATETIME
);


-- Dumping TEST data for table 'orders'

INSERT INTO orders (location_ID, supply_ID, count, unit_ID, cost, date) VALUES
  (1, 1, 1, 6, 75.00, '2019-03-04 10:45:00'),
  (1, 2, 2, 6, 130.00,'2019-03-04 10:45:00'),
  (1, 4, 2, 5, 55.95, '2019-03-04 10:45:00'),
  (1, 6, 10, 6, 35.12, '2019-03-04 10:45:00'),
  (1, 7, 2, 6, 67.00, '2019-03-04 10:45:00')
  ;



-- Table structure for table 'sales'

CREATE TABLE sales (
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL, -- for database use
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0, --identifies the location where the transaction occured 
  service_ID int FOREIGN KEY (service_ID) REFERENCES services(id) NOT NULL DEFAULT 0, --identifies the service sold
  guest_ID int FOREIGN KEY (guest_ID) REFERENCES guests(id) NOT NULL DEFAULT 0, --identifies which guest made the purchase
  count int NOT NULL DEFAULT 0, --how many instances of the service the guest purchased
  date DATETIME --date and time of purchase
);


-- Dumping TEST data for table 'sales'

INSERT INTO sales (location_ID, service_ID, guest_ID, count, date) VALUES
  (6, 3, 1, 2, '2019-03-04 18:30:00'),
  (6, 4, 2, 1, '2019-03-04 17:30:00'),
  (5, 5, 3, 4, '2019-03-04 19:30:00'),
  (3, 1, 4, 1, '2019-03-04 10:30:00'),
  (5, 2, 5, 1, '2019-03-04 19:30:00')
  ;




-- Table structure for table 'serviceSupplies'

CREATE TABLE serviceSupplies (
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0, --identifies the location where the service is offered 
  service_ID int FOREIGN KEY (service_ID) REFERENCES services(id) NOT NULL DEFAULT 0, --identifies the service being described
  supply_ID int FOREIGN KEY (supply_ID) REFERENCES supplies (id) NOT NULL DEFAULT 0, --identifies which supply is needed
  count int NOT NULL DEFAULT 0, --how many of the given units of the supply are needed to provide the service
  unit_ID int FOREIGN KEY (unit_ID) REFERENCES units(id) NOT NULL DEFAULT 0 --unit of measure for count
);


-- Dumping TEST data for table 'serviceSupplies'

INSERT INTO serviceSupplies (location_ID, service_ID, supply_ID, count, unit_ID) VALUES
  (6, 3, 7, 1, 1),
  (6, 4, 6, 8, 3),
  (1, 4, 6, 6, 3),
  (3, 1, 3, 8, 2),
  (5, 2, 3, 16, 2)
  ;




-- Table structure for table 'serviceStatuses'

CREATE TABLE serviceStatuses (
  location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0, --identifies the location where the service is offered 
  service_ID int FOREIGN KEY (service_ID) REFERENCES services(id) NOT NULL DEFAULT 0, --identifies the service being described
  price decimal(19,4) NOT NULL DEFAULT 0.0, --how much does this location charge for this service
  status_ID int FOREIGN KEY (status_ID) REFERENCES statuses(id) NOT NULL DEFAULT 0 --unit of measure for count
);


-- Dumping TEST data for table 'serviceStatuses'

INSERT INTO serviceStatuses (location_ID, service_ID, price, status_ID) VALUES
  (6, 3, 13.75, 1),
  (6, 4, 6.50, 1),
  (1, 4, 4.75, 1),
  (3, 1, 3.50, 1),
  (5, 2, 5.50, 1),
  (5, 5, 6.00, 3)
  ;





-- Table structure for table 'userInfo'

CREATE TABLE userInfo (
   user_ID int FOREIGN KEY (user_ID) REFERENCES users(id) NOT NULL DEFAULT 0, -- links to the user table to specify user name 
   role_ID int FOREIGN KEY (role_ID) REFERENCES roles(id) NOT NULL DEFAULT 0, --links to the name and description of the user's role in the roles table
   location_ID int FOREIGN KEY (location_ID) REFERENCES locations(id) NOT NULL DEFAULT 0 --identifies the location where the user works, can also determine what tavern they work for base on the location
  );

-- Dumping TEST data for table 'userInfo'

INSERT INTO userInfo (user_ID, role_ID, location_ID) VALUES
  (1, 11, 6),
  (2, 3, 6),
  (3, 2, 6),
  (4, 8, 1),
  (5, 8, 5),
  (6, 1, 4),
  (7, 9, 4)
  ;
