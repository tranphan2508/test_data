-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2016 at 09:10 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `id` int(11) NOT NULL,
  `name` varchar(265) CHARACTER SET utf8 NOT NULL,
  `del` tinyint(1) DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `name`, `del`, `created_date`, `updated_date`) VALUES
(1, 'Dầu khí', 0, '2016-10-05 08:29:26', '2016-10-05 08:30:36'),
(2, 'Vật liệu cơ bản', 0, '2016-10-05 08:33:04', '2016-10-05 08:33:04'),
(3, 'Công nghiệp', 0, '2016-10-05 08:33:12', '2016-10-05 08:33:12'),
(4, 'Hàng tiêu dùng', 0, '2016-10-05 08:33:21', '2016-10-05 08:33:21'),
(5, 'Y tế', 0, '2016-10-05 08:33:32', '2016-10-05 08:33:32'),
(6, 'Dịch vụ tiêu dùng', 0, '2016-10-05 08:33:42', '2016-10-05 08:33:42'),
(7, 'Viễn thông', 0, '2016-10-05 08:33:49', '2016-10-05 08:33:49'),
(8, 'Các dịch vụ hạ tầng', 0, '2016-10-05 08:33:59', '2016-10-05 08:33:59'),
(9, 'Tài chính', 0, '2016-10-05 08:34:06', '2016-10-05 08:34:06'),
(10, 'Công nghệ', 0, '2016-10-05 08:34:13', '2016-10-05 08:34:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
