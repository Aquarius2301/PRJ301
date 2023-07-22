-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 11:51 AM
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
-- Database: `coffeeweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Phone` varchar(15) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Dob` date NOT NULL,
  `Gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Phone`, `Username`, `Password`, `Dob`, `Gender`) VALUES
('0123456789', 'Mike', '250cf8b51c773f3f8dc8b4be867a9a02', '2003-01-23', 'Male'),
('1234567890', 'Jake', '202cb962ac59075b964b07152d234b70', '2023-07-05', 'Male'),
('1472583690', 'Vu', '202cb962ac59075b964b07152d234b70', '2023-06-30', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `Customerid` varchar(15) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` varchar(15) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `Customerid`, `content`, `type`, `date`) VALUES
(3, '1234567890', 'Food is good', 'Food', '2023-07-16'),
(13, '0123456789', 'Good!!!', 'Employee', '2023-07-20'),
(14, '1472583690', 'It\'s very good', 'Food', '2023-07-20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customerid` varchar(15) NOT NULL,
  `orderstatusid` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `orderdate` date NOT NULL,
  `ordertime` time NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerid`, `orderstatusid`, `total`, `orderdate`, `ordertime`, `address`) VALUES
(40, '1472583690', '20230720143445', 17.98, '2023-07-20', '14:34:45', '');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `id` varchar(20) NOT NULL,
  `NameProduct` varchar(50) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `NameProduct`, `UnitPrice`, `Quantity`, `total`) VALUES
('20230720143445', 'Pizza', 12.99, 1, 12.99),
('20230720143445', 'French Fries', 4.99, 1, 4.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `SalePercent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Category` varchar(15) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `SalePercent`, `Category`, `Description`) VALUES
(8, 'Burger', 9.99, 10.00, 'Food', 'Delicious beef burger with lettuce and cheese'),
(9, 'Pizza', 12.99, 0.00, 'Food', 'Classic pepperoni pizza with melted cheese'),
(10, 'French Fries', 4.99, 0.00, 'Food', 'Crispy golden French fries with ketchup'),
(11, 'Chicken Wings', 8.99, 0.00, 'Food', 'Spicy chicken wings with ranch dipping sauce'),
(12, 'Salad', 7.99, 0.00, 'Food', 'Fresh garden salad with mixed greens and vinaigrette dressing'),
(13, 'Sushi Roll', 10.99, 0.00, 'Food', 'Assorted sushi rolls with soy sauce and wasabi'),
(14, 'Taco', 6.99, 0.00, 'Food', 'Tasty taco filled with seasoned meat and fresh toppings'),
(15, 'Bing Chilling', 3.99, 110.00, 'Dessert', 'Creamy vanilla ice cream in a waffle cone'),
(16, 'Milkshake', 5.99, 0.00, 'Beverage', 'Refreshing milkshake with your choice of flavor'),
(17, 'Smoothie', 4.99, 0.00, 'Beverage', 'Healthy fruit smoothie packed with vitamins'),
(18, 'Coffee', 2.99, 0.00, 'Beverage', 'Rich and aromatic brewed coffee'),
(19, 'Tea', 2.49, 0.00, 'Beverage', 'A soothing cup of hot tea'),
(20, 'Steak', 19.99, 0.00, 'Food', 'Juicy grilled steak cooked to perfection'),
(21, 'Pasta', 11.99, 0.00, 'Food', 'Homemade pasta with rich tomato sauce and parmesan cheese'),
(22, 'Sushi Sashimi Combo', 15.99, 0.00, 'Food', 'A combination of sushi and sashimi'),
(23, 'Hamburger', 8.99, 0.00, 'Food', 'Classic hamburger with lettuce, tomato, and onion'),
(24, 'Chicken Salad', 9.99, 0.00, 'Food', 'Grilled chicken salad with mixed greens and balsamic dressing'),
(25, 'Fish and Chips', 13.99, 0.00, 'Food', 'Beer-battered fish with crispy fries'),
(26, 'Cheese Pizza', 10.99, 25.00, 'Food', 'Margherita pizza topped with fresh mozzarella'),
(27, 'Onion Rings', 5.99, 0.00, 'Food', 'Crunchy onion rings with tangy dipping sauce'),
(28, 'Chicken Nuggets', 6.99, 0.00, 'Food', 'Bite-sized chicken nuggets with BBQ sauce'),
(29, 'Pancakes', 7.99, 0.00, 'Food', 'Fluffy pancakes served with maple syrup and butter'),
(30, 'Waffle', 6.99, 0.00, 'Food', 'Golden Belgian waffle with whipped cream and berries'),
(31, 'Milk', 1.99, 0.00, 'Beverage', 'Cold and refreshing milk'),
(32, 'Orange Juice', 3.49, 0.00, 'Beverage', 'Freshly squeezed orange juice'),
(33, 'Lemonade', 2.99, 0.00, 'Beverage', 'Homemade lemonade with a twist of lemon'),
(34, 'Iced Tea', 2.49, 0.00, 'Beverage', 'Chilled iced tea with lemon and mint'),
(35, 'Cheesecake', 4.99, 0.00, 'Dessert', 'Creamy cheesecake with a graham cracker crust'),
(36, 'Chocolate Brownie', 3.99, 0.00, 'Dessert', 'Decadent chocolate brownie with vanilla ice cream'),
(37, 'Fruit Salad', 6.99, 0.00, 'Dessert', 'Assorted fresh fruits served in a bowl'),
(52, 'Milk Coffee', 10.00, 25.00, 'Beverage', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(50) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Dob` date NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Name`, `password`, `Dob`, `gender`) VALUES
('abc', 'Tom', '202cb962ac59075b964b07152d234b70', '2002-12-23', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Phone`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Customerid` (`Customerid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderstatusid` (`orderstatusid`),
  ADD KEY `customerid` (`customerid`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Customerid`) REFERENCES `customers` (`Phone`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customers` (`Phone`);

--
-- Constraints for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD CONSTRAINT `orderstatus_ibfk_1` FOREIGN KEY (`id`) REFERENCES `orders` (`orderstatusid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
