-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2021 at 06:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forums`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` bigint(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `username`, `password`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'QdfTlHNHxdtTzDb7CpiNEWNsT6dOqwC1', 'Joana', '$2b$10$QGLn8/Wtll5SQlDFIG/D7enwMNzEp29hVq.ZAvjixHr6.S.6pwfRC', 0, '2021-05-24 16:55:04', '2021-05-24 16:55:04', NULL),
(3, 'Wht3hBH9nO59NeffryjHew6Kk0iFf16k', 'Joana1', '$2b$10$1S/TPJKljLP7RJY9SrEzhO5eByyXbEEacOruIel3ueEDuAVWT1MFG', 0, '2021-05-24 16:56:43', '2021-05-24 16:56:43', NULL),
(6, 'YwIJsgeaGz2JtBlOBKt6gGbKJPlWsDg9', 'Joana3', '$2b$10$XZDNrMgcy.QHrnH4MNkVzOxTSXHQiqeVCRmeOPCxdyMIH5YiQpBMW', 0, '2021-05-24 16:58:54', '2021-05-24 16:58:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210524154802-create_accounts_table.js'),
('20210524155655-create_threads_table.js');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `threadId` bigint(20) NOT NULL,
  `threaduuid` varchar(255) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_body` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`threadId`, `threaduuid`, `thread_title`, `thread_body`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, '', 'new', 'new', '2021-05-24 18:30:50', '2021-05-24 18:30:50', NULL),
(2, 'QdfTlHNHxdtTzDb7CpiNEWNsT6dOqwC1', 'new1', 'new1', '2021-05-24 18:33:40', '2021-05-24 18:33:40', NULL),
(3, 'QdfTlHNHxdtTzDb7CpiNEWNsT6dOqwC1', 'new2', 'new2', '2021-06-08 16:27:40', '2021-06-08 16:27:40', NULL),
(4, 'QdfTlHNHxdtTzDb7CpiNEWNsT6dOqwC1', 'new2', 'new2', '2021-06-08 16:28:30', '2021-06-08 16:28:30', NULL),
(5, 'QdfTlHNHxdtTzDb7CpiNEWNsT6dOqwC1', 'new3', 'new3', '2021-06-08 16:30:16', '2021-06-08 16:30:16', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`threadId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `threadId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
