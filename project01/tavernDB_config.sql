-- USE _________; SPECIFY FINAL DATABASE USED IN IMPLEMENTATION

-- DOCUMENTATION:
-- Describes the structure of the relational Tavern Management database
-- Source this file to wipe the db and create a clean coppy
-- Author: Will Gross
-- Date:2/28/2019
-- Version: 1.0
-- -----------------------------------------------------

-- Drops tables in order of least dependency to most to avoid foreign key conflicts

 DROP TABLE IF EXISTS `userInfo`;
 DROP TABLE IF EXISTS `serviceStatuses`;
 DROP TABLE IF EXISTS `sales`;
 DROP TABLE IF EXISTS `orders`;
 DROP TABLE IF EXISTS `inventory`;
 DROP TABLE IF EXISTS `rats`;
 DROP TABLE IF EXISTS `locations`;
 DROP TABLE IF EXISTS `units`;
 DROP TABLE IF EXISTS `statuses`;
 DROP TABLE IF EXISTS `services`;
 DROP TABLE IF EXISTS `supplies`;
 DROP TABLE IF EXISTS `roles`;
 DROP TABLE IF EXISTS `guests`;
 DROP TABLE IF EXISTS `users`;
 DROP TABLE IF EXISTS `taverns`;


-- Creates tables in order of most dependency to least to create all necessary foreign keys before use

-- Table structure for table 'taverns'

CREATE TABLE `taverns`  (
  `id` int(4) NOT NULL auto_increment, -- for database use
  `name` varchar(50) NOT NULL DEFAULT '', -- name of tavern or franchise
  PRIMARY KEY(`id`)
);

-- Dumping TEST data for table 'taverns'

LOCK TABLES `taverns` WRITE ;
INSERT INTO `taverns` VALUES
  (1,'The Marchese Blue Light Pub'),
  (2,'Prospectors'),
  (3,'Paddys'),
  (4,'Train Wreck'),
  (5,'Tavern on Broad'),
  (6,'Firebird')
  ;
UNLOCK TABLES;



-- Table structure for table 'users'

CREATE TABLE `users` (
   `id` int(11) NOT NULL auto_increment,
   `name` varchar(25) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'users'

LOCK TABLES `users` WRITE ;
INSERT INTO `users` VALUES
  (1,'Will Gross'),
  (2, 'Chef Chris'),
  (3, 'TR Mansfield'),
  (4, 'Sheryl'),
  (5, 'Shannon'),
  (6, 'Frank Reynolds'),
  (7, 'Charlie Kelly')
  ;
UNLOCK TABLES;




-- Table structure for table 'roles'

CREATE TABLE `roles` (
  `id` int(3) NOT NULL auto_increment, -- for database use
  `role` varchar(50) NOT NULL DEFAULT '', -- name of role in plain english
  `description` varchar(500) NOT NULL DEFAULT '', --brief description of the role
  PRIMARY KEY (`id`)
);



-- Table structure for table 'guests'

CREATE TABLE `guests` (
   `id` int(20) NOT NULL auto_increment,
   `name` varchar(25) NOT NULL DEFAULT '',
   `birthday` DATE,
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'guests'

LOCK TABLES `guests` WRITE ;
INSERT INTO `guests` VALUES
  (1,'jimmy','1997-06-22'),
  (2, 'timmy','1982-12-07'),
  (3, 'john','2010-01-31'),
  (4, 'Sheryl','1969-06-23'),
  (5, 'Shannon','2000-10-10'),
  (6, 'Frank','1997-06-22')
  ;
UNLOCK TABLES;



-- Dumping TEST data for table 'roles'

LOCK TABLES `roles` WRITE ;
INSERT INTO `roles` VALUES
  (1,'Owner', 'Owns the establishment'),
  (2,'General Manager','Runs the daily operations of the establishment'),
  (3,'Executive Chef','In charge of the menu and runs all back of the house operations'),
  (4,'Manager','Runs all of the front of the house operations'),
  (5,'Host','Greets customers, handles reservations'),
  (6,'Server','Communicates between customer, kitchen, and bar. Serves customer'),
  (7,'Head Bartender','In charge of creating specialty cocktails and runs all bar operations'),
  (8,'Bartender','Makes and serves drinks to customers'),
  (9,'Barback','Ensures bar is properly and consistantly stocked'),
  (10,'Line Cook','Prepares food in accordance with back of house standards'),
  (11,'Dish Washer','Cleans dishes and glass wear, cleans and maintains back of house')
  ;
UNLOCK TABLES;




-- Table structure for table 'supplies'

CREATE TABLE `supplies` (
   `id` int(5) NOT NULL auto_increment,
   `name` varchar(30) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'supplies'

LOCK TABLES `supplies` WRITE ;
INSERT INTO `supplies` VALUES
  (1,'pint glasses'),
  (2, 'plates'),
  (3, 'duclaw beer'),
  (4, 'boulevard beer'),
  (5, 'napkins'),
  (6, 'onion rings'),
  (7, 'burgers')
  ;
UNLOCK TABLES;




-- Table structure for table 'services'

CREATE TABLE `services` (
   `id` int(3) NOT NULL auto_increment,
   `name` varchar(30) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'services'

LOCK TABLES `services` WRITE ;
INSERT INTO `services` VALUES
  (1,'duclaw 8oz'),
  (2, 'duclaw pint'),
  (3, 'burger'),
  (4, 'onion rings'),
  (5, 'live music cover'),
  (6, 'pool')
  ;
UNLOCK TABLES;



-- Table structure for table 'statuses'

CREATE TABLE `statuses` (
   `id` int(2) NOT NULL auto_increment,
   `name` varchar(30) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'statuses'

LOCK TABLES `statuses` WRITE ;
INSERT INTO `statuses` VALUES
  (1,'active'),
  (2, 'discontinued'),
  (3, 'suspended'),
  (4, 'pending')
  ;
UNLOCK TABLES;



-- Table structure for table 'units'

CREATE TABLE `units` (
   `id` int(2) NOT NULL auto_increment,
   `name` varchar(30) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
  );

-- Dumping TEST data for table 'units'

LOCK TABLES `units` WRITE ;
INSERT INTO `units` VALUES
  (0, 'item')
  (1, 'ounces- fluid'),
  (2, 'ounces- weight'),
  (3, 'pounds'),
  (4, 'kegs'),
  (5, 'cases'),
  (6, 'cans'),
  (7, 'bottles')
  ;
UNLOCK TABLES;

-- Table structure for table 'locations'

CREATE TABLE `locations` (
	`id` int(9) NOT NULL auto_increment, --for database use
	`streetAddress` VARCHAR(40) NOT NULL DEFAULT '', --street adress of loctaion, including street number, name, and suite/apartment number
	`city` VARCHAR(21) NOT NULL DEFAULT '',
  `state` char(2) NOT NULL DEFAULT '', --two letter state abreviation
  `zip` int(5) NOT NULL DEFAULT 0, --5 digit zip code of location
	`numFloors` int(3) NOT NULL DEFAULT 0, --number of floors at location
	`tavern_ID` int(4) NOT NULL DEFAULT 0, --id of tavern at this location from taverns table
  PRIMARY KEY (`id`),
	FOREIGN KEY (`tavern_ID`) REFERENCES `taverns`(`id`)
);


-- Dumping TEST data for table 'locations'

LOCK TABLES `locations` WRITE ;
INSERT INTO `locations` VALUES
  (1, '4000 Mayflower Hill', 'Waterville', 'ME', 04901, 3, 1),
  (2, '200 S Broad Street', 'Philadelphia', 'PA', 19102, 23, 5),
  (3, '25 Madison Ave', 'Mt Holly', 'NJ', 08060, 1, 4),
  (4, '228 Race Street', 'Philadelphia', 'PA', 19160, 4, 3),
  (5, '3050 Route 38', 'Mt Laurel', 'NJ', 08054, 1, 2),
  (6, '400 Route 38', 'Moorestown', 'NJ', 08057, 1, 6)
  ;
UNLOCK TABLES;


-- Table structure for table 'rats'

CREATE TABLE `rats` (
	`id` int(15) NOT NULL auto_increment,
	`name` varchar(25) NOT NULL DEFAULT '', --name of the rat
	`location_ID` int(9) NOT NUll DEFAULT 0, --location of the rat, will also tie to the name of the tavern at the indicated location
  PRIMARY KEY (`id`),
	FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`)
 );

 	
 	-- Dumping TEST data for table 'rats'

LOCK TABLES `rats` WRITE ;
INSERT INTO `rats` VALUES
  (1, 'Remmy', 4),
  (2, 'Spectre', 1),
  (3, 'Rizzo', 2),
  (4, 'Peter Pettigrew', 2),
  (5, 'Splinter', 3)
  ;
UNLOCK TABLES;



-- Table structure for table 'inventory'

CREATE TABLE `inventory` (
  `id` int(9) NOT NULL auto_increment, --for database use
  `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the inventory is  
  `supply_ID` int(5) NOT NULL DEFAULT 0, --identifies the supply being refrenced
  `count` int(4) NOT NULL DEFAULT 0, --amount of supply in stock using stated units
  `unit_ID` int(2) NOT NULL DEFAULT 0, --unit of measure for count
  `date` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`),
  FOREIGN KEY (`supply_ID`) REFERENCES `supplies`(`id`),
  FOREIGN KEY (`unit_ID`) REFERENCES `units`(`id`)
);


-- Dumping TEST data for table 'inventory'

LOCK TABLES `inventory` WRITE ;
INSERT INTO `inventory` VALUES
  (1, 1, 1, 250, 0, '2019-03-04 10:30:00'),
  (2, 1, 2, 250, 0, '2019-03-04 10:30:00'),
  (3, 1, 3, 2, 4, '2019-03-04 10:30:00'),
  (4, 1, 5, 12, 5, '2019-03-04 10:30:00'),
  (5, 1, 7, 150, 0, '2019-03-04 10:30:00')
  ;
UNLOCK TABLES;



-- Table structure for table 'orders'

CREATE TABLE `orders` (
  `id` int(9) NOT NULL auto_increment, --for database use
  `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the inventory is  
  `supply_ID` int(5) NOT NULL DEFAULT 0, --identifies the supply being refrenced
  `count` int(4) NOT NULL DEFAULT 0, --amount of supply in stock using stated units
  `unit_ID` int(2) NOT NULL DEFAULT 0, --unit of measure for count
  `cost` decimal(19,4) NOT NULL DEFAULT 0.0, --total cost of the order, from cost and count the unit price can be calculated
  `date` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`),
  FOREIGN KEY (`unit_ID`) REFERENCES `units`(`id`)
);


-- Dumping TEST data for table 'orders'

LOCK TABLES `orders` WRITE ;
INSERT INTO `orders` VALUES
  (1, 1, 1, 1, 5, '2019-03-04 10:45:00'),
  (2, 1, 2, 2, 5, '2019-03-04 10:45:00'),
  (3, 1, 4, 2, 4, '2019-03-04 10:45:00'),
  (4, 1, 6, 10, 5, '2019-03-04 10:45:00'),
  (5, 1, 7, 2, 5, '2019-03-04 10:45:00')
  ;
UNLOCK TABLES;



-- Table structure for table 'sales'

CREATE TABLE `sales` (
  `id` int(9) NOT NULL auto_increment, --for database use
  `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the transaction occured 
  `service_ID` int(3) NOT NULL DEFAULT 0, --identifies the service sold
  `guest_ID` int(20) NOT NULL DEFAULT 0, --identifies which guest made the purchase
  `count` int(2) NOT NULL DEFAULT 0, --how many instances of the service the guest purchased
  `date` DATETIME, --date and time of purchase
  PRIMARY KEY (`id`),
  FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`),
  FOREIGN KEY (`service_ID`) REFERENCES `services`(`id`),
  FOREIGN KEY (`guest_ID`) REFERENCES `guests`(`id`)
);


-- Dumping TEST data for table 'sales'

LOCK TABLES `sales` WRITE ;
INSERT INTO `sales` VALUES
  (1, 6, 3, 1, 2, '2019-03-04 18:30:00'),
  (2, 6, 4, 2, 1, '2019-03-04 17:30:00'),
  (3, 5, 5, 3, 4, '2019-03-04 19:30:00'),
  (4, 3, 1, 4, 1, '2019-03-04 10:30:00'),
  (5, 5, 2, 5, 1, '2019-03-04 19:30:00')
  ;
UNLOCK TABLES;




-- Table structure for table 'serviceSupplies'

CREATE TABLE `serviceSupplies` (
  `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the service is offered 
  `service_ID` int(3) NOT NULL DEFAULT 0, --identifies the service being described
  `supply_ID` int(5) NOT NULL DEFAULT 0, --identifies which supply is needed
  `count` int(2) NOT NULL DEFAULT 0, --how many of the given units of the supply are needed to provide the service
  `unit_ID` int(2) NOT NULL DEFAULT 0, --unit of measure for count
  FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`),
  FOREIGN KEY (`service_ID`) REFERENCES `services`(`id`),
  FOREIGN KEY (`supply_ID`) REFERENCES `supplies`(`id`),
  FOREIGN KEY (`unit_ID`) REFERENCES `units`(`id`)
);


-- Dumping TEST data for table 'serviceSupplies'

LOCK TABLES `serviceSupplies` WRITE ;
INSERT INTO `serviceSupplies` VALUES
  (6, 3, 7, 1, 0),
  (6, 4, 6, 8, 2),
  (1, 4, 6, 6, 2),
  (3, 1, 3, 8, 1),
  (5, 2, 3, 16, 1)
  ;
UNLOCK TABLES;




-- Table structure for table 'serviceStatuses'

CREATE TABLE `serviceStatuses` (
  `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the service is offered 
  `service_ID` int(3) NOT NULL DEFAULT 0, --identifies the service being described
  `price` decimal(19,4) NOT NULL DEFAULT 0.0, --how much does this location charge for this service
  `status_ID` int(2) NOT NULL DEFAULT 0, --unit of measure for count
  FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`),
  FOREIGN KEY (`service_ID`) REFERENCES `services`(`id`),
  FOREIGN KEY (`status_ID`) REFERENCES `statuses`(`id`)
);


-- Dumping TEST data for table 'serviceStatuses'

LOCK TABLES `serviceStatuses` WRITE ;
INSERT INTO `serviceStatuses` VALUES
  (6, 3, 13.75, 1),
  (6, 4, 6.50, 1),
  (1, 4, 4.75, 1),
  (3, 1, 3.50, 1),
  (5, 2, 5.50, 1),
  (5, 5, 6.00, 3)
  ;
UNLOCK TABLES;





-- Table structure for table 'userInfo'

CREATE TABLE `userInfo` (
   `user_ID` int(11) NOT NULL DEFAULT 0, -- links to the user table to specify user name 
   `role_ID` int(3) NOT NULL DEFAULT 0, --links to the name and description of the user's role in the roles table
   `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the user works, can also determine what tavern they work for base on the location
   FOREIGN KEY (`user_ID`) REFERENCES `users`(`id`),
   FOREIGN KEY (`role_ID`) REFERENCES `roles`(`id`),
   FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`)
  );

-- Dumping TEST data for table 'userInfo'

LOCK TABLES `userInfo` WRITE ;
INSERT INTO `userInfo` VALUES
  (1, 11, 6),
  (2, 3, 6),
  (3, 2, 6),
  (4, 8, 1),
  (5, 8, 5),
  (6, 1, 4),
  (7, 9, 4)
  ;
UNLOCK TABLES;