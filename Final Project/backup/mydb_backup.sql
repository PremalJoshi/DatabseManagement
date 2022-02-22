-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2021 at 01:16 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_album_stock` (`album_name_param` VARCHAR(50)) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
BEGIN 
		DECLARE album_stock_var INT;
        
        SELECT stock INTO album_stock_var FROM album WHERE album_name = album_name_param;
        RETURN(album_stock_var);
	END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_client_id` (`first_name_param` VARCHAR(50)) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
BEGIN 
		DECLARE client_id_var INT;
        
        SELECT client_id INTO client_id_var FROM client WHERE first_name = first_name_param;
        RETURN(client_id_var);
	END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_track_stock` (`track_name_param` VARCHAR(50)) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
BEGIN 
		DECLARE track_stock_var INT;
        
        SELECT stock INTO track_stock_var FROM tracks WHERE title = track_name_param;
        RETURN(track_stock_var);
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `album_name` varchar(45) NOT NULL,
  `release_date` date NOT NULL,
  `album_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `album_name`, `release_date`, `album_price`, `stock`) VALUES
(1, 'Aashiqui 2', '2005-12-31', 1000, 5),
(2, 'ABCD 2', '2010-10-10', 1500, 2),
(3, 'Agent Vinod', '2015-07-08', 500, 7),
(4, 'All Is Well', '2012-12-01', 1200, 20),
(5, 'Andhudhun', '2020-05-05', 2000, 9),
(6, 'Apne', '2010-02-14', 1500, 11),
(7, 'Badlapur', '2019-10-01', 1200, 1),
(8, 'Bajirao Mastani', '2015-12-10', 2500, 30),
(9, 'Bandish Bandits', '2014-02-12', 1800, 45),
(10, 'Batla House', '2018-09-11', 1000, 22);

-- --------------------------------------------------------

--
-- Table structure for table `album_has_review`
--

CREATE TABLE `album_has_review` (
  `album_review_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_date` datetime NOT NULL,
  `Album_album_id` int(11) NOT NULL,
  `Reviewer_reviewer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album_has_review`
--

INSERT INTO `album_has_review` (`album_review_id`, `rating`, `review_date`, `Album_album_id`, `Reviewer_reviewer_id`) VALUES
(1, 5, '2020-02-14 00:00:00', 1, 1),
(2, 4, '2020-02-14 00:00:00', 2, 2),
(3, 5, '2020-03-18 00:00:00', 3, 3),
(4, 2, '2019-04-28 00:00:00', 4, 4),
(5, 1, '2020-05-11 00:00:00', 5, 5),
(6, 3, '2019-06-01 00:00:00', 6, 6),
(7, 5, '2019-07-30 00:00:00', 7, 7),
(8, 4, '2020-08-03 00:00:00', 8, 8),
(9, 3, '2019-09-29 00:00:00', 9, 9),
(10, 5, '2019-10-31 00:00:00', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `band_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `first_name`, `last_name`, `birthdate`, `band_name`) VALUES
(1, 'Amaal', 'Malik', '1991-12-10', 'Meghdhanush'),
(2, 'Jassi', 'Katyal', '1990-10-12', 'Indian Ocean'),
(3, 'Amit', 'Trivedi', '1885-07-01', 'Parikrama'),
(4, 'Ammy', 'Virk', '1885-01-01', 'Avail'),
(5, 'AP', ' Dhillon', '1990-10-22', 'Euphoria'),
(6, 'Yo Yo', 'Honey Singh', '1989-05-17', 'Agnee'),
(7, 'Asha', 'Bhosle', '1975-01-27', 'Coshish'),
(8, 'B.', 'Praak', '1980-07-18', 'Cassini Divisionn'),
(9, 'Bappi', 'Lahiri', '1965-12-12', 'Still Waters'),
(10, 'Benny', 'Dayal', '1988-04-11', 'Inner Sanctum');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `Province_province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `Province_province_id`) VALUES
(1, 'Ahmedabad', 1),
(2, 'Karachi', 3),
(3, 'Montreal', 5),
(4, 'Auckland', 7),
(5, 'Doha', 9),
(6, 'Mexico city', 10),
(7, 'Muscat', 12),
(8, 'Brisbane', 14),
(9, 'Midrand', 18),
(10, 'Los Angeles', 16);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_ID` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `e-mail_id` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_number` bigint(10) NOT NULL,
  `City_city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_ID`, `first_name`, `last_name`, `e-mail_id`, `address`, `contact_number`, `City_city_id`) VALUES
(1, 'Shubham', 'Mevada', 'shubh.mevada@gmail.com', 'Pushkar Flats,Paldi', 9998755510, 1),
(2, 'Shivam', 'Sheth', 'shiv.sheth@gmail.com', 'Adani Bunglows', 7772256561, 2),
(3, 'Premal', 'Joshi', 'prem.joshi@gmail.com', 'Sunrise Flats', 8523697410, 3),
(4, 'Nirav', 'Paneliya', 'nirav.paneliya@gmail.com', 'Galaxy Row house', 4557422210, 4),
(5, 'Mihir', 'Vora', 'mihir.vora@gmail.com', 'White Orchid', 1001001001, 5),
(6, 'Smith', 'Patel', 'smith.patel@gmail.com', 'Orchid Bunglows', 2201458740, 6),
(7, 'Bittu', 'Shah', 'bittu.shah@gmail.com', 'Golf out field', 4571259631, 7),
(8, 'Vatsal', 'Mehta', 'vatsal.mehta@gmail.com', 'Watch Dogs', 7854123598, 8),
(9, 'Aaryan', 'Bhatt', 'aaryan.bhatt@gmail.com', 'Red Street', 1258472536, 9),
(10, 'Yash', 'Mistry', 'yash.mistry@gmail.com', 'Shyam Sundar Heights', 4785954125, 10),
(11, 'Shivay', 'Mehta', 'shivaym@gmail.com', 'Rajnagar,chandranagar', 9998755519, 1),
(12, 'Shiv', 'Shah', 'shivshah@gmail.com', 'Pushpak Flats,Maninagar', 9998757819, 2),
(13, 'Saumya', 'Shah', 'saumyaS@gmail.com', 'Luv kush soc, Manekbaug', 9398755519, 3),
(14, 'Nancy', 'Joshi', 'nancyJ@gmail.com', 'Astha apt,Ghatlodia', 9788745519, 4),
(15, 'Rahul', 'Mehra', 'RahulM@gmail.com', 'Reshma Bunglows,Kankaria', 9992655519, 5),
(16, 'Suraj', 'Panchal', 'surajPanchal@gmail.com', 'Sun Bunglows, Thaltej', 9998895519, 6),
(17, 'Megha', 'Bhatt', 'mbhatt@gmail.com', 'Pushkar Flats,Paldi', 9998723519, 1),
(18, 'Mayur', 'Patel', 'mayurpatel45@gmail.com', 'Saral flats, Jivraj Park', 9998723519, 5);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'Pakistan'),
(3, 'Canada'),
(4, 'New Zeland'),
(5, 'Qatar'),
(6, 'Mexico'),
(7, 'Oman'),
(8, 'Australia'),
(9, 'USA'),
(10, 'South Africa');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre`) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Pop music'),
(4, 'Hip hop'),
(5, 'Country Music'),
(6, 'Classical'),
(7, 'Fol Music'),
(8, 'Dance Music'),
(9, 'Soul Music'),
(10, 'Disco');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_total` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `Client_client_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `order_total`, `discount`, `Client_client_ID`) VALUES
(1, '1999-05-31', 8, 5, 1),
(2, '1999-08-10', 10, 5, 2),
(3, '2000-12-17', 15, 5, 3),
(4, '1999-02-25', 20, 5, 4),
(5, '1998-01-20', 12, 5, 5),
(6, '1999-10-25', 8, 5, 6),
(7, '2000-11-27', 10, 5, 7),
(8, '1997-09-30', 30, 5, 8),
(9, '2000-08-14', 10, 5, 9),
(10, '1999-05-10', 5, 5, 10),
(11, '1998-01-25', 12, 5, 5),
(12, '1998-01-27', 15, 5, 4),
(13, '1998-01-24', 20, 5, 6),
(14, '2000-11-29', 10, 5, 4),
(15, '2000-11-30', 15, 5, 8),
(16, '2000-11-26', 17, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `Tracks_track_id` int(11) NOT NULL,
  `Album_album_id` int(11) NOT NULL,
  `Order_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `product_name`, `price`, `quantity`, `Tracks_track_id`, `Album_album_id`, `Order_order_id`) VALUES
(1, 'Aashiqui 2', 500, 1, 1, 3, 10),
(2, 'Nazm Nazm', 550, 9, 2, 4, 9),
(3, 'Befikar', 500, 8, 3, 5, 8),
(4, 'Andhudhun', 1200, 7, 4, 6, 7),
(5, 'Bandish Bandits', 660, 6, 5, 7, 6),
(6, 'Main tere kabil hoon', 700, 5, 6, 8, 5),
(7, 'Yaara', 800, 4, 7, 9, 4),
(8, 'Baarfi', 950, 3, 8, 2, 3),
(9, 'Krishh', 1000, 2, 9, 1, 2),
(10, 'Ya ali', 1500, 1, 10, 3, 1),
(11, 'udta punjab', 1500, 12, 2, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(45) NOT NULL,
  `Country_country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `province_name`, `Country_country_id`) VALUES
(1, 'Gujarat', 1),
(2, 'Maharashtra', 1),
(3, 'Lahore', 2),
(4, 'Islamabad', 2),
(5, 'Quebec', 3),
(6, 'Nova Scotia', 3),
(7, 'Auckland', 4),
(8, 'Nelson', 3),
(9, 'Doha', 5),
(10, 'Jalsico', 6),
(11, 'Sonora', 6),
(12, 'Wusta', 7),
(13, 'Dhofar', 7),
(14, 'Queensland', 8),
(15, 'Victoria', 8),
(16, 'California', 9),
(17, 'Texas', 9),
(18, 'Gauteng', 10),
(19, 'Limpopo', 10);

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `reviewer_id` int(11) NOT NULL,
  `reviewer_name` varchar(45) NOT NULL,
  `reviewer_email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`reviewer_id`, `reviewer_name`, `reviewer_email`) VALUES
(1, 'Shubham Mevada', 'shubh.mevada@gmail.com'),
(2, 'Shivam Sheth', 'shiv.sheth@gmail.com'),
(3, 'Premal Joshi', 'prem.joshi@gmail.com'),
(4, 'Nirav Paneliya', 'nirav.paneliya@gmail.com'),
(5, 'Mihir Vora', 'mihir.vora@gmail.com'),
(6, 'Smith Patel', 'smith.patel@gmail.com'),
(7, 'Bittu Shah', 'bittu.shah@gmail.com'),
(8, 'Vatsal Mehta', 'vatsal.mehta@gmail.com'),
(9, 'Aaryan Bhatt', 'aaryan.bhatt@gmail.com'),
(10, 'Yash Mistry', 'yash.mistry@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `track_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `Artist_artist_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `Album_album_id` int(11) NOT NULL,
  `Genre_genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`track_id`, `title`, `duration`, `price`, `Artist_artist_id`, `stock`, `Album_album_id`, `Genre_genre_id`) VALUES
(1, 'Nazm Nazm', '3.10mins', 500, 1, 20, 1, 1),
(2, 'Aaj Se Teri', '2.55mins', 550, 2, 5, 2, 2),
(3, 'Main tere kabil hoon', '4.00mins', 500, 3, 8, 3, 3),
(4, 'Enna Sonna', '7.59mins', 1200, 4, 10, 4, 4),
(5, 'Humsafar', '5.25mins', 660, 5, 13, 5, 5),
(6, 'Befikar', '3.39mins', 700, 6, 15, 6, 6),
(7, 'Jab Tak', '4.10mins', 800, 7, 7, 7, 7),
(8, 'Ban ja rani', '5.50mins', 950, 8, 12, 8, 8),
(9, 'Lambiyaan', '6.31mins', 1000, 9, 25, 9, 9),
(10, 'Yaara', '2.12mins', 1500, 10, 15, 10, 10),
(11, 'tera surror', '3.10mins', 700, 5, 4, 1, 4),
(12, 'hero', '4.00mins', 450, 3, 3, 3, 2),
(13, 'ranjhana', '4.00mins', 550, 7, 4, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tracks_has_review`
--

CREATE TABLE `tracks_has_review` (
  `track_review_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_date` datetime NOT NULL,
  `Tracks_track_id` int(11) NOT NULL,
  `Reviewer_reviewer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracks_has_review`
--

INSERT INTO `tracks_has_review` (`track_review_id`, `rating`, `review_date`, `Tracks_track_id`, `Reviewer_reviewer_id`) VALUES
(1, 3, '2019-01-22 00:00:00', 1, 1),
(2, 3, '2020-02-14 00:00:00', 2, 2),
(3, 3, '2020-03-18 00:00:00', 3, 3),
(4, 2, '2019-04-28 00:00:00', 4, 4),
(5, 3, '2020-05-11 00:00:00', 5, 5),
(6, 5, '2019-06-01 00:00:00', 6, 6),
(7, 1, '2019-07-30 00:00:00', 7, 7),
(8, 4, '2020-08-03 00:00:00', 8, 8),
(9, 5, '2019-09-29 00:00:00', 9, 9),
(10, 5, '2019-10-31 00:00:00', 10, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD UNIQUE KEY `album_id_UNIQUE` (`album_id`);

--
-- Indexes for table `album_has_review`
--
ALTER TABLE `album_has_review`
  ADD PRIMARY KEY (`album_review_id`),
  ADD UNIQUE KEY `album_review_id_UNIQUE` (`album_review_id`),
  ADD KEY `fk_Album_has_Review_Album1_idx` (`Album_album_id`),
  ADD KEY `fk_Album_has_Review_Reviewer1_idx` (`Reviewer_reviewer_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD UNIQUE KEY `artist_id_UNIQUE` (`artist_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  ADD KEY `fk_City_Province1_idx` (`Province_province_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_ID`),
  ADD UNIQUE KEY `Client_ID_UNIQUE` (`client_ID`),
  ADD KEY `fk_Client_City1_idx` (`City_city_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_id_UNIQUE` (`country_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_id_UNIQUE` (`genre_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  ADD KEY `fk_Order_Client_idx` (`Client_client_ID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD UNIQUE KEY `order_item_id_UNIQUE` (`order_item_id`),
  ADD KEY `fk_table1_Tracks1_idx` (`Tracks_track_id`),
  ADD KEY `fk_table1_Album1_idx` (`Album_album_id`),
  ADD KEY `fk_table1_Order1_idx` (`Order_order_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`),
  ADD UNIQUE KEY `province_id_UNIQUE` (`province_id`),
  ADD KEY `fk_Province_Country1_idx` (`Country_country_id`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`reviewer_id`),
  ADD UNIQUE KEY `reviewer_id_UNIQUE` (`reviewer_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`),
  ADD UNIQUE KEY `track_id_UNIQUE` (`track_id`),
  ADD KEY `fk_Tracks_Artist1_idx` (`Artist_artist_id`),
  ADD KEY `fk_Tracks_Album1_idx` (`Album_album_id`),
  ADD KEY `fk_Tracks_Genre1_idx` (`Genre_genre_id`);

--
-- Indexes for table `tracks_has_review`
--
ALTER TABLE `tracks_has_review`
  ADD PRIMARY KEY (`track_review_id`),
  ADD UNIQUE KEY `track_review_id_UNIQUE` (`track_review_id`),
  ADD KEY `fk_Tracks_has_Review_Tracks1_idx` (`Tracks_track_id`),
  ADD KEY `fk_Tracks_has_Review_Reviewer1_idx` (`Reviewer_reviewer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `reviewer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album_has_review`
--
ALTER TABLE `album_has_review`
  ADD CONSTRAINT `fk_Album_has_Review_Album1` FOREIGN KEY (`Album_album_id`) REFERENCES `album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Album_has_Review_Reviewer1` FOREIGN KEY (`Reviewer_reviewer_id`) REFERENCES `reviewer` (`reviewer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_City_Province1` FOREIGN KEY (`Province_province_id`) REFERENCES `province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_City1` FOREIGN KEY (`City_city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Order_Client` FOREIGN KEY (`Client_client_ID`) REFERENCES `client` (`client_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_table1_Album1` FOREIGN KEY (`Album_album_id`) REFERENCES `album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_Order1` FOREIGN KEY (`Order_order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_Tracks1` FOREIGN KEY (`Tracks_track_id`) REFERENCES `tracks` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `fk_Province_Country1` FOREIGN KEY (`Country_country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `fk_Tracks_Album1` FOREIGN KEY (`Album_album_id`) REFERENCES `album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tracks_Artist1` FOREIGN KEY (`Artist_artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tracks_Genre1` FOREIGN KEY (`Genre_genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tracks_has_review`
--
ALTER TABLE `tracks_has_review`
  ADD CONSTRAINT `fk_Tracks_has_Review_Reviewer1` FOREIGN KEY (`Reviewer_reviewer_id`) REFERENCES `reviewer` (`reviewer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tracks_has_Review_Tracks1` FOREIGN KEY (`Tracks_track_id`) REFERENCES `tracks` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
