-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2017 at 07:50 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `njrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE `runs` (
  `rid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `time` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `result` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `access` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `submittime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `runs`
--

INSERT INTO `runs` (`rid`, `pid`, `user_id`, `language`, `time`, `result`, `access`, `submittime`) VALUES
(1, 1, 1, 'C', '', NULL, 'public', NULL),
(2, 1, 1, 'C++', '', NULL, 'public', NULL),
(3, 1, 1, 'C#', '', NULL, 'public', NULL),
(4, 1, 1, 'Java', '', NULL, 'public', NULL),
(5, 1, 1, 'JavaScript', '', NULL, 'public', NULL),
(6, 1, 1, 'Pascal', '', NULL, 'public', NULL),
(7, 1, 1, 'Perl', '', NULL, 'public', NULL),
(8, 1, 1, 'PHP', '', NULL, 'public', NULL),
(9, 1, 1, 'Python', '', NULL, 'public', NULL),
(10, 1, 1, 'Ruby', '', NULL, 'public', NULL),
(11, 1, 1, 'Python3', '', NULL, 'public', NULL),
(12, 1, 1, 'AWK', '', NULL, 'public', NULL),
(13, 1, 1, 'Bash', '', NULL, 'public', NULL),
(14, 1, 1, 'Brain', '', NULL, 'public', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
