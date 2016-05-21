-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 05 月 21 日 10:50
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `company`
--

-- --------------------------------------------------------

--
-- 替换视图以便查看 `average_salary`
--
CREATE TABLE IF NOT EXISTS `average_salary` (
`DNO` varchar(10)
,`AVERAGE` double
);
-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DNAME` varchar(30) DEFAULT NULL,
  `DNO` varchar(20) NOT NULL DEFAULT '',
  `MGRSSN` varchar(20) DEFAULT NULL,
  `MGRSTARTDATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`DNAME`, `DNO`, `MGRSSN`, `MGRSTARTDATE`) VALUES
('研发部', 'DD001', '00002', '2010-04-01'),
('Future Direction', 'FT002', '00003', '2009-01-01'),
('Human Resource', 'HR000', '00001', '2014-05-01'),
('Product Department', 'PR003', '00004', '2012-02-09'),
('Safety Department', 'SF004', '00005', '2013-03-12');

-- --------------------------------------------------------

--
-- 表的结构 `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `ENAME` varchar(10) DEFAULT NULL,
  `ESSN` varchar(20) NOT NULL DEFAULT '',
  `ADDRESS` varchar(50) DEFAULT NULL,
  `SALARY` varchar(10) DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` varchar(10) DEFAULT NULL,
  `HID` varchar(20) NOT NULL,
  `SID` varchar(10) NOT NULL,
  PRIMARY KEY (`ESSN`),
  KEY `dno_index` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `employee`
--

INSERT INTO `employee` (`ENAME`, `ESSN`, `ADDRESS`, `SALARY`, `SUPERSSN`, `DNO`, `HID`, `SID`) VALUES
('John', '00001', 'America', '10000', NULL, 'HR000', '1', '2'),
('Mike', '00002', 'America', '10000', NULL, 'DD001', '1', ''),
('Carpela', '00003', 'PRC', '20000', NULL, 'FT002', '1', ''),
('张蔷', '00004', 'PRC', '8000', NULL, 'PR003', '1', ''),
('李为', '00005', 'PRC', '12000', NULL, 'SF004', '1', ''),
('Hover', '00006', 'Italy', '8000', '00001', 'HR000', '1', '1'),
('Winter', '00007', 'France', '7000', '00006', 'HR000', '1', ''),
('王里', '00008', 'PRC', '8000', '00001', 'HR000', '1', ''),
('李从文', '00009', 'PRC', '9000', '00001', 'HR000', '1', ''),
('张红', '00010', 'PRC', '6000', '00008', 'HR000', '1', ''),
('TJ', '00011', 'Fenland', '8000', '00002', 'DD001', '1', ''),
('张天佑', '00012', 'PRC', '8000', '00002', 'DD001', '1', ''),
('李天斯', '00013', 'PRC', '8000', '00012', 'DD001', '1', ''),
('Steve', '00014', 'America', '8000', '00012', 'DD001', '1', ''),
('Bill', '00015', 'America', '8000', '00012', 'DD001', '1', ''),
('Kelinton', '00016', 'America', '2000', '00012', 'DD001', '1', ''),
('Peter', '00017', 'England', '6000', '00010', 'HR000', '2', ''),
('Robert', '00018', 'England', '1000', '00004', 'PR003', '1', ''),
('Lee', '00019', 'America', '1000', '00004', 'PR003', '1', ''),
('Micheal', '00020', 'India', '1000', '00004', 'PR003', '1', ''),
('张一', '00021', 'PRC', '1000', '00004', 'SF004', '2', ''),
('张二', '00022', 'PRC', '1000', '00004', 'PR003', '1', ''),
('张三', '00023', 'PRC', '1000', '00004', 'HR000', '1', ''),
('李一', '00024', 'PRC', '1000', '00004', 'SF004', '1', ''),
('李二', '00025', 'PRC', '1000', '00004', 'PR003', '1', ''),
('李三', '00026', 'PRC', '1000', '00004', 'SF004', '1', ''),
('李四', '00027', 'PRC', '1000', '00004', 'PR003', '1', ''),
('李五', '00028', 'PRC', '1000', '00004', 'PR003', '1', ''),
('赵地', '00029', 'PRC', '1000', '00004', 'SF004', '1', ''),
('赵天', '00030', 'PRC', '1000', '00004', 'PR003', '1', ''),
('赵静', '00031', 'PRC', '1000', '00004', 'PR003', '1', ''),
('赵耀', '00032', 'PRC', '1000', '00004', 'SF004', '1', ''),
('赵群', '00033', 'PRC', '1000', '00004', 'PR003', '1', ''),
('赵天穹', '00034', 'PRC', '1000', '00004', 'SF004', '1', ''),
('钱松', '00035', 'PRC', '1000', '00004', 'SF004', '1', ''),
('钱前', '00036', 'PRC', '1000', '00004', 'FT002', '1', ''),
('钱由', '00037', 'PRC', '1000', '00004', 'PR003', '1', ''),
('钱德宝', '00038', 'PRC', '1000', '00004', 'PR003', '1', ''),
('孙大圣', '00039', 'PRC', '1000', '00004', 'SF004', '1', ''),
('孙小果', '00040', 'PRC', '1000', '00004', 'PR003', '1', ''),
('孙建', '00041', 'PRC', '1000', '00004', 'PR003', '1', ''),
('孙李', '00042', 'PRC', '1000', '00004', 'PR003', '1', ''),
('Alice', '00043', 'America', '1000', '00004', 'FT002', '1', ''),
('Bob', '00044', 'America', '1000', '00004', 'PR003', '1', ''),
('Candy', '00045', 'America', '1000', '00004', 'SF004', '1', ''),
('Herbert', '00046', 'America', '1000', '00004', 'SF004', '1', ''),
('Dijkstra', '00047', 'America', '1000', '00004', 'PR003', '1', ''),
('Ert', '00048', 'America', '1000', '00004', 'PR003', '1', ''),
('Jack', '00049', 'America', '1000', '00004', 'FT002', '1', ''),
('Mozart', '00050', 'America', '1000', '00004', 'FT002', '1', ''),
('Zed', '00051', 'America', '1000', '00004', 'FT002', '1', '');

-- --------------------------------------------------------

--
-- 表的结构 `friend_on`
--

CREATE TABLE IF NOT EXISTS `friend_on` (
  `EID1` varchar(20) NOT NULL,
  `EID2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `friend_on`
--

INSERT INTO `friend_on` (`EID1`, `EID2`) VALUES
('00001', '00002'),
('00001', '00006'),
('00001', '00002'),
('00002', '00006'),
('00003', '00002'),
('00001', '00006');

-- --------------------------------------------------------

--
-- 表的结构 `hometown`
--

CREATE TABLE IF NOT EXISTS `hometown` (
  `HID` varchar(20) NOT NULL,
  `HNAME` varchar(20) NOT NULL,
  PRIMARY KEY (`HID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hometown`
--

INSERT INTO `hometown` (`HID`, `HNAME`) VALUES
('1', '黑龙江'),
('2', '北京');

-- --------------------------------------------------------

--
-- 表的结构 `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `LID` varchar(10) NOT NULL,
  `LCONTENT` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `like`
--

INSERT INTO `like` (`LID`, `LCONTENT`) VALUES
('1', '洗澡'),
('2', '游泳');

-- --------------------------------------------------------

--
-- 表的结构 `like_on`
--

CREATE TABLE IF NOT EXISTS `like_on` (
  `EID` varchar(10) NOT NULL,
  `LID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `like_on`
--

INSERT INTO `like_on` (`EID`, `LID`) VALUES
('00001', '1'),
('00006', '2');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `PNAME` varchar(30) DEFAULT NULL,
  `PNO` varchar(20) NOT NULL DEFAULT '',
  `PLOCATION` varchar(255) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES
('哈同公路', 'P1', 'Washington', 'FT002'),
('六环公路', 'P10', '北京', 'PR003'),
('Linux Project', 'P2', '北京', 'DD001'),
('SQL Project', 'P3', '哈尔滨', 'DD001'),
('OS Project', 'P4', 'Seattle', 'PR003'),
('Internet Project', 'P5', 'New York', 'SF004'),
('PL Project', 'P6', '杭州', 'DD001'),
('明日之星', 'P7', '中国', 'HR000'),
('饮食中心', 'P8', '哈尔滨', 'PR003'),
('上海中心', 'P9', '上海', 'FT002');

-- --------------------------------------------------------

--
-- 表的结构 `signature`
--

CREATE TABLE IF NOT EXISTS `signature` (
  `SID` varchar(20) NOT NULL,
  `SCONTENT` varchar(200) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `signature`
--

INSERT INTO `signature` (`SID`, `SCONTENT`) VALUES
('1', '哈哈哈哈，这是签名'),
('2', '你没看错，我是签名');

-- --------------------------------------------------------

--
-- 表的结构 `works_on`
--

CREATE TABLE IF NOT EXISTS `works_on` (
  `ESSN` varchar(20) NOT NULL DEFAULT '',
  `PNO` varchar(20) NOT NULL DEFAULT '',
  `HOURS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `works_on`
--

INSERT INTO `works_on` (`ESSN`, `PNO`, `HOURS`) VALUES
('00001', 'P1', '40'),
('00002', 'P1', '40'),
('00003', 'P1', '40'),
('00004', 'P1', '40'),
('00005', 'P1', '40'),
('00006', 'P1', '40'),
('00007', 'P1', '40'),
('00008', 'P1', '40'),
('00009', 'P1', '40'),
('00010', 'P1', '40'),
('00011', 'P1', '120'),
('00011', 'P10', '21'),
('00011', 'P2', '60'),
('00011', 'P3', '40'),
('00011', 'P4', '40'),
('00011', 'P5', '40'),
('00011', 'P6', '40'),
('00011', 'P7', '40'),
('00011', 'P8', '20'),
('00011', 'P9', '35'),
('00012', 'P1', '40'),
('00012', 'P2', '80'),
('00013', 'P1', '40'),
('00013', 'P3', '10'),
('00014', 'P1', '40'),
('00014', 'P3', '30'),
('00015', 'P1', '40'),
('00015', 'P3', '110'),
('00016', 'P1', '40'),
('00017', 'P1', '40'),
('00018', 'P1', '40'),
('00019', 'P1', '40'),
('00020', 'P1', '40'),
('00021', 'P1', '40'),
('00022', 'P1', '40'),
('00023', 'P1', '40'),
('00024', 'P1', '40'),
('00025', 'P1', '40'),
('00026', 'P1', '40'),
('00027', 'P1', '40'),
('00028', 'P1', '40'),
('00029', 'P1', '40'),
('00030', 'P1', '40'),
('00031', 'P1', '40'),
('00032', 'P1', '40'),
('00033', 'P1', '40'),
('00034', 'P1', '40'),
('00035', 'P1', '40'),
('00036', 'P1', '40'),
('00037', 'P1', '40'),
('00038', 'P1', '40'),
('00039', 'P1', '40'),
('00040', 'P1', '40'),
('00041', 'P1', '40'),
('00042', 'P1', '40'),
('00043', 'P1', '40'),
('00044', 'P1', '40'),
('00045', 'P1', '40'),
('00046', 'P1', '40'),
('00047', 'P1', '40'),
('00048', 'P1', '40'),
('00049', 'P1', '40'),
('00050', 'P1', '40'),
('00051', 'P1', '40');

-- --------------------------------------------------------

--
-- 视图结构 `average_salary`
--
DROP TABLE IF EXISTS `average_salary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `average_salary` AS (select `employee`.`DNO` AS `DNO`,(sum(`employee`.`SALARY`) / sum(`works_on`.`HOURS`)) AS `AVERAGE` from (`employee` join `works_on` on((`employee`.`ESSN` = `works_on`.`ESSN`))) group by `employee`.`DNO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
