-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2025 at 08:05 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms_330`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`) VALUES
(1, 'Laptops', '2024-11-10 10:00:00'),
(2, 'Smartphones', '2025-01-15 10:00:00'),
(3, 'Tablets', '2024-09-05 09:00:00'),
(4, 'Accessories', '2025-03-20 10:00:00'),
(5, 'Gaming Consoles', '2024-12-01 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `note` text,
  `total` decimal(10,0) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `qty` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `discount` int DEFAULT '0',
  `stock` int NOT NULL,
  `description` text,
  `image` varchar(255) NOT NULL,
  `status` enum('published','pending') DEFAULT 'published',
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `discount`, `stock`, `description`, `image`, `status`, `category_id`) VALUES
(1, 'Dell Inspiron 15', 1101, 0, 177, 'High-quality Dell Inspiron 15 with advanced features.', 'dell_inspiron_15.jpg', 'pending', 1),
(2, 'HP Pavilion x360', 1460, 5, 41, 'High-quality HP Pavilion x360 with advanced features.', 'hp_pavilion_x360.jpg', 'published', 1),
(3, 'MacBook Air M2', 1585, 5, 148, 'High-quality MacBook Air M2 with advanced features.', 'macbook_air_m2.jpg', 'published', 1),
(4, 'iPhone 15 Pro', 1944, 5, 134, 'High-quality iPhone 15 Pro with advanced features.', 'iphone_15_pro.jpg', 'published', 2),
(5, 'Samsung Galaxy S23', 730, 5, 182, 'High-quality Samsung Galaxy S23 with advanced features.', 'samsung_galaxy_s23.jpg', 'pending', 2),
(6, 'iPad Pro 12.9', 1807, 10, 97, 'High-quality iPad Pro 12.9 with advanced features.', 'ipad_pro_12.9.jpg', 'published', 3),
(7, 'Lenovo Tab P11', 515, 15, 64, 'High-quality Lenovo Tab P11 with advanced features.', 'lenovo_tab_p11.jpg', 'pending', 3),
(8, 'Sony WH-1000XM5', 380, 20, 120, 'High-quality Sony WH-1000XM5 with advanced features.', 'sony_wh-1000xm5.jpg', 'published', 4),
(9, 'Logitech MX Master 3S', 130, 10, 88, 'High-quality Logitech MX Master 3S with advanced features.', 'logitech_mx_master_3s.jpg', 'published', 4),
(10, 'Nintendo Switch OLED', 350, 15, 75, 'High-quality Nintendo Switch OLED with advanced features.', 'nintendo_switch_oled.jpg', 'pending', 5),
(11, 'PlayStation 5', 499, 0, 52, 'High-quality PlayStation 5 with advanced features.', 'playstation_5.jpg', 'published', 5),
(12, 'Xbox Series X', 499, 5, 33, 'High-quality Xbox Series X with advanced features.', 'xbox_series_x.jpg', 'published', 5),
(13, 'Anker Power Bank 20000mAh', 60, 25, 200, 'High-quality Anker Power Bank 20000mAh with advanced features.', 'anker_power_bank_20000mah.jpg', 'published', 4),
(14, 'Samsung T7 SSD 1TB', 130, 20, 140, 'High-quality Samsung T7 SSD 1TB with advanced features.', 'samsung_t7_ssd_1tb.jpg', 'pending', 4),
(15, 'Apple Watch Ultra', 800, 15, 66, 'High-quality Apple Watch Ultra with advanced features.', 'apple_watch_ultra.jpg', 'published', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `order_product_ibfk_1` (`order_id`),
  ADD KEY `order_product_ibfk_2` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
