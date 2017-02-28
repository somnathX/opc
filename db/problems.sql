-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2017 at 06:41 AM
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
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `pid` int(11) NOT NULL,
  `code` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `cid` int(11) NOT NULL,
  `status` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pgroup` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `statement` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `image` longblob,
  `imgext` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `input` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `output` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timelimit` float DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `languages` tinytext,
  `options` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `displayio` tinyint(1) NOT NULL DEFAULT '0',
  `maxfilesize` int(11) NOT NULL DEFAULT '50000',
  `solved` int(11) NOT NULL DEFAULT '0',
  `total` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`pid`, `code`, `name`, `type`, `cid`, `status`, `pgroup`, `statement`, `image`, `imgext`, `input`, `output`, `timelimit`, `score`, `languages`, `options`, `displayio`, `maxfilesize`, `solved`, `total`) VALUES
(1, 'TEST', 'Squares', 'Ad-Hoc', 1, 'Active', 'Test', 'WAP to output the square of an integer.\r\nInput : Read until the end of file. Each line contains a single positive integer less than or equal to 10.\r\nOutput : Output the square of the integer, one in each line.\r\n\r\n<b>SAMPLE INPUT</b>\r\n<code>\r\n1\r\n2\r\n3\r\n5\r\n</code>\r\n\r\n<b>SAMPLE OUTPUT </b>\r\n<code>\r\n1\r\n4\r\n9\r\n25\r\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0),
(2, 'TEST', 'Add', 'Ad-Hoc', 2, 'Active', 'Test', 'WAP to output addition of integer.\r\nInput : Read until the end of file.\r\nOutput : Output the addition of the integer, one in each line.\r\n\r\n<b>SAMPLE INPUT</b>\r\n<code>\r\n1\r\n2\r\n3\r\n5\r\n4\r\n6\r\n</code>\r\n\r\n<b>SAMPLE OUTPUT </b>\r\n<code>\r\n3\r\n8\r\n10\r\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '3\n7\n11\n15\n19\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
