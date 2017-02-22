-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2017 at 08:33 AM
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
-- Table structure for table `balance_sheet`
--

CREATE TABLE `balance_sheet` (
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
  `col_id37` varchar(255) DEFAULT NULL,
  `col_id38` varchar(255) DEFAULT NULL,
  `col_id39` varchar(255) DEFAULT NULL,
  `col_id40` varchar(255) DEFAULT NULL,
  `col_id41` varchar(255) DEFAULT NULL,
  `col_id42` varchar(255) DEFAULT NULL,
  `col_id43` varchar(255) DEFAULT NULL,
  `col_id44` varchar(255) DEFAULT NULL,
  `col_id45` varchar(255) DEFAULT NULL,
  `col_id46` varchar(255) DEFAULT NULL,
  `col_id47` varchar(255) DEFAULT NULL,
  `col_id48` varchar(255) DEFAULT NULL,
  `col_id49` varchar(255) DEFAULT NULL,
  `col_id50` varchar(255) DEFAULT NULL,
  `col_id51` varchar(255) DEFAULT NULL,
  `col_id52` varchar(255) DEFAULT NULL,
  `col_id53` varchar(255) DEFAULT NULL,
  `col_id54` varchar(255) DEFAULT NULL,
  `col_id55` varchar(255) DEFAULT NULL,
  `col_id56` varchar(255) DEFAULT NULL,
  `col_id57` varchar(255) DEFAULT NULL,
  `col_id58` varchar(255) DEFAULT NULL,
  `col_id59` varchar(255) DEFAULT NULL,
  `col_id60` varchar(255) DEFAULT NULL,
  `col_id61` varchar(255) DEFAULT NULL,
  `col_id62` varchar(255) DEFAULT NULL,
  `col_id63` varchar(255) DEFAULT NULL,
  `col_id64` varchar(255) DEFAULT NULL,
  `col_id65` varchar(255) DEFAULT NULL,
  `col_id66` varchar(255) DEFAULT NULL,
  `col_id67` varchar(255) DEFAULT NULL,
  `col_id68` varchar(255) DEFAULT NULL,
  `col_id69` varchar(255) DEFAULT NULL,
  `col_id70` varchar(255) DEFAULT NULL,
  `col_id71` varchar(255) DEFAULT NULL,
  `col_id72` varchar(255) DEFAULT NULL,
  `col_id73` varchar(255) DEFAULT NULL,
  `col_id74` varchar(255) DEFAULT NULL,
  `col_id75` varchar(255) DEFAULT NULL,
  `col_id76` varchar(255) DEFAULT NULL,
  `col_id77` varchar(255) DEFAULT NULL,
  `col_id78` varchar(255) DEFAULT NULL,
  `col_id79` varchar(255) DEFAULT NULL,
  `col_id80` varchar(255) DEFAULT NULL,
  `col_id81` varchar(255) DEFAULT NULL,
  `col_id82` varchar(255) DEFAULT NULL,
  `col_id83` varchar(255) DEFAULT NULL,
  `col_id84` varchar(255) DEFAULT NULL,
  `col_id85` varchar(255) DEFAULT NULL,
  `col_id86` varchar(255) DEFAULT NULL,
  `col_id87` varchar(255) DEFAULT NULL,
  `col_id88` varchar(255) DEFAULT NULL,
  `col_id89` varchar(255) DEFAULT NULL,
  `col_id90` varchar(255) DEFAULT NULL,
  `col_id91` varchar(255) DEFAULT NULL,
  `col_id92` varchar(255) DEFAULT NULL,
  `col_id93` varchar(255) DEFAULT NULL,
  `col_id94` varchar(255) DEFAULT NULL,
  `col_id95` varchar(255) DEFAULT NULL,
  `col_id96` varchar(255) DEFAULT NULL,
  `col_id97` varchar(255) DEFAULT NULL,
  `col_id98` varchar(255) DEFAULT NULL,
  `col_id99` varchar(255) DEFAULT NULL,
  `col_id100` varchar(255) DEFAULT NULL,
  `col_id101` varchar(255) DEFAULT NULL,
  `col_id102` varchar(255) DEFAULT NULL,
  `col_id103` varchar(255) DEFAULT NULL,
  `col_id104` varchar(255) DEFAULT NULL,
  `col_id105` varchar(255) DEFAULT NULL,
  `col_id106` varchar(255) DEFAULT NULL,
  `col_id107` varchar(255) DEFAULT NULL,
  `col_id108` varchar(255) DEFAULT NULL,
  `col_id109` varchar(255) DEFAULT NULL,
  `col_id110` varchar(255) DEFAULT NULL,
  `col_id111` varchar(255) DEFAULT NULL,
  `col_id112` varchar(255) DEFAULT NULL,
  `col_id113` varchar(255) DEFAULT NULL,
  `col_id114` varchar(255) DEFAULT NULL,
  `col_id115` varchar(255) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_sheet`
--

INSERT INTO `balance_sheet` (`id`, `company_id`, `year`, `col_id1`, `col_id2`, `col_id3`, `col_id4`, `col_id5`, `col_id6`, `col_id7`, `col_id8`, `col_id9`, `col_id10`, `col_id11`, `col_id12`, `col_id13`, `col_id14`, `col_id15`, `col_id16`, `col_id17`, `col_id18`, `col_id19`, `col_id20`, `col_id21`, `col_id22`, `col_id23`, `col_id24`, `col_id25`, `col_id26`, `col_id27`, `col_id28`, `col_id29`, `col_id30`, `col_id31`, `col_id32`, `col_id33`, `col_id34`, `col_id35`, `col_id36`, `col_id37`, `col_id38`, `col_id39`, `col_id40`, `col_id41`, `col_id42`, `col_id43`, `col_id44`, `col_id45`, `col_id46`, `col_id47`, `col_id48`, `col_id49`, `col_id50`, `col_id51`, `col_id52`, `col_id53`, `col_id54`, `col_id55`, `col_id56`, `col_id57`, `col_id58`, `col_id59`, `col_id60`, `col_id61`, `col_id62`, `col_id63`, `col_id64`, `col_id65`, `col_id66`, `col_id67`, `col_id68`, `col_id69`, `col_id70`, `col_id71`, `col_id72`, `col_id73`, `col_id74`, `col_id75`, `col_id76`, `col_id77`, `col_id78`, `col_id79`, `col_id80`, `col_id81`, `col_id82`, `col_id83`, `col_id84`, `col_id85`, `col_id86`, `col_id87`, `col_id88`, `col_id89`, `col_id90`, `col_id91`, `col_id92`, `col_id93`, `col_id94`, `col_id95`, `col_id96`, `col_id97`, `col_id98`, `col_id99`, `col_id100`, `col_id101`, `col_id102`, `col_id103`, `col_id104`, `col_id105`, `col_id106`, `col_id107`, `col_id108`, `col_id109`, `col_id110`, `col_id111`, `col_id112`, `col_id113`, `col_id114`, `col_id115`, `del`, `created_date`, `updated_date`) VALUES
(1, 2, 2016, '4', NULL, '4', NULL, '4', NULL, NULL, NULL, NULL, '1', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-02-21 06:31:55', '2017-02-21 08:14:54'),
(2, 2, 2009, '3790457925899', '3790457925899', '2874446860526', '916011065373', '106943400984', NULL, '1953579329651', '653971238187', '159952891704', '106943400984', NULL, NULL, NULL, NULL, '1514564963418', '359958256358', NULL, NULL, NULL, '83323400444', '-4267290569', '653971238187', NULL, '375693002', '96747880013', '2594171671', NULL, '60235147018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '568547649121', '488731460711', '611378006093', '-122646545382', NULL, NULL, NULL, NULL, NULL, NULL, '22563974272', NULL, '22563974272', '300766537809', NULL, '300766537809', NULL, NULL, NULL, '24132904171', '24048904171', NULL, '84000000', NULL, '2013999152757', '1924975771992', '1545357006812', NULL, '197815578762', '16153849695', '34806273214', '7254302965', '5307617321', NULL, NULL, NULL, '119681670275', NULL, '-1400527052', NULL, NULL, '89023380765', NULL, NULL, NULL, NULL, NULL, '84870361161', NULL, '1341912538', '2811107066', NULL, NULL, NULL, '1776458773142', '1776458773142', '599999930000', NULL, '706724070000', NULL, NULL, NULL, NULL, '29984766900', '35920754779', '36707290563', NULL, '304135514998', NULL, '304135514998', NULL, NULL, '62986445902', NULL, NULL, NULL, '79816188410', '83355271109', '-3539082699', NULL, 0, '2017-02-21 08:19:02', '2017-02-22 07:28:44'),
(3, 2, 2010, '5388128920387', '5388128920387', '3923085968027', '1465042952360', '206930674738', '50530040000', '2238050844506', '1251130452944', '176443955839', '162530674738', '44400000000', '50530040000', NULL, NULL, '1567597222879', '539262247383', NULL, NULL, NULL, '146595848788', '-15404474544', '1254132611600', '-3002158656', '2385038313', '93837493067', '3323118126', NULL, '76898306333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1052317177354', '899978358777', '1260456806556', '-360478447779', '0', '0', '0', NULL, NULL, NULL, '53143690450', NULL, '53143690450', '335161204584', NULL, '245331204584', NULL, '-12410000000', NULL, '24420879972', '17856826462', '5980053510', '584000000', NULL, '3170462865474', '3084033575411', '2171551068003', NULL, '470962057118', '154548631515', '27154554598', '34430248350', '22764801996', NULL, NULL, NULL, '192278006820', NULL, '10344207011', NULL, NULL, '86429290063', NULL, NULL, NULL, NULL, NULL, '63112909195', NULL, '10006001082', '13310379786', NULL, NULL, NULL, '2217666054913', '2217666054913', '659980730000', NULL, '706724070000', NULL, NULL, '-29640652453', NULL, NULL, '52363643070', '53428590703', NULL, '376494059903', NULL, '376494059903', NULL, NULL, '398315613690', NULL, NULL, NULL, '152338818577', '159461625157', '-7122806580', '102240000000', 0, '2017-02-22 07:41:04', '2017-02-22 07:41:04'),
(4, 2, 2011, '6295113560653', '6295113560653', '4860126917754', '1434986642899', '303637987038', NULL, '2795353564990', '1504516745503', '256618620223', '262809987038', '40828000000', NULL, NULL, NULL, '2251180047609', '495692204753', NULL, NULL, NULL, '155056513842', '-106575201214', '1504516745503', NULL, '2393179468', '114500188867', '123166008', NULL, '139602085880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '943379442214', '802232669608', '1249741308280', '-447508638672', NULL, NULL, NULL, NULL, NULL, NULL, '73260812997', NULL, '73260812997', '395724655725', NULL, '300126092360', NULL, '-39331836635', NULL, '22621731963', '13887434437', '7150297526', '1584000000', NULL, '3780516681399', '3718774384862', '2329166844110', NULL, '1130269398234', '24233558931', '52689308592', '44644502708', '41357377442', NULL, NULL, NULL, '83803712421', '12609682424', NULL, NULL, NULL, '61742296537', NULL, NULL, NULL, NULL, NULL, '36255963361', NULL, '2839213002', '22647120174', NULL, NULL, NULL, '2514596879254', '2514596879254', '659980730000', NULL, '706724070000', NULL, NULL, '-30325837000', NULL, NULL, '60800844448', '58293665344', '-1017985453', '635987826735', NULL, '635987826735', NULL, NULL, '424153565180', NULL, NULL, NULL, '141146772606', '150494625157', '-9347852551', '134930400000', 0, '2017-02-22 07:50:43', '2017-02-22 07:50:43');

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
(85, 2, 1, 'Mua cổ phiếu quỹ', 1186530, 10000, 64811543, 1186530, '2010-10-14 00:00:00', '2017-02-20 08:59:37', 0),
(14, 5, 0, 'Phát hành cổ phiếu ra công chúng', 5472920, 100000, 5472920, 0, '2005-12-01 00:00:00', '2016-12-15 05:57:43', 0),
(15, 5, 0, 'Phát hành cổ phiếu ra công chúng', 55337310, 10000, 60810230, 0, '2006-12-01 00:00:00', '2016-12-15 05:59:18', 0),
(16, 5, 0, 'Phát hành cổ phiếu cho công chúng', 30405114, 10000, 91215344, 0, '2007-06-12 00:00:00', '2016-12-15 06:37:54', 0),
(17, 5, 0, 'Niêm yết bổ sung', 684115, 10000, 91899459, 0, '2007-08-12 00:00:00', '2016-12-15 06:56:31', 0),
(18, 5, 0, 'Phát hành cổ phiếu cho ngươi lao động có thành tích đóng góp năm 2007', 1292887, 10000, 93627866, 17600, '2008-06-11 00:00:00', '2016-12-20 03:57:31', 0),
(19, 5, 0, 'Phát hành cổ phiếu thưởng cho cổ đông hiện hữu tỷ lệ 2:1', 47001458, 10000, 140978924, 183150, '2008-12-22 00:00:00', '2016-12-20 04:24:07', 0),
(20, 5, 0, 'Phát hành cổ phiếu cho CBNV', 220125, 10000, 140443464, 17600, '2009-06-25 00:00:00', '2016-12-20 03:57:38', 0),
(21, 5, 0, 'Phát hành cho CBNV có thành tích đóng góp 2008', 2641253, 10000, 143648817, 183150, '2009-08-12 00:00:00', '2016-12-20 06:32:00', 0),
(22, 5, 0, 'Trả cổ tức năm 2009', 47547223, 10000, 191098635, 280555, '2010-07-01 00:00:00', '2016-12-20 06:58:03', 0),
(23, 5, 1, 'Mua lại CPQ', 320, 10000, 193379837, 100680, '2011-05-16 00:00:00', '2016-12-20 07:35:08', 0),
(24, 5, 1, 'Mua lại CPQ', 20539, 10000, 193380157, 100360, '2011-05-01 00:00:00', '2016-12-20 07:34:46', 0),
(25, 5, 1, 'Cổ phiếu quỹ', 17600, 10000, 91881859, 17600, '2007-11-30 00:00:00', '2016-12-20 03:54:33', 0),
(26, 5, 0, 'Cổ phiếu hạn chế chuyển nhượng', 453120, 10000, 92334979, 17600, '2007-12-03 00:00:00', '2016-12-20 03:54:38', 0),
(27, 5, 0, 'Cổ phiếu ưu đãi cho nhân viên', 515150, 10000, 94143016, 17600, '2008-06-12 00:00:00', '2016-12-20 04:20:05', 0),
(28, 5, 1, 'Cổ phiếu quỹ', 165550, 10000, 93977466, 183150, '2008-07-12 00:00:00', '2016-12-20 04:23:41', 0),
(29, 5, 1, 'Cổ phiếu quỹ', 97405, 10000, 143551412, 280555, '2009-08-13 00:00:00', '2016-12-20 06:32:03', 0),
(30, 5, 0, 'Cổ phiếu ưu đãi cho nhân viên', 564100, 10000, 141007564, 183150, '2009-06-26 00:00:00', '2016-12-20 06:31:55', 0),
(31, 5, 0, 'Phát hành cho CBCNV có thành tích 2009', 1037832, 10000, 192136467, 280555, '2010-08-05 00:00:00', '2016-12-20 07:24:56', 0),
(32, 5, 0, 'Phát hành ưu đãi cho nhân viên loại 2 năm 2008', 291435, 10000, 192427902, 280555, '2010-08-11 00:00:00', '2016-12-20 07:25:02', 0),
(33, 5, 0, 'Cổ phần ưu đãi nhân viên năm 2007, cổ phần phát sinh từ cổ phần ưu đãi NV loại 2 năm 2008', 772060, 10000, 193199962, 280555, '2010-09-08 00:00:00', '2016-12-20 07:25:05', 0),
(34, 5, 1, 'Bán cổ phiếu quỹ', -211340, 10000, 193411302, 69215, '2010-09-09 00:00:00', '2016-12-20 07:25:19', 0),
(35, 5, 1, 'Mua lại CPUDNV khi CBNV nghỉ việc', 780, 10000, 193410522, 69995, '2011-01-16 00:00:00', '2016-12-20 07:28:54', 0),
(36, 5, 1, 'Công ty mua lại CPUĐNV khi CBNV nghỉ việc', 3020, 10000, 193407502, 73015, '2011-02-16 00:00:00', '2016-12-20 07:28:45', 0),
(37, 5, 1, 'Công ty mua lại CPUĐNV khi CBNV nghỉ việc', 560, 10000, 193406942, 73575, '2011-03-01 00:00:00', '2016-12-20 07:29:30', 0),
(38, 5, 1, 'Công ty mua lại CPUĐNV khi CBNV nghỉ việc', 5073, 10000, 193401869, 78648, '2011-03-16 00:00:00', '2016-12-20 07:30:02', 0),
(39, 5, 1, 'Mua lại do CBNV nghỉ việc', 1173, 10000, 193400696, 79821, '2011-04-16 00:00:00', '2016-12-20 07:34:16', 0),
(40, 5, 1, 'Mua lại CPQ', 1840, 10000, 193377997, 102520, '2011-06-01 00:00:00', '2016-12-20 07:35:30', 0),
(41, 5, 1, 'Phân bổ CPQ', -100000, 10000, 193477997, 2520, '2011-06-03 00:00:00', '2016-12-20 07:36:04', 0),
(42, 5, 0, 'Cổ phiếu ưu đãi cho Nhân viên', 397950, 10000, 216057421, 25255, '2011-11-08 00:00:00', '2016-12-20 07:49:41', 0),
(43, 5, 0, 'Phát hành cổ phiếu cho các cổ đông CTCP Hệ thống thông tin FPR, CTCP phần mềm FPT, CTCP thương mại FPT', 19830549, 10000, 213300334, 10732, '2011-09-29 00:00:00', '2016-12-20 07:42:30', 0),
(44, 5, 1, 'Mua lại CPQ', 370, 10000, 193477627, 2890, '2011-07-16 00:00:00', '2016-12-20 07:41:57', 0),
(45, 5, 1, 'Mua lại CPQ', 4757, 10000, 193472870, 7647, '2011-08-16 00:00:00', '2016-12-20 07:42:00', 0),
(46, 5, 1, 'Mua lại CPQ', 3085, 10000, 193469785, 10732, '2011-09-16 00:00:00', '2016-12-20 07:42:25', 0),
(47, 5, 0, 'Phát hành cổ phiếu cho CBNV', 2373660, 10000, 215673994, 10732, '2011-10-10 00:00:00', '2016-12-20 07:49:28', 0),
(48, 5, 1, 'Mua lại CPQ', 14523, 10000, 215659471, 25255, '2011-10-16 00:00:00', '2016-12-20 07:49:39', 0),
(49, 5, 1, 'Mua lại CPQ', 7404, 10000, 216050017, 32659, '2011-11-16 00:00:00', '2016-12-20 07:49:43', 0),
(50, 5, 1, 'Mua lại CPQ', 18685, 10000, 216031332, 51344, '2011-12-16 00:00:00', '2016-12-20 07:49:45', 0),
(51, 5, 1, 'Mua lại CPQ', 476, 10000, 216030856, 51820, '2012-03-01 00:00:00', '2016-12-20 08:03:03', 0),
(52, 5, 1, 'Mua lại CPQ', 3979, 10000, 216026877, 55799, '2012-03-16 00:00:00', '2016-12-20 08:03:31', 0),
(53, 5, 1, 'Mua lại CPQ', 1234, 10000, 216025643, 57033, '2012-04-16 00:00:00', '2016-12-20 08:04:21', 0),
(54, 5, 0, 'Trả cổ tức 2011', 53981160, 10000, 269999214, 64622, '2012-07-11 00:00:00', '2016-12-20 08:09:29', 0),
(55, 5, 1, 'Phân bổ CPQ', -240, 10000, 216025883, 56793, '2012-06-07 00:00:00', '2016-12-20 08:09:00', 0),
(56, 5, 1, 'Mua lại CBNV', 7829, 10000, 216018054, 64622, '2012-06-16 00:00:00', '2016-12-20 08:15:33', 0),
(57, 5, 0, 'Phát hành cổ phiếu theo chương trình lựa chọn cho CBNV có thành tích 2011', 3762899, 10000, 273758865, 67870, '2012-07-26 00:00:00', '2016-12-20 08:11:43', 0),
(58, 5, 1, 'Mua lại CBNV', 3248, 10000, 269995966, 67870, '2012-07-16 00:00:00', '2016-12-20 08:15:29', 0),
(59, 5, 1, 'Mua lại CBNV', 4715, 10000, 273754150, 72585, '2012-08-16 00:00:00', '2016-12-20 08:15:25', 0),
(60, 5, 0, 'Niêm yết cổ phiếu phát hành cho CBNV bị hạn chế chuyển nhượng', 22098, 10000, 273774198, 74635, '2012-10-03 00:00:00', '2016-12-20 08:21:13', 0),
(61, 5, 1, 'Mua lại CBNV', 2050, 10000, 273752100, 74635, '2012-09-16 00:00:00', '2016-12-20 08:15:52', 0),
(62, 5, 1, 'Mua lại CBNV', 1391, 10000, 273772807, 76026, '2012-10-16 00:00:00', '2016-12-20 08:21:15', 0),
(63, 5, 1, 'mua lại CBNV', 2968, 10000, 273769839, 78994, '2012-11-16 00:00:00', '2016-12-20 08:21:17', 0),
(64, 5, 1, 'Mua lại CBNV', 440, 10000, 273769399, 79434, '2012-12-16 00:00:00', '2016-12-20 08:21:18', 0),
(65, 5, 1, 'Mua lại CBNV', 772, 10000, 273768627, 80206, '2013-01-16 00:00:00', '2016-12-21 06:16:15', 0),
(66, 5, 1, 'Mua lại CBNV', 517, 10000, 273768110, 80723, '2013-02-16 00:00:00', '2016-12-21 06:16:48', 0),
(67, 5, 1, 'Mua lại CBNV', 136, 10000, 273767507, 81326, '2013-04-16 00:00:00', '2016-12-21 06:19:17', 0),
(68, 5, 1, 'Mua lại CBNV', 467, 10000, 273767643, 81190, '2013-03-01 00:00:00', '2016-12-21 06:19:13', 0),
(69, 5, 1, 'Mua lại CBNV', 350, 10000, 273767157, 81676, '2013-05-31 00:00:00', '2016-12-21 06:26:34', 0),
(70, 5, 1, 'Mua lại CBNV', 700, 10000, 275119379, 82376, '2013-06-16 00:00:00', '2016-12-21 06:33:28', 0),
(71, 5, 0, 'Phát hành cổ phiếu ESOP', 1352922, 10000, 275120079, 81676, '2013-06-06 00:00:00', '2016-12-21 06:33:25', 0),
(72, 5, 0, 'Trả cổ tức cho cổ đông hiện hữu năm 2013', 68774845, 10000, 343894224, 82376, '2014-06-27 00:00:00', '2016-12-21 06:36:05', 0),
(73, 5, 0, 'Phát hành cổ phiếu ESOP ngày giao dich 23-04-2018', 1719317, 10000, 345613541, 82376, '2015-04-20 00:00:00', '2016-12-21 06:38:15', 0),
(74, 5, 0, 'Trả cổ tức 2015 tỷ lệ 15%', 51835723, 10000, 397449264, 82376, '2015-07-13 00:00:00', '2016-12-21 06:54:12', 0),
(75, 5, 0, 'Phát hành ESOP', 1986829, 10000, 399436093, 82376, '2016-04-29 00:00:00', '2016-12-21 06:56:56', 0),
(76, 5, 0, 'Trả cổ tức 2015 tỷ lệ 15%', 59908215, 10000, 459344308, 82376, '2016-07-07 00:00:00', '2016-12-21 06:57:50', 0),
(81, 2, 0, 'Cổ phiếu hiện hành', 59385600, 10000, 59385600, 0, '2008-12-31 00:00:00', '2017-02-20 08:45:26', 0),
(82, 2, 0, 'Niêm yết', 614393, 10000, 59999993, 0, '2009-09-15 00:00:00', '2017-02-20 08:45:50', 0),
(83, 2, 0, 'Trả cổ tức tỷ lệ 10:1', 5998080, 10000, 65998073, 0, '2010-08-25 00:00:00', '2017-02-20 08:46:21', 0),
(86, 2, 1, 'Mua cổ phiếu quỹ', 73790, 10000, 64737753, 1260320, '2011-11-01 00:00:00', '2017-02-20 08:59:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cashflow`
--

CREATE TABLE `cashflow` (
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
  `col_id37` varchar(255) DEFAULT NULL,
  `col_id38` varchar(255) DEFAULT NULL,
  `col_id39` varchar(255) DEFAULT NULL,
  `col_id40` varchar(255) DEFAULT NULL,
  `col_id41` varchar(255) DEFAULT NULL,
  `col_id42` varchar(255) DEFAULT NULL,
  `col_id43` varchar(255) DEFAULT NULL,
  `col_id44` varchar(255) DEFAULT NULL,
  `col_id45` varchar(255) DEFAULT NULL,
  `col_id46` varchar(255) DEFAULT NULL,
  `col_id47` varchar(255) DEFAULT NULL,
  `col_id48` varchar(255) DEFAULT NULL,
  `col_id49` varchar(255) DEFAULT NULL,
  `col_id50` varchar(255) DEFAULT NULL,
  `col_id51` varchar(255) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashflow`
--

INSERT INTO `cashflow` (`id`, `company_id`, `year`, `col_id1`, `col_id2`, `col_id3`, `col_id4`, `col_id5`, `col_id6`, `col_id7`, `col_id8`, `col_id9`, `col_id10`, `col_id11`, `col_id12`, `col_id13`, `col_id14`, `col_id15`, `col_id16`, `col_id17`, `col_id18`, `col_id19`, `col_id20`, `col_id21`, `col_id22`, `col_id23`, `col_id24`, `col_id25`, `col_id26`, `col_id27`, `col_id28`, `col_id29`, `col_id30`, `col_id31`, `col_id32`, `col_id33`, `col_id34`, `col_id35`, `col_id36`, `col_id37`, `col_id38`, `col_id39`, `col_id40`, `col_id41`, `col_id42`, `col_id43`, `col_id44`, `col_id45`, `col_id46`, `col_id47`, `col_id48`, `col_id49`, `col_id50`, `col_id51`, `del`, `created_date`, `updated_date`) VALUES
(1, 2, 2009, '-401923669423', '334743738035', '19294091176', '46971403702', '-250592667227', NULL, NULL, NULL, '146944435866', NULL, NULL, NULL, '75970918835', NULL, '354037829211', '-540114428816', '-220792083722', '137116207269', '-17854217113', NULL, '-79309471760', '-2050464746', '5558490840', '-38515530586', '-140505181202', '-191845505311', '166000000', NULL, NULL, NULL, NULL, '-60073190000', '107205237324', NULL, '4042276785', NULL, '570957892063', '6144000000', NULL, '5083755326641', '-4403901050982', NULL, NULL, NULL, '-115040383596', NULL, NULL, '28529041438', '79989441966', '-1575082420', '106943400984', 0, '2017-02-22 03:18:59', '2017-02-22 03:23:43'),
(2, 2, 2010, '335841267629', '277000249970', '147441351934', '99571303475', '33948615351', NULL, NULL, '-34624186838', '-145050543560', NULL, NULL, NULL, '193596163506', NULL, '424441601904', '146080947590', '-334170670410', '334617513552', '8745555714', NULL, '-193545794197', '-25567649199', NULL, '-24760237325', '-329428397620', '-205748136288', '889113636', NULL, NULL, NULL, NULL, '-178150132502', '20400000000', NULL, '33180757534', NULL, '95209575216', '20935160000', '-30612881485', '6456372357806', '-6281022505273', NULL, NULL, NULL, '-70462555832', NULL, NULL, '101622445225', '106943400915', '-1635171402', '206930674738', 0, '2017-02-22 07:47:06', '2017-02-22 07:47:06'),
(3, 2, 2011, '94216931447', '508186890694', '375267425410', '103730196835', '115090404649', NULL, NULL, '-19786864615', '-90650707573', NULL, NULL, NULL, '266884396114', NULL, '883454316104', '-656592266017', '-250384133903', '473031173498', '3961250870', NULL, '-264477387087', '-15388045142', '323395051396', '-402783028272', '39761530129', '-45433427812', '47795234436', NULL, '50530040000', NULL, NULL, '-34690400000', NULL, NULL, '21560083505', NULL, '-36926345081', NULL, '-1703170000', '7402383615328', '-7273183666479', NULL, NULL, NULL, '-164423123930', NULL, NULL, '97052116495', '206930674738', '-344804195', '303637987038', 0, '2017-02-22 07:54:10', '2017-02-22 07:54:10');

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
(1, 'Công ty Cổ phần Tập đoàn FLC', 'FLC', 9, 1, 'Công ty Cổ phầnTập đoàn FLC là một công ty hoạt động trong lĩnh vực bất động sản mới gia nhập thị trường. Tuy nhiên, nhờ có đội ngũ quản lý có nhiều kinh nghiệm trong ngành, Công ty đang từng bước tạo lập uy tín và thương hiệu “FLC” trên thị trường. Số lượng khách hàng của Công ty ngày càng tăng không chỉ dựa vào mối quan hệ tốt sẵn có của các cán bộ quản lý mà còn dựa vào chính chất lượng sản phẩm dịch vụ mà FLC mang đến cho khách hàng. FLC định hướng trở thành một trong những tập đoàn kinh doanh tư vấn bất động sản hàng đầu tại Việt Nam.', 'http://flc.vn', 1, 0, '2016-10-06 06:19:31', '2016-11-24 07:54:39'),
(2, 'CTCP Hùng Vương', 'HVG', 4, 1, 'HVG là một trong những công ty chế biến cá tra được thành lập sớm tại Việt Nam với đội ngũ nhân sự nhiều kinh nghiệm và đã tạo dựng được thương hiệu được nhiều người tiêu dùng và đối tác biết đến, nhờ vào tính ổn định trong sản lượng và chất lượng của các sản phẩm, quy trình sản xuất khép kín, thương hiệu luôn được Công ty chú trọng quảng bá và trách nhiệm cao đối với xã hội và môi trường của Công ty. Đây là những yếu tố làm nên một HVG luôn duy trì mức tăng trưởng tốt trong suốt 11 năm hoat động của mình.', 'http://www.hungvuongpanga.com/', 1, 0, '2016-10-06 07:53:46', '2016-10-06 07:53:46'),
(3, 'Tập đoàn Vingroup - CTCP', 'VIC', 9, 1, 'Công ty Cổ phần Vincom (Vincom), tiền thân là Công ty Cổ phần (CP) Thương mại Tổng hợp Việt Nam, được chính thức thành lập vào ngày 3/5/2002. Trải qua hơn 8 năm xây dựng và phát triển,tới nay, Vincom đã trở thành một trong những doanh nghiệp hàng đầu Việt Nam trong lĩnh vực bất động sản. Hàng loạt những dự án bất động sản cao cấp mang thương hiệu Vincom đang được triển khai tiếp nối nhau tại nhiều thành phố lớn của cả nước. Những dự án này đều là tâm điểm của sự chú ý và được đánh giá cao bởi các nhà đầu tư. Trong tương lai, hàng loạt công trình tầm cỡ mang tên Vincom sẽ xuất hiện trên khắp đất nước Việt Nam, góp phần xây dựng hình ảnh Việt Nam hiện đại,năng động và phát triển.', 'http://www.vingroup.net', 1, 0, '2016-10-28 01:42:23', '2016-10-28 01:42:23'),
(4, '1', '1', 1, 1, '1', '1', 1, 1, '2016-11-24 04:13:56', '2016-11-24 04:14:08'),
(5, 'CTCP FPT', 'FPT', 10, 1, '- Công nghệ: gồm 3 mảng chính là Phát triển phần mềm, Tích hợp hệ thống và Dịch vụ CNTT\n- Viễn thông: gồm 2 mảng chính là Dịch vụ viễn thông và Nội dung số\n- Phân phối và bán lẻ các sản phẩm công nghệ: gồm 2 mảng chính là Phân phối các sản phẩm công nghệ và Bán lẻ các sản phẩm công nghệ\n- Giáo dục', 'http://www.fpt.com.vn', 1, 0, '2016-12-15 03:49:39', '2016-12-15 03:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(265) CHARACTER SET utf8 NOT NULL,
  `password` varchar(265) CHARACTER SET utf8 NOT NULL,
  `login_hash` varchar(265) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `login_hash`, `name`, `del`, `created_date`, `updated_date`) VALUES
(1, 'tranphan2508@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '79240af2e4c0b9e685f76d2a02b6b93c', 'Tran Phan', 0, '2016-11-23 00:00:00', '2017-02-22 08:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `link` varchar(256) CHARACTER SET utf8 NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`id`, `name`, `code`, `link`, `del`, `created_date`, `updated_date`) VALUES
(1, 'Sở giao dịch chứng khoán Hồ Chí Minh', 'HSX', 'https://www.hsx.vn/', 0, '2016-09-29 09:29:40', '2016-11-23 04:03:45'),
(2, 'Sở Giao dịch Chứng khoán Hà Nội', 'HNX', 'http://www.hnx.vn/', 0, '2016-10-05 07:27:31', '2016-10-05 07:27:31'),
(3, 'UPCOM', 'UPCOM', 'http://www.hnx.vn/', 0, '2016-10-05 08:36:54', '2016-10-05 08:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `income_statement`
--

CREATE TABLE `income_statement` (
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
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `income_statement`
--

INSERT INTO `income_statement` (`id`, `company_id`, `year`, `col_id1`, `col_id2`, `col_id3`, `col_id4`, `col_id5`, `col_id6`, `col_id7`, `col_id8`, `col_id9`, `col_id10`, `col_id11`, `col_id12`, `col_id13`, `col_id14`, `col_id15`, `col_id16`, `col_id17`, `col_id18`, `col_id19`, `col_id20`, `col_id21`, `col_id22`, `del`, `created_date`, `updated_date`) VALUES
(1, 2, 2016, '4', '2', '2', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0', '1', NULL, NULL, NULL, '1', NULL, '1', 0, '2017-02-22 02:42:53', '2017-02-22 03:05:24'),
(2, 2, 2009, '3105193741440', '17910371463', '3087283369977', '2567863787279', '519419582698', '55873351919', '27182234408', '75970918835', '23931999641', '201381278987', '42269072736', '328392348127', '9309002251', '2957612343', '6351389908', '334743738035', '39203756564', '636117596', '39839874160', '294903863875', '1632590336', '293271273539', 0, '2017-02-22 02:46:26', '2017-02-22 03:07:00'),
(3, 2, 2010, '4481514419240', '49920013818', '4431594405422', '3822880964651', '608713440771', '311745819707', '246420607633', '193596163506', '14689511719', '346943884056', '66558439083', '275225841425', '7628177742', '5853769197', '1774408545', '277000249970', '22104639560', '3965240477', '26069880037', '250930369933', '32188616350', '218741753583', 0, '2017-02-22 07:42:34', '2017-02-22 07:43:57'),
(4, 2, 2011, '7845430906195', '51163285323', '7794267620872', '6577582659566', '1216684961306', '185017333095', '346690788656', '266884396114', '53556445650', '410977113162', '197693983361', '499896854872', '55309381784', '47019345962', '8290035822', '508186890694', '31514794404', '-8337032096', '23177762308', '485009128386', '67253171989', '417755956397', 0, '2017-02-22 07:51:44', '2017-02-22 07:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

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
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indicators`
--

INSERT INTO `indicators` (`id`, `company_id`, `year`, `col_id1`, `col_id2`, `col_id3`, `col_id4`, `col_id5`, `col_id6`, `col_id7`, `col_id8`, `col_id9`, `col_id10`, `col_id11`, `col_id12`, `col_id13`, `col_id14`, `col_id15`, `col_id16`, `col_id17`, `col_id18`, `col_id19`, `col_id20`, `col_id21`, `col_id22`, `col_id23`, `col_id24`, `col_id25`, `col_id26`, `col_id27`, `col_id28`, `del`, `created_date`, `updated_date`) VALUES
(1, 2, 2009, NULL, NULL, NULL, NULL, NULL, '4923.35', NULL, '1.15', '1.49', '113.37', '53.13', NULL, '1.63', '7.85', '3.16', NULL, '16.73', '13.23', '14.74', NULL, '7.74', '16.51', '9.50', '28277.38', '9.44', NULL, '0.06', '5.41', 0, '2017-02-22 04:20:27', '2017-02-22 07:30:52'),
(2, 2, 2010, NULL, NULL, NULL, NULL, NULL, '3521.29', NULL, '0.87', '1.27', '142.96', '58.84', NULL, '0.97', '4.01', '2.11', NULL, '13.58', '10.50', '11.55', NULL, '4.06', '9.86', '4.94', '31293.75', '4.88', NULL, '0.07', '2.43', 0, '2017-02-22 07:41:04', '2017-02-22 07:43:58'),
(3, 2, 2011, NULL, NULL, NULL, NULL, NULL, '6445.70', NULL, '0.90', '1.31', '150.34', '60.05', NULL, '1.33', '4.77', '3.10', NULL, '15.51', '9.88', '11.15', NULL, '6.64', '16.61', '5.36', '35962.42', '5.32', NULL, '0.08', '2.90', 0, '2017-02-22 07:50:43', '2017-02-22 07:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `col_id` int(11) DEFAULT NULL,
  `title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(3) NOT NULL COMMENT '1-balance sheet; 2-income statement;3-statement of cash flow',
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='name of all data type';

--
-- Dumping data for table `params`
--

INSERT INTO `params` (`id`, `col_id`, `title`, `description`, `type`, `parent_id`, `level`, `created_date`, `updated_date`, `del`) VALUES
(1, 1, 'TÀI SẢN', '', 1, 0, 1, '2016-09-28 13:33:56', '2016-11-02 08:02:32', 0),
(2, 2, 'NGUỒN VỐN', NULL, 1, 0, 1, '2016-09-28 13:35:02', '2016-09-28 13:35:02', 0),
(3, 3, 'A. Tài sản lưu động và đầu tư ngắn hạn', NULL, 1, 1, 2, '2016-09-28 13:35:21', '2016-09-28 13:35:21', 0),
(4, 4, 'B. Tài sản cố định và đầu tư dài hạn', NULL, 1, 1, 2, '2016-09-28 13:35:52', '2016-09-28 13:35:52', 0),
(5, 5, 'I. Tiền và các khoản tương đương tiền', NULL, 1, 3, 3, '2016-09-28 13:36:11', '2016-09-28 13:36:11', 0),
(6, 6, 'II. Các khoản đầu tư tài chính ngắn hạn', NULL, 1, 3, 3, '2016-09-28 13:37:08', '2016-09-28 13:37:08', 0),
(7, 7, 'III. Các khoản phải thu ngắn hạn', NULL, 1, 3, 3, '2016-09-28 13:38:02', '2016-09-28 13:38:02', 0),
(8, 8, 'IV. Tổng hàng tồn kho', NULL, 1, 3, 3, '2016-09-28 13:39:13', '2016-09-28 13:39:13', 0),
(9, 9, 'V. Tài sản ngắn hạn khác', NULL, 1, 3, 3, '2016-09-28 13:44:06', '2016-09-28 13:44:06', 0),
(11, 10, '1. Tiền', NULL, 1, 5, 4, '2016-09-28 13:57:58', '2016-09-28 13:57:58', 0),
(12, 11, '2. Các khoản tương đương tiền', NULL, 1, 5, 4, '2016-09-28 13:58:14', '2016-09-28 13:58:14', 0),
(13, 12, '1. Chứng khoán kinh doanh', NULL, 1, 6, 4, '2016-09-28 13:58:27', '2016-09-28 13:58:27', 0),
(14, 13, '2. Dự phòng giảm giá chứng khoán kinh doanh', NULL, 1, 6, 4, '2016-09-28 13:58:35', '2016-09-28 13:58:35', 0),
(15, 14, '3. Đầu tư nắm giữ đến ngày đáo hạn', NULL, 1, 6, 4, '2016-09-28 13:58:44', '2016-09-28 13:58:44', 0),
(16, 15, '1. Phải thu ngắn hạn của khách hàng', NULL, 1, 7, 4, '2016-09-28 13:58:52', '2016-09-28 13:58:52', 0),
(17, 16, '2. Trả trước cho người bán', NULL, 1, 7, 4, '2016-09-28 13:58:59', '2016-09-28 13:58:59', 0),
(18, 17, '3. Phải thu nội bộ ngắn hạn', NULL, 1, 7, 4, '2016-09-28 13:59:06', '2016-09-28 13:59:06', 0),
(19, 18, '4. Phải thu theo tiến độ hợp đồng xây dựng', NULL, 1, 7, 4, '2016-09-28 13:59:51', '2016-09-28 13:59:51', 0),
(20, 19, '5. Phải thu về cho vay ngắn hạn', NULL, 1, 7, 4, '2016-09-28 13:59:59', '2016-09-28 13:59:59', 0),
(21, 20, '6. Phải thu ngắn hạn khác', NULL, 1, 7, 4, '2016-09-28 14:00:05', '2016-09-28 14:00:05', 0),
(22, 21, '7. Dự phòng phải thu ngắn hạn khó đòi', NULL, 1, 7, 4, '2016-09-28 14:00:12', '2016-09-28 14:00:12', 0),
(23, 22, '1. Hàng tồn kho', NULL, 1, 8, 4, '2016-09-28 14:00:22', '2016-09-28 14:00:22', 0),
(24, 23, '2. Dự phòng giảm giá hàng tồn kho', NULL, 1, 8, 4, '2016-09-28 14:00:29', '2016-09-28 14:00:29', 0),
(25, 24, '1. Chi phí trả trước ngắn hạn', NULL, 1, 9, 4, '2016-09-28 14:00:36', '2016-09-28 14:06:06', 0),
(26, 25, '2. Thuế giá trị gia tăng được khấu trừ', NULL, 1, 9, 4, '2016-09-28 14:06:12', '2016-09-28 14:06:12', 0),
(27, 26, '3. Thuế và các khoản phải thu Nhà nước', NULL, 1, 9, 4, '2016-09-28 14:06:18', '2016-09-28 14:06:18', 0),
(28, 27, '4. Giao dịch mua bán lại trái phiếu chính phủ', NULL, 1, 9, 4, '2016-09-28 14:06:27', '2016-09-28 14:06:27', 0),
(29, 28, '5. Tài sản ngắn hạn khác', NULL, 1, 9, 4, '2016-09-28 14:06:34', '2016-09-28 14:06:34', 0),
(30, 29, 'I. Các khoản phải thu dài hạn', NULL, 1, 4, 3, '2016-09-28 14:06:46', '2016-09-28 14:06:46', 0),
(31, 30, '1. Phải thu dài hạn của khách hàng', NULL, 1, 30, 4, '2016-09-28 14:06:55', '2016-09-28 14:06:55', 0),
(32, 31, '2. Vốn kinh doanh tại các đơn vị trực thuộc', NULL, 1, 30, 4, '2016-09-28 14:07:02', '2016-09-28 14:07:02', 0),
(33, 32, '3. Phải thu dài hạn nội bộ', NULL, 1, 30, 4, '2016-09-28 14:07:08', '2016-09-28 14:07:08', 0),
(34, 33, '4. Phải thu về cho vay dài hạn', NULL, 1, 30, 4, '2016-09-28 14:07:12', '2016-09-28 14:07:12', 0),
(35, 34, '5. Phải thu dài hạn khác', NULL, 1, 30, 4, '2016-09-28 14:07:23', '2016-09-28 14:07:23', 0),
(36, 35, '6. Dự phòng phải thu dài hạn khó đòi', NULL, 1, 30, 4, '2016-09-28 14:07:29', '2016-09-28 14:07:29', 0),
(37, 36, 'II. Tài sản cố định', NULL, 1, 4, 3, '2016-09-28 14:07:48', '2016-09-28 14:07:48', 0),
(38, 37, '1. Tài sản cố định hữu hình', NULL, 1, 37, 4, '2016-09-28 14:08:10', '2016-09-28 14:08:10', 0),
(39, 38, '- Nguyên giá', NULL, 1, 38, 5, '2016-09-28 14:13:30', '2016-09-28 14:13:30', 0),
(40, 39, '- Giá trị hao mòn lũy kế', NULL, 1, 38, 5, '2016-09-28 14:57:21', '2016-09-28 14:57:21', 0),
(41, 40, '2. Tài sản cố định thuê tài chính', NULL, 1, 37, 4, '2016-09-28 14:58:21', '2016-10-14 07:54:08', 0),
(42, 41, '- Nguyên giá', NULL, 1, 41, 5, '2016-09-28 14:58:30', '2016-09-28 14:58:30', 0),
(43, 42, '- Giá trị hao mòn lũy kế', NULL, 1, 41, 5, '2016-09-28 14:58:36', '2016-09-28 14:58:36', 0),
(44, 43, 'III. Bất động sản đầu tư', NULL, 1, 4, 3, '2016-09-28 14:58:54', '2016-09-28 14:58:54', 0),
(45, 44, '- Nguyên giá', NULL, 1, 44, 4, '2016-09-28 14:59:03', '2016-09-28 14:59:03', 0),
(46, 45, '- Giá trị hao mòn lũy kế', NULL, 1, 44, 4, '2016-09-28 14:59:11', '2016-09-28 14:59:11', 0),
(47, 46, 'IV. Tài sản dở dang dài hạn', NULL, 1, 4, 3, '2016-09-28 14:59:33', '2016-09-28 14:59:33', 0),
(48, 47, '1. Chi phí sản xuất, kinh doanh dở dang dài hạn', NULL, 1, 47, 4, '2016-09-28 14:59:47', '2016-09-28 14:59:47', 0),
(49, 48, '2. Chi phí xây dựng cơ bản dở dang', NULL, 1, 47, 4, '2016-09-28 14:59:56', '2016-09-28 15:00:13', 0),
(50, 49, 'V. Các khoản đầu tư tài chính dài hạn', NULL, 1, 4, 3, '2016-09-28 15:00:35', '2016-09-28 15:00:35', 0),
(51, 50, '1. Đầu tư vào công ty con', NULL, 1, 50, 4, '2016-09-28 15:00:47', '2016-09-28 15:00:47', 0),
(52, 51, '2. Đầu tư vào công ty liên kết, liên doanh', NULL, 1, 50, 4, '2016-09-28 15:00:54', '2016-09-28 15:00:54', 0),
(53, 52, '3. Đầu tư khác vào công cụ vốn', NULL, 1, 50, 4, '2016-09-28 15:01:00', '2016-09-28 15:01:00', 0),
(54, 53, '4. Dự phòng giảm giá đầu tư tài chính dài hạn', NULL, 1, 50, 4, '2016-09-28 15:01:08', '2016-09-28 15:01:08', 0),
(55, 54, '5. Đầu tư nắm giữ đến ngày đáo hạn', NULL, 1, 50, 4, '2016-09-28 15:01:15', '2016-09-28 15:01:15', 0),
(56, 55, 'VI. Tổng tài sản dài hạn khác', NULL, 1, 4, 3, '2016-09-28 15:01:30', '2016-09-28 15:01:30', 0),
(57, 56, '1. Chi phí trả trước dài hạn', NULL, 1, 56, 4, '2016-09-28 15:01:41', '2016-09-28 15:01:41', 0),
(58, 57, '2. Tài sản Thuế thu nhập hoãn lại', NULL, 1, 56, 4, '2016-09-28 15:01:48', '2016-09-28 15:01:48', 0),
(59, 58, '3. Tài sản dài hạn khác', NULL, 1, 56, 4, '2016-09-28 15:01:53', '2016-09-28 15:01:53', 0),
(60, 59, 'VII. Lợi thế thương mại', NULL, 1, 4, 3, '2016-09-28 15:02:03', '2016-09-28 15:02:03', 0),
(61, 60, 'A. Nợ phải trả', NULL, 1, 2, 2, '2016-09-28 15:02:20', '2016-09-28 15:02:20', 0),
(62, 61, 'I. Nợ ngắn hạn', NULL, 1, 61, 3, '2016-09-28 15:02:30', '2016-09-28 15:02:30', 0),
(63, 62, '1. Vay và nợ thuê tài chính ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:02:40', '2016-09-28 15:02:40', 0),
(64, 63, '2. Vay và nợ dài hạn đến hạn phải trả', NULL, 1, 62, 4, '2016-09-28 15:02:45', '2016-09-28 15:02:45', 0),
(65, 64, '3. Phải trả người bán ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:02:50', '2016-09-28 15:02:50', 0),
(66, 65, '4. Người mua trả tiền trước', NULL, 1, 62, 4, '2016-09-28 15:02:56', '2016-09-28 15:02:56', 0),
(67, 66, '5. Thuế và các khoản phải nộp nhà nước', NULL, 1, 62, 4, '2016-09-28 15:03:02', '2016-09-28 15:03:02', 0),
(68, 67, '6. Phải trả người lao động', NULL, 1, 62, 4, '2016-09-28 15:03:09', '2016-09-28 15:03:09', 0),
(69, 68, '7. Chi phí phải trả ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:03:14', '2016-09-28 15:03:14', 0),
(70, 69, '8. Phải trả nội bộ ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:03:20', '2016-09-28 15:03:20', 0),
(71, 70, '9. Phải trả theo tiến độ kế hoạch hợp đồng xây dựng', NULL, 1, 62, 4, '2016-09-28 15:03:27', '2016-09-28 15:03:27', 0),
(72, 71, '10. Doanh thu chưa thực hiện ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:03:32', '2016-09-28 15:03:32', 0),
(73, 72, '11. Phải trả ngắn hạn khác', NULL, 1, 62, 4, '2016-09-28 15:03:38', '2016-09-28 15:03:38', 0),
(74, 73, '12. Dự phòng phải trả ngắn hạn', NULL, 1, 62, 4, '2016-09-28 15:03:43', '2016-09-28 15:03:43', 0),
(75, 74, '13. Quỹ khen thưởng phúc lợi', NULL, 1, 62, 4, '2016-09-28 15:03:48', '2016-09-28 15:03:48', 0),
(76, 75, '14. Quỹ bình ổn giá', NULL, 1, 62, 4, '2016-09-28 15:03:54', '2016-09-28 15:03:54', 0),
(77, 76, '15. Giao dịch mua bán lại trái phiếu chính phủ', NULL, 1, 62, 4, '2016-09-28 15:03:59', '2016-09-28 15:03:59', 0),
(78, 77, 'II. Nợ dài hạn', NULL, 1, 61, 3, '2016-09-28 15:04:23', '2016-09-28 15:04:23', 0),
(79, 78, '1. Phải trả người bán dài hạn', NULL, 1, 78, 4, '2016-09-28 15:04:32', '2016-09-28 15:04:32', 0),
(80, 79, '2. Chi phí phải trả dài hạn', NULL, 1, 78, 4, '2016-09-28 15:04:37', '2016-09-28 15:04:37', 0),
(81, 80, '3. Phải trả nội bộ về vốn kinh doanh', NULL, 1, 78, 4, '2016-09-28 15:04:43', '2016-09-28 15:04:43', 0),
(82, 81, '4. Phải trả nội bộ dài hạn', NULL, 1, 78, 4, '2016-09-28 15:04:50', '2016-09-28 15:04:50', 0),
(83, 82, '5. Phải trả dài hạn khác', NULL, 1, 78, 4, '2016-09-28 15:04:55', '2016-09-28 15:04:55', 0),
(84, 83, '6. Vay và nợ thuê tài chính dài hạn', NULL, 1, 78, 4, '2016-09-28 15:05:01', '2016-09-28 15:05:01', 0),
(85, 84, '7. Trái phiếu chuyển đổi', NULL, 1, 78, 4, '2016-09-28 15:05:06', '2016-09-28 15:05:06', 0),
(86, 85, '8. Thuế thu nhập hoãn lại phải trả', NULL, 1, 78, 4, '2016-09-28 15:05:12', '2016-09-28 15:05:12', 0),
(87, 86, '9. Dự phòng trợ cấp mất việc làm', NULL, 1, 78, 4, '2016-09-28 15:05:17', '2016-09-28 15:05:17', 0),
(88, 87, '10. Dự phòng phải trả dài hạn', NULL, 1, 78, 4, '2016-09-28 15:05:22', '2016-09-28 15:05:22', 0),
(89, 88, '11. Doanh thu chưa thực hiện dài hạn', NULL, 1, 78, 4, '2016-09-28 15:05:28', '2016-09-28 15:05:28', 0),
(90, 89, '12. Quỹ phát triển khoa học và công nghệ', NULL, 1, 78, 4, '2016-09-28 15:05:33', '2016-09-28 15:05:33', 0),
(91, 90, 'B. Nguồn vốn chủ sở hữu', NULL, 1, 2, 2, '2016-09-28 15:05:51', '2016-09-28 15:05:51', 0),
(92, 91, 'I. Vốn chủ sở hữu', NULL, 1, 91, 3, '2016-09-28 15:05:59', '2016-09-28 15:05:59', 0),
(93, 92, '1. Vốn đầu tư của chủ sở hữu', NULL, 1, 92, 4, '2016-09-28 15:06:06', '2016-09-28 15:06:06', 0),
(94, 93, 'II. Nguồn kinh phí và quỹ khác', NULL, 1, 91, 3, '2016-09-28 15:06:12', '2016-09-28 15:06:30', 0),
(95, 94, '2. Thặng dư vốn cổ phần', NULL, 1, 92, 4, '2016-09-28 15:06:37', '2016-09-28 15:06:37', 0),
(96, 95, '3. Quyền chọn chuyển đổi trái phiếu', NULL, 1, 92, 4, '2016-09-28 15:06:43', '2016-09-28 15:06:43', 0),
(97, 96, '4. Vốn khác của chủ sở hữu', NULL, 1, 92, 4, '2016-09-28 15:06:51', '2016-09-28 15:06:51', 0),
(98, 97, '5. Cổ phiếu quỹ', NULL, 1, 92, 4, '2016-09-28 15:06:59', '2016-09-28 15:06:59', 0),
(99, 98, '6. Chênh lệch đánh giá lại tài sản', NULL, 1, 92, 4, '2016-09-28 15:07:06', '2016-09-28 15:07:06', 0),
(100, 99, '7. Chênh lệch tỷ giá hối đoái', NULL, 1, 92, 4, '2016-09-28 15:07:11', '2016-09-28 15:07:22', 0),
(101, 100, '8. Quỹ đầu tư phát triển', NULL, 1, 92, 4, '2016-09-28 15:07:28', '2016-09-28 15:07:28', 0),
(102, 101, '9. Quỹ dự phòng tài chính', NULL, 1, 92, 4, '2016-09-28 15:07:33', '2016-09-28 15:07:33', 0),
(103, 102, '10. Quỹ khác thuộc vốn chủ sở hữu', NULL, 1, 92, 4, '2016-09-28 15:07:40', '2016-09-28 15:07:40', 0),
(104, 103, '11. Lợi nhuận sau thuế chưa phân phối', NULL, 1, 92, 4, '2016-09-28 15:07:48', '2016-09-28 15:07:48', 0),
(105, 104, '- LNST chưa phân phối lũy kế đến cuối kỳ trước', NULL, 1, 104, 5, '2016-09-28 15:08:01', '2016-09-28 15:08:01', 0),
(106, 105, '- LNST chưa phân phối kỳ này', NULL, 1, 104, 5, '2016-09-28 15:08:11', '2016-09-28 15:08:11', 0),
(107, 106, '12. Nguồn vốn đầu tư xây dựng cơ bản', NULL, 1, 92, 4, '2016-09-28 15:08:27', '2016-09-28 15:08:27', 0),
(108, 107, '13. Quỹ hỗ trợ sắp xếp doanh nghiệp', NULL, 1, 92, 4, '2016-09-28 15:08:33', '2016-09-28 15:08:33', 0),
(109, 108, '14. Lợi ích của cổ đông không kiểm soát', NULL, 1, 92, 4, '2016-09-28 15:08:40', '2016-09-28 15:08:40', 0),
(110, 109, '1. Nguồn kinh phí', NULL, 1, 94, 4, '2016-09-28 15:08:48', '2016-09-28 15:08:48', 0),
(111, 110, '2. Nguồn kinh phí đã hình thành tài sản cố định', NULL, 1, 94, 4, '2016-09-28 15:08:56', '2016-09-28 15:08:56', 0),
(112, 111, '3. Quỹ dự phòng trợ cấp mất việc làm', NULL, 1, 94, 4, '2016-09-28 15:09:01', '2016-09-28 15:09:01', 0),
(188, 112, '3. Tài sản cố định vô hình', NULL, 1, 37, 4, '2016-10-14 07:54:18', '2016-10-14 07:54:18', 0),
(189, 113, '- Nguyên giá', NULL, 1, 188, 5, '2016-10-14 07:54:29', '2016-10-14 07:54:29', 0),
(190, 114, '- Giá trị hao mòn lũy kế', NULL, 1, 188, 5, '2016-10-14 07:54:37', '2016-10-14 07:54:37', 0),
(220, 115, '6. Đầu tư dài hạn khác', '', 1, 50, 4, '2016-12-21 07:30:20', '2016-12-21 07:30:20', 0),
(113, 1, '1. Tổng doanh thu hoạt động kinh doanh', NULL, 2, 0, 1, '2016-09-28 15:19:48', '2016-09-28 15:19:48', 0),
(114, 2, '2. Các khoản giảm trừ doanh thu', NULL, 2, 0, 1, '2016-09-28 15:19:55', '2016-09-28 15:19:55', 0),
(115, 3, '3. Doanh thu thuần (1)-(2)', NULL, 2, 0, 1, '2016-09-28 15:20:43', '2016-09-28 15:20:43', 0),
(116, 4, '4. Giá vốn hàng bán', NULL, 2, 0, 1, '2016-09-28 15:20:48', '2016-09-28 15:20:48', 0),
(117, 5, '5. Lợi nhuận gộp (3)-(4)', NULL, 2, 0, 1, '2016-09-28 15:20:56', '2016-09-28 15:20:56', 0),
(118, 6, '6. Doanh thu hoạt động tài chính', NULL, 2, 0, 1, '2016-09-28 15:21:04', '2016-09-28 15:21:04', 0),
(119, 7, '7. Chi phí tài chính', NULL, 2, 0, 1, '2016-09-28 15:21:09', '2016-09-28 15:21:09', 0),
(120, 8, '-Trong đó: Chi phí lãi vay', NULL, 2, 119, 2, '2016-09-28 15:21:15', '2016-09-28 15:21:15', 0),
(121, 9, '8. Phần lợi nhuận hoặc lỗ trong công ty liên kết liên doanh', NULL, 2, 0, 1, '2016-09-28 15:21:22', '2016-09-28 15:21:22', 0),
(122, 10, '9. Chi phí bán hàng', NULL, 2, 0, 1, '2016-09-28 15:21:32', '2016-09-28 15:21:32', 0),
(123, 11, '10. Chi phí quản lý doanh nghiệp', NULL, 2, 0, 1, '2016-09-28 15:21:41', '2016-09-28 15:21:41', 0),
(124, 12, '11. Lợi nhuận thuần từ hoạt động kinh doanh (5)+(6)-(7)+(8)-(9)-(10)', NULL, 2, 0, 1, '2016-09-28 15:22:17', '2016-09-28 15:22:17', 0),
(125, 13, '12. Thu nhập khác', NULL, 2, 0, 1, '2016-09-28 15:22:23', '2016-09-28 15:22:23', 0),
(126, 14, '13. Chi phí khác', NULL, 2, 0, 1, '2016-09-28 15:22:31', '2016-09-28 15:22:31', 0),
(127, 15, '14. Lợi nhuận khác (12)-(13)', NULL, 2, 0, 1, '2016-09-28 15:22:36', '2016-09-28 15:22:36', 0),
(128, 16, '15. Tổng lợi nhuận kế toán trước thuế (11)+(14)', NULL, 2, 0, 1, '2016-09-28 15:25:00', '2016-09-28 15:25:00', 0),
(129, 17, '16. Chi phí thuế TNDN hiện hành', NULL, 2, 0, 1, '2016-09-28 15:25:14', '2016-09-28 15:25:14', 0),
(130, 18, '17. Chi phí thuế TNDN hoãn lại', NULL, 2, 0, 1, '2016-09-28 15:25:19', '2016-09-28 15:25:19', 0),
(131, 19, '18. Chi phí thuế TNDN (16)+(17)', NULL, 2, 0, 1, '2016-09-28 15:25:28', '2016-09-28 15:25:28', 0),
(132, 20, '19. Lợi nhuận sau thuế thu nhập doanh nghiệp (15)-(18)', NULL, 2, 0, 1, '2016-09-28 15:25:35', '2016-09-28 15:25:35', 0),
(133, 21, '20. Lợi nhuận sau thuế của cổ đông không kiểm soát', NULL, 2, 0, 1, '2016-09-28 15:25:40', '2016-09-28 15:25:40', 0),
(134, 22, '21. Lợi nhuận sau thuế của cổ đông của công ty mẹ (19)-(20)', NULL, 2, 0, 1, '2016-09-28 15:25:47', '2016-09-28 15:25:47', 0),
(135, 1, 'I. Lưu chuyển tiền từ hoạt động kinh doanh', NULL, 3, 0, 1, '2016-09-28 15:26:56', '2016-09-28 15:26:56', 0),
(136, 2, '1. Lợi nhuận trước thuế', NULL, 3, 135, 2, '2016-09-28 15:27:03', '2016-09-28 15:27:03', 0),
(137, 3, '2. Điều chỉnh cho các khoản', NULL, 3, 135, 2, '2016-09-28 15:27:10', '2016-09-28 15:27:10', 0),
(138, 4, '- Khấu hao TSCĐ', NULL, 3, 137, 3, '2016-09-28 15:27:17', '2016-09-28 15:27:17', 0),
(139, 5, '- Các khoản dự phòng', NULL, 3, 137, 3, '2016-09-28 15:27:22', '2016-09-28 15:27:22', 0),
(140, 6, '- Lợi nhuận thuần từ đầu tư vào công ty liên kết', NULL, 3, 137, 3, '2016-09-28 15:27:27', '2016-09-28 15:27:27', 0),
(141, 7, '- Xóa sổ tài sản cố định (thuần)', NULL, 3, 137, 3, '2016-09-28 15:27:32', '2016-09-28 15:27:32', 0),
(142, 8, '- Lãi, lỗ chênh lệch tỷ giá hối đoái chưa thực hiện', NULL, 3, 137, 3, '2016-09-28 15:27:39', '2016-09-28 15:27:39', 0),
(143, 9, '- Lãi, lỗ từ thanh lý TSCĐ', NULL, 3, 137, 3, '2016-09-28 15:27:44', '2016-09-28 15:27:44', 0),
(144, 10, '- Lãi, lỗ từ hoạt động đầu tư', NULL, 3, 137, 3, '2016-09-28 15:27:52', '2016-09-28 15:28:00', 0),
(145, 11, '- Lãi tiền gửi', NULL, 3, 137, 3, '2016-09-28 15:28:08', '2016-09-28 15:28:08', 0),
(146, 12, '- Thu nhập lãi', NULL, 3, 137, 3, '2016-09-28 15:28:13', '2016-09-28 15:28:13', 0),
(147, 13, '- Chi phí lãi vay', NULL, 3, 137, 3, '2016-09-28 15:28:18', '2016-09-28 15:28:18', 0),
(148, 14, '- Các khoản chi trực tiếp từ lợi nhuận', NULL, 3, 137, 3, '2016-09-28 15:28:24', '2016-09-28 15:28:24', 0),
(149, 15, '3. Lợi nhuận từ hoạt động kinh doanh trước thay đổi vốn lưu động', NULL, 3, 135, 2, '2016-09-28 15:28:44', '2016-09-28 15:28:44', 0),
(150, 16, '- Tăng, giảm các khoản phải thu', NULL, 3, 149, 3, '2016-09-28 15:28:56', '2016-09-28 15:28:56', 0),
(151, 17, '- Tăng, giảm hàng tồn kho', NULL, 3, 149, 3, '2016-09-28 15:29:02', '2016-09-28 15:29:02', 0),
(152, 18, '- Tăng, giảm các khoản phải trả (Không kể lãi vay phải trả, thuế thu nhập doanh nghiệp phải nộp)', NULL, 3, 149, 3, '2016-09-28 15:29:08', '2016-09-28 15:29:08', 0),
(153, 19, '- Tăng giảm chi phí trả trước', NULL, 3, 149, 3, '2016-09-28 15:29:15', '2016-09-28 15:29:15', 0),
(154, 20, '- Tăng giảm tài sản ngắn hạn khác', NULL, 3, 149, 3, '2016-09-28 15:29:21', '2016-09-28 15:29:21', 0),
(155, 21, '- Tiền lãi vay phải trả', NULL, 3, 149, 3, '2016-09-28 15:29:28', '2016-09-28 15:29:28', 0),
(156, 22, '- Thuế thu nhập doanh nghiệp đã nộp', NULL, 3, 149, 3, '2016-09-28 15:29:33', '2016-09-28 15:29:33', 0),
(157, 23, '- Tiền thu khác từ hoạt động kinh doanh', NULL, 3, 149, 3, '2016-09-28 15:29:40', '2016-09-28 15:29:40', 0),
(158, 24, '- Tiền chi khác từ hoạt động kinh doanh', NULL, 3, 149, 3, '2016-09-28 15:29:47', '2016-09-28 15:29:47', 0),
(159, 25, 'II. Lưu chuyển tiền từ hoạt động đầu tư', NULL, 3, 0, 1, '2016-09-28 15:30:02', '2016-09-28 15:30:02', 0),
(160, 26, '1. Tiền chi để mua sắm, xây dựng TSCĐ và các tài sản dài hạn khác', NULL, 3, 159, 2, '2016-09-28 15:30:19', '2016-09-28 15:30:19', 0),
(162, 27, '2. Tiền thu từ thanh lý, nhượng bán TSCĐ và các tài sản dài hạn khác', NULL, 3, 159, 2, '2016-09-28 15:30:42', '2016-09-28 15:30:42', 0),
(163, 28, '3. Tiền chi cho vay, mua các công cụ nợ của đơn vị khác', NULL, 3, 159, 2, '2016-09-28 15:30:47', '2016-09-28 15:30:47', 0),
(164, 29, '4. Tiền thu hồi cho vay, bán lại các công cụ nợ của các đơn vị khác', NULL, 3, 159, 2, '2016-09-28 15:30:53', '2016-09-28 15:30:53', 0),
(165, 30, '5. Đầu tư góp vốn vào công ty liên doanh liên kết', NULL, 3, 159, 2, '2016-09-28 15:30:59', '2016-09-28 15:30:59', 0),
(166, 31, '6. Chi đầu tư ngắn hạn', NULL, 3, 159, 2, '2016-09-28 15:31:04', '2016-09-28 15:31:04', 0),
(167, 32, '7. Tiền chi đầu tư góp vốn vào đơn vị khác', NULL, 3, 159, 2, '2016-09-28 15:31:13', '2016-09-28 15:31:13', 0),
(168, 33, '8. Tiền thu hồi đầu tư góp vốn vào đơn vị khác', NULL, 3, 159, 2, '2016-09-28 15:31:22', '2016-09-28 15:31:22', 0),
(169, 34, '9. Lãi tiền gửi đã thu', NULL, 3, 159, 2, '2016-09-28 15:31:27', '2016-09-28 15:31:27', 0),
(170, 35, '10. Tiền thu lãi cho vay, cổ tức và lợi nhuận được chia', NULL, 3, 159, 2, '2016-09-28 15:31:33', '2016-09-28 15:31:33', 0),
(171, 36, '11. Tiền chi mua lại phần vốn góp của các cổ đông thiểu số', NULL, 3, 159, 2, '2016-09-28 15:31:40', '2016-09-28 15:31:40', 0),
(172, 37, 'III. Lưu chuyển tiền từ hoạt động tài chính', NULL, 3, 0, 1, '2016-09-28 15:31:54', '2016-09-28 15:31:54', 0),
(173, 38, '1. Tiền thu từ phát hành cổ phiếu, nhận vốn góp của chủ sở hữu', NULL, 3, 172, 2, '2016-09-28 15:32:03', '2016-09-28 15:32:03', 0),
(174, 39, '2. Tiền chi trả vốn góp cho các chủ sở hữu, mua lại cổ phiếu của doanh nghiệp đã phát hành', NULL, 3, 172, 2, '2016-09-28 15:32:09', '2016-09-28 15:32:09', 0),
(175, 40, '3. Tiền vay ngắn hạn, dài hạn nhận được', NULL, 3, 172, 2, '2016-09-28 15:32:15', '2016-09-28 15:32:15', 0),
(176, 41, '4. Tiền chi trả nợ gốc vay', NULL, 3, 172, 2, '2016-09-28 15:32:21', '2016-09-28 15:32:21', 0),
(177, 42, '5. Tiền chi trả nợ thuê tài chính', NULL, 3, 172, 2, '2016-09-28 15:32:25', '2016-09-28 15:32:25', 0),
(178, 43, '6. Tiền chi khác từ hoạt động tài chính', NULL, 3, 172, 2, '2016-09-28 15:32:30', '2016-09-28 15:32:30', 0),
(179, 44, '7. Tiền chi trả từ cổ phần hóa', NULL, 3, 172, 2, '2016-09-28 15:32:34', '2016-09-28 15:32:34', 0),
(180, 45, '8. Cổ tức, lợi nhuận đã trả cho chủ sở hữu', NULL, 3, 172, 2, '2016-09-28 15:32:38', '2016-09-28 15:32:38', 0),
(181, 46, '9. Vốn góp của các cổ đông thiểu số vào các công ty con', NULL, 3, 172, 2, '2016-09-28 15:32:45', '2016-09-28 15:32:45', 0),
(182, 47, '10. Chi tiêu quỹ phúc lợi xã hội', NULL, 3, 172, 2, '2016-09-28 15:32:49', '2016-09-28 15:32:49', 0),
(184, 48, 'Lưu chuyển tiền thuần trong kỳ', NULL, 3, 0, 1, '2016-09-28 15:33:14', '2016-09-28 15:33:14', 0),
(185, 49, 'Tiền và tương đương tiền đầu kỳ', NULL, 3, 0, 1, '2016-09-28 15:33:23', '2016-09-28 15:33:23', 0),
(186, 50, 'Ảnh hưởng của thay đổi tỷ giá hối đoái quy đổi ngoại tệ', NULL, 3, 0, 1, '2016-09-28 15:33:30', '2016-09-28 15:33:30', 0),
(187, 51, 'Tiền và tương đương tiền cuối kỳ', NULL, 3, 0, 1, '2016-09-28 15:33:35', '2016-09-28 15:33:35', 0),
(191, 1, 'ĐỊNH GIÁ', NULL, 4, 0, 1, '2016-11-02 07:45:05', '2016-11-02 07:45:05', 0),
(192, 2, 'Thị giá vốn', 'Giá trị vốn hoá thị trường là tổng giá trị của một công ty tính theo thị giá. Nó được tính bằng cách nhân tổng số cổ phiếu lưu hành với giá hiện hành của cổ phiếu.', 4, 191, 2, '2016-11-02 07:46:31', '2016-11-02 08:05:14', 0),
(193, 3, 'P/E', 'P/E là tỷ lệ giữa giá thị trường và lợi nhuận ròng trên mỗi cổ phần của một công ty', 4, 191, 2, '2016-11-02 08:05:30', '2016-11-02 08:05:30', 0),
(194, 4, 'P/S', 'Hệ số giá trên doanh thu của mỗi cổ phiếu cho biết nhà đầu tư trả giá cao hơn gấp bao nhiêu lần doanh thu của một cổ phiếu.', 4, 191, 2, '2016-11-02 08:05:48', '2016-11-02 08:05:48', 0),
(195, 5, 'P/B', 'Hệ số giá thị trường trên giá trị sổ sách được sử dụng để so sánh giá thị trường của một cổ phiếu so với giá trị sổ sách của cổ phiếu đó.', 4, 191, 2, '2016-11-02 08:06:35', '2016-11-02 08:06:35', 0),
(196, 6, 'EPS', 'Lợi nhuận trên mỗi cổ phiếu', 4, 191, 2, '2016-11-02 08:06:44', '2016-11-02 08:06:44', 0),
(197, 7, 'SỨC MẠNH TÀI CHÍNH', '', 4, 0, 1, '2016-11-02 08:06:59', '2016-11-02 08:06:59', 0),
(198, 8, 'Thanh toán nhanh', 'Hệ số khả năng thanh toán nhanh= (tài sản lưu động và đầu tư ngắn hạn - hàng tồn kho):  nợ ngắn hạn', 4, 197, 2, '2016-11-02 08:07:16', '2016-12-12 03:46:04', 0),
(199, 9, 'Thanh toán hiện hành', 'Hệ số khả năng thanh toán hiện hành= tài sản lưu động và đầu tư ngắn hạn : nợ ngắn hạn.', 4, 197, 2, '2016-11-02 08:07:28', '2016-12-12 03:46:17', 0),
(200, 10, 'Tổng nợ/Vốn CSH (%)', 'Hệ số tổng nợ trên vốn chủ sở hữu', 4, 197, 2, '2016-11-02 08:07:41', '2016-11-16 09:20:53', 0),
(201, 11, 'Tổng nợ/Tổng tài sản (%)', 'Hệ số tổng nợ trên tổng tài sản', 4, 197, 2, '2016-11-02 08:07:51', '2016-11-16 09:21:00', 0),
(202, 12, 'KHẢ NĂNG HOẠT ĐỘNG', '', 4, 0, 1, '2016-11-02 08:10:44', '2016-11-02 08:14:04', 0),
(203, 13, 'Vòng quay tổng tài sản', 'Hệ số vòng quay tổng tài sản =doanh thu thuần : tổng tài sản bình quân', 4, 202, 2, '2016-11-02 08:10:56', '2016-12-12 03:46:45', 0),
(204, 14, 'Vòng quay hàng tồn kho', 'Hệ số vòng quay hàng tồn kho = giá vốn hàng bán : bình quân hàng tồn kho', 4, 202, 2, '2016-11-02 08:11:06', '2016-12-12 03:47:02', 0),
(205, 15, 'Vòng quay các khoản phải thu', 'Hệ số vòng quay các khoản phải thu =  doanh thu : bình quân các khoản phải thu', 4, 202, 2, '2016-11-02 08:11:17', '2016-12-12 03:47:24', 0),
(206, 16, 'KHẢ NĂNG SINH LỜI', '', 4, 0, 1, '2016-11-02 08:11:39', '2016-11-02 08:14:15', 0),
(207, 17, 'Tỷ lệ lãi gộp GOS (%)', 'Hệ số biên lợi nhuận gộp = lợi nhuận gộp : doanh thu.', 4, 206, 2, '2016-11-02 08:12:05', '2016-12-13 03:53:00', 0),
(208, 18, 'Tỷ lệ EBIT (%)', 'Hệ số biên lợi nhuận hoạt động = lợi nhuận trước thuế và lãi vay : doanh thu', 4, 206, 2, '2016-11-02 08:12:15', '2016-12-12 03:48:03', 0),
(209, 19, 'Tỷ lệ EBITDA (%)', 'Tỷ lệ EBITDA = (Lợi nhuận trước thuế + lãi vay + khấu hao) : doanh thu', 4, 206, 2, '2016-11-02 08:12:27', '2016-12-12 03:48:27', 0),
(210, 20, 'HIỆU QUẢ QUẢN LÝ', '', 4, 0, 1, '2016-11-02 08:12:51', '2016-11-02 08:14:27', 0),
(211, 21, 'ROA (%)', 'ROA thể hiện tương quan giữa mức sinh lợi của một công ty so với tài sản của nó. ROA = thu nhập ròng : tổng tài sản.', 4, 210, 2, '2016-11-02 08:12:57', '2016-12-12 03:49:06', 0),
(212, 22, 'ROE (%)', 'ROE thể hiện tương quan giữa mức sinh lợi của một công ty so với vốn chủ sở hữu của nó. ROE = thu nhập ròng : vốn chủ sở hữu.', 4, 210, 2, '2016-11-02 08:13:08', '2016-12-12 03:49:20', 0),
(213, 23, 'ROS (%)', 'Hệ số lợi nhuận trên doanh thu thuần = Lợi nhuận sau thuế : Doanh thu thuần', 4, 210, 2, '2016-11-02 08:13:19', '2016-11-25 07:40:45', 0),
(216, 24, 'Book value (B)', 'Giá trị sổ sách/cổ phiếu= (Vốn chủ sở hữu - TSVH) : số lượng cổ phiếu lưu hành', 4, 191, 2, '2016-11-25 07:42:51', '2016-11-25 07:42:51', 0),
(214, 25, 'Tỷ lệ lãi ròng (%)', 'Tỷ lệ lãi ròng = lợi nhuận sau thuế : doanh thu.', 4, 206, 2, '2016-11-02 08:45:58', '2016-12-12 03:48:46', 0),
(217, 26, 'Tỷ suẩt cổ tức', 'Hệ số cổ tức cổ đông nhận được trên mệnh giá của cổ phiếu', 4, 191, 2, '2016-11-25 08:11:30', '2016-11-25 08:11:30', 0),
(218, 27, 'Thanh toán bằng tiền mặt', 'Được tính bằng = (Tiền và các khoản tương đương tiền) : nợ ngắn hạn', 4, 197, 2, '2016-11-25 08:19:06', '2016-11-25 08:19:06', 0),
(219, 28, 'Khả năng thanh toán lãi vay', 'Được tính bằng = Lãi trước thuế và lãi vay : lãi vay', 4, 197, 2, '2016-11-25 08:22:46', '2016-11-25 08:22:46', 0);

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
(1, 'Dầu khí', 0, '2016-10-05 08:29:26', '2016-11-23 03:58:45'),
(2, 'Vật liệu cơ bản', 0, '2016-10-05 08:33:04', '2016-10-05 08:33:04'),
(3, 'Công nghiệp', 0, '2016-10-05 08:33:12', '2016-10-05 08:33:12'),
(4, 'Hàng tiêu dùng', 0, '2016-10-05 08:33:21', '2016-10-05 08:33:21'),
(5, 'Y tế', 0, '2016-10-05 08:33:32', '2016-10-05 08:33:32'),
(6, 'Dịch vụ tiêu dùng', 0, '2016-10-05 08:33:42', '2016-10-05 08:33:42'),
(7, 'Viễn thông', 0, '2016-10-05 08:33:49', '2016-10-05 08:33:49'),
(8, 'Các dịch vụ hạ tầng', 0, '2016-10-05 08:33:59', '2016-10-05 08:33:59'),
(9, 'Tài chính', 0, '2016-10-05 08:34:06', '2016-10-05 08:34:06'),
(10, 'Công nghệ', 0, '2016-10-05 08:34:13', '2016-10-05 08:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(265) CHARACTER SET utf8 NOT NULL,
  `password` varchar(265) CHARACTER SET utf8 NOT NULL,
  `login_hash` varchar(265) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `login_hash`, `name`, `del`, `created_date`, `updated_date`) VALUES
(1, 'tranphan2508@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'ed19e05cf49e11410effa41986ffe401', 'Tran Phan', 0, '2016-11-23 00:00:00', '2017-02-22 07:26:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`);

--
-- Indexes for table `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_statement`
--
ALTER TABLE `income_statement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`);

--
-- Indexes for table `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `cashflow`
--
ALTER TABLE `cashflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `income_statement`
--
ALTER TABLE `income_statement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
