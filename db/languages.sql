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
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lid` int(11) NOT NULL,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lid`, `name`) VALUES
(1, 'Bash (4.4)'),
(2, 'Bash (4.0)'),
(3, 'C (gcc 6.3.0)'),
(4, 'C (gcc 5.4.0)'),
(5, 'C (gcc 4.9.4)'),
(6, 'C (gcc 4.8.5)'),
(7, 'C++ (g++ 6.3.0)'),
(8, 'C++ (g++ 5.4.0)'),
(9, 'C++ (g++ 4.9.4)'),
(10, 'C++ (g++ 4.8.5)'),
(11, 'C# (mono 4.8.0.472)'),
(12, 'Haskell (ghc 8.0.2)'),
(13, 'Java (OpenJDK 8)'),
(14, 'Java (OpenJDK 7)'),
(15, 'Octave (4.2.0)'),
(16, 'Pascal (fpc 3.0.0)'),
(17, 'Python (3.6.0)'),
(18, 'Python (3.5.3)'),
(19, 'Python (2.7.9)'),
(20, 'Python (2.6.9)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
