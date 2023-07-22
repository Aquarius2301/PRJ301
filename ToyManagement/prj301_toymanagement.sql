-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 05:45 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prj301_toymanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `toys`
--

CREATE TABLE `toys` (
  `ToyID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toys`
--

INSERT INTO `toys` (`ToyID`, `Name`, `Description`, `Category`, `Price`, `Quantity`) VALUES
(1, 'Teddy Bear', 'Soft and cuddly teddy bear', 'Stuffed', 19.99, 10),
(2, 'Lego Set', 'Building blocks', 'Building', 29.99, 5),
(3, 'Barbie', 'Fashion doll', 'Doll', 14.99, 8),
(4, 'Hot Wheels', 'Die-cast toy cars', 'Vehicles ', 9.99, 15),
(5, 'Play-Doh', 'Modeling compund', 'Art', 7.99, 21),
(6, 'Puzzle Set', 'Challenging puzzle set with multiple puzzles', 'Puzzles', 14.99, 7),
(7, 'Lego Set', 'Build and create with Lego blocks', 'Building Blocks', 29.99, 5),
(8, 'Art Kit', 'Complete art kit with paints, brushes, and canvas', 'Art', 29.99, 4),
(9, 'Remote Control Car', 'Race and drive with this RC car', 'Remote Control Toys', 39.99, 3),
(10, 'Board Game', 'Fun board game for the whole family', 'Board Games', 49.99, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('nguoidung', '69cba732464d0fd968722a036e9c7975'),
('quanly', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `toys`
--
ALTER TABLE `toys`
  ADD PRIMARY KEY (`ToyID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
