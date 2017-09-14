-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2017 at 08:39 AM
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
-- Table structure for table `params`
--

DROP TABLE IF EXISTS `params`;
CREATE TABLE IF NOT EXISTS `params` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `col_id` int(11) DEFAULT NULL,
  `title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(3) NOT NULL COMMENT '1-balance sheet; 2-income statement;3-statement of cash flow',
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `template` tinyint(4) DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='name of all data type';

--
-- Dumping data for table `params`
--

INSERT INTO `params` (`id`, `col_id`, `title`, `description`, `type`, `parent_id`, `level`, `template`, `created_date`, `updated_date`, `del`) VALUES
(1, 1, 'TÀI SẢN', '', 1, 0, 1, 0, '2016-09-28 13:33:56', '2017-05-09 03:58:12', 0),
(2, 2, 'NGUỒN VỐN', NULL, 1, 0, 1, 0, '2016-09-28 13:35:02', '2016-09-28 13:35:02', 0),
(3, 3, 'A. Tài sản lưu động và đầu tư ngắn hạn', NULL, 1, 1, 2, 0, '2016-09-28 13:35:21', '2016-09-28 13:35:21', 0),
(4, 4, 'B. Tài sản cố định và đầu tư dài hạn', NULL, 1, 1, 2, 0, '2016-09-28 13:35:52', '2016-09-28 13:35:52', 0),
(5, 5, 'I. Tiền và các khoản tương đương tiền', NULL, 1, 3, 3, 0, '2016-09-28 13:36:11', '2016-09-28 13:36:11', 0),
(6, 6, 'II. Các khoản đầu tư tài chính ngắn hạn', NULL, 1, 3, 3, 0, '2016-09-28 13:37:08', '2016-09-28 13:37:08', 0),
(7, 7, 'III. Các khoản phải thu ngắn hạn', NULL, 1, 3, 3, 0, '2016-09-28 13:38:02', '2016-09-28 13:38:02', 0),
(8, 8, 'IV. Tổng hàng tồn kho', NULL, 1, 3, 3, 0, '2016-09-28 13:39:13', '2016-09-28 13:39:13', 0),
(9, 9, 'V. Tài sản ngắn hạn khác', NULL, 1, 3, 3, 0, '2016-09-28 13:44:06', '2016-09-28 13:44:06', 0),
(11, 10, '1. Tiền', '', 1, 5, 4, 1, '2016-09-28 13:57:58', '2017-05-08 03:35:24', 0),
(12, 11, '2. Các khoản tương đương tiền', '', 1, 5, 4, 1, '2016-09-28 13:58:14', '2017-05-09 05:44:55', 0),
(13, 12, '1. Chứng khoán kinh doanh', '', 1, 6, 4, 3, '2016-09-28 13:58:27', '2017-05-09 05:51:53', 0),
(14, 13, '2. Dự phòng giảm giá chứng khoán kinh doanh', NULL, 1, 6, 4, 0, '2016-09-28 13:58:35', '2016-09-28 13:58:35', 0),
(15, 14, '3. Đầu tư nắm giữ đến ngày đáo hạn', '', 1, 6, 4, 2, '2016-09-28 13:58:44', '2017-05-09 05:52:20', 0),
(16, 15, '1. Phải thu ngắn hạn của khách hàng', '', 1, 7, 4, 1, '2016-09-28 13:58:52', '2017-05-08 03:58:02', 0),
(17, 16, '2. Trả trước cho người bán', '', 1, 7, 4, 1, '2016-09-28 13:58:59', '2017-05-08 03:59:35', 0),
(18, 17, '3. Phải thu nội bộ ngắn hạn', NULL, 1, 7, 4, 0, '2016-09-28 13:59:06', '2016-09-28 13:59:06', 0),
(19, 18, '4. Phải thu theo tiến độ hợp đồng xây dựng', NULL, 1, 7, 4, 0, '2016-09-28 13:59:51', '2016-09-28 13:59:51', 0),
(20, 19, '5. Phải thu về cho vay ngắn hạn', '', 1, 7, 4, 1, '2016-09-28 13:59:59', '2017-05-08 04:00:10', 0),
(21, 20, '6. Phải thu ngắn hạn khác', '', 1, 7, 4, 2, '2016-09-28 14:00:05', '2017-05-09 05:54:45', 0),
(22, 21, '7. Dự phòng phải thu ngắn hạn khó đòi', NULL, 1, 7, 4, 0, '2016-09-28 14:00:12', '2016-09-28 14:00:12', 0),
(23, 22, '1. Hàng tồn kho', '', 1, 8, 4, 2, '2016-09-28 14:00:22', '2017-05-09 05:55:24', 0),
(24, 23, '2. Dự phòng giảm giá hàng tồn kho', NULL, 1, 8, 4, 0, '2016-09-28 14:00:29', '2016-09-28 14:00:29', 0),
(25, 24, '1. Chi phí trả trước ngắn hạn', '', 1, 9, 4, 1, '2016-09-28 14:00:36', '2017-05-08 06:19:21', 0),
(26, 25, '2. Thuế giá trị gia tăng được khấu trừ', NULL, 1, 9, 4, 0, '2016-09-28 14:06:12', '2016-09-28 14:06:12', 0),
(27, 26, '3. Thuế và các khoản phải thu Nhà nước', NULL, 1, 9, 4, 0, '2016-09-28 14:06:18', '2016-09-28 14:06:18', 0),
(28, 27, '4. Giao dịch mua bán lại trái phiếu chính phủ', NULL, 1, 9, 4, 0, '2016-09-28 14:06:27', '2016-09-28 14:06:27', 0),
(29, 28, '5. Tài sản ngắn hạn khác', NULL, 1, 9, 4, 0, '2016-09-28 14:06:34', '2016-09-28 14:06:34', 0),
(30, 29, 'I. Các khoản phải thu dài hạn', NULL, 1, 4, 3, 0, '2016-09-28 14:06:46', '2016-09-28 14:06:46', 0),
(31, 30, '1. Phải thu dài hạn của khách hàng', '', 1, 30, 4, 1, '2016-09-28 14:06:55', '2017-05-08 03:59:08', 0),
(32, 31, '2. Vốn kinh doanh tại các đơn vị trực thuộc', NULL, 1, 30, 4, 0, '2016-09-28 14:07:02', '2016-09-28 14:07:02', 0),
(33, 32, '3. Phải thu dài hạn nội bộ', NULL, 1, 30, 4, 0, '2016-09-28 14:07:08', '2016-09-28 14:07:08', 0),
(34, 33, '4. Phải thu về cho vay dài hạn', NULL, 1, 30, 4, 0, '2016-09-28 14:07:12', '2016-09-28 14:07:12', 0),
(35, 34, '5. Phải thu dài hạn khác', '', 1, 30, 4, 1, '2016-09-28 14:07:23', '2017-05-08 04:12:41', 0),
(36, 35, '6. Dự phòng phải thu dài hạn khó đòi', NULL, 1, 30, 4, 0, '2016-09-28 14:07:29', '2016-09-28 14:07:29', 0),
(37, 36, 'II. Tài sản cố định', '', 1, 4, 3, 0, '2016-09-28 14:07:48', '2017-05-09 08:19:24', 0),
(38, 37, '1. Tài sản cố định hữu hình', '', 1, 37, 4, 0, '2016-09-28 14:08:10', '2017-05-09 06:06:29', 0),
(39, 38, '- Nguyên giá', '', 1, 38, 5, 7, '2016-09-28 14:13:30', '2017-05-18 02:17:30', 0),
(40, 39, '- Giá trị hao mòn lũy kế', '', 1, 38, 5, 6, '2016-09-28 14:57:21', '2017-05-18 02:23:11', 0),
(41, 40, '2. Tài sản cố định thuê tài chính', NULL, 1, 37, 4, 0, '2016-09-28 14:58:21', '2016-10-14 07:54:08', 0),
(42, 41, '- Nguyên giá', NULL, 1, 41, 5, 0, '2016-09-28 14:58:30', '2016-09-28 14:58:30', 0),
(43, 42, '- Giá trị hao mòn lũy kế', NULL, 1, 41, 5, 0, '2016-09-28 14:58:36', '2016-09-28 14:58:36', 0),
(44, 43, 'III. Bất động sản đầu tư', NULL, 1, 4, 3, 0, '2016-09-28 14:58:54', '2016-09-28 14:58:54', 0),
(45, 44, '- Nguyên giá', NULL, 1, 44, 4, 0, '2016-09-28 14:59:03', '2016-09-28 14:59:03', 0),
(46, 45, '- Giá trị hao mòn lũy kế', NULL, 1, 44, 4, 0, '2016-09-28 14:59:11', '2016-09-28 14:59:11', 0),
(47, 46, 'IV. Tài sản dở dang dài hạn', NULL, 1, 4, 3, 0, '2016-09-28 14:59:33', '2016-09-28 14:59:33', 0),
(48, 47, '1. Chi phí sản xuất, kinh doanh dở dang dài hạn', NULL, 1, 47, 4, 0, '2016-09-28 14:59:47', '2016-09-28 14:59:47', 0),
(49, 48, '2. Chi phí xây dựng cơ bản dở dang', '', 1, 47, 4, 1, '2016-09-28 14:59:56', '2017-05-08 04:19:59', 0),
(50, 49, 'V. Các khoản đầu tư tài chính dài hạn', NULL, 1, 4, 3, 0, '2016-09-28 15:00:35', '2016-09-28 15:00:35', 0),
(51, 50, '1. Đầu tư vào công ty con', '', 1, 50, 4, 1, '2016-09-28 15:00:47', '2017-05-08 04:22:03', 0),
(52, 51, '2. Đầu tư vào công ty liên kết, liên doanh', '', 1, 50, 4, 9, '2016-09-28 15:00:54', '2017-05-16 02:33:57', 0),
(53, 52, '3. Đầu tư góp vốn vào đơn vị khác', '', 1, 50, 4, 5, '2016-09-28 15:01:00', '2017-05-11 07:26:47', 0),
(54, 53, '4. Dự phòng giảm giá đầu tư tài chính dài hạn', NULL, 1, 50, 4, 0, '2016-09-28 15:01:08', '2016-09-28 15:01:08', 0),
(55, 54, '5. Đầu tư nắm giữ đến ngày đáo hạn', NULL, 1, 50, 4, 0, '2016-09-28 15:01:15', '2016-09-28 15:01:15', 0),
(56, 55, 'VI. Tổng tài sản dài hạn khác', NULL, 1, 4, 3, 0, '2016-09-28 15:01:30', '2016-09-28 15:01:30', 0),
(57, 56, '1. Chi phí trả trước dài hạn', '', 1, 56, 4, 1, '2016-09-28 15:01:41', '2017-05-08 06:19:35', 0),
(58, 57, '2. Tài sản Thuế thu nhập hoãn lại', NULL, 1, 56, 4, 0, '2016-09-28 15:01:48', '2016-09-28 15:01:48', 0),
(59, 58, '3. Tài sản dài hạn khác', NULL, 1, 56, 4, 0, '2016-09-28 15:01:53', '2016-09-28 15:01:53', 0),
(60, 59, 'VII. Lợi thế thương mại', '', 1, 4, 3, 3, '2016-09-28 15:02:03', '2017-05-11 08:08:59', 0),
(61, 60, 'A. Nợ phải trả', NULL, 1, 2, 2, 0, '2016-09-28 15:02:20', '2016-09-28 15:02:20', 0),
(62, 61, 'I. Nợ ngắn hạn', NULL, 1, 61, 3, 0, '2016-09-28 15:02:30', '2016-09-28 15:02:30', 0),
(63, 62, '1. Vay và nợ thuê tài chính ngắn hạn', '', 1, 62, 4, 7, '2016-09-28 15:02:40', '2017-05-18 03:12:51', 0),
(64, 63, '2. Vay và nợ dài hạn đến hạn phải trả', NULL, 1, 62, 4, 0, '2016-09-28 15:02:45', '2016-09-28 15:02:45', 0),
(65, 64, '3. Phải trả người bán ngắn hạn', '', 1, 62, 4, 2, '2016-09-28 15:02:50', '2017-05-09 06:35:10', 0),
(66, 65, '4. Người mua trả tiền trước', '', 1, 62, 4, 1, '2016-09-28 15:02:56', '2017-05-08 06:50:50', 0),
(67, 66, '5. Thuế và các khoản phải nộp nhà nước', '', 1, 62, 4, 4, '2016-09-28 15:03:02', '2017-05-09 06:37:28', 0),
(68, 67, '6. Phải trả người lao động', NULL, 1, 62, 4, 0, '2016-09-28 15:03:09', '2016-09-28 15:03:09', 0),
(69, 68, '7. Chi phí phải trả ngắn hạn', '', 1, 62, 4, 1, '2016-09-28 15:03:14', '2017-05-16 04:03:10', 0),
(70, 69, '8. Phải trả nội bộ ngắn hạn', NULL, 1, 62, 4, 0, '2016-09-28 15:03:20', '2016-09-28 15:03:20', 0),
(71, 70, '9. Phải trả theo tiến độ kế hoạch hợp đồng xây dựng', NULL, 1, 62, 4, 0, '2016-09-28 15:03:27', '2016-09-28 15:03:27', 0),
(72, 71, '10. Doanh thu chưa thực hiện ngắn hạn', NULL, 1, 62, 4, 0, '2016-09-28 15:03:32', '2016-09-28 15:03:32', 0),
(73, 72, '11. Phải trả ngắn hạn khác', '', 1, 62, 4, 1, '2016-09-28 15:03:38', '2017-05-09 06:38:08', 0),
(74, 73, '12. Dự phòng phải trả ngắn hạn', NULL, 1, 62, 4, 0, '2016-09-28 15:03:43', '2016-09-28 15:03:43', 0),
(75, 74, '13. Quỹ khen thưởng phúc lợi', NULL, 1, 62, 4, 0, '2016-09-28 15:03:48', '2016-09-28 15:03:48', 0),
(76, 75, '14. Quỹ bình ổn giá', NULL, 1, 62, 4, 0, '2016-09-28 15:03:54', '2016-09-28 15:03:54', 0),
(77, 76, '15. Giao dịch mua bán lại trái phiếu chính phủ', NULL, 1, 62, 4, 0, '2016-09-28 15:03:59', '2016-09-28 15:03:59', 0),
(78, 77, 'II. Nợ dài hạn', NULL, 1, 61, 3, 0, '2016-09-28 15:04:23', '2016-09-28 15:04:23', 0),
(79, 78, '1. Phải trả người bán dài hạn', NULL, 1, 78, 4, 0, '2016-09-28 15:04:32', '2016-09-28 15:04:32', 0),
(80, 79, '2. Chi phí phải trả dài hạn', NULL, 1, 78, 4, 0, '2016-09-28 15:04:37', '2016-09-28 15:04:37', 0),
(81, 80, '3. Phải trả nội bộ về vốn kinh doanh', NULL, 1, 78, 4, 0, '2016-09-28 15:04:43', '2016-09-28 15:04:43', 0),
(82, 81, '4. Phải trả nội bộ dài hạn', NULL, 1, 78, 4, 0, '2016-09-28 15:04:50', '2016-09-28 15:04:50', 0),
(83, 82, '5. Phải trả dài hạn khác', NULL, 1, 78, 4, 0, '2016-09-28 15:04:55', '2016-09-28 15:04:55', 0),
(84, 83, '6. Vay và nợ thuê tài chính dài hạn', '', 1, 78, 4, 6, '2016-09-28 15:05:01', '2017-05-09 06:42:54', 0),
(85, 84, '7. Trái phiếu chuyển đổi', NULL, 1, 78, 4, 0, '2016-09-28 15:05:06', '2016-09-28 15:05:06', 0),
(86, 85, '8. Thuế thu nhập hoãn lại phải trả', NULL, 1, 78, 4, 0, '2016-09-28 15:05:12', '2016-09-28 15:05:12', 0),
(87, 86, '9. Dự phòng trợ cấp mất việc làm', NULL, 1, 78, 4, 0, '2016-09-28 15:05:17', '2016-09-28 15:05:17', 0),
(88, 87, '10. Dự phòng phải trả dài hạn', NULL, 1, 78, 4, 0, '2016-09-28 15:05:22', '2016-09-28 15:05:22', 0),
(89, 88, '11. Doanh thu chưa thực hiện dài hạn', NULL, 1, 78, 4, 0, '2016-09-28 15:05:28', '2016-09-28 15:05:28', 0),
(90, 89, '12. Quỹ phát triển khoa học và công nghệ', NULL, 1, 78, 4, 0, '2016-09-28 15:05:33', '2016-09-28 15:05:33', 0),
(91, 90, 'B. Nguồn vốn chủ sở hữu', NULL, 1, 2, 2, 0, '2016-09-28 15:05:51', '2016-09-28 15:05:51', 0),
(92, 91, 'I. Vốn chủ sở hữu', '', 1, 91, 3, 8, '2016-09-28 15:05:59', '2017-05-16 04:13:11', 0),
(93, 92, '1. Vốn đầu tư của chủ sở hữu', NULL, 1, 92, 4, 0, '2016-09-28 15:06:06', '2016-09-28 15:06:06', 0),
(94, 93, 'II. Nguồn kinh phí và quỹ khác', NULL, 1, 91, 3, 0, '2016-09-28 15:06:12', '2016-09-28 15:06:30', 0),
(95, 94, '2. Thặng dư vốn cổ phần', NULL, 1, 92, 4, 0, '2016-09-28 15:06:37', '2016-09-28 15:06:37', 0),
(96, 95, '3. Quyền chọn chuyển đổi trái phiếu', NULL, 1, 92, 4, 0, '2016-09-28 15:06:43', '2016-09-28 15:06:43', 0),
(97, 96, '4. Vốn khác của chủ sở hữu', NULL, 1, 92, 4, 0, '2016-09-28 15:06:51', '2016-09-28 15:06:51', 0),
(98, 97, '5. Cổ phiếu quỹ', NULL, 1, 92, 4, 0, '2016-09-28 15:06:59', '2016-09-28 15:06:59', 0),
(99, 98, '6. Chênh lệch đánh giá lại tài sản', NULL, 1, 92, 4, 0, '2016-09-28 15:07:06', '2016-09-28 15:07:06', 0),
(100, 99, '7. Chênh lệch tỷ giá hối đoái', NULL, 1, 92, 4, 0, '2016-09-28 15:07:11', '2016-09-28 15:07:22', 0),
(101, 100, '8. Quỹ đầu tư phát triển', NULL, 1, 92, 4, 0, '2016-09-28 15:07:28', '2016-09-28 15:07:28', 0),
(102, 101, '9. Quỹ dự phòng tài chính', NULL, 1, 92, 4, 0, '2016-09-28 15:07:33', '2016-09-28 15:07:33', 0),
(103, 102, '10. Quỹ khác thuộc vốn chủ sở hữu', NULL, 1, 92, 4, 0, '2016-09-28 15:07:40', '2016-09-28 15:07:40', 0),
(104, 103, '11. Lợi nhuận sau thuế chưa phân phối', NULL, 1, 92, 4, 0, '2016-09-28 15:07:48', '2016-09-28 15:07:48', 0),
(105, 104, '- LNST chưa phân phối lũy kế đến cuối kỳ trước', NULL, 1, 104, 5, 0, '2016-09-28 15:08:01', '2016-09-28 15:08:01', 0),
(106, 105, '- LNST chưa phân phối kỳ này', NULL, 1, 104, 5, 0, '2016-09-28 15:08:11', '2016-09-28 15:08:11', 0),
(107, 106, '12. Nguồn vốn đầu tư xây dựng cơ bản', NULL, 1, 92, 4, 0, '2016-09-28 15:08:27', '2016-09-28 15:08:27', 0),
(108, 107, '13. Quỹ hỗ trợ sắp xếp doanh nghiệp', NULL, 1, 92, 4, 0, '2016-09-28 15:08:33', '2016-09-28 15:08:33', 0),
(109, 108, '14. Lợi ích của cổ đông không kiểm soát', '', 1, 92, 4, 5, '2016-09-28 15:08:40', '2017-05-09 06:58:54', 0),
(110, 109, '1. Nguồn kinh phí', NULL, 1, 94, 4, 0, '2016-09-28 15:08:48', '2016-09-28 15:08:48', 0),
(111, 110, '2. Nguồn kinh phí đã hình thành tài sản cố định', NULL, 1, 94, 4, 0, '2016-09-28 15:08:56', '2016-09-28 15:08:56', 0),
(112, 111, '3. Quỹ dự phòng trợ cấp mất việc làm', NULL, 1, 94, 4, 0, '2016-09-28 15:09:01', '2016-09-28 15:09:01', 0),
(188, 112, '3. Tài sản cố định vô hình', '', 1, 37, 4, 0, '2016-10-14 07:54:18', '2017-05-09 08:19:34', 0),
(189, 113, '- Nguyên giá', '', 1, 188, 5, 6, '2016-10-14 07:54:29', '2017-05-18 02:27:51', 0),
(190, 114, '- Giá trị hao mòn lũy kế', '', 1, 188, 5, 6, '2016-10-14 07:54:37', '2017-05-18 02:28:06', 0),
(220, 115, '6. Đầu tư dài hạn khác', '', 1, 50, 4, 3, '2016-12-21 07:30:20', '2017-05-11 07:54:48', 0),
(113, 1, '1. Tổng doanh thu hoạt động kinh doanh', '', 2, 0, 1, 1, '2016-09-28 15:19:48', '2017-05-08 07:26:11', 0),
(114, 2, '2. Các khoản giảm trừ doanh thu', NULL, 2, 0, 1, 0, '2016-09-28 15:19:55', '2016-09-28 15:19:55', 0),
(115, 3, '3. Doanh thu thuần (1)-(2)', '', 2, 0, 1, 1, '2016-09-28 15:20:43', '2017-05-08 07:26:30', 0),
(116, 4, '4. Giá vốn hàng bán', '', 2, 0, 1, 1, '2016-09-28 15:20:48', '2017-05-08 07:26:50', 0),
(117, 5, '5. Lợi nhuận gộp (3)-(4)', NULL, 2, 0, 1, 0, '2016-09-28 15:20:56', '2016-09-28 15:20:56', 0),
(118, 6, '6. Doanh thu hoạt động tài chính', '', 2, 0, 1, 1, '2016-09-28 15:21:04', '2017-05-08 07:26:39', 0),
(119, 7, '7. Chi phí tài chính', '', 2, 0, 1, 1, '2016-09-28 15:21:09', '2017-05-08 07:26:58', 0),
(120, 8, '-Trong đó: Chi phí lãi vay', NULL, 2, 119, 2, 0, '2016-09-28 15:21:15', '2016-09-28 15:21:15', 0),
(121, 9, '8. Phần lợi nhuận hoặc lỗ trong công ty liên kết liên doanh', NULL, 2, 0, 1, 0, '2016-09-28 15:21:22', '2016-09-28 15:21:22', 0),
(122, 10, '9. Chi phí bán hàng', '', 2, 0, 1, 1, '2016-09-28 15:21:32', '2017-05-08 07:27:12', 0),
(123, 11, '10. Chi phí quản lý doanh nghiệp', '', 2, 0, 1, 1, '2016-09-28 15:21:41', '2017-05-08 07:27:16', 0),
(124, 12, '11. Lợi nhuận thuần từ hoạt động kinh doanh (5)+(6)-(7)+(8)-(9)-(10)', NULL, 2, 0, 1, 0, '2016-09-28 15:22:17', '2016-09-28 15:22:17', 0),
(125, 13, '12. Thu nhập khác', '', 2, 0, 1, 1, '2016-09-28 15:22:23', '2017-05-08 07:27:24', 0),
(126, 14, '13. Chi phí khác', '', 2, 0, 1, 1, '2016-09-28 15:22:31', '2017-05-08 07:27:27', 0),
(127, 15, '14. Lợi nhuận khác (12)-(13)', NULL, 2, 0, 1, 0, '2016-09-28 15:22:36', '2016-09-28 15:22:36', 0),
(128, 16, '15. Tổng lợi nhuận kế toán trước thuế (11)+(14)', NULL, 2, 0, 1, 0, '2016-09-28 15:25:00', '2016-09-28 15:25:00', 0),
(129, 17, '16. Chi phí thuế TNDN hiện hành', '', 2, 0, 1, 1, '2016-09-28 15:25:14', '2017-05-09 07:52:06', 0),
(130, 18, '17. Chi phí thuế TNDN hoãn lại', '', 2, 0, 1, 2, '2016-09-28 15:25:19', '2017-05-09 07:55:21', 0),
(131, 19, '18. Chi phí thuế TNDN (16)+(17)', NULL, 2, 0, 1, 0, '2016-09-28 15:25:28', '2016-09-28 15:25:28', 0),
(132, 20, '19. Lợi nhuận sau thuế thu nhập doanh nghiệp (15)-(18)', NULL, 2, 0, 1, 0, '2016-09-28 15:25:35', '2016-09-28 15:25:35', 0),
(133, 21, '20. Lợi nhuận sau thuế của cổ đông không kiểm soát', NULL, 2, 0, 1, 0, '2016-09-28 15:25:40', '2016-09-28 15:25:40', 0),
(134, 22, '21. Lợi nhuận sau thuế của cổ đông của công ty mẹ (19)-(20)', NULL, 2, 0, 1, 0, '2016-09-28 15:25:47', '2016-09-28 15:25:47', 0),
(135, 1, 'I. Lưu chuyển tiền từ hoạt động kinh doanh', NULL, 3, 0, 1, 0, '2016-09-28 15:26:56', '2016-09-28 15:26:56', 0),
(136, 2, '1. Lợi nhuận trước thuế', NULL, 3, 135, 2, 0, '2016-09-28 15:27:03', '2016-09-28 15:27:03', 0),
(137, 3, '2. Điều chỉnh cho các khoản', NULL, 3, 135, 2, 0, '2016-09-28 15:27:10', '2016-09-28 15:27:10', 0),
(138, 4, '- Khấu hao TSCĐ', NULL, 3, 137, 3, 0, '2016-09-28 15:27:17', '2016-09-28 15:27:17', 0),
(139, 5, '- Các khoản dự phòng', NULL, 3, 137, 3, 0, '2016-09-28 15:27:22', '2016-09-28 15:27:22', 0),
(140, 6, '- Lợi nhuận thuần từ đầu tư vào công ty liên kết', NULL, 3, 137, 3, 0, '2016-09-28 15:27:27', '2016-09-28 15:27:27', 0),
(141, 7, '- Xóa sổ tài sản cố định (thuần)', NULL, 3, 137, 3, 0, '2016-09-28 15:27:32', '2016-09-28 15:27:32', 0),
(142, 8, '- (Lãi) lỗ chênh lệch tỷ giá hối đoái chưa thực hiện', '', 3, 137, 3, 0, '2016-09-28 15:27:39', '2017-02-27 07:08:42', 0),
(143, 9, '- (Lãi) lỗ từ thanh lý TSCĐ', '', 3, 137, 3, 0, '2016-09-28 15:27:44', '2017-02-27 07:09:03', 0),
(144, 10, '- (Lãi) lỗ từ hoạt động đầu tư', '', 3, 137, 3, 0, '2016-09-28 15:27:52', '2017-02-27 07:09:20', 0),
(145, 11, '- Lãi tiền gửi', NULL, 3, 137, 3, 0, '2016-09-28 15:28:08', '2016-09-28 15:28:08', 0),
(146, 12, '- Thu nhập lãi', NULL, 3, 137, 3, 0, '2016-09-28 15:28:13', '2016-09-28 15:28:13', 0),
(147, 13, '- Chi phí lãi vay', NULL, 3, 137, 3, 0, '2016-09-28 15:28:18', '2016-09-28 15:28:18', 0),
(148, 14, '- Các khoản chi trực tiếp từ lợi nhuận', NULL, 3, 137, 3, 0, '2016-09-28 15:28:24', '2016-09-28 15:28:24', 0),
(149, 15, '3. Lợi nhuận từ hoạt động kinh doanh trước thay đổi vốn lưu động', NULL, 3, 135, 2, 0, '2016-09-28 15:28:44', '2016-09-28 15:28:44', 0),
(150, 16, '- (Tăng) giảm các khoản phải thu', '', 3, 149, 3, 0, '2016-09-28 15:28:56', '2017-02-27 07:04:44', 0),
(151, 17, '- (Tăng) giảm hàng tồn kho', '', 3, 149, 3, 0, '2016-09-28 15:29:02', '2017-02-27 07:04:55', 0),
(152, 18, '- Tăng (giảm) các khoản phải trả (Không kể lãi vay phải trả, thuế thu nhập doanh nghiệp phải nộp)', '', 3, 149, 3, 0, '2016-09-28 15:29:08', '2017-02-27 07:05:07', 0),
(153, 19, '- (Tăng) giảm chi phí trả trước', '', 3, 149, 3, 0, '2016-09-28 15:29:15', '2017-02-27 07:05:21', 0),
(154, 20, '- Tăng (giảm) tài sản ngắn hạn khác', '', 3, 149, 3, 0, '2016-09-28 15:29:21', '2017-02-27 07:08:23', 0),
(155, 21, '- Tiền lãi vay phải trả', NULL, 3, 149, 3, 0, '2016-09-28 15:29:28', '2016-09-28 15:29:28', 0),
(156, 22, '- Thuế thu nhập doanh nghiệp đã nộp', NULL, 3, 149, 3, 0, '2016-09-28 15:29:33', '2016-09-28 15:29:33', 0),
(157, 23, '- Tiền thu khác từ hoạt động kinh doanh', NULL, 3, 149, 3, 0, '2016-09-28 15:29:40', '2016-09-28 15:29:40', 0),
(158, 24, '- Tiền chi khác từ hoạt động kinh doanh', NULL, 3, 149, 3, 0, '2016-09-28 15:29:47', '2016-09-28 15:29:47', 0),
(159, 25, 'II. Lưu chuyển tiền từ hoạt động đầu tư', NULL, 3, 0, 1, 0, '2016-09-28 15:30:02', '2016-09-28 15:30:02', 0),
(160, 26, '1. Tiền chi để mua sắm, xây dựng TSCĐ và các tài sản dài hạn khác', NULL, 3, 159, 2, 0, '2016-09-28 15:30:19', '2016-09-28 15:30:19', 0),
(162, 27, '2. Tiền thu từ thanh lý, nhượng bán TSCĐ và các tài sản dài hạn khác', NULL, 3, 159, 2, 0, '2016-09-28 15:30:42', '2016-09-28 15:30:42', 0),
(163, 28, '3. Tiền chi cho vay, mua các công cụ nợ của đơn vị khác', NULL, 3, 159, 2, 0, '2016-09-28 15:30:47', '2016-09-28 15:30:47', 0),
(164, 29, '4. Tiền thu hồi cho vay, bán lại các công cụ nợ của các đơn vị khác', NULL, 3, 159, 2, 0, '2016-09-28 15:30:53', '2016-09-28 15:30:53', 0),
(165, 30, '5. Đầu tư góp vốn vào công ty liên doanh liên kết', NULL, 3, 159, 2, 0, '2016-09-28 15:30:59', '2016-09-28 15:30:59', 0),
(166, 31, '6. Chi đầu tư ngắn hạn', NULL, 3, 159, 2, 0, '2016-09-28 15:31:04', '2016-09-28 15:31:04', 0),
(167, 32, '7. Tiền chi đầu tư góp vốn vào đơn vị khác', NULL, 3, 159, 2, 0, '2016-09-28 15:31:13', '2016-09-28 15:31:13', 0),
(168, 33, '8. Tiền thu hồi đầu tư góp vốn vào đơn vị khác', NULL, 3, 159, 2, 0, '2016-09-28 15:31:22', '2016-09-28 15:31:22', 0),
(169, 34, '9. Lãi tiền gửi đã thu', NULL, 3, 159, 2, 0, '2016-09-28 15:31:27', '2016-09-28 15:31:27', 0),
(170, 35, '10. Tiền thu lãi cho vay, cổ tức và lợi nhuận được chia', NULL, 3, 159, 2, 0, '2016-09-28 15:31:33', '2016-09-28 15:31:33', 0),
(171, 36, '11. Tiền chi mua lại phần vốn góp của các cổ đông thiểu số', NULL, 3, 159, 2, 0, '2016-09-28 15:31:40', '2016-09-28 15:31:40', 0),
(172, 37, 'III. Lưu chuyển tiền từ hoạt động tài chính', NULL, 3, 0, 1, 0, '2016-09-28 15:31:54', '2016-09-28 15:31:54', 0),
(173, 38, '1. Tiền thu từ phát hành cổ phiếu, nhận vốn góp của chủ sở hữu', NULL, 3, 172, 2, 0, '2016-09-28 15:32:03', '2016-09-28 15:32:03', 0),
(174, 39, '2. Tiền chi trả vốn góp cho các chủ sở hữu, mua lại cổ phiếu của doanh nghiệp đã phát hành', NULL, 3, 172, 2, 0, '2016-09-28 15:32:09', '2016-09-28 15:32:09', 0),
(175, 40, '3. Tiền vay ngắn hạn, dài hạn nhận được', NULL, 3, 172, 2, 0, '2016-09-28 15:32:15', '2016-09-28 15:32:15', 0),
(176, 41, '4. Tiền chi trả nợ gốc vay', NULL, 3, 172, 2, 0, '2016-09-28 15:32:21', '2016-09-28 15:32:21', 0),
(177, 42, '5. Tiền chi trả nợ thuê tài chính', NULL, 3, 172, 2, 0, '2016-09-28 15:32:25', '2016-09-28 15:32:25', 0),
(178, 43, '6. Tiền chi khác từ hoạt động tài chính', NULL, 3, 172, 2, 0, '2016-09-28 15:32:30', '2016-09-28 15:32:30', 0),
(179, 44, '7. Tiền chi trả từ cổ phần hóa', NULL, 3, 172, 2, 0, '2016-09-28 15:32:34', '2016-09-28 15:32:34', 0),
(180, 45, '8. Cổ tức, lợi nhuận đã trả cho chủ sở hữu', NULL, 3, 172, 2, 0, '2016-09-28 15:32:38', '2016-09-28 15:32:38', 0),
(181, 46, '9. Vốn góp của các cổ đông thiểu số vào các công ty con', NULL, 3, 172, 2, 0, '2016-09-28 15:32:45', '2016-09-28 15:32:45', 0),
(182, 47, '10. Chi tiêu quỹ phúc lợi xã hội', NULL, 3, 172, 2, 0, '2016-09-28 15:32:49', '2016-09-28 15:32:49', 0),
(184, 48, 'Lưu chuyển tiền thuần trong kỳ', NULL, 3, 0, 1, 0, '2016-09-28 15:33:14', '2016-09-28 15:33:14', 0),
(185, 49, 'Tiền và tương đương tiền đầu kỳ', NULL, 3, 0, 1, 0, '2016-09-28 15:33:23', '2016-09-28 15:33:23', 0),
(186, 50, 'Ảnh hưởng của thay đổi tỷ giá hối đoái quy đổi ngoại tệ', NULL, 3, 0, 1, 0, '2016-09-28 15:33:30', '2016-09-28 15:33:30', 0),
(187, 51, 'Tiền và tương đương tiền cuối kỳ', NULL, 3, 0, 1, 0, '2016-09-28 15:33:35', '2016-09-28 15:33:35', 0),
(191, 1, 'Nhóm chỉ số Định giá', '', 4, 0, 1, 0, '2016-11-02 07:45:05', '2017-02-28 08:06:55', 0),
(192, 2, 'ROIC (%)', 'Return on investment capital = EBIT x (1 - thuế xuất) / (Tổng tài sản - tổng nợ ngắn hạn)', 4, 191, 2, 0, '2016-11-02 07:46:31', '2017-08-14 04:07:55', 0),
(193, 3, 'Tăng trưởng doanh thu (%)', 'Tốc độ tăng trưởng doanh thu qua từng năm', 4, 191, 2, 0, '2016-11-02 08:05:30', '2017-08-14 03:25:31', 0),
(194, 4, 'Tăng trưởng EPS (%)', 'Tốc độ tăng trưởng EPS qua từng năm', 4, 191, 2, 0, '2016-11-02 08:05:48', '2017-08-14 03:26:27', 0),
(195, 5, 'Tăng trưởng vốn (%)', 'Tốc độ tăng trưởng vốn', 4, 191, 2, 0, '2016-11-02 08:06:35', '2017-08-14 03:27:21', 0),
(196, 6, 'EPS', 'Lợi nhuận trên mỗi cổ phiếu', 4, 191, 2, 0, '2016-11-02 08:06:44', '2016-11-02 08:06:44', 0),
(197, 7, 'Nhóm chỉ số Thanh khoản và Đòn bẩy tài chính', '', 4, 0, 1, 0, '2016-11-02 08:06:59', '2017-02-28 08:10:07', 0),
(198, 8, 'Thanh toán nhanh', 'Hệ số khả năng thanh toán nhanh= (Tiền và tương đương tiền + Các khoản đầu tư tài chính ngắn hạn):  nợ ngắn hạn', 4, 197, 2, 0, '2016-11-02 08:07:16', '2017-03-03 07:22:57', 0),
(199, 9, 'Thanh toán hiện hành', 'Hệ số khả năng thanh toán hiện hành= tài sản lưu động và đầu tư ngắn hạn : nợ ngắn hạn.', 4, 197, 2, 0, '2016-11-02 08:07:28', '2016-12-12 03:46:17', 0),
(200, 10, 'Tổng nợ/Vốn CSH (%)', 'Hệ số tổng nợ trên vốn chủ sở hữu', 4, 197, 2, 0, '2016-11-02 08:07:41', '2016-11-16 09:20:53', 0),
(201, 11, 'Tổng nợ/Tổng tài sản (%)', 'Hệ số tổng nợ trên tổng tài sản', 4, 197, 2, 0, '2016-11-02 08:07:51', '2016-11-16 09:21:00', 0),
(202, 12, 'Nhóm chỉ số Hiệu quả hoạt động', '', 4, 0, 1, 0, '2016-11-02 08:10:44', '2017-02-28 08:07:25', 0),
(203, 13, 'Vòng quay tổng tài sản', 'Hệ số vòng quay tổng tài sản =doanh thu thuần : tổng tài sản bình quân', 4, 202, 2, 0, '2016-11-02 08:10:56', '2016-12-12 03:46:45', 0),
(204, 14, 'Vòng quay hàng tồn kho', 'Hệ số vòng quay hàng tồn kho = giá vốn hàng bán : bình quân hàng tồn kho', 4, 202, 2, 0, '2016-11-02 08:11:06', '2016-12-12 03:47:02', 0),
(205, 15, 'Vòng quay các khoản phải thu', 'Hệ số vòng quay các khoản phải thu =  doanh thu thuần : bình quân các khoản phải thu', 4, 202, 2, 0, '2016-11-02 08:11:17', '2017-02-28 08:58:00', 0),
(206, 16, 'KHẢ NĂNG SINH LỜI', '', 4, 0, 1, 0, '2016-11-02 08:11:39', '2016-11-02 08:14:15', 0),
(207, 17, 'Tỷ lệ lãi gộp GOS (%)', 'Hệ số biên lợi nhuận gộp = lợi nhuận gộp : doanh thu.', 4, 206, 2, 0, '2016-11-02 08:12:05', '2016-12-13 03:53:00', 0),
(208, 18, 'Tỷ lệ EBIT (%)', 'Hệ số biên lợi nhuận hoạt động = lợi nhuận trước thuế và lãi vay : doanh thu', 4, 206, 2, 0, '2016-11-02 08:12:15', '2016-12-12 03:48:03', 0),
(209, 19, 'Tỷ lệ EBITDA (%)', 'Tỷ lệ EBITDA = (Lợi nhuận trước thuế + lãi vay + khấu hao) : doanh thu', 4, 206, 2, 0, '2016-11-02 08:12:27', '2016-12-12 03:48:27', 0),
(210, 20, 'HIỆU QUẢ QUẢN LÝ', '', 4, 0, 1, 0, '2016-11-02 08:12:51', '2016-11-02 08:14:27', 0),
(211, 21, 'ROA (%)', 'ROA thể hiện tương quan giữa mức sinh lợi của một công ty so với tài sản của nó. ROA = Net income  : Avg. Total Asset', 4, 210, 2, 0, '2016-11-02 08:12:57', '2017-02-28 07:28:01', 0),
(212, 22, 'ROE (%)', 'ROE thể hiện tương quan giữa mức sinh lợi của một công ty so với vốn chủ sở hữu của nó. ROE = Net Income / Avg. Stockholder\s Equity', 4, 210, 2, 0, '2016-11-02 08:13:08', '2017-02-28 06:24:00', 0),
(213, 23, 'ROS (%)', 'Hệ số lợi nhuận trên doanh thu thuần ROS=Net Income  /  Sales', 4, 210, 2, 0, '2016-11-02 08:13:19', '2017-02-28 07:28:16', 0),
(216, 24, 'Book value (BVPS)', 'Giá trị sổ sách/cổ phiếu= (Vốn chủ sở hữu - TSVH) : số lượng cổ phiếu lưu hành', 4, 191, 2, 0, '2016-11-25 07:42:51', '2017-08-14 03:31:57', 0),
(214, 25, 'Tỷ lệ lãi ròng (%)', 'Tỷ lệ lãi ròng = lợi nhuận sau thuế : doanh thu.', 4, 206, 2, 0, '2016-11-02 08:45:58', '2016-12-12 03:48:46', 0),
(217, 26, 'Tăng trưởng Free Cash Flow (%)', 'Tốc độ tăng trưởng Free Cash Flow', 4, 191, 2, 0, '2016-11-25 08:11:30', '2017-08-14 03:32:27', 0),
(218, 27, 'Thanh toán bằng tiền mặt', 'Được tính bằng = (Tiền và các khoản tương đương tiền) : nợ ngắn hạn', 4, 197, 2, 0, '2016-11-25 08:19:06', '2016-11-25 08:19:06', 0),
(219, 28, 'Khả năng thanh toán lãi vay', 'Được tính bằng = Lãi trước thuế và lãi vay : lãi vay', 4, 197, 2, 0, '2016-11-25 08:22:46', '2016-11-25 08:22:46', 0),
(221, 29, 'Vòng quay các khoản phải trả', '(Hàng tồn kho cuối kỳ - hàng tồn kho đầu kỳ + giá vốn hàng hóa)/bình quân các khoản phải trả', 4, 202, 2, 0, '2017-02-28 08:33:28', '2017-02-28 09:03:52', 0),
(222, 30, 'Thời gian hàng tồn kho', '365/vòng quay hàng tồn kho', 4, 202, 2, 0, '2017-02-28 08:38:10', '2017-02-28 08:38:10', 0),
(223, 31, 'Thời gian các khoản phải thu', '365/vòng quay các khoản phải thu', 4, 202, 2, 0, '2017-02-28 08:38:41', '2017-02-28 08:38:41', 0),
(224, 32, 'Thời gian phải trả cho nhà cung cấp', '365/vòng quay các khoản phải trả', 4, 202, 2, 0, '2017-02-28 08:39:29', '2017-02-28 08:39:29', 0),
(225, 33, 'Net trade cycle', 'thời gian tồn kho + thời gian thu tiền - thời gian trả tiền', 4, 202, 2, 0, '2017-02-28 08:40:28', '2017-02-28 08:40:28', 0),
(226, 34, 'Đòn bẩy tài chính', '= tổng tài sản bình quân / Vốn chủ sở hữu bình quân', 4, 197, 2, 0, '2017-02-28 08:43:29', '2017-02-28 08:43:29', 0),
(231, 2, '1. Tiền thu từ bán hàng, cung cấp dịch vụ và doanh thu khác', '', 5, 230, 2, 0, '2017-04-04 08:22:29', '2017-04-04 08:22:29', 0),
(230, 1, 'I. Lưu chuyển tiền từ hoạt động kinh doanh', '', 5, 0, 1, 0, '2017-04-04 08:22:17', '2017-04-04 08:22:17', 0),
(229, 35, 'Vòng quay tổng tài sản cố định', 'Doanh thu thuần /  Tổng TSCĐ bình quân', 4, 202, 2, 0, '2017-03-01 03:19:41', '2017-03-03 03:59:28', 0),
(232, 3, '2. Tiền chi trả cho người cung cấp hàng hóa và dịch vụ', '', 5, 230, 2, 0, '2017-04-04 08:41:16', '2017-04-04 08:41:16', 0),
(233, 4, '3. Tiền chi trả cho người lao động', '', 5, 230, 2, 0, '2017-04-04 08:41:29', '2017-04-04 08:41:29', 0),
(234, 5, 'II. LƯU CHUYỂN TIỀN TỪ HOẠT ĐỘNG ĐẦU TƯ', '', 5, 0, 1, 0, '2017-04-04 08:41:34', '2017-04-04 08:42:11', 0),
(235, 6, '4. Tiền chi trả lãi vay', '', 5, 230, 2, 0, '2017-04-04 08:42:19', '2017-04-04 08:42:19', 0),
(236, 7, '5. Tiền chi nộp thuế thu nhập doanh nghiệp', '', 5, 230, 2, 0, '2017-04-04 08:42:24', '2017-04-04 08:42:24', 0),
(237, 8, '6. Tiền thu khác từ hoạt động kinh doanh', '', 5, 230, 2, 0, '2017-04-04 08:42:29', '2017-04-04 08:42:29', 0),
(238, 9, '7. Tiền chi khác cho hoạt động kinh doanh', '', 5, 230, 2, 0, '2017-04-04 08:42:34', '2017-04-04 08:42:34', 0),
(239, 10, '1. Tiền chi để mua sắm, xây dựng tài sản cố định', '', 5, 234, 2, 0, '2017-04-04 08:42:44', '2017-04-04 08:43:26', 0),
(240, 11, '2. Tiền thu do thanh lý, nhượng bán TSCĐ và các tài sản dài hạn khác', '', 5, 234, 2, 0, '2017-04-04 08:42:50', '2017-04-04 08:43:31', 0),
(241, 12, '3. Tiền chi cho vay, mua các công cụ nợ của đơn vị khác', '', 5, 234, 2, 0, '2017-04-04 08:42:54', '2017-04-04 08:43:37', 0),
(242, 13, '4. Tiền thu hồi cho vay, bán lại công cụ nợ của đơn vị khác', '', 5, 234, 2, 0, '2017-04-04 08:42:58', '2017-04-04 08:43:41', 0),
(243, 14, '5. Tiền chi đầu tư góp vốn vào đơn vị khác', '', 5, 234, 2, 0, '2017-04-04 08:43:02', '2017-04-04 08:43:45', 0),
(244, 15, '6. Tiền thu do bán các khoản đầu tư góp vốn vào đơn vị khác', '', 5, 234, 2, 0, '2017-04-04 08:43:08', '2017-04-04 08:43:49', 0),
(245, 16, '7. Tiền thu lãi cho vay, cổ tức và lợi nhuận được chia', '', 5, 234, 2, 0, '2017-04-04 08:43:15', '2017-04-04 08:43:54', 0),
(246, 17, '8. Tiền đầu tư xây dựng nhà xưởng', '', 5, 234, 2, 0, '2017-04-04 08:44:30', '2017-04-04 08:45:06', 0),
(247, 18, '9. Tăng lợi ích của cổ đông thiếu số khi hợp nhất công ty con', '', 5, 234, 2, 0, '2017-04-04 08:44:46', '2017-04-04 08:45:15', 0),
(248, 19, '10. Loại trừ lợi ích của cổ đông thiểu số khi thanh lý công ty con', '', 5, 234, 2, 0, '2017-04-04 08:44:56', '2017-04-04 08:44:56', 0),
(249, 20, '11. Tiền mặt tại công ty con mua trong năm', '', 5, 234, 2, 0, '2017-04-04 08:45:27', '2017-04-04 08:45:27', 0),
(250, 21, '12. Tiền thu do nhượng bán các khoản đầu tư vào công ty con', '', 5, 234, 2, 0, '2017-04-04 08:45:33', '2017-04-04 08:45:33', 0),
(251, 22, '13. Tiền chi gửi ngắn hạn', '', 5, 234, 2, 0, '2017-04-04 08:45:37', '2017-04-04 08:45:37', 0),
(252, 23, '14. Tiền thu lãi từ gửi ngắn hạn', '', 5, 234, 2, 0, '2017-04-04 08:45:42', '2017-04-04 08:45:42', 0),
(253, 24, '15. Tiền chi mua tài sản khác', '', 5, 234, 2, 0, '2017-04-04 08:45:46', '2017-04-04 08:45:46', 0),
(254, 25, '16. Tiền chi để mua thêm cổ phần của công ty con', '', 5, 234, 2, 0, '2017-04-04 08:45:55', '2017-04-04 08:45:55', 0),
(255, 26, '17. Giảm tiền gửi ngân hàng có kỳ hạn', '', 5, 234, 2, 0, '2017-04-04 08:46:01', '2017-04-04 08:46:01', 0),
(256, 27, '18. Tiền thu từ các khoản ký gửi, ký quỹ dài hạn', '', 5, 234, 2, 0, '2017-04-04 08:46:05', '2017-04-04 08:46:05', 0),
(257, 28, '19. Tiền gửi ngắn hạn', '', 5, 234, 2, 0, '2017-04-04 08:46:10', '2017-04-04 08:46:10', 0),
(258, 29, '20. Rút tiền gửi ngắn hạn', '', 5, 234, 2, 0, '2017-04-04 08:46:14', '2017-04-04 08:46:14', 0),
(259, 30, '21. Tiền thu từ chuyển quyền góp vốn vào dự án', '', 5, 234, 2, 0, '2017-04-04 08:46:18', '2017-04-04 08:46:18', 0),
(260, 31, 'III. LƯU CHUYỂN TIỀN TỪ HOẠT ĐỘNG TÀI CHÍNH', '', 5, 0, 1, 0, '2017-04-04 08:46:30', '2017-04-04 08:46:30', 0),
(261, 32, 'Tiền thu từ phát hành cổ phiếu, nhận góp vốn của chủ sở hữu', '', 5, 260, 2, 0, '2017-04-04 08:46:38', '2017-04-04 08:46:38', 0),
(262, 33, 'Tiền chi trả vốn góp cho các chủ sở hữu, mua lại cổ phiếu của doanh nghiệp của doanh nghiệp đã phát hành', '', 5, 260, 2, 0, '2017-04-04 08:46:46', '2017-04-04 08:46:46', 0),
(263, 34, 'Tiền thu từ nhận góp vốn liên doanh', '', 5, 260, 2, 0, '2017-04-04 08:46:51', '2017-04-04 08:46:51', 0),
(264, 35, 'Tiền vay ngắn hạn, dài hạn nhận được', '', 5, 260, 2, 0, '2017-04-04 08:46:55', '2017-04-04 08:46:55', 0),
(265, 36, 'Tiền chi trả nợ gốc vay', '', 5, 260, 2, 0, '2017-04-04 08:47:00', '2017-04-04 08:47:00', 0),
(266, 37, 'Tiền chi trả nợ thuê tài chính', '', 5, 260, 2, 0, '2017-04-04 08:47:05', '2017-04-04 08:47:05', 0),
(267, 38, 'Tiền chi cho đầu tư ngắn hạn', '', 5, 260, 2, 0, '2017-04-04 08:47:09', '2017-04-04 08:47:09', 0),
(268, 39, 'Cổ tức, lợi nhuận đã trả cho chủ sở hữu', '', 5, 260, 2, 0, '2017-04-04 08:47:14', '2017-04-04 08:47:14', 0),
(269, 40, 'Cổ tức, lợi nhuận đã trả cho cổ đông thiểu số', '', 5, 260, 2, 0, '2017-04-04 08:47:19', '2017-04-04 08:47:19', 0),
(270, 41, 'Nhận vốn góp của cổ đông thiểu số', '', 5, 260, 2, 0, '2017-04-04 08:47:23', '2017-04-04 08:47:23', 0),
(271, 42, 'Chi khác từ lợi nhuận chưa phân phối', '', 5, 260, 2, 0, '2017-04-04 08:47:26', '2017-04-04 08:47:26', 0),
(272, 43, 'Tiền thu từ lãi tiền gửi', '', 5, 260, 2, 0, '2017-04-04 08:47:30', '2017-04-04 08:47:30', 0),
(273, 44, 'Lưu chuyển tiền thuần từ/(sử dụng vào) hoạt động tài chính', '', 5, 0, 1, 0, '2017-04-04 08:47:41', '2017-04-05 01:59:00', 1),
(274, 45, 'Lưu chuyển tiền thuần trong năm', '', 5, 0, 1, 0, '2017-04-04 08:47:47', '2017-04-04 08:47:47', 0),
(275, 46, 'Tiền và tương đương tiền đầu năm', '', 5, 0, 1, 0, '2017-04-04 08:48:06', '2017-04-04 08:48:06', 0),
(276, 47, 'Ảnh hưởng của thay đổi tỷ giá hối đoái quy đổi ngoại tệ', '', 5, 0, 1, 0, '2017-04-04 08:48:10', '2017-04-04 08:48:10', 0),
(277, 48, 'Chênh lệch tỷ giá chuyển đối báo cáo tài chính', '', 5, 0, 1, 0, '2017-04-04 08:48:15', '2017-04-04 08:48:15', 0),
(278, 49, 'Tiền và tương đương tiền cuối năm', '', 5, 0, 1, 0, '2017-04-04 08:48:21', '2017-04-04 08:48:21', 0),
(279, 1, 'Thông tin theo bộ phận lĩnh vực kinh doanh', '', 6, 0, 1, 5, '2017-05-17 06:38:11', '2017-05-17 06:38:11', 0),
(280, 2, 'Thông tin bộ phận theo khu vực địa lý', '', 6, 0, 1, 1, '2017-05-17 06:45:12', '2017-05-17 06:45:12', 0),
(281, 3, 'Chi phí sản xuất kinh doanh theo yếu tố', '', 6, 0, 1, 1, '2017-05-17 06:46:01', '2017-05-17 06:46:01', 0),
(282, 4, 'Nghiệp vụ với các bên liên quan', '', 6, 0, 1, 3, '2017-05-17 06:48:56', '2017-05-17 07:41:39', 0),
(283, 5, 'Cam kết thuê hoạt động', '', 6, 0, 1, 1, '2017-05-17 06:50:48', '2017-05-17 06:50:48', 0),
(284, 6, 'Cam kết cho thuê hoạt động', '', 6, 0, 1, 1, '2017-05-17 06:51:05', '2017-05-17 06:51:05', 0),
(285, 7, 'Cam kết liên quan đến các khoản đầu tư, góp vốn', '', 6, 0, 1, 3, '2017-05-17 06:52:11', '2017-05-17 07:24:45', 0),
(286, 8, 'test', '', 6, 0, 1, 1, '2017-05-17 07:10:14', '2017-05-17 07:13:12', 1),
(287, 8, 'Thu nhập của các thành viên HĐQT và Ban Tổng giám đốc', '', 6, 0, 1, 1, '2017-05-17 08:51:18', '2017-05-17 08:51:18', 0),
(288, 36, '5 Big numbers', 'Tính 5 chỉ số quan trong trong Rule #1', 4, 0, 1, 0, '2017-08-14 03:18:09', '2017-08-14 03:22:36', 1);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `params`
--
  
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;