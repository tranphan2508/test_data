-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2017 at 08:41 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
CREATE TABLE `indicators` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `year` smallint(6) NOT NULL,
  `col_id1` varchar(255) DEFAULT NULL,
  `col_id2` varchar(255) DEFAULT NULL,
  `col_id3` varchar(255) DEFAULT NULL,
  `col_id4` varchar(255) DEFAULT NULL,
  `col_id5` varchar(255) DEFAULT NULL,
  `col_id6` varchar(255) DEFAULT NULL,
  `col_id7` varchar(255) DEFAULT NULL,
  `col_id8` varchar(255) DEFAULT NULL,
  `col_id9` varchar(255) DEFAULT NULL,
  `col_id10` varchar(255) DEFAULT NULL,
  `col_id11` varchar(255) DEFAULT NULL,
  `col_id12` varchar(255) DEFAULT NULL,
  `col_id13` varchar(255) DEFAULT NULL,
  `col_id14` varchar(255) DEFAULT NULL,
  `col_id15` varchar(255) DEFAULT NULL,
  `col_id16` varchar(255) DEFAULT NULL,
  `col_id17` varchar(255) DEFAULT NULL,
  `col_id18` varchar(255) DEFAULT NULL,
  `col_id19` varchar(255) DEFAULT NULL,
  `col_id20` varchar(255) DEFAULT NULL,
  `col_id21` varchar(255) DEFAULT NULL,
  `col_id22` varchar(255) DEFAULT NULL,
  `col_id23` varchar(255) DEFAULT NULL,
  `col_id24` varchar(255) DEFAULT NULL,
  `col_id25` varchar(255) DEFAULT NULL,
  `col_id26` varchar(255) DEFAULT NULL,
  `col_id27` varchar(255) DEFAULT NULL,
  `col_id28` varchar(255) DEFAULT NULL,
  `col_id29` varchar(255) DEFAULT NULL,
  `col_id30` varchar(255) DEFAULT NULL,
  `col_id31` varchar(255) DEFAULT NULL,
  `col_id32` varchar(255) DEFAULT NULL,
  `col_id33` varchar(255) DEFAULT NULL,
  `col_id34` varchar(255) DEFAULT NULL,
  `col_id35` varchar(255) DEFAULT NULL,
  `col_id36` varchar(255) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indicators`
--

INSERT INTO `indicators` (`id`, `company_id`, `year`, `col_id1`, `col_id2`, `col_id3`, `col_id4`, `col_id5`, `col_id6`, `col_id7`, `col_id8`, `col_id9`, `col_id10`, `col_id11`, `col_id12`, `col_id13`, `col_id14`, `col_id15`, `col_id16`, `col_id17`, `col_id18`, `col_id19`, `col_id20`, `col_id21`, `col_id22`, `col_id23`, `col_id24`, `col_id25`, `col_id26`, `col_id27`, `col_id28`, `col_id29`, `col_id30`, `col_id31`, `col_id32`, `col_id33`, `col_id34`, `col_id35`, `col_id36`, `del`, `created_date`, `updated_date`) VALUES
(1, 2, 2009, NULL, NULL, NULL, NULL, NULL, '4923.35', NULL, '1.15', '1.49', '113.37', '53.13', NULL, '0.81', '3.93', '1.58', NULL, '16.73', '13.23', '14.74', NULL, '7.74', '16.51', '9.50', '28277.38', '9.44', NULL, '0.06', '5.41', '16.29', '92.96', '230.97', '22.41', '301.51', '2.13', '6.32', NULL, 0, '2017-02-22 04:20:27', '2017-03-01 03:59:24'),
(2, 2, 2010, NULL, NULL, NULL, NULL, NULL, '3521.29', NULL, '0.87', '1.27', '142.96', '58.84', NULL, '0.97', '4.01', '2.11', NULL, '13.58', '10.50', '12.72', NULL, '4.77', '10.95', '4.94', '31293.75', '4.88', NULL, '0.07', '2.43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-02-22 07:41:04', '2017-02-28 07:52:49'),
(3, 2, 2011, NULL, NULL, NULL, NULL, NULL, '6445.70', NULL, '0.90', '1.31', '150.34', '60.05', NULL, '1.33', '4.77', '3.10', NULL, '15.51', '9.88', '11.20', NULL, '7.15', '17.66', '5.36', '35962.42', '5.32', NULL, '0.08', '2.90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-02-22 07:50:43', '2017-02-28 07:53:03'),
(4, 1, 2009, NULL, NULL, NULL, NULL, NULL, '6858.77', NULL, '0.66', '109.09', '0.92', '0.91', NULL, '0.02', '', '0.04', NULL, '100.00', '518.63', '518.63', NULL, '8.21', '8.29', '427.87', '10432.19', '427.87', NULL, '0.66', '', '', '', '9284.69', '', '9284.69', '1.01', '', NULL, 0, '2017-03-03 02:28:10', '2017-03-03 06:24:11'),
(5, 1, 2010, NULL, NULL, NULL, NULL, NULL, '741.86', NULL, '9.90', '11.49', '6.98', '6.53', NULL, '0.25', '96.82', '2.15', NULL, '26.29', '16.37', '17.45', NULL, '5.35', '5.70', '21.17', '22044.35', '11.83', NULL, '0.28', '75.97', '24.23', '3.77', '169.53', '15.06', '158.23', '1.07', '5.03', NULL, 0, '2017-03-03 02:43:33', '2017-03-03 06:06:00'),
(6, 1, 2011, NULL, NULL, NULL, NULL, NULL, '1064.14', NULL, '0.63', '1.02', '100.29', '50.07', NULL, '0.40', '104.96', '2.90', NULL, '7.54', '23.24', '25.09', NULL, '3.62', '5.58', '9.13', '13252.32', '9.13', NULL, '0.00', '2.28', '3.85', '3.48', '126.05', '94.85', '34.67', '1.54', '7.10', NULL, 0, '2017-03-03 06:28:11', '2017-03-03 07:05:28'),
(7, 1, 2012, NULL, NULL, NULL, NULL, NULL, '728.35', NULL, '0.98', '1.75', '76.21', '43.25', NULL, '1.21', '709.83', '5.05', NULL, '2.75', '3.26', '3.88', NULL, '2.82', '5.08', '2.34', '14633.75', '2.33', NULL, '0.01', '4.14', '5.80', '0.51', '72.34', '62.98', '9.87', '1.80', '26.23', NULL, 0, '2017-03-03 06:31:16', '2017-03-03 07:07:36'),
(8, 1, 2013, NULL, NULL, NULL, NULL, NULL, '1284.23', NULL, '0.51', '1.39', '66.17', '39.82', NULL, '0.83', '33.90', '3.30', NULL, '8.36', '8.95', '9.51', NULL, '4.69', '8.03', '5.68', '15194.74', '5.68', NULL, '0.02', '8.17', '4.03', '10.77', '110.56', '90.62', '30.72', '1.71', '11.18', NULL, 0, '2017-03-03 06:34:30', '2017-03-03 07:09:52'),
(9, 1, 2014, NULL, NULL, NULL, NULL, NULL, '1980.82', NULL, '3.91', '6.09', '37.99', '27.53', NULL, '0.54', '26.67', '2.55', NULL, '12.49', '24.22', '24.94', NULL, '9.48', '13.73', '17.24', '12106.73', '17.24', NULL, '0.95', '10.88', '5.88', '13.68', '143.13', '62.07', '93', '1.44', '11.51', NULL, 0, '2017-03-03 06:37:53', '2017-04-04 02:55:45'),
(10, 1, 2015, NULL, NULL, NULL, NULL, NULL, '1951.89', NULL, '0.06', '1.94', '57.51', '36.51', NULL, '0.69', '14.05', '2.19', NULL, '12.46', '22.53', '23.05', NULL, '11.85', '17.78', '16.93', '11564.18', '16.93', NULL, '0.06', '28.23', '10.52', '25.97', '166.66', '34.69', '157', '1.49', '3.90', NULL, 0, '2017-03-03 06:58:32', '2017-04-04 02:55:50'),
(11, 6, 2007, NULL, '31.25', NULL, NULL, NULL, '12442', NULL, '0.01', '1.04', '385.34', '79.39', NULL, '1.53', '2.80', '4.32', NULL, '23.46', '11.11', '11.89', NULL, '12.92', '62.74', '8.43', '13613.05', '8.43', NULL, '0.01', '8.47', '4.20', '130.35', '84.49', '86.90', '127', '4.85', '48.34', NULL, 0, '2017-04-04 03:31:40', '2017-08-14 08:22:34'),
(12, 6, 2008, NULL, '29.00', NULL, NULL, NULL, '5009', NULL, '0.11', '1.21', '256.95', '71.98', NULL, '0.81', '1.28', '2.66', NULL, '29.94', '12.94', '15.06', NULL, '9.32', '37.74', '11.46', '13296.41', '11.46', NULL, '0.11', '13.98', '1.52', '285.15', '137.21', '240.13', '181', '4.04', '19.24', NULL, 0, '2017-04-04 06:19:09', '2017-08-14 08:22:31'),
(13, 6, 2009, NULL, '41.98', NULL, NULL, NULL, '9115', NULL, '0.15', '1.15', '255.37', '71.86', NULL, '1.25', '3.66', '3.00', NULL, '26.24', '13.96', '15.04', NULL, '15.98', '56.91', '12.75', '14992.90', '12.75', NULL, '0.07', '27.27', '1.58', '99.72', '121.66', '231.01', '-10', '3.55', '30.87', NULL, 0, '2017-04-04 07:15:51', '2017-08-14 08:22:28'),
(14, 6, 2010, NULL, '29.53', NULL, NULL, NULL, '8495', NULL, '0.33', '1.62', '108.75', '52.09', NULL, '0.81', '5.05', '1.57', NULL, '36.57', '25.28', '25.90', NULL, '18.51', '45.71', '22.60', '24412.13', '22.60', NULL, '0.30', '33.40', '1.34', '72.27', '232.48', '272.38', '31', '2.46', '28.08', NULL, 0, '2017-04-04 07:42:27', '2017-08-14 08:22:25'),
(15, 6, 2011, NULL, '18.67', NULL, NULL, NULL, '3910.87', NULL, '0.83', '1.70', '92.76', '48.12', NULL, '0.42', '3.21', '1.01', NULL, '43.05', '26.38', '27.35', NULL, '10.00', '20.05', '23.74', '19850.11', '23.74', NULL, '0.79', '29.07', '0.55', '113.70', '361.38', '663.63', '-188', '2.00', '13.08', NULL, 0, '2017-04-04 08:03:23', '2017-08-14 08:22:22'),
(16, 6, 2016, '0', '10.72', NULL, NULL, NULL, '2050', NULL, '0.38', '2.96', '47.62', '32.26', NULL, '1.13', '7.17', '2.10', NULL, '21.36', '9.39', '9.39', NULL, '8.23', '12.55', '7.27', '16779.67', '7.27', NULL, '0.36', '11.38', '7.11', '50.90', '173.80', '51.33', '172', '1.52', '9.16', NULL, 0, '2017-04-05 02:50:16', '2017-08-14 08:22:08'),
(17, 6, 2012, NULL, '16.86', NULL, NULL, NULL, '3173', NULL, '0.79', '2.50', '39.33', '28.23', NULL, '0.46', '4.21', '1.41', NULL, '37.52', '25.12', '25.12', NULL, '11.17', '18.35', '24.21', '18117.26', '24.21', NULL, '0.75', '209.34', '1.06', '86.69', '258.86', '344.33', '', '1.64', '6.17', NULL, 0, '2017-04-05 03:10:17', '2017-08-14 08:22:19'),
(18, 6, 2013, NULL, '5.45', NULL, NULL, NULL, '978', NULL, '0.34', '2.02', '48.99', '32.88', NULL, '0.43', '4.15', '1.14', NULL, '20.86', '10.85', '10.85', NULL, '3.76', '5.42', '8.56', '17067.68', '8.56', NULL, '0.33', '13.51', '1.78', '87.95', '320.17', '205.05', '202', '1.44', '3.40', NULL, 0, '2017-04-05 03:26:22', '2017-08-14 08:22:17'),
(19, 6, 2014, NULL, '8.38', NULL, NULL, NULL, '1694', NULL, '0.17', '1.99', '55.57', '35.72', NULL, '0.32', '2.11', '0.71', NULL, '38.08', '21.33', '21.33', NULL, '6.24', '9.51', '19.38', '18146.17', '19.38', NULL, '0.15', '11.44', '1.31', '172.98', '514.08', '278.62', '408', '1.52', '2.14', NULL, 0, '2017-04-05 03:34:23', '2017-08-14 08:22:14'),
(20, 6, 2015, NULL, '8.65', NULL, NULL, NULL, '1789', NULL, '0.26', '2.45', '57.78', '36.62', NULL, '0.64', '3.56', '1.33', NULL, '31.33', '12.66', '12.66', NULL, '6.56', '10.29', '10.11', '17254.48', '10.11', NULL, '0.23', '21.45', '3.41', '102.52', '274.43', '107.03', '268', '1.56', '4.37', NULL, 0, '2017-04-05 03:41:46', '2017-08-14 08:22:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
