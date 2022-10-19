-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 05:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_film`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id_films` int(13) NOT NULL,
  `title` varchar(64) NOT NULL,
  `year` int(4) NOT NULL,
  `genre` varchar(64) NOT NULL,
  `duration` varchar(64) NOT NULL,
  `ratings` float NOT NULL,
  `rent` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id_films`, `title`, `year`, `genre`, `duration`, `ratings`, `rent`) VALUES
(1, 'Ocean\'s Eleven', 2001, 'Crime/Comedy', '1h 56m', 7.7, 15000),
(2, 'Ocean\'s Twelve', 2004, 'Crime/Comedy', '2h 5m', 6.9, 15000),
(3, 'Ocean\'s Thirteen', 2007, 'Crime/Comedy', '1h 53m', 6.5, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `rented`
--

CREATE TABLE `rented` (
  `id_rented` int(13) NOT NULL,
  `id_films` int(13) NOT NULL,
  `id_renters` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rented`
--

INSERT INTO `rented` (`id_rented`, `id_films`, `id_renters`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `renters`
--

CREATE TABLE `renters` (
  `id_renters` int(13) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `renters`
--

INSERT INTO `renters` (`id_renters`, `name`, `email`) VALUES
(1, 'Benny', 'test@gmail.com'),
(2, 'Ethan', 'ethan@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id_films`);

--
-- Indexes for table `rented`
--
ALTER TABLE `rented`
  ADD PRIMARY KEY (`id_rented`),
  ADD KEY `id_films` (`id_films`,`id_renters`),
  ADD KEY `id_renters` (`id_renters`);

--
-- Indexes for table `renters`
--
ALTER TABLE `renters`
  ADD PRIMARY KEY (`id_renters`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id_films` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rented`
--
ALTER TABLE `rented`
  MODIFY `id_rented` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `renters`
--
ALTER TABLE `renters`
  MODIFY `id_renters` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rented`
--
ALTER TABLE `rented`
  ADD CONSTRAINT `rented_ibfk_1` FOREIGN KEY (`id_renters`) REFERENCES `renters` (`id_renters`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rented_ibfk_2` FOREIGN KEY (`id_films`) REFERENCES `films` (`id_films`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
