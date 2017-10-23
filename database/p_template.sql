-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2017 at 03:25 AM
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
-- Table structure for table `p_template`
--

DROP TABLE IF EXISTS `p_template`;
CREATE TABLE `p_template` (
  `id` int(11) NOT NULL COMMENT 'param id',
  `title1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority1` tinyint(4) NOT NULL DEFAULT '0',
  `title2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority2` tinyint(4) NOT NULL DEFAULT '0',
  `title3` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority3` tinyint(4) NOT NULL DEFAULT '0',
  `title4` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority4` tinyint(4) NOT NULL DEFAULT '0',
  `title5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority5` tinyint(4) NOT NULL DEFAULT '0',
  `title6` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority6` tinyint(4) NOT NULL DEFAULT '0',
  `title7` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority7` tinyint(4) NOT NULL DEFAULT '0',
  `title8` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority8` tinyint(4) NOT NULL DEFAULT '0',
  `title9` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority9` tinyint(4) NOT NULL DEFAULT '0',
  `title10` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `priority10` tinyint(4) NOT NULL DEFAULT '0',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `p_template`
--

INSERT INTO `p_template` (`id`, `title1`, `priority1`, `title2`, `priority2`, `title3`, `priority3`, `title4`, `priority4`, `title5`, `priority5`, `title6`, `priority6`, `title7`, `priority7`, `title8`, `priority8`, `title9`, `priority9`, `title10`, `priority10`, `del`, `created_date`, `updated_date`) VALUES
(12, 'Value', 0, 'Value 2', 0, 'value 3', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 04:18:37', '2017-05-09 05:45:23'),
(11, 'Value', 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:42:00', '2017-05-15 06:12:56'),
(13, 'Giá gốc', 0, 'Giá trị hơp lý', 0, 'Dự phòng', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:51:22', '2017-05-09 05:51:53'),
(15, 'Giá gốc', 0, 'Giá trị ghi sổ', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:52:20', '2017-05-09 05:52:20'),
(16, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:53:12', '2017-05-09 05:53:12'),
(31, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:53:22', '2017-05-09 05:53:22'),
(17, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:53:48', '2017-05-09 05:53:48'),
(20, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:54:24', '2017-05-09 05:54:24'),
(21, 'Giá trị', 0, 'Dự phòng', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:54:45', '2017-05-09 05:54:45'),
(23, 'Giá gốc', 0, 'Dự phòng', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 05:55:24', '2017-05-09 05:55:24'),
(38, 'Số dư đầu năm', 0, 'Mua trong năm', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:06:29', '2017-05-09 06:06:29'),
(39, 'Số dư đầu năm', 0, 'Mua trong năm', 0, 'Đầu tư xây dựng cơ bản hoàn thành', 0, 'Thanh lý, nhượng bán', 0, 'Khác', 1, 'Số dư cuối năm', 1, 'Giảm do chuyển nhượng công ty con', 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:09:10', '2017-05-18 02:17:30'),
(40, 'Số dư đầu năm', 1, 'Khấu hao trong năm', 2, 'Thanh lý, nhượng bán', 3, 'Khác', 5, 'Số dư cuối năm', 6, 'Giảm do chuyển nhượng công ty con', 4, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:09:53', '2017-05-18 02:23:11'),
(189, 'Số dư đầu năm', 0, 'Mua mới trong năm', 0, 'Khác', 1, 'Số dư cuối năm', 1, 'Thanh lý nhượng bán', 0, 'Giảm do chuyển nhượng công ty con', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:12:19', '2017-05-18 02:27:51'),
(190, 'Số dư đầu năm', 0, 'Khấu hao trong năm', 0, 'Thanh lý, nhượng bán', 0, 'Khác', 1, 'Số dư cuối năm', 1, 'Giảm do chuyển nhượng công ty con', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:13:18', '2017-05-18 02:28:06'),
(49, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:13:35', '2017-05-09 06:13:35'),
(52, 'Số đầu năm', 0, 'Chuyển nhượng từ công ty con', 0, 'Đầu tư tăng/(giảm) trong năm', 0, 'Phân loại giá trị đầu tư sang đầu tư khác', 0, 'Phần lợi nhuận /(lỗ) từ công ty liên kết', 0, 'Lợi nhuận/(lỗ) từ thanh lý đầu tư trong năm', 0, 'Phân loại lợi nhuận/(lỗ) sang đầu tư khác', 0, 'Số cuối năm', 1, 'Tăng/(giảm) lũy kế lợi nhuận khác', 0, NULL, 0, 0, '2017-05-09 06:27:16', '2017-05-16 02:33:57'),
(53, 'Số lượng (cổ phiếu)', 0, 'Tỷ lệ sở hữu', 0, 'Giá gốc', 0, 'Dự phòng', 0, 'Giá trị ghi sổ', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:28:26', '2017-05-11 07:26:47'),
(25, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:31:00', '2017-05-09 06:31:00'),
(57, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:31:11', '2017-05-09 06:31:11'),
(60, 'Nguyên giá', 0, 'Phân bổ lũy kế', 0, 'Giá trị còn lại', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:33:43', '2017-05-11 08:08:59'),
(65, 'Giá trị', 0, 'Số có khả năng trả nợ', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:35:10', '2017-05-09 06:35:10'),
(66, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:35:27', '2017-05-09 06:35:27'),
(67, 'Số đầu năm', 0, 'Số phát sinh trong năm', 0, 'Số đã nộp trong năm', 0, 'Số cuối năm', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:37:28', '2017-05-09 06:37:28'),
(73, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:38:08', '2017-05-09 06:38:08'),
(63, 'Giá trị đầu năm', 0, 'Số khả năng trả nợ đầu năm', 0, 'Tăng trong năm', 0, 'Giảm trong năm', 0, 'Giá trị cuối năm', 1, 'Số có khả năng trả cuối năm', 1, 'Chênh lệch tỷ giá', 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:42:04', '2017-05-18 03:12:51'),
(84, 'Giá trị đầu năm', 0, 'Số có khả năng trả nợ đầu năm', 0, 'Tăng trong năm', 0, 'Giảm trong năm', 0, 'Giá trị cuối năm', 0, 'Số có khả năng trả cuối năm', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:42:54', '2017-05-09 06:42:54'),
(92, 'Vốn góp', 0, 'Thặng dư vốn cổ phẩn', 0, 'Cổ phiếu quỹ', 0, 'Quỹ đầu tư phát triển', 0, 'Quỹ khác thuộc chủ sỡ hữu', 2, 'Lợi nhuận sau thuế chưa phân phối', 2, 'Lợi ích cổ đông không kiểm soảt', 2, 'Quỹ dự phòng tài chính', 2, 'Chênh lệch tỷ giá hối đoái', 1, NULL, 0, 0, '2017-05-09 06:55:23', '2017-10-16 02:06:54'),
(109, 'Số đầu năm', 0, 'Vốn góp từ cổ đông không kiểm soát tăng thêm trong năm', 0, 'Thay đổi do mất quyền kiểm soát công ty con', 0, 'Phần lợi nhuận/(lỗ) thuộc về cổ đông không kiểm soát trong năm', 0, 'Số cuối năm', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:58:54', '2017-05-09 06:58:54'),
(113, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:59:28', '2017-05-09 06:59:28'),
(115, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:59:41', '2017-05-09 06:59:41'),
(118, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 06:59:53', '2017-05-09 06:59:53'),
(116, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:09', '2017-05-09 07:00:09'),
(119, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:20', '2017-05-09 07:00:20'),
(122, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:31', '2017-05-09 07:00:31'),
(123, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:35', '2017-05-09 07:00:35'),
(125, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:46', '2017-05-09 07:00:46'),
(126, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:00:51', '2017-05-09 07:00:51'),
(129, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:52:06', '2017-05-09 07:52:06'),
(130, 'Bảng cân đối kế toán hợp nhât', 0, 'Báo cáo kết quả hoạt động kinh doanh hợp nhất', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 07:55:21', '2017-05-09 07:55:21'),
(188, '', 0, '', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-09 08:19:34', '2017-05-09 08:19:34'),
(220, 'Giá gốc', 0, 'Dự phòng', 0, 'Giá trị ghi sổ', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-11 07:54:48', '2017-05-11 07:54:48'),
(35, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-15 08:41:40', '2017-05-15 08:41:40'),
(69, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-16 04:03:10', '2017-05-16 04:03:10'),
(279, 'Doanh thu từ bán hàng ra ngoài', 0, 'Doanh thu từ bán hàng cho các bộ phận', 0, 'Lợi nhuận/(lỗ) gộp trước thuế của bộ phận', 0, 'Tài sản', 0, 'Công nợ', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:38:11', '2017-05-17 06:38:11'),
(280, 'Doanh thu từ bán hàng ra bên ngoài', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:45:12', '2017-05-17 06:45:12'),
(281, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:46:01', '2017-05-17 06:46:01'),
(282, 'Mối quan hệ', 0, 'Nội dung nghiệp vụ', 0, 'Số tiền', 0, 'Số tiền', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:48:56', '2017-05-17 07:41:39'),
(283, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:50:48', '2017-05-17 06:50:48'),
(284, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:51:05', '2017-05-17 06:51:05'),
(285, 'Cam kết góp vốn của công ty', 0, 'Số vốn thực góp', 0, 'Số vốn chưa góp', 0, 'Số vốn chưa góp', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 06:52:11', '2017-05-17 07:24:45'),
(286, 'value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 07:10:14', '2017-05-17 07:10:14'),
(287, 'Value', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2017-05-17 08:51:18', '2017-05-17 08:51:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `p_template`
--
ALTER TABLE `p_template`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
