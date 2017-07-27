-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 17-07-27 09:12
-- 서버 버전: 5.6.36-log
-- PHP 버전: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `mes`
--
CREATE DATABASE IF NOT EXISTS `mes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mes`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `cycle_time_check`
-- (See below for the actual view)
--
CREATE TABLE `cycle_time_check` (
`object_code` int(11)
,`date` date
,`entry_time` time
);

-- --------------------------------------------------------

--
-- 테이블 구조 `defect`
--

CREATE TABLE `defect` (
  `defect_code` int(11) NOT NULL,
  `defect_type` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `defect`
--

INSERT INTO `defect` (`defect_code`, `defect_type`, `description`) VALUES
(1, 'appearance_d', '외관 불량'),
(2, 'size_d', '치수 불량'),
(3, 'machine_d', '설비 고장');

-- --------------------------------------------------------

--
-- Stand-in structure for view `defect_all_process`
-- (See below for the actual view)
--
CREATE TABLE `defect_all_process` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`object_code` int(11)
,`p_name` varchar(20)
,`date` date
,`defect_code` int(11)
,`defect_type` varchar(45)
,`is_defect` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `defect_count`
-- (See below for the actual view)
--
CREATE TABLE `defect_count` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(1)
,`object_code` int(11)
,`is_defect` tinyint(1)
,`date` date
,`entry_time` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `defect_management_trace`
-- (See below for the actual view)
--
CREATE TABLE `defect_management_trace` (
`od_id` int(11)
,`f_code` int(11)
,`l_code` int(11)
,`p_name` varchar(20)
,`pro_name` varchar(45)
,`defect_type` varchar(45)
,`date` date
,`entry_time` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `defect_rate_each_line`
-- (See below for the actual view)
--
CREATE TABLE `defect_rate_each_line` (
`f_code` int(11)
,`l_code` int(11)
,`p_code` int(11)
,`object_code` int(11)
,`is_defect` tinyint(1)
,`date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `defect_type_each_process`
-- (See below for the actual view)
--
CREATE TABLE `defect_type_each_process` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`defect_code` int(11)
,`defect_type` varchar(45)
,`object_code` int(11)
);

-- --------------------------------------------------------

--
-- 테이블 구조 `f_environment`
--

CREATE TABLE `f_environment` (
  `f_environment_code` varchar(45) NOT NULL,
  `f_code` int(11) NOT NULL,
  `f_temperature` double DEFAULT NULL,
  `f_huminity` double DEFAULT NULL,
  `f_gas` varchar(45) DEFAULT NULL,
  `f_finedust` varchar(45) DEFAULT NULL,
  `f_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `f_environment`
--

INSERT INTO `f_environment` (`f_environment_code`, `f_code`, `f_temperature`, `f_huminity`, `f_gas`, `f_finedust`, `f_date`) VALUES
('1', 1, 30, 50, 'good', 'good', '2017-01-01'),
('2', 1, 35, 50, 'good', 'good', '2017-01-02'),
('3', 1, 40, 60, 'not good', 'bad', '2017-01-03');

-- --------------------------------------------------------

--
-- 테이블 구조 `factory`
--

CREATE TABLE `factory` (
  `f_code` int(11) NOT NULL COMMENT 'f_code',
  `f_name` varchar(45) DEFAULT NULL COMMENT 'f_name',
  `description` varchar(500) DEFAULT NULL COMMENT 'description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FACTORY';

--
-- 테이블의 덤프 데이터 `factory`
--

INSERT INTO `factory` (`f_code`, `f_name`, `description`) VALUES
(1, 'f_1', 'factory1'),
(2, 'f_2', 'factory2'),
(3, 'f_3', 'factory3'),
(4, 'f_4', 'factory4'),
(5, 'f_5', 'factory5'),
(6, '6', '6');

-- --------------------------------------------------------

--
-- 테이블 구조 `line`
--

CREATE TABLE `line` (
  `l_code` int(11) NOT NULL COMMENT 'l_code',
  `l_name` varchar(10) DEFAULT NULL COMMENT 'l_name',
  `descrition` varchar(50) DEFAULT NULL COMMENT 'descrition',
  `f_code` int(11) NOT NULL COMMENT 'f_code',
  `l_start_date` date DEFAULT NULL,
  `l_end_date` date DEFAULT NULL,
  `l_production_goal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LINE';

--
-- 테이블의 덤프 데이터 `line`
--

INSERT INTO `line` (`l_code`, `l_name`, `descrition`, `f_code`, `l_start_date`, `l_end_date`, `l_production_goal`) VALUES
(1, 'l_1', '화학도금', 1, '2017-01-01', '2017-01-31', 10000),
(2, 'l_2', '전기도금', 1, '2017-01-01', '2017-01-31', 10000);

-- --------------------------------------------------------

--
-- 테이블 구조 `machine`
--

CREATE TABLE `machine` (
  `m_code` int(11) NOT NULL,
  `m_name` varchar(45) NOT NULL,
  `manufacture_date` varchar(45) DEFAULT NULL,
  `set_date` varchar(45) DEFAULT NULL,
  `purchase_date` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `machine`
--

INSERT INTO `machine` (`m_code`, `m_name`, `manufacture_date`, `set_date`, `purchase_date`, `description`) VALUES
(1, 'm_1', '20170101', '20170101', '20170101', 'machine_1'),
(2, 'm_2', '20170101', '20170101', '20170101', 'machine_2'),
(3, 'm_3', '20170101', '20170101', '20170101', 'machine_3'),
(4, 'm_1', '20170101', '20170101', '20170101', 'machine_4');

-- --------------------------------------------------------

--
-- 테이블 구조 `machine_maintenance`
--

CREATE TABLE `machine_maintenance` (
  `maintanace_code` int(11) NOT NULL,
  `maintanace_name` varchar(45) DEFAULT NULL,
  `maintanace_detail` varchar(45) DEFAULT NULL,
  `maintanace_date` date DEFAULT NULL,
  `m_code` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `p_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `machine_maintenance`
--

INSERT INTO `machine_maintenance` (`maintanace_code`, `maintanace_name`, `maintanace_detail`, `maintanace_date`, `m_code`, `description`, `p_code`) VALUES
(1, 'machine', 'machine_error', '2017-01-01', 1, '1', 1),
(2, 'sensor', 'sensor_error', '2017-01-01', 1, '1', 1),
(3, 'machine', 'machine_error', '2017-01-01', 1, '1', 1),
(4, 'machine', 'machine_error', '2017-01-01', 1, '1', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maintenance_each_process`
-- (See below for the actual view)
--
CREATE TABLE `maintenance_each_process` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(1)
,`m_name` varchar(45)
,`maintanace_date` date
,`maintanace_detail` varchar(45)
);

-- --------------------------------------------------------

--
-- 테이블 구조 `material`
--

CREATE TABLE `material` (
  `ma_code` int(11) NOT NULL,
  `ma_type` varchar(45) DEFAULT NULL,
  `ma_name` varchar(45) DEFAULT NULL,
  `ma_price` double DEFAULT NULL,
  `ma_buy_date` date DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `material`
--

INSERT INTO `material` (`ma_code`, `ma_type`, `ma_name`, `ma_price`, `ma_buy_date`, `description`) VALUES
(1, '1', 'ma_1', 10000, '2017-01-01', 'material1'),
(2, '1', 'ma_2', 10000, '2017-01-01', 'material2'),
(3, '1', 'ma_3', 10000, '2017-01-01', 'material3'),
(4, '1', 'ma_4', 10000, '2017-01-01', 'material4');

-- --------------------------------------------------------

--
-- Stand-in structure for view `monitoring_each_process`
-- (See below for the actual view)
--
CREATE TABLE `monitoring_each_process` (
`pro_code` int(1)
,`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`is_defect` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `moving_on_process`
-- (See below for the actual view)
--
CREATE TABLE `moving_on_process` (
`pro_code` int(1)
,`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`object_code` int(11)
,`entry_time` time
,`date` date
);

-- --------------------------------------------------------

--
-- 테이블 구조 `object`
--

CREATE TABLE `object` (
  `object_code` int(11) NOT NULL,
  `p_code` int(11) NOT NULL,
  `entry_time` time NOT NULL,
  `date` date NOT NULL,
  `is_defect` tinyint(1) NOT NULL,
  `cycle_time` time DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `m_code` int(11) NOT NULL,
  `ma_code` int(11) NOT NULL,
  `sensor_code` int(11) NOT NULL,
  `warehouse_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `object`
--

INSERT INTO `object` (`object_code`, `p_code`, `entry_time`, `date`, `is_defect`, `cycle_time`, `description`, `m_code`, `ma_code`, `sensor_code`, `warehouse_code`) VALUES
(1, 10, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(2, 9, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(3, 8, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(4, 7, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(5, 6, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(6, 5, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(7, 4, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(8, 3, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(9, 2, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(10, 1, '00:00:00', '2017-01-01', 0, '00:00:10', '1부터10까지 동시진행중', 1, 1, 1, 1),
(11, 1, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(12, 1, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(13, 1, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(14, 1, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(15, 1, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(16, 19, '00:00:00', '2017-01-01', 0, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(17, 19, '00:00:00', '2017-01-01', 0, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(18, 19, '00:00:00', '2017-01-01', 0, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(19, 19, '00:00:00', '2017-01-01', 0, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(20, 19, '00:00:00', '2017-01-01', 0, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(21, 36, '00:00:00', '2017-01-01', 0, '00:00:10', 'l2완제품', 1, 1, 1, 1),
(22, 36, '00:00:00', '2017-01-01', 0, '00:00:10', 'l2완제품', 1, 1, 1, 1),
(23, 10, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(24, 11, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(25, 12, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(26, 13, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(27, 14, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1),
(28, 15, '00:00:00', '2017-01-01', 1, '00:00:10', 'l1오류상황', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `object_defect`
--

CREATE TABLE `object_defect` (
  `od_id` int(11) NOT NULL,
  `object_code` int(11) NOT NULL,
  `defect_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `object_defect`
--

INSERT INTO `object_defect` (`od_id`, `object_code`, `defect_code`) VALUES
(1, 11, 1),
(2, 12, 1),
(3, 13, 1),
(4, 14, 1),
(5, 15, 1),
(6, 23, 2),
(7, 24, 2),
(8, 25, 2),
(9, 26, 3),
(10, 27, 3),
(11, 28, 3);

-- --------------------------------------------------------

--
-- 테이블 구조 `object_stock`
--

CREATE TABLE `object_stock` (
  `os_id` int(11) NOT NULL,
  `object_code` int(11) NOT NULL,
  `stock_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `object_stock`
--

INSERT INTO `object_stock` (`os_id`, `object_code`, `stock_code`) VALUES
(1, 16, 1),
(2, 17, 1),
(3, 18, 1),
(4, 19, 1),
(5, 20, 1),
(6, 21, 1),
(7, 22, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prac_line`
-- (See below for the actual view)
--
CREATE TABLE `prac_line` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`object_code` int(11)
,`p_name` varchar(20)
,`date` date
,`defect_type` varchar(45)
,`is_defect` tinyint(1)
);

-- --------------------------------------------------------

--
-- 테이블 구조 `process`
--

CREATE TABLE `process` (
  `p_code` int(1) NOT NULL,
  `p_name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pro_code` int(1) NOT NULL,
  `l_code` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `process`
--

INSERT INTO `process` (`p_code`, `p_name`, `description`, `pro_code`, `l_code`) VALUES
(1, 'equipment_contro', '설비제어', 1, 1),
(2, 'line1p1p2', 'between_line1p1p2', 1, 1),
(3, 'lecking', '렉킹(소재투입)', 1, 1),
(4, 'line1p2p3', 'between_line1p2p3', 1, 1),
(5, 'decalcification', '탈지', 1, 1),
(6, 'line1p3p4', 'between_line1p3p4', 1, 1),
(7, 'etching', '에칭', 1, 1),
(8, 'line1p4p5', 'between_line1p4p5', 1, 1),
(9, 'neutralization', '중화', 1, 1),
(10, 'line1p5p6', 'between_line1p5p6', 1, 1),
(11, 'vitality1', '활성1', 1, 1),
(12, 'line1p6p7', 'between_line1p6p7', 1, 1),
(13, 'vitality2', '활성2', 1, 1),
(14, 'line1p7p8', 'between_line1p7p8', 1, 1),
(15, 'chemical_ nickel', '화학니켈', 1, 1),
(16, 'line1p8p9', 'between_line1p8p9', 1, 1),
(17, 'transduction', '치환동', 1, 1),
(18, 'line1p9p10', 'between_line1p9p10', 1, 1),
(19, 'line1_end', '화학도금_끝', 1, 1),
(20, 'legacy', '유산동', 1, 2),
(21, 'line2p1p2', 'between_line2p1p2', 1, 2),
(22, 'semi_bright', '반광택', 1, 2),
(23, 'line2p2p3', 'between_line2p2p3', 1, 2),
(24, 'bright', '광택', 1, 2),
(25, 'line2p3p4', 'between_line2p3p4', 1, 2),
(26, 'satin', '사틴', 1, 2),
(27, 'line2p4p5', 'between_line2p4p5', 1, 2),
(28, 'mp_nickel', 'mp니켈', 1, 2),
(29, 'line2p5p6', 'between_line2p5p6', 1, 2),
(30, 'chrome', '크롬', 1, 2),
(31, 'line2p6p7', 'between_line2p6p7', 1, 2),
(32, 'plating_end', '도금완료', 1, 2),
(33, 'line2p7p8', 'between_line2p7p8', 1, 2),
(34, 'direcking', '디렉킹', 1, 2),
(35, 'line2p8p9', 'between_line2p8p9', 1, 2),
(36, 'line2_end', '전기도금_끝', 1, 2);

-- --------------------------------------------------------

--
-- 테이블 구조 `product`
--

CREATE TABLE `product` (
  `pro_code` int(11) NOT NULL COMMENT 'pro_code',
  `pro_type` varchar(45) DEFAULT NULL,
  `pro_name` varchar(45) DEFAULT NULL COMMENT 'pro_name',
  `description` varchar(500) DEFAULT NULL COMMENT 'description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PRODUCT';

--
-- 테이블의 덤프 데이터 `product`
--

INSERT INTO `product` (`pro_code`, `pro_type`, `pro_name`, `description`) VALUES
(1, 'medal', 'gold_medal', '도금_금메달'),
(2, 'medal', 'silver_medal', '도금_은메달'),
(3, 'medal', 'bronze_medal', '도금_동메달');

-- --------------------------------------------------------

--
-- Stand-in structure for view `production_rate`
-- (See below for the actual view)
--
CREATE TABLE `production_rate` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`entry_time` time
,`date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `production_rate_on_line`
-- (See below for the actual view)
--
CREATE TABLE `production_rate_on_line` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`date` date
,`stock_day_goal` int(11)
,`stock_week_goal` int(11)
,`stock_month_goal` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `production_schedule_all_line`
-- (See below for the actual view)
--
CREATE TABLE `production_schedule_all_line` (
`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`object_code` int(11)
,`l_start_date` date
,`l_end_date` date
,`l_production_goal` int(11)
);

-- --------------------------------------------------------

--
-- 테이블 구조 `sensor`
--

CREATE TABLE `sensor` (
  `sensor_code` int(11) NOT NULL,
  `sensor_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `sensor`
--

INSERT INTO `sensor` (`sensor_code`, `sensor_name`) VALUES
(1, 's_1'),
(2, 's_2'),
(3, 's_3'),
(4, 's_4');

-- --------------------------------------------------------

--
-- 테이블 구조 `stock`
--

CREATE TABLE `stock` (
  `stock_code` int(11) NOT NULL,
  `stock_day_goal` int(11) DEFAULT NULL,
  `stock_week_goal` int(11) DEFAULT NULL,
  `stock_month_goal` int(11) DEFAULT NULL,
  `stock_average` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `stock`
--

INSERT INTO `stock` (`stock_code`, `stock_day_goal`, `stock_week_goal`, `stock_month_goal`, `stock_average`, `date`, `description`) VALUES
(1, 1000, 7000, 30000, 1000, '2017-01-01', NULL),
(2, 1000, 7000, 30000, 1000, '2017-01-02', NULL),
(3, 1000, 7000, 30000, 1000, '2017-01-03', NULL),
(4, 1000, 7000, 30000, 1000, '2017-01-04', NULL),
(5, 1000, 7000, 30000, 1000, '2017-01-05', NULL),
(6, 1000, 7000, 30000, 1000, '2017-01-06', NULL),
(7, 1000, 7000, 30000, 1000, '2017-01-07', NULL),
(8, 1000, 7000, 30000, 1000, '2017-01-08', NULL),
(9, 1000, 7000, 30000, 1000, '2017-01-09', NULL),
(10, 1000, 7000, 30000, 1000, '2017-01-10', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_management`
-- (See below for the actual view)
--
CREATE TABLE `stock_management` (
`pro_code` int(1)
,`warehouse_code` int(11)
,`f_code` int(11)
,`l_code` int(1)
,`p_code` int(11)
,`os_id` int(11)
,`date` date
);

-- --------------------------------------------------------

--
-- 테이블 구조 `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_code` int(11) NOT NULL,
  `warehouse_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `warehouse`
--

INSERT INTO `warehouse` (`warehouse_code`, `warehouse_name`, `description`) VALUES
(1, 'w_goldmedal', '금메달_창고'),
(2, 'w_silvermedal', '은메달_창고'),
(3, 'w_bronzemedal', '동메달_창고');

-- --------------------------------------------------------

--
-- 뷰 구조 `cycle_time_check`
--
DROP TABLE IF EXISTS `cycle_time_check`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cycle_time_check`  AS  select `object`.`object_code` AS `object_code`,`object`.`date` AS `date`,`object`.`entry_time` AS `entry_time` from `object` ;

-- --------------------------------------------------------

--
-- 뷰 구조 `defect_all_process`
--
DROP TABLE IF EXISTS `defect_all_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `defect_all_process`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`p`.`p_name` AS `p_name`,`o`.`date` AS `date`,`d`.`defect_code` AS `defect_code`,`d`.`defect_type` AS `defect_type`,`o`.`is_defect` AS `is_defect` from ((((`line` `l` join `process` `p` on((`l`.`l_code` = `p`.`l_code`))) join `object` `o` on((`p`.`p_code` = `o`.`p_code`))) join `object_defect` `od` on((`o`.`object_code` = `od`.`object_code`))) join `defect` `d` on((`od`.`defect_code` = `d`.`defect_code`))) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `defect_count`
--
DROP TABLE IF EXISTS `defect_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `defect_count`  AS  select `line`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`p`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`o`.`is_defect` AS `is_defect`,`o`.`date` AS `date`,`o`.`entry_time` AS `entry_time` from ((`process` `p` join `object` `o`) join `line`) where ((`p`.`p_code` = `o`.`p_code`) and (`line`.`l_code` = `p`.`l_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `defect_management_trace`
--
DROP TABLE IF EXISTS `defect_management_trace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `defect_management_trace`  AS  select `object_defect`.`od_id` AS `od_id`,`line`.`f_code` AS `f_code`,`line`.`l_code` AS `l_code`,`process`.`p_name` AS `p_name`,`product`.`pro_name` AS `pro_name`,`defect`.`defect_type` AS `defect_type`,`object`.`date` AS `date`,`object`.`entry_time` AS `entry_time` from (((((`product` join `line`) join `process`) join `object`) join `object_defect`) join `defect`) where ((`product`.`pro_code` = `process`.`pro_code`) and (`line`.`l_code` = `process`.`l_code`) and (`process`.`p_code` = `object`.`p_code`) and (`object`.`object_code` = `object_defect`.`object_code`) and (`object_defect`.`defect_code` = `defect`.`defect_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `defect_rate_each_line`
--
DROP TABLE IF EXISTS `defect_rate_each_line`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `defect_rate_each_line`  AS  select `l`.`f_code` AS `f_code`,`l`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`o`.`is_defect` AS `is_defect`,`o`.`date` AS `date` from ((`line` `l` join `process` `p`) join `object` `o`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `defect_type_each_process`
--
DROP TABLE IF EXISTS `defect_type_each_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `defect_type_each_process`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`od`.`defect_code` AS `defect_code`,`d`.`defect_type` AS `defect_type`,`od`.`object_code` AS `object_code` from ((((`line` `l` join `process` `p`) join `object` `o`) join `object_defect` `od`) join `defect` `d`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`) and (`o`.`object_code` = `od`.`object_code`) and (`od`.`defect_code` = `d`.`defect_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `maintenance_each_process`
--
DROP TABLE IF EXISTS `maintenance_each_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maintenance_each_process`  AS  select `line`.`f_code` AS `f_code`,`process`.`l_code` AS `l_code`,`process`.`p_code` AS `p_code`,`machine`.`m_name` AS `m_name`,`mm`.`maintanace_date` AS `maintanace_date`,`mm`.`maintanace_detail` AS `maintanace_detail` from (((`line` join `process`) join `machine`) join `machine_maintenance` `mm`) where ((`line`.`l_code` = `process`.`l_code`) and (`process`.`p_code` = `mm`.`p_code`) and (`mm`.`m_code` = `machine`.`m_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `monitoring_each_process`
--
DROP TABLE IF EXISTS `monitoring_each_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monitoring_each_process`  AS  select `p`.`pro_code` AS `pro_code`,`l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`is_defect` AS `is_defect` from (((`product` `pro` join `line` `l`) join `process` `p`) join `object` `o`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`) and (`p`.`pro_code` = `pro`.`pro_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `moving_on_process`
--
DROP TABLE IF EXISTS `moving_on_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `moving_on_process`  AS  select `p`.`pro_code` AS `pro_code`,`l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`o`.`entry_time` AS `entry_time`,`o`.`date` AS `date` from ((`line` `l` join `process` `p`) join `object` `o`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `prac_line`
--
DROP TABLE IF EXISTS `prac_line`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prac_line`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`p`.`p_name` AS `p_name`,`o`.`date` AS `date`,`d`.`defect_type` AS `defect_type`,`o`.`is_defect` AS `is_defect` from ((((`line` `l` left join `process` `p` on((`l`.`l_code` = `p`.`l_code`))) join `object` `o` on((`p`.`p_code` = `o`.`p_code`))) left join `object_defect` `od` on((`o`.`object_code` = `od`.`object_code`))) left join `defect` `d` on((`od`.`defect_code` = `d`.`defect_code`))) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `production_rate`
--
DROP TABLE IF EXISTS `production_rate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `production_rate`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`entry_time` AS `entry_time`,`o`.`date` AS `date` from ((`line` `l` join `process` `p`) join `object` `o`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`) and ((`p`.`p_code` = '19') or (`p`.`p_code` = '36'))) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `production_rate_on_line`
--
DROP TABLE IF EXISTS `production_rate_on_line`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `production_rate_on_line`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`date` AS `date`,`s`.`stock_day_goal` AS `stock_day_goal`,`s`.`stock_week_goal` AS `stock_week_goal`,`s`.`stock_month_goal` AS `stock_month_goal` from ((((`line` `l` join `process` `p`) join `object` `o`) join `object_stock` `os`) join `stock` `s`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`) and (`o`.`object_code` = `os`.`object_code`) and (`os`.`stock_code` = `s`.`stock_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `production_schedule_all_line`
--
DROP TABLE IF EXISTS `production_schedule_all_line`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `production_schedule_all_line`  AS  select `l`.`f_code` AS `f_code`,`p`.`l_code` AS `l_code`,`o`.`p_code` AS `p_code`,`o`.`object_code` AS `object_code`,`l`.`l_start_date` AS `l_start_date`,`l`.`l_end_date` AS `l_end_date`,`l`.`l_production_goal` AS `l_production_goal` from ((((`line` `l` join `process` `p`) join `object` `o`) join `object_stock` `os`) join `stock` `s`) where ((`l`.`l_code` = `p`.`l_code`) and (`p`.`p_code` = `o`.`p_code`) and (`o`.`object_code` = `os`.`object_code`) and (`os`.`stock_code` = `s`.`stock_code`)) ;

-- --------------------------------------------------------

--
-- 뷰 구조 `stock_management`
--
DROP TABLE IF EXISTS `stock_management`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_management`  AS  select `process`.`pro_code` AS `pro_code`,`object`.`warehouse_code` AS `warehouse_code`,`line`.`f_code` AS `f_code`,`process`.`l_code` AS `l_code`,`object`.`p_code` AS `p_code`,`object_stock`.`os_id` AS `os_id`,`stock`.`date` AS `date` from ((((`process` join `object`) join `object_stock`) join `stock`) join `line`) where ((`line`.`l_code` = `process`.`l_code`) and (`object_stock`.`stock_code` = `stock`.`stock_code`) and (`object_stock`.`object_code` = `object`.`object_code`) and (`process`.`p_code` = `object`.`p_code`)) ;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`defect_code`);

--
-- 테이블의 인덱스 `f_environment`
--
ALTER TABLE `f_environment`
  ADD PRIMARY KEY (`f_environment_code`);

--
-- 테이블의 인덱스 `factory`
--
ALTER TABLE `factory`
  ADD PRIMARY KEY (`f_code`);

--
-- 테이블의 인덱스 `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`l_code`),
  ADD KEY `f_code` (`f_code`);

--
-- 테이블의 인덱스 `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`m_code`);

--
-- 테이블의 인덱스 `machine_maintenance`
--
ALTER TABLE `machine_maintenance`
  ADD PRIMARY KEY (`maintanace_code`),
  ADD KEY `1_idx` (`m_code`),
  ADD KEY `2_idx` (`p_code`);

--
-- 테이블의 인덱스 `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ma_code`);

--
-- 테이블의 인덱스 `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`object_code`),
  ADD KEY `p_code` (`p_code`),
  ADD KEY `ma_code` (`ma_code`),
  ADD KEY `m_code` (`m_code`),
  ADD KEY `sensor_code` (`sensor_code`),
  ADD KEY `warehousecode_idx` (`warehouse_code`);

--
-- 테이블의 인덱스 `object_defect`
--
ALTER TABLE `object_defect`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `defect_code` (`defect_code`),
  ADD KEY `object_code` (`object_code`);

--
-- 테이블의 인덱스 `object_stock`
--
ALTER TABLE `object_stock`
  ADD PRIMARY KEY (`os_id`),
  ADD KEY `object_code` (`object_code`),
  ADD KEY `stock_code` (`stock_code`);

--
-- 테이블의 인덱스 `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`p_code`),
  ADD KEY `l_code` (`l_code`),
  ADD KEY `pro_code` (`pro_code`);

--
-- 테이블의 인덱스 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_code`);

--
-- 테이블의 인덱스 `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`sensor_code`);

--
-- 테이블의 인덱스 `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_code`);

--
-- 테이블의 인덱스 `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_code`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `line`
--
ALTER TABLE `line`
  ADD CONSTRAINT `line_ibfk_1` FOREIGN KEY (`f_code`) REFERENCES `factory` (`f_code`);

--
-- 테이블의 제약사항 `machine_maintenance`
--
ALTER TABLE `machine_maintenance`
  ADD CONSTRAINT `1` FOREIGN KEY (`m_code`) REFERENCES `machine` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `2` FOREIGN KEY (`p_code`) REFERENCES `process` (`p_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `object_ibfk_1` FOREIGN KEY (`p_code`) REFERENCES `process` (`p_code`),
  ADD CONSTRAINT `object_ibfk_2` FOREIGN KEY (`ma_code`) REFERENCES `material` (`ma_code`),
  ADD CONSTRAINT `object_ibfk_3` FOREIGN KEY (`m_code`) REFERENCES `machine` (`m_code`),
  ADD CONSTRAINT `object_ibfk_4` FOREIGN KEY (`sensor_code`) REFERENCES `sensor` (`sensor_code`),
  ADD CONSTRAINT `warehousecode` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `object_defect`
--
ALTER TABLE `object_defect`
  ADD CONSTRAINT `object_defect_ibfk_1` FOREIGN KEY (`defect_code`) REFERENCES `defect` (`defect_code`),
  ADD CONSTRAINT `object_defect_ibfk_2` FOREIGN KEY (`object_code`) REFERENCES `object` (`object_code`);

--
-- 테이블의 제약사항 `object_stock`
--
ALTER TABLE `object_stock`
  ADD CONSTRAINT `object_stock_ibfk_1` FOREIGN KEY (`object_code`) REFERENCES `object` (`object_code`),
  ADD CONSTRAINT `object_stock_ibfk_2` FOREIGN KEY (`stock_code`) REFERENCES `stock` (`stock_code`);

--
-- 테이블의 제약사항 `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`l_code`) REFERENCES `line` (`l_code`),
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`pro_code`) REFERENCES `product` (`pro_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
