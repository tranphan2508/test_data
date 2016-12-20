-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2016 at 04:18 AM
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
-- Table structure for table `capital`
--

CREATE TABLE `capital` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '0',
  `reason` varchar(285) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `share_outstanding` int(11) NOT NULL,
  `other_share` int(11) NOT NULL,
  `list_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capital`
--

INSERT INTO `capital` (`id`, `company_id`, `type`, `reason`, `quantity`, `price`, `share_outstanding`, `other_share`, `list_date`, `updated_date`, `del`) VALUES
(1, 1, 0, 'Niêm yết cổ phiếu', 1800000, 10000, 1800000, 0, '2009-12-09 00:00:00', '2016-11-23 02:21:48', 0),
(2, 1, 0, 'Phát hành cổ phiểu riêng lẻ', 700000, 10000, 2500000, 0, '2010-01-14 00:00:00', '2016-11-22 08:11:40', 0),
(3, 1, 0, 'Phát hành cổ phiếu riêng lẻ và phát hành cho cổ đông hiện hữu', 7500000, 10000, 10000000, 0, '2010-02-08 00:00:00', '2016-11-22 08:11:33', 0),
(4, 1, 0, 'Phát hành cổ phiếu riêng lẻ và phát hành cho cổ đông hiện hữu', 7000000, 10000, 17000000, 0, '2011-10-05 00:00:00', '2016-11-22 07:43:31', 0),
(5, 1, 0, 'Phát hành riêng lẻ', 60180000, 10000, 77180000, 0, '2012-06-15 00:00:00', '2016-11-22 07:43:09', 0),
(6, 1, 0, 'Phát hành cho cổ đông hiện hữu tỷ lệ 1:1', 77180000, 10000, 154360000, 0, '2014-04-29 00:00:00', '2016-11-22 07:52:11', 0),
(7, 1, 0, 'Phát hành cổ phiếu trả cổ tức tỷ lệ 4%', 6173882, 0, 160533882, 0, '2014-09-03 00:00:00', '2016-11-22 08:13:20', 0),
(8, 1, 0, 'Phát hành cổ phiếu cho cổ đông hiện hữu', 154360000, 10000, 314893882, 0, '2014-09-09 00:00:00', '2016-11-22 08:09:25', 0),
(9, 1, 0, 'Phát hành cổ phiếu riêng lẻ cho các nhà đầu tư', 60000000, 10200, 374893882, 0, '2015-01-13 00:00:00', '2016-12-12 09:13:46', 0),
(10, 1, 0, 'Chuyển đổi trái phiếu chuyển đổi thành cổ phiếu', 80000000, 0, 454893882, 0, '2015-05-27 00:00:00', '2016-11-22 08:23:42', 0),
(11, 1, 0, 'Phát hành cổ phiếu để tăng vốn cổ phần từ nguồn vốn chủ sỡ hữu', 74977651, 10000, 529871533, 0, '2015-06-14 00:00:00', '2016-11-22 08:29:09', 0),
(12, 1, 0, 'Phát hành cổ phiếu cho cổ đông hiện hữu tỷ lệ 59:20', 108167204, 10000, 638038737, 0, '2016-09-08 00:00:00', '2016-11-22 08:32:46', 0),
(13, 2, 0, 'df', 123, 0, 638038860, 0, '2016-11-09 00:00:00', '2016-11-23 03:47:29', 0),
(14, 5, 0, 'Phát hành cổ phiếu ra công chúng', 5472920, 100000, 5472920, 0, '2005-12-01 00:00:00', '2016-12-15 05:57:43', 0),
(15, 5, 0, 'Phát hành cổ phiếu ra công chúng', 55337310, 10000, 60810230, 0, '2006-12-01 00:00:00', '2016-12-15 05:59:18', 0),
(16, 5, 0, 'Phát hành cổ phiếu cho công chúng', 30405114, 10000, 91215344, 0, '2007-06-12 00:00:00', '2016-12-15 06:37:54', 0),
(17, 5, 0, 'Niêm yết bổ sung', 684115, 10000, 91899459, 0, '2007-08-12 00:00:00', '2016-12-15 06:56:31', 0),
(18, 5, 0, 'Phát hành cổ phiếu cho ngươi lao động có thành tích đóng góp năm 2007', 1292887, 10000, 93627866, 17600, '2008-06-11 00:00:00', '2016-12-20 03:57:31', 0),
(19, 5, 0, 'Phát hành cổ phiếu thưởng cho cổ đông hiện hữu tỷ lệ 2:1', 46595473, 10000, 140223339, 17600, '2008-12-22 00:00:00', '2016-12-20 03:57:34', 0),
(20, 5, 0, 'Phát hành cổ phiếu cho CBNV', 220125, 10000, 140443464, 17600, '2009-06-25 00:00:00', '2016-12-20 03:57:38', 0),
(21, 5, 0, 'Phát hành cho CBNV có thành tích đóng góp 2008', 2641253, 10000, 143084717, 17600, '2009-08-12 00:00:00', '2016-12-20 03:57:41', 0),
(22, 5, 0, 'Trả cổ tức', 47547223, 10000, 57547223, 17600, '2010-07-01 00:00:00', '2016-12-20 03:57:43', 0),
(23, 5, 1, 'fsdfa', 1000, 10000, 57547223, 1000, '2016-12-30 00:00:00', '2016-12-15 08:06:29', 0),
(24, 5, 1, 'fsa', 1, 1, 57547223, 1, '2016-12-23 00:00:00', '2016-12-15 08:38:35', 0),
(25, 5, 1, 'Cổ phiếu quỹ', 17600, 10000, 91881859, 17600, '2007-11-30 00:00:00', '2016-12-20 03:54:33', 0),
(26, 5, 0, 'Cổ phiếu hạn chế chuyển nhượng', 453120, 10000, 92334979, 17600, '2007-12-03 00:00:00', '2016-12-20 03:54:38', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
