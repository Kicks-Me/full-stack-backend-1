-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2025 at 08:25 AM
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
-- Database: `db_full_stack`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbproducts`
--

CREATE TABLE `tbproducts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `expired_at` date DEFAULT NULL,
  `buyPrice` float DEFAULT 0,
  `sellPrice` float NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `img_ext` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbproducts`
--

INSERT INTO `tbproducts` (`id`, `name`, `description`, `slug`, `expired_at`, `buyPrice`, `sellPrice`, `qty`, `image`, `img_ext`, `created_at`, `created_by`) VALUES
(2, 'Camera', 'Sony Tuna Camera. 1. RAM 8GB, 2. CPU 1.8GHz, 3. ROM 128GM.', 'Sony Tuna Camera.', '2025-11-30', 12000, 50000, 3, '../upload/images/b76b4d07-76d5-4a13-a5f3-e48bce69572d.jpg', '.jpg', '2025-04-09 14:13:41', 8),
(3, 'Product 112', 'this is product 112 description', 'This is product 112 slug', '2025-04-24', 2000, 35000, 8, '../upload/images/6a1cb0d6-780e-4841-bee9-098c4be0a2eb.jpg', NULL, '2025-04-19 14:24:31', 8),
(4, 'ຜ້າຕ່ຳແພໄໝລາວ', 'ຜ້າຕ່ຳແພໄໝລາວສຳລັບການຕັດເຄື່ອງນຸ່ງຂອງທ່ານຍີງຜ້າຕ່ຳແພໄໝລາວສຳລັບການຕັດເຄື່ອງນຸ່ງຂອງທ່ານຍີງຜ້າຕ່ຳແພໄໝລາວສຳລັບການຕັດເຄື່ອງນຸ່ງຂອງທ່ານຍີງຜ້າຕ່ຳແພໄໝລາວສຳລັບການຕັດເຄື່ອງນຸ່ງຂອງທ່ານຍີງ', 'ຜ້າຕ່ຳແພໄໝລາວສຳລັບການຕັດເຄື່ອງນຸ່ງຂອງທ່ານຍີງ', '2028-04-30', 200000, 500000, 2000, '../upload/images/e9460a90-ee03-40bb-a15b-8684bd7c86b3.jpg', NULL, '2025-04-20 15:02:20', 8),
(5, 'My Product', 'My Product Description here goes here goes here ', 'My Product slug', '2028-04-23', 25000, 50000, 1000, '../upload/images/9caadb72-644b-4bc9-9421-4eb20b518b11.jpg', NULL, '2025-04-22 14:05:44', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbsell`
--

CREATE TABLE `tbsell` (
  `id` int(11) NOT NULL,
  `sell_id` varchar(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL CHECK (`qty` > 0),
  `selled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbsell`
--

INSERT INTO `tbsell` (`id`, `sell_id`, `product_id`, `user_id`, `qty`, `selled_at`) VALUES
(1, 'uXVU5F', 4, 8, 1, '2025-05-02 09:00:13'),
(2, 'uXVU5F', 3, 8, 1, '2025-05-02 09:00:13'),
(3, 'lw6NUj', 3, 8, 1, '2025-05-02 09:01:23'),
(4, 'lw6NUj', 4, 8, 1, '2025-05-02 09:01:23'),
(5, 'ZR1faj', 4, 8, 1, '2025-05-02 09:07:37'),
(6, 'lH2qdL', 3, 8, 1, '2025-05-02 09:43:15'),
(7, 'gd9jRj', 4, 8, 2, '2025-05-05 13:41:31'),
(8, 'gd9jRj', 3, 8, 1, '2025-05-05 13:41:31'),
(9, 'gd9jRj', 5, 8, 1, '2025-05-05 13:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbusers`
--

CREATE TABLE `tbusers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbusers`
--

INSERT INTO `tbusers` (`id`, `username`, `password`, `role`, `created_at`, `createdBy`) VALUES
(7, 'Dev', '$2b$10$lAolUh8hihzqIkhH/tyo7.9G7EbVB9nLmDsrlDsZ/QpwlsKTtZFWi', 'user', '2025-03-19 14:29:23', 0),
(8, 'IT', '$2b$10$FFD6d53dPshkVfL4W0HzROrI92oKdsNDRTEqUNkwVg7kfP/Xfi58q', 'user', '2025-03-27 12:37:08', NULL),
(9, 'Finance', '$2b$10$n7urR96y0QOPWPfFGOvsXO8qZkCZTwijkvt80H5ZHIh/AMrcMYOjK', 'admin', '2025-03-27 12:38:15', NULL),
(12, 'MKT', '123', 'user', '2025-03-27 12:42:08', 8),
(13, 'rere', '$2b$10$vQNWneohhugbcIy13Vp22O6oWRhdoNn1esJk/.T5v9XVR/4SOJ3rS', 'admin', '2025-03-27 12:58:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbproducts`
--
ALTER TABLE `tbproducts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `tbsell`
--
ALTER TABLE `tbsell`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbusers`
--
ALTER TABLE `tbusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbproducts`
--
ALTER TABLE `tbproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbsell`
--
ALTER TABLE `tbsell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbusers`
--
ALTER TABLE `tbusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbproducts`
--
ALTER TABLE `tbproducts`
  ADD CONSTRAINT `tbproducts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `tbusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbsell`
--
ALTER TABLE `tbsell`
  ADD CONSTRAINT `tbsell_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbsell_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbusers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
