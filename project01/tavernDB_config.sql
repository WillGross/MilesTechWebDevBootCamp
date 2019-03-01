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
 DROP TABLE IF EXISTS `rats`;
 DROP TABLE IF EXISTS `locations`;
 DROP TABLE IF EXISTS `roles`;
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


-- Table structure for table 'locations'

CREATE TABLE `locations` (
	`id` int(9) NOT NULL auto_increment, --for database use
	`streetAddress` VARCHAR(40) NOT NULL DEFAULT '', --street adress of loctaion, including street number, name, and suite/apartment number
	`city` VARCHAR(21) NOT NULL DEFAULT '',
  `state` char(2) NOT NULL DEFAULT '', --two letter state abreviation
  `zip` int(5) NOT NULL DEFAULT '', --5 digit zip code of location
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



-- Table structure for table 'users'

CREATE TABLE `userInfo` (
   `user_ID` int(11) NOT NULL DEFAULT 0, -- links to the user table to specify user name 
   `role_ID` int(3) NOT NULL DEFAULT 0, --links to the name and description of the user's role in the roles table
   `location_ID` int(9) NOT NULL DEFAULT 0, --identifies the location where the user works, can also determine what tavern they work for base on the location
   FOREIGN KEY (`user_ID`) REFERENCES `users`(`id`),
   FOREIGN KEY (`role_ID`) REFERENCES `roles`(`id`),
   FOREIGN KEY (`location_ID`) REFERENCES `locations`(`id`)
  );

-- Dumping TEST data for table 'users'

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