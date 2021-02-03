-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2021 at 02:53 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `id` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`) VALUES
('A1', 'Gal Gadot'),
('A2', 'Pat Jenkins'),
('A3', 'Robert Downey Jr');

-- --------------------------------------------------------

--
-- Table structure for table `artist_skill`
--

DROP TABLE IF EXISTS `artist_skill`;
CREATE TABLE IF NOT EXISTS `artist_skill` (
  `id` int(11) NOT NULL,
  `artist id` varchar(4) NOT NULL,
  `skill id` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_skill`
--

INSERT INTO `artist_skill` (`id`, `artist id`, `skill id`) VALUES
(1, 'A1', 'S899'),
(2, 'A2', 'S897'),
(3, 'A2', 'S898'),
(4, 'A3', 'S899');

-- --------------------------------------------------------

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
CREATE TABLE IF NOT EXISTS `cast` (
  `id` int(4) NOT NULL,
  `movie id` varchar(4) NOT NULL,
  `artist id` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cast`
--

INSERT INTO `cast` (`id`, `movie id`, `artist id`) VALUES
(1, '1002', 'A1'),
(2, '1003', 'A2'),
(3, '1001', 'A3'),
(4, '1002', 'A3');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` varchar(4) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `type`) VALUES
('G200', 'Action'),
('G201', 'Drama'),
('G202', 'Si-fi'),
('G203', 'Romance');

-- --------------------------------------------------------

--
-- Table structure for table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
CREATE TABLE IF NOT EXISTS `genre_movie` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `movie id` int(4) NOT NULL,
  `genre id` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre_movie`
--

INSERT INTO `genre_movie` (`id`, `movie id`, `genre id`) VALUES
(1, 1001, 'G200'),
(2, 1001, 'G201'),
(3, 1001, 'G203'),
(4, 1002, 'G202'),
(5, 1003, 'G201');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `movie id` int(4) NOT NULL,
  `media id` varchar(4) NOT NULL,
  `Media type` varchar(15) NOT NULL,
  `URL` varchar(50) NOT NULL,
  PRIMARY KEY (`media id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`movie id`, `media id`, `Media type`, `URL`) VALUES
(1001, 'M300', 'image', '...'),
(1001, 'M301', 'video', '...'),
(1001, 'M302', 'image', '...');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `title`, `year`) VALUES
(1, 'Avengers', 2010),
(2, 'Sherlock Holmes', 2008),
(3, 'Wonder Womans', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `movie_review`
--

DROP TABLE IF EXISTS `movie_review`;
CREATE TABLE IF NOT EXISTS `movie_review` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `movie id` int(4) NOT NULL,
  `user id` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_review`
--

INSERT INTO `movie_review` (`id`, `movie id`, `user id`) VALUES
(1, 1001, 'R500'),
(2, 1002, 'R500'),
(3, 1002, 'R501');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `User id` varchar(4) NOT NULL,
  `movie id` int(11) NOT NULL,
  `rating` int(2) NOT NULL,
  `review` varchar(50) NOT NULL,
  PRIMARY KEY (`User id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`User id`, `movie id`, `rating`, `review`) VALUES
('R500', 0, 8, 'good'),
('R501', 1001, 7, 'avg'),
('R502', 1002, 6, 'avg'),
('R503', 1003, 3, 'bad');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` varchar(4) NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
('R1', 'Iron man'),
('R2', 'Sherlock'),
('R3', 'Diana');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `id` varchar(4) NOT NULL,
  `Skill` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `Skill`) VALUES
('S899', 'Actor'),
('S898', 'Producer'),
('S897', 'Director');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_artist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_artist`;
CREATE TABLE IF NOT EXISTS `view_artist` (
`id` varchar(4)
,`name` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `view_artist`
--
DROP TABLE IF EXISTS `view_artist`;

DROP VIEW IF EXISTS `view_artist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_artist`  AS  select `artist`.`id` AS `id`,`artist`.`name` AS `name` from `artist` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
