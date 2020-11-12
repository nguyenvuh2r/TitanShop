-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 02:32 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `titan_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `authoritiesId` bigint(20) NOT NULL,
  `authorityType` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`authoritiesId`, `authorityType`, `username`) VALUES
(1, 'ROLE_ADMIN', 'admin'),
(18, 'ROLE_USER', 'uuuuuu'),
(19, 'ROLE_USER', 'Touhidur000'),
(20, 'ROLE_ADMIN', 'vu123');

-- --------------------------------------------------------

--
-- Table structure for table `billingaddress`
--

CREATE TABLE `billingaddress` (
  `billingAddressId` bigint(20) NOT NULL,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `strretName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billingaddress`
--

INSERT INTO `billingaddress` (`billingAddressId`, `apartmentNumber`, `city`, `country`, `state`, `strretName`, `zipCode`) VALUES
(1, 'A2', 'A3', 'A5', 'A4', 'Xz', 'A6'),
(2, 'S1', 'S2', 'S4', 'S3', 'S', 'S5'),
(3, 'A2', 'A3', 'A5', 'A4', 'xxxxxxxxxxxxxx', 'A6'),
(4, '', '', '', '', '', ''),
(5, 'k222', 'k3', 'k5', 'k4', 'k11111111111111111', 'k6'),
(6, 'u2', 'u3', 'u4', 'u4', 'u1yyyyyyyyyyyyyyy', 'u5'),
(7, '', '', '', '', '', ''),
(8, '', '', '', '', '', ''),
(9, 'm', 'm', 'm', 'm', 'm', 'm'),
(10, 'd', 'd', 'd', 'd', 'd', 'dd'),
(11, 'd', 'd', 'd', 'd', 'd', 'dd'),
(12, 'f', 'f', 'f', 'f', 'c', 'f'),
(13, 'a', 'a', 'A5', 'a', 'Aa', 'A5'),
(14, 'a', 'a', 'a', 'a', 'a', 'a'),
(15, 'a', 'a', 'a', 'a', 'a', 'a'),
(16, 'a', 'a', 'a', 'a', 'a', 'a'),
(17, 'A2', 'a', 'a', 'a', 'a', 'a'),
(18, 'A2', 'a', 'a', 'a', 'a', 'a'),
(19, 'A2', 'a', 'a', 'a', 'a', 'a'),
(20, 'a', 'a', 'a', 'a', 'a', 'a'),
(21, 'a', 'a', 'a', 'a', 'a', 'a'),
(22, 'a', 'a', 'a', 'a', 'a', 'a'),
(23, 'a', 'a', 'a', 'a', 'a', 'a'),
(24, 'a', 'a', 'a', 'a', 'a', 'a'),
(25, 'a', 'a', 'a', 'a', 'a', 'a'),
(26, 'R-9', 'Dhaka', 'Bangladesh', 'Dhaka', '12', '1230'),
(27, 'g', 'Dhaka', 'Bangladesh', 'Dhaka', '12g', '1230'),
(28, 'a', 'Dhaka', 'Bangladesh', 'Dhaka', '12', '1230'),
(29, '11', 'Phan Rang', 'Vietnam', 'Hồ Chí Minh', 'Ninh Son', '111');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` bigint(20) NOT NULL,
  `grandTotal` double NOT NULL,
  `customerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `grandTotal`, `customerId`) VALUES
(1, 70000, 1),
(2, 120000, 2),
(3, 0, 3),
(4, 20000, 5),
(5, 0, 6),
(6, 180, 8),
(7, 200, 9),
(8, 0, 10),
(9, 0, 11),
(10, 0, 12),
(11, 0, 13),
(12, 0, 14),
(13, 0, 15),
(14, 0, 16),
(15, 0, 17),
(16, 0, 18),
(17, 0, 19),
(18, 0, 20),
(19, 0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `cartItemId` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `cartId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`cartItemId`, `quantity`, `totalPrice`, `cartId`, `productId`) VALUES
(1, 4, 400, 18, 25),
(2, 1, 100, 18, 25),
(3, 1, 100, 18, 25),
(4, 1, 100, 18, 25),
(5, 1, 100, 18, 25),
(6, 3, 210, 18, 24);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` bigint(20) NOT NULL,
  `customerEmailAddress` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `custometPhoneNumber` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `billingAddressId` bigint(20) DEFAULT NULL,
  `cartId` bigint(20) DEFAULT NULL,
  `shippingAddressId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `customerEmailAddress`, `customerName`, `custometPhoneNumber`, `enabled`, `password`, `username`, `billingAddressId`, `cartId`, `shippingAddressId`) VALUES
(1, 'user255@gmail.com', 'user255', '89798', 1, 'user255', 'user255', 1, 1, 1),
(2, 'user2@gmail.com', 'user2', '7674', 1, 'user2', 'user2', 2, 2, 2),
(3, 'user25@gmail.com', 'user25', '89798', 1, 'user25', 'user25', 3, 3, 3),
(4, 'user25@gmail.com', 'user25', '89798', 0, 'user25', 'user25', 3, NULL, 3),
(5, '', 'a', '', 1, 'a', 'a', 4, 4, 4),
(6, 'kamalnew@gmail.com', 'kamal new', '6757', 1, 'kamalnew', 'kamal new', 5, 5, 5),
(7, 'kamalnew@gmail.com', 'kamal new', '6757', 0, 'kamalnew', 'kamal new', 5, NULL, 5),
(8, 'ullash25thefrelencer@gmail.com', 'ullash25', '56576', 1, 'ullash25', 'ullash25', 6, 6, 6),
(9, 'kamal@gmail.com', 'kamal', '', 1, 'kamal', 'kamal', 7, 7, 7),
(10, 'a@gmail.com', 'aaaaa', '7667', 1, 'aaaaaaa', 'aaaaa', 8, 8, 8),
(11, 'user25555@gmail.com', 'aaaah', 'hfgfhjhhjjhjfh', 1, 'vmvmnvmnm', 'user24444', 9, 9, 9),
(12, 'ww@gmail.com', 'wwwww', '01911784298', 1, 'jkjjlljl', 'dddddddddd', 10, 10, 10),
(13, 'www@gmail.com', 'wwwww', '01719832912', 1, 'jkjllj', 'ddddddddddw', 11, 11, 11),
(14, 'jj@gmail.com', 'axcggg', '01911784298', 1, 'iiiippppp', 'refffff', 12, 12, 12),
(15, 'r@gmail.com', 'royal', '01911784298', 1, 'royal2', 'royal', 20, 13, 20),
(16, 'r2@gmail.com', 'royal2', '01911784298', 1, '$2a$10$/dHi8JHrXQp37OcAhpTTbujEVbrTwYIT.Ll57LBMTCf1fZ7CDpwb6', 'royal2', 24, 14, 24),
(17, 'r3@gmail.com', 'royal3', '01911784298', 1, '$2a$10$SZu/nspUQX780WP0c7xwXuJpJLLZyYpG69mF25eAg0QhQWikZhZT6', 'royal3', 25, 15, 25),
(18, 'shahab@gmail.com', 'shahab', '01911784298', 1, '$2a$10$JcFp4jr91q5VjB93/449cOAVvoxC7pfTcTILIqHgxlLv2HKhlB4Km', 'shahab', 26, 16, 26),
(19, 'A@mail.com', 'Auuuuu', '01911784298', 1, '$2a$10$Rg602kpXPlknBWg9UGkPl.G1N3KD9pLQuRCjyIammH/SG8HQ085k.', 'uuuuuu', 27, 17, 27),
(20, 't@mail.com', 'Touhidur Rahaman', '01911784298', 1, '$2a$10$N8hvT3ajQtgVevsPUeDrPOa9AMF93T2JTrxAvacmawxcjtj8clC96', 'Touhidur000', 28, 18, 28),
(21, 'vegitoson01@gmail.com', 'Quoc Vu Nguyen', '01911231234', 1, '$2a$10$fOVWF8B.08TgKM3OsPYV1.V5wofG4DG0n4gOcd8OebgKJz0CYdaw6', 'vu123', 29, 19, 29);

-- --------------------------------------------------------

--
-- Table structure for table `customercontact`
--

CREATE TABLE `customercontact` (
  `contactId` bigint(20) NOT NULL,
  `contactInfo` longtext DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customercontact`
--

INSERT INTO `customercontact` (`contactId`, `contactInfo`, `date`, `customerId`) VALUES
(1, 'When new laptop will be arrived', '2017-11-27 23:50:36', 20);

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `customerOrderId` bigint(20) NOT NULL,
  `billingAddressId` bigint(20) DEFAULT NULL,
  `cartId` bigint(20) DEFAULT NULL,
  `cutomerId` bigint(20) DEFAULT NULL,
  `shippingAddressId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customerorder`
--

INSERT INTO `customerorder` (`customerOrderId`, `billingAddressId`, `cartId`, `cutomerId`, `shippingAddressId`) VALUES
(1, 28, 18, 20, 28);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `customerOrderId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `series` varchar(64) NOT NULL,
  `last_used` datetime NOT NULL,
  `token` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persistent_logins`
--

INSERT INTO `persistent_logins` (`series`, `last_used`, `token`, `username`) VALUES
('AtAShPVWqRXdfxmVrOHXPQ==', '2017-08-06 17:02:27', 'GUzsG1kCY0YGT3PAvyW7Wg==', 'admin'),
('G/kEqe0AkXYDfrcb4pcdAA==', '2017-11-27 23:39:35', '9QsBO7tziTdh8nAOhTz0eg==', 'admin'),
('g8TpbDK1C2ySgij5haXaCQ==', '2016-11-01 01:01:45', 'LHxWeOFXjBI8podE0d4e1w==', 'a'),
('grvvy0DbTo7pzeqLWReUzg==', '2016-11-02 06:15:54', 'IfH1GL/ySw607NZJqy0NIQ==', 'admin'),
('nL3SDQtGVWVHfTSr2lipPg==', '2016-10-31 23:45:21', 'ytRdFqUA13Z8EElKCJTw5Q==', 'a'),
('PkVd3FVgyo5FMCREhnKT+w==', '2016-12-02 00:23:00', 'OFDQDwhSU+L/Qtlk2NkYgg==', 'admin'),
('SQJleeTeKPFcirDf//f51Q==', '2017-08-06 18:01:05', 'sTYJSWLsFKD3W7T38nL0lA==', 'uuuuuu'),
('WVeinsaUGpgUxiKARSRUCw==', '2017-08-06 18:02:41', 'FFTqR91RYfeasyMGevy6xg==', 'uuuuuu'),
('ZiQwOd4ejjuFTia1nCUnYQ==', '2017-08-06 16:49:49', 'a+1w2kc7jMIRCo7GHRbgbg==', 'admin'),
('ZREOUWohNgPpCIQ3UhjXVg==', '2016-10-31 23:54:32', 'FSrsltTBtN2IoPIhAw03sQ==', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` bigint(20) NOT NULL,
  `discount` double NOT NULL,
  `productBrand` varchar(255) DEFAULT NULL,
  `productCategory` varchar(255) DEFAULT NULL,
  `productDescription` varchar(255) DEFAULT NULL,
  `productModel` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productPrice` double NOT NULL,
  `productStatus` varchar(255) DEFAULT NULL,
  `unitInStock` int(11) NOT NULL,
  `productCategoriesId` int(11) NOT NULL,
  `productBrandId` int(11) NOT NULL,
  `variants` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `discount`, `productBrand`, `productCategory`, `productDescription`, `productModel`, `productName`, `productPrice`, `productStatus`, `unitInStock`, `productCategoriesId`, `productBrandId`, `variants`) VALUES
(24, 2, 'Samsung', 'Mobile', '4.80-inch touchscreen display with a resolution of 720 pixels by 1280 pixels', 'Galaxy S III', 'Samsung Galaxy', 70, 'Brand New', 100, 0, 0, ''),
(25, 0, 'A', 'Laptop', 'dddd', 'A', 'A', 100, 'Brand New', 10, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `productbrand`
--

CREATE TABLE `productbrand` (
  `productBrandId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(125) NOT NULL,
  `productCategoriesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productbrand`
--

INSERT INTO `productbrand` (`productBrandId`, `name`, `image`, `productCategoriesId`) VALUES
(1, 'Samsung', '', 1),
(2, 'IPhone', '', 1),
(3, 'HP', '', 2),
(5, 'Dell', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `productcategories`
--

CREATE TABLE `productcategories` (
  `productCategoriesId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productcategories`
--

INSERT INTO `productcategories` (`productCategoriesId`, `name`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `productvariants`
--

CREATE TABLE `productvariants` (
  `productVariantsId` int(11) NOT NULL,
  `variant` varchar(50) NOT NULL,
  `productCategoriesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productvariants`
--

INSERT INTO `productvariants` (`productVariantsId`, `variant`, `productCategoriesId`) VALUES
(1, 'Màn hình', 1),
(2, 'Pin', 1),
(3, 'CPU', 2),
(4, 'RAM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shippingaddress`
--

CREATE TABLE `shippingaddress` (
  `shippingAddressId` bigint(20) NOT NULL,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `strretName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingaddress`
--

INSERT INTO `shippingaddress` (`shippingAddressId`, `apartmentNumber`, `city`, `country`, `state`, `strretName`, `zipCode`) VALUES
(1, 'B2', 'B3', 'B5', 'B4', 'yz', 'B6'),
(2, 'Z2', 'Z3', 'Z5', 'Z4', 'Z1', 'Z6'),
(3, 'B2', 'B3', 'B5', 'B4', 'yyyyyyyyyyyyyy', 'B6'),
(4, '', '', '', '', '', ''),
(5, 'k8', 'k9', 'k11', 'k10', 'k777777777777777', 'k12'),
(6, 'u7', 'u8', 'u9', 'u9', 'u6yyyyyyyyyyyyyyyyyyyyyyyy', 'u10'),
(7, '', '', '', '', '', ''),
(8, '', '', '', '', '', ''),
(9, 'm', 'm', 'm', 'm', 'm', 'm'),
(10, 'd', 'd', 'd', 'd', 'd', 'd'),
(11, 'd', 'd', 'd', 'd', 'd', 'd'),
(12, 'f', 'f', 'f', 'f', 'f', 'f'),
(13, 'a', 'a', 'a', 'a', 'A', 'a'),
(14, 'a', 'a', 'a', 'a', 'a', 'a'),
(15, 'a', 'a', 'a', 'a', 'a', 'a'),
(16, 'a', 'a', 'a', 'a', 'a', 'a'),
(17, 'a', 'a', 'a', 'a', 'a', 'a'),
(18, 'a', 'a', 'a', 'a', 'a', 'a'),
(19, 'a', 'a', 'a', 'a', 'a', 'a'),
(20, 'a', 'a', 'a', 'a', 'a', 'a'),
(21, 'a', 'a', 'a', 'a', 'a', 'a'),
(22, 'a', 'a', 'a', 'a', 'a', 'a'),
(23, 'a', 'a', 'a', 'a', 'a', 'a'),
(24, 'a', 'a', 'a', 'a', 'a', 'a'),
(25, 'a', 'a', 'a', 'a', 'a', 'a'),
(26, 'R-9', 'Dhaka', 'Bangladesh', 'Dhaka', '12', '1230'),
(27, 'g', 'g', 'g', 'g', 'g', 'g'),
(28, 'h', 'h', 'Bangladesh', 'm,', '34', '1230'),
(29, '11', 'Ho Chi Minh', 'Vietnam', 'Ho Chi Minh, thanh pho', '1066 Truong Sa Street, Ward 12, 3 District', '700000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` bigint(20) NOT NULL,
  `customerId` bigint(20) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `customerId`, `enabled`, `password`, `username`) VALUES
(1, 0, 1, '$2a$10$DHI9KScefjBtky5DCe/LVOK.HeIeDglqM1nLSgz8SRhYoErwZdll.', 'admin'),
(18, 19, 1, '$2a$10$EkXwpDeQaCpkvMaCYccMkeYQEGAj18/F5WRuEYr1HcmVPit7.1sAm', 'uuuuuu'),
(19, 20, 1, '$2a$10$NlAgR7VmIw/xsajhvME8n.xHHxOZcfTved5GzBTN/n2nibTjH3bp2', 'Touhidur000'),
(20, 21, 1, '$2a$10$H/gXxXZYgdKn40xG2twbNOY37UC4BkUOWH0ihDuQLjkGIzb8FWW8m', 'vu123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`authoritiesId`);

--
-- Indexes for table `billingaddress`
--
ALTER TABLE `billingaddress`
  ADD PRIMARY KEY (`billingAddressId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `FK1FEF404CE26869` (`customerId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cartItemId`),
  ADD KEY `FK4393E735CBA1E7` (`productId`),
  ADD KEY `FK4393E7355E6EF6D` (`cartId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `FK27FBE3FE55E6EF6D` (`cartId`),
  ADD KEY `FK27FBE3FE27314535` (`shippingAddressId`),
  ADD KEY `FK27FBE3FEA21E1A7F` (`billingAddressId`);

--
-- Indexes for table `customercontact`
--
ALTER TABLE `customercontact`
  ADD PRIMARY KEY (`contactId`),
  ADD KEY `FK4FC8FE424CE26869` (`customerId`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`customerOrderId`),
  ADD KEY `FKAEF781F0376E3518` (`cutomerId`),
  ADD KEY `FKAEF781F055E6EF6D` (`cartId`),
  ADD KEY `FKAEF781F027314535` (`shippingAddressId`),
  ADD KEY `FKAEF781F0A21E1A7F` (`billingAddressId`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD UNIQUE KEY `productId` (`productId`),
  ADD KEY `FK98B580BE5CBA1E7` (`productId`),
  ADD KEY `FK98B580BEFB141589` (`customerOrderId`);

--
-- Indexes for table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `productbrand`
--
ALTER TABLE `productbrand`
  ADD PRIMARY KEY (`productBrandId`);

--
-- Indexes for table `productcategories`
--
ALTER TABLE `productcategories`
  ADD PRIMARY KEY (`productCategoriesId`);

--
-- Indexes for table `productvariants`
--
ALTER TABLE `productvariants`
  ADD PRIMARY KEY (`productVariantsId`);

--
-- Indexes for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD PRIMARY KEY (`shippingAddressId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `authoritiesId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `billingaddress`
--
ALTER TABLE `billingaddress`
  MODIFY `billingAddressId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `cartItemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customercontact`
--
ALTER TABLE `customercontact`
  MODIFY `contactId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customerorder`
--
ALTER TABLE `customerorder`
  MODIFY `customerOrderId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `productbrand`
--
ALTER TABLE `productbrand`
  MODIFY `productBrandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productcategories`
--
ALTER TABLE `productcategories`
  MODIFY `productCategoriesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productvariants`
--
ALTER TABLE `productvariants`
  MODIFY `productVariantsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  MODIFY `shippingAddressId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK1FEF404CE26869` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FK4frngji4r1ftbjor2abkba6aj` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FK1ddqmbytuin6giodgt7m8ele5` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FK4393E7355E6EF6D` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FK4393E735CBA1E7` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  ADD CONSTRAINT `FKfm2xpv0aksxnpoucoywb41f86` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK20d1ujcacjjnd89s8quarc9np` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FK27FBE3FE27314535` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FK27FBE3FE55E6EF6D` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FK27FBE3FEA21E1A7F` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`),
  ADD CONSTRAINT `FK3b3ceu4yod31t25x3t678f1q` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FKr5wi61lg58im15h4mwys66f2f` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`);

--
-- Constraints for table `customercontact`
--
ALTER TABLE `customercontact`
  ADD CONSTRAINT `FK4FC8FE424CE26869` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FKavn19cimkgkp8ncle7t8w9i5d` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `FK5exbchk9o8g1fwjpcak5e1jps` FOREIGN KEY (`cutomerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FKAEF781F027314535` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FKAEF781F0376E3518` FOREIGN KEY (`cutomerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FKAEF781F055E6EF6D` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FKAEF781F0A21E1A7F` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`),
  ADD CONSTRAINT `FKku97yur4wvma4y6fj46i9nyky` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`),
  ADD CONSTRAINT `FKpyvagleec73uwpe30b7bsdyw4` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FKssw7c3idfgxi4fj4q4h7twfhl` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK98B580BE5CBA1E7` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  ADD CONSTRAINT `FK98B580BEFB141589` FOREIGN KEY (`customerOrderId`) REFERENCES `customerorder` (`customerOrderId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
