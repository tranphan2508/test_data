-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2016 at 09:16 AM
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
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Name of company',
  `code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT 'Stock code ',
  `sector_id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COMMENT 'History of company',
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `public` int(1) DEFAULT '0',
  `del` tinyint(2) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `code`, `sector_id`, `floor_id`, `description`, `link`, `public`, `del`, `created_date`, `updated_date`) VALUES
(1, 'Công ty Cổ phần Tập đoàn FLC', 'FLC', 9, 1, 'Công ty Cổ phầnTập đoàn FLC là một công ty hoạt động trong lĩnh vực bất động sản mới gia nhập thị trường. Tuy nhiên, nhờ có đội ngũ quản lý có nhiều kinh nghiệm trong ngành, Công ty đang từng bước tạo lập uy tín và thương hiệu “FLC” trên thị trường. Số lượng khách hàng của Công ty ngày càng tăng không chỉ dựa vào mối quan hệ tốt sẵn có của các cán bộ quản lý mà còn dựa vào chính chất lượng sản phẩm dịch vụ mà FLC mang đến cho khách hàng. FLC định hướng trở thành một trong những tập đoàn kinh doanh tư vấn bất động sản hàng đầu tại Việt Nam.', 'http://flc.vn', 1, 0, '2016-10-06 06:19:31', '2016-10-06 08:26:16'),
(2, 'CTCP Hùng Vương', 'HVG', 4, 1, 'HVG là một trong những công ty chế biến cá tra được thành lập sớm tại Việt Nam với đội ngũ nhân sự nhiều kinh nghiệm và đã tạo dựng được thương hiệu được nhiều người tiêu dùng và đối tác biết đến, nhờ vào tính ổn định trong sản lượng và chất lượng của các sản phẩm, quy trình sản xuất khép kín, thương hiệu luôn được Công ty chú trọng quảng bá và trách nhiệm cao đối với xã hội và môi trường của Công ty. Đây là những yếu tố làm nên một HVG luôn duy trì mức tăng trưởng tốt trong suốt 11 năm hoat động của mình.', 'http://www.hungvuongpanga.com/', 1, 0, '2016-10-06 07:53:46', '2016-10-06 07:53:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
