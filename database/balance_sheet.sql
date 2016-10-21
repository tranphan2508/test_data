-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2016 at 09:18 AM
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
-- Table structure for table `balance_sheet`
--

CREATE TABLE `balance_sheet` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `year` smallint(6) NOT NULL,
  `param_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_sheet`
--

INSERT INTO `balance_sheet` (`id`, `company_id`, `year`, `param_id`, `value`, `del`, `created_date`, `updated_date`) VALUES
(80, 1, 2015, 5, '163218530205', 0, '2016-10-19 01:40:31', '2016-10-20 06:59:09'),
(95, 1, 2015, 190, '-2500000000', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(94, 1, 2015, 189, '106081102933', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(93, 1, 2015, 40, '-44782211088', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(92, 1, 2015, 39, '2528706399042', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(91, 1, 2015, 35, '67066760000', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(84, 1, 2015, 21, '1609223283449', 0, '2016-10-19 02:07:04', '2016-10-19 02:16:27'),
(90, 1, 2015, 27, '944069025', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(89, 1, 2015, 26, '134370552777', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(88, 1, 2015, 25, '32070169390', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(87, 1, 2015, 23, '620122747252', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(86, 1, 2015, 7, '3671494351441', 0, '2016-10-19 02:07:04', '2016-10-19 02:16:27'),
(85, 1, 2015, 22, '-546997074', 0, '2016-10-19 02:07:04', '2016-10-19 02:16:27'),
(83, 1, 2015, 17, '894641452058', 0, '2016-10-19 02:07:04', '2016-10-19 02:16:27'),
(79, 1, 2015, 3, '4622220420090', 0, '2016-10-19 01:40:31', '2016-10-20 06:59:09'),
(78, 1, 2015, 1, '9814813244921', 0, '2016-10-19 01:40:31', '2016-10-20 06:59:09'),
(81, 1, 2015, 12, '134442770000', 0, '2016-10-19 02:04:07', '2016-10-19 02:16:27'),
(82, 1, 2015, 16, '1168176613008', 0, '2016-10-19 02:07:04', '2016-10-19 02:16:27'),
(77, 1, 2015, 11, '28775760205', 0, '2016-10-19 01:40:31', '2016-10-20 06:59:09'),
(96, 1, 2015, 45, '653793041233', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(97, 1, 2015, 46, '-7636145238', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(98, 1, 2015, 49, '1086227521015', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(99, 1, 2015, 4, '5192592824831', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(100, 1, 2015, 8, '620122747252', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(101, 1, 2015, 9, '167384791192', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(102, 1, 2015, 30, '67066760000', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(103, 1, 2015, 37, '2587505290887', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(104, 1, 2015, 38, '2483924187954', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(105, 1, 2015, 44, '646156895995', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(106, 1, 2015, 47, '1086227521015', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(107, 1, 2015, 188, '103581102933', 0, '2016-10-19 02:10:35', '2016-10-19 02:16:27'),
(108, 1, 2015, 52, '208675618910', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(109, 1, 2015, 53, '376700000000', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(110, 1, 2015, 57, '30428020631', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(111, 1, 2015, 58, '765015123', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(112, 1, 2015, 60, '189067702270', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(113, 1, 2015, 50, '585375618910', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(114, 1, 2015, 56, '31193035754', 0, '2016-10-19 02:11:33', '2016-10-19 02:16:27'),
(115, 1, 2015, 63, '259730500711', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(116, 1, 2015, 65, '780096277608', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(117, 1, 2015, 66, '179150192090', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(118, 1, 2015, 67, '352630294690', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(119, 1, 2015, 68, '14996297706', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(120, 1, 2015, 69, '371156763998', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(121, 1, 2015, 72, '996000000', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(122, 1, 2015, 73, '420312538651', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(123, 1, 2015, 75, '61399180', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(124, 1, 2015, 83, '2666000000', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(125, 1, 2015, 84, '1142477056887', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(126, 1, 2015, 85, '0', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(127, 1, 2015, 86, '5510042597', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(128, 1, 2015, 89, '53918764702', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(129, 1, 2015, 93, '5298715330000', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(130, 1, 2015, 95, '23967378437', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(131, 1, 2015, 101, '7344810719', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(132, 1, 2015, 103, '118623112', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(133, 1, 2015, 105, '-3028254203', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(134, 1, 2015, 106, '902186066807', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(135, 1, 2015, 109, '1807161229', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(136, 1, 2015, 2, '9814813244921', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(137, 1, 2015, 61, '3583702128820', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(138, 1, 2015, 62, '2379130264634', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(139, 1, 2015, 78, '1204571864186', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(140, 1, 2015, 91, '6231111116101', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(141, 1, 2015, 92, '6231111116101', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(142, 1, 2015, 104, '899157812604', 0, '2016-10-19 02:16:27', '2016-10-19 02:16:27'),
(143, 1, 2014, 11, '286359148199', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(144, 1, 2014, 12, '277500000000', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(145, 1, 2014, 13, '1745545987900', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(146, 1, 2014, 16, '444823019406', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(147, 1, 2014, 17, '634954186866', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(148, 1, 2014, 21, '25143035102', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(149, 1, 2014, 22, '-444897074', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(150, 1, 2014, 23, '43286057749', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(151, 1, 2014, 25, '4543760204', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(152, 1, 2014, 26, '23333787879', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(153, 1, 2014, 27, '0', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(154, 1, 2014, 35, '0', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(155, 1, 2014, 39, '49584162574', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(156, 1, 2014, 40, '-13466823835', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(157, 1, 2014, 189, '105868390933', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(158, 1, 2014, 190, '-2500000000', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(159, 1, 2014, 45, '373757641233', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(160, 1, 2014, 46, '0', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(161, 1, 2014, 49, '465925446431', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(162, 1, 2014, 1, '5403551975381', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(163, 1, 2014, 3, '3589787525097', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(164, 1, 2014, 4, '1813764450284', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(165, 1, 2014, 5, '563859148199', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(166, 1, 2014, 6, '1745545987900', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(167, 1, 2014, 7, '1104475344300', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(168, 1, 2014, 8, '43286057749', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(169, 1, 2014, 9, '132620986949', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(170, 1, 2014, 30, '0', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(171, 1, 2014, 37, '139485729672', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(172, 1, 2014, 38, '36117338739', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(173, 1, 2014, 44, '373757641233', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(174, 1, 2014, 47, '465925446431', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(175, 1, 2014, 188, '103368390933', 0, '2016-10-19 07:21:20', '2016-10-19 07:46:10'),
(176, 1, 2014, 29, '104743438866', 0, '2016-10-19 07:23:57', '2016-10-19 07:46:10'),
(177, 1, 2014, 52, '460192426230', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(178, 1, 2014, 53, '150985854066', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(179, 1, 2014, 57, '12468449109', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(180, 1, 2014, 58, '137916295', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(181, 1, 2014, 59, '422575200', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(182, 1, 2014, 60, '210388412048', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(183, 1, 2014, 50, '611178280296', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(184, 1, 2014, 56, '13028940604', 0, '2016-10-19 07:26:22', '2016-10-19 07:46:10'),
(185, 1, 2014, 63, '6816750000', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(186, 1, 2014, 65, '215249390832', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(187, 1, 2014, 66, '585022170', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(188, 1, 2014, 67, '138106629670', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(189, 1, 2014, 68, '3033949179', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(190, 1, 2014, 69, '32834860621', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(191, 1, 2014, 70, '15397800', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(192, 1, 2014, 73, '192173090585', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(193, 1, 2014, 75, '548486380', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(194, 1, 2014, 2, '5403551975381', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(195, 1, 2014, 61, '1487847367158', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(196, 1, 2014, 62, '589363577237', 0, '2016-10-19 07:37:52', '2016-10-19 07:46:10'),
(197, 1, 2014, 83, '2726000000', 0, '2016-10-19 07:40:11', '2016-10-19 07:46:10'),
(198, 1, 2014, 84, '847399100000', 0, '2016-10-19 07:40:11', '2016-10-19 07:46:10'),
(199, 1, 2014, 89, '48358689921', 0, '2016-10-19 07:40:11', '2016-10-19 07:46:10'),
(200, 1, 2014, 78, '898483789921', 0, '2016-10-19 07:40:11', '2016-10-19 07:46:10'),
(201, 1, 2014, 93, '3148938820000', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(202, 1, 2014, 95, '413711378437', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(203, 1, 2014, 101, '6415289973', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(204, 1, 2014, 102, '1510920746', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(205, 1, 2014, 103, '709106912', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(206, 1, 2014, 91, '3915704608223', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(207, 1, 2014, 92, '3915704608223', 0, '2016-10-19 07:41:34', '2016-10-19 07:46:10'),
(208, 1, 2014, 106, '343299749950', 0, '2016-10-19 07:44:18', '2016-10-19 07:46:10'),
(209, 1, 2014, 104, '343299749950', 0, '2016-10-19 07:44:18', '2016-10-19 07:46:10'),
(210, 1, 2014, 109, '1119342205', 0, '2016-10-19 07:46:10', '2016-10-19 07:46:10'),
(211, 1, 2013, 11, '12442080454', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(212, 1, 2013, 12, '500000000', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(213, 1, 2013, 13, '349962677900', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(214, 1, 2013, 15, '0', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(215, 1, 2013, 16, '428964496957', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(216, 1, 2013, 17, '57537900404', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(217, 1, 2013, 21, '27525805863', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(218, 1, 2013, 22, '-146203712', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(219, 1, 2013, 23, '92083462034', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(220, 1, 2013, 25, '7030439837', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(221, 1, 2013, 26, '2368780798', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(222, 1, 2013, 27, '1067363', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(223, 1, 2013, 29, '9350564813', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(224, 1, 2013, 1, '2100861485631', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(225, 1, 2013, 3, '987621072711', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(226, 1, 2013, 5, '12942080454', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(227, 1, 2013, 6, '349962677900', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(228, 1, 2013, 7, '513881999512', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(229, 1, 2013, 8, '92083462034', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(230, 1, 2013, 9, '18750852811', 0, '2016-10-19 08:13:47', '2016-10-19 08:18:06'),
(231, 1, 2013, 39, '142118229222', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(232, 1, 2013, 40, '-14662400693', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(233, 1, 2013, 189, '91550455390', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(234, 1, 2013, 45, '373757641233', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(235, 1, 2013, 49, '50065579980', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(236, 1, 2013, 52, '442054476184', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(237, 1, 2013, 53, '5500000000', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(238, 1, 2013, 57, '7176787603', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(239, 1, 2013, 58, '10944950362', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(240, 1, 2013, 59, '407940000', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(241, 1, 2013, 60, '4326753639', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(242, 1, 2013, 4, '1113240412920', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(243, 1, 2013, 37, '219006283919', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(244, 1, 2013, 38, '127455828529', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(245, 1, 2013, 44, '373757641233', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(246, 1, 2013, 47, '50065579980', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(247, 1, 2013, 50, '447554476184', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(248, 1, 2013, 56, '18529677965', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(249, 1, 2013, 188, '91550455390', 0, '2016-10-19 08:15:48', '2016-10-19 08:18:06'),
(250, 1, 2013, 63, '115392186085', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(251, 1, 2013, 65, '381435356623', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(252, 1, 2013, 66, '5727781772', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(253, 1, 2013, 67, '80318000885', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(254, 1, 2013, 68, '2173325173', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(255, 1, 2013, 69, '57312569538', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(256, 1, 2013, 73, '65681939980', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(257, 1, 2013, 75, '1090466480', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(258, 1, 2013, 83, '960000000', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(259, 1, 2013, 84, '58319933322', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(260, 1, 2013, 89, '68169622418', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(261, 1, 2013, 93, '771800000000', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(262, 1, 2013, 95, '413961378437', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(263, 1, 2013, 101, '6415289973', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(264, 1, 2013, 102, '1510920746', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(265, 1, 2013, 103, '709106912', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(266, 1, 2013, 106, '63779569670', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(267, 1, 2013, 109, '6104037617', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(268, 1, 2013, 2, '2100861485631', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(269, 1, 2013, 61, '836581182276', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(270, 1, 2013, 62, '709131626536', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(271, 1, 2013, 78, '127449555740', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(272, 1, 2013, 91, '1264280303355', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(273, 1, 2013, 92, '1264280303355', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(274, 1, 2013, 104, '63779569670', 0, '2016-10-19 08:18:06', '2016-10-19 08:18:06'),
(275, 1, 2012, 11, '6591266338', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(276, 1, 2012, 13, '709992490000', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(277, 1, 2012, 14, '-1100000000', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(278, 1, 2012, 16, '455616927368', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(279, 1, 2012, 17, '86809156324', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(280, 1, 2012, 21, '263389118', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(281, 1, 2012, 23, '2210936480', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(282, 1, 2012, 25, '736370718', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(283, 1, 2012, 26, '1566661353', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(284, 1, 2012, 29, '14439996482', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(285, 1, 2012, 39, '22776149234', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(286, 1, 2012, 40, '-5574039119', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(287, 1, 2012, 189, '75742178933', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(288, 1, 2012, 45, '373757641233', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(289, 1, 2012, 49, '213124623580', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(290, 1, 2012, 52, '147725898358', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(291, 1, 2012, 57, '4065939284', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(292, 1, 2012, 58, '9657528145', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(293, 1, 2012, 59, '407940000', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(294, 1, 2012, 60, '4841521564', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(295, 1, 2012, 1, '2123652575393', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(296, 1, 2012, 3, '1277127194181', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(297, 1, 2012, 4, '846525381212', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(298, 1, 2012, 5, '6591266338', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(299, 1, 2012, 6, '708892490000', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(300, 1, 2012, 7, '542689472810', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(301, 1, 2012, 8, '2210936480', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(302, 1, 2012, 9, '16743028553', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(303, 1, 2012, 37, '92944289048', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(304, 1, 2012, 38, '17202110115', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(305, 1, 2012, 44, '373757641233', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(306, 1, 2012, 47, '213124623580', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(307, 1, 2012, 50, '147725898358', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(308, 1, 2012, 56, '14131407429', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(309, 1, 2012, 188, '75742178933', 0, '2016-10-19 08:30:02', '2016-10-19 08:31:29'),
(310, 1, 2012, 63, '191940297825', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(311, 1, 2012, 65, '456725114278', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(312, 1, 2012, 66, '437405085', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(313, 1, 2012, 67, '49263933636', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(314, 1, 2012, 68, '1504561068', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(315, 1, 2012, 69, '583780000', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(316, 1, 2012, 73, '27720000371', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(317, 1, 2012, 75, '639234125', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(318, 1, 2012, 83, '530000000', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(319, 1, 2012, 84, '103568787330', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(320, 1, 2012, 89, '85564504346', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(321, 1, 2012, 93, '771800000000', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(322, 1, 2012, 95, '413745800523', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(323, 1, 2012, 101, '4028264228', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(324, 1, 2012, 102, '658411551', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(325, 1, 2012, 103, '368103234', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(326, 1, 2012, 106, '8525091946', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(327, 1, 2012, 109, '6049285847', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(328, 1, 2012, 2, '2123652575393', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(329, 1, 2012, 61, '918477618064', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(330, 1, 2012, 62, '728814326388', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(331, 1, 2012, 78, '189663291676', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(332, 1, 2012, 91, '1205174957329', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(333, 1, 2012, 92, '1205174957329', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(334, 1, 2012, 104, '8525091946', 0, '2016-10-19 08:31:29', '2016-10-19 08:31:29'),
(335, 1, 2011, 11, '634156486', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(336, 1, 2011, 13, '139940002000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(337, 1, 2011, 16, '63876304736', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(338, 1, 2011, 17, '4768942490', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(339, 1, 2011, 21, '4750490393', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(340, 1, 2011, 23, '2047117570', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(341, 1, 2011, 25, '534705795', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(342, 1, 2011, 26, '2089864495', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(343, 1, 2011, 29, '8882568265', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(344, 1, 2011, 39, '29599676959', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(345, 1, 2011, 40, '-4034551651', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(346, 1, 2011, 49, '2459411567', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(347, 1, 2011, 52, '159272831926', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(348, 1, 2011, 57, '3410351172', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(349, 1, 2011, 59, '203497512', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(350, 1, 2011, 60, '32793962531', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(351, 1, 2011, 63, '135142000000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(352, 1, 2011, 65, '64896414145', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(353, 1, 2011, 66, '538544304', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(354, 1, 2011, 67, '5587691715', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(355, 1, 2011, 68, '1016080604', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(356, 1, 2011, 69, '145442908', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(357, 1, 2011, 73, '16309150180', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(358, 1, 2011, 75, '467441850', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(359, 1, 2011, 84, '1508000000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(360, 1, 2011, 87, '329205775', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(361, 1, 2011, 93, '170000000000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(362, 1, 2011, 95, '42000000000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(363, 1, 2011, 97, '1243883693', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(364, 1, 2011, 101, '4339235151', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(365, 1, 2011, 102, '1280353399', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(366, 1, 2011, 103, '368103234', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(367, 1, 2011, 106, '2143780626', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(368, 1, 2011, 1, '451229332246', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(369, 1, 2011, 2, '451229332246', 0, '2016-10-20 07:57:56', '2016-10-20 07:59:16'),
(370, 1, 2011, 3, '227524152230', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(371, 1, 2011, 4, '223705180016', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(372, 1, 2011, 5, '634156486', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(373, 1, 2011, 6, '139940002000', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(374, 1, 2011, 7, '73395737619', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(375, 1, 2011, 8, '2047117570', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(376, 1, 2011, 9, '11507138555', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(377, 1, 2011, 37, '25565125308', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(378, 1, 2011, 38, '25565125308', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(379, 1, 2011, 47, '2459411567', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(380, 1, 2011, 50, '159272831926', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(381, 1, 2011, 56, '3613848684', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(382, 1, 2011, 61, '225939971481', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(383, 1, 2011, 62, '224102765706', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(384, 1, 2011, 78, '1837205775', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(385, 1, 2011, 91, '225289360765', 0, '2016-10-20 07:57:56', '2016-10-20 07:59:16'),
(386, 1, 2011, 92, '225289360765', 0, '2016-10-20 07:57:56', '2016-10-20 07:59:16'),
(387, 1, 2011, 104, '2143780626', 0, '2016-10-20 07:57:56', '2016-10-20 07:57:56'),
(388, 1, 2011, 109, '3914004662', 0, '2016-10-20 07:59:16', '2016-10-20 07:59:16'),
(389, 1, 2010, 11, '4355914330', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(390, 1, 2010, 13, '148020480000', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(391, 1, 2010, 14, '-2480000', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(392, 1, 2010, 15, '0', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(393, 1, 2010, 16, '10559713982', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(394, 1, 2010, 17, '154455000', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(395, 1, 2010, 20, '6382133333', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(396, 1, 2010, 23, '352468928', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(397, 1, 2010, 25, '663059437', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(398, 1, 2010, 26, '1331724553', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(399, 1, 2010, 29, '4960522837', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(400, 1, 2010, 35, '3580649191', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(401, 1, 2010, 39, '14340588058', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(402, 1, 2010, 40, '-1522398793', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(403, 1, 2010, 49, '5946527443', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(404, 1, 2010, 57, '1522532828', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(405, 1, 2010, 59, '203497512', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(406, 1, 2010, 60, '34985176047', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(407, 1, 2010, 1, '235834564686', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(408, 1, 2010, 3, '176777992400', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(409, 1, 2010, 4, '59056572286', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(410, 1, 2010, 5, '4355914330', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(411, 1, 2010, 6, '148018000000', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(412, 1, 2010, 7, '17096302315', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(413, 1, 2010, 8, '352468928', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(414, 1, 2010, 9, '6955306827', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(415, 1, 2010, 30, '3580649191', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(416, 1, 2010, 37, '12818189265', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(417, 1, 2010, 38, '12818189265', 0, '2016-10-20 08:19:00', '2016-10-20 08:28:18'),
(418, 1, 2010, 47, '5946527443', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(419, 1, 2010, 56, '1726030340', 0, '2016-10-20 08:19:00', '2016-10-20 08:19:00'),
(420, 1, 2010, 63, '908886510', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(421, 1, 2010, 65, '1437634100', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(422, 1, 2010, 66, '49818974', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(423, 1, 2010, 67, '2820163645', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(424, 1, 2010, 68, '1890806729', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(425, 1, 2010, 69, '7415300', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(426, 1, 2010, 70, '0', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(427, 1, 2010, 71, '8203941684', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(428, 1, 2010, 72, '0', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(429, 1, 2010, 73, '0', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(430, 1, 2010, 93, '170000000000', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(431, 1, 2010, 95, '42000000000', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(432, 1, 2010, 101, '77794918', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(433, 1, 2010, 103, '38897459', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(434, 1, 2010, 106, '7404304376', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(435, 1, 2010, 109, '922506073', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(436, 1, 2010, 2, '235834564686', 0, '2016-10-20 08:22:15', '2016-10-20 08:25:58'),
(437, 1, 2010, 61, '15391061860', 0, '2016-10-20 08:22:15', '2016-10-20 08:25:58'),
(438, 1, 2010, 62, '15391061860', 0, '2016-10-20 08:22:15', '2016-10-20 08:25:58'),
(439, 1, 2010, 91, '220443502826', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(440, 1, 2010, 92, '220443502826', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(441, 1, 2010, 104, '7404304376', 0, '2016-10-20 08:22:15', '2016-10-20 08:22:15'),
(442, 1, 2010, 75, '72394918', 0, '2016-10-20 08:25:58', '2016-10-20 08:25:58'),
(443, 1, 2009, 11, '114871699', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(444, 1, 2009, 17, '9250000000', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(445, 1, 2009, 29, '9500000000', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(446, 1, 2009, 57, '86000879', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(447, 1, 2009, 67, '172923403', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(448, 1, 2009, 93, '18000000000', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(449, 1, 2009, 103, '777949175', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(450, 1, 2009, 1, '18950872578', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(451, 1, 2009, 2, '18950872578', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(452, 1, 2009, 3, '18864871699', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(453, 1, 2009, 4, '86000879', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(454, 1, 2009, 5, '114871699', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(455, 1, 2009, 7, '9250000000', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(456, 1, 2009, 9, '9500000000', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(457, 1, 2009, 56, '86000879', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(458, 1, 2009, 61, '172923403', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(459, 1, 2009, 62, '172923403', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(460, 1, 2009, 91, '18777949175', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20'),
(461, 1, 2009, 92, '18777949175', 0, '2016-10-20 08:42:20', '2016-10-20 08:42:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`year`,`param_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
