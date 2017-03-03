-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2017 at 09:22 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `variable` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`variable`, `value`) VALUES
('mode', 'Disabled'),
('penalty', '20'),
('notice', 'Online Coding \nWelcome to Techno NJR\n');

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

CREATE TABLE `contest` (
  `cid` int(11) NOT NULL,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`cid`, `name`, `description`, `start_time`, `end_time`) VALUES
(1, 'test', 'Hello World', '2017-11-13 15:00:00', '2017-12-14 15:00:00'),
(2, 'present', 'code hard', '2017-02-24 15:00:00', '2017-04-15 16:00:00'),
(3, 'CodeAgon', 'Platform for coders.', '2017-04-27 08:21:21', '2017-04-29 13:37:42'),
(4, 'Past Test', 'Code Hard = Mind Hard', '2016-03-03 00:00:00', '2016-03-04 00:00:00'),
(5, 'Again Past', 'Techno India NJR contest', '2016-12-12 00:00:00', '2016-12-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contest_users`
--

CREATE TABLE `contest_users` (
  `id` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contest_users`
--

INSERT INTO `contest_users` (`id`, `cid`, `user_id`, `rank`, `score`) VALUES
(15, 1, 1, NULL, 0),
(16, 1, 1, NULL, 0),
(17, 1, 1, NULL, 0),
(18, 1, 1, NULL, 0),
(19, 1, 1, NULL, 20),
(20, 1, 1, NULL, 0),
(21, 1, 1, NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `editorials`
--

CREATE TABLE `editorials` (
  `pid` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `editorials`
--

INSERT INTO `editorials` (`pid`, `content`) VALUES
(1, ''),
(2, '#include');

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
(1, 'TEST', 'Squares', 'Ad-Hoc', 1, 'Active', 'Test', 'WAP to output the square of an integer.\nInput : Read until the end of file. Each line contains a single positive integer less than or equal to 10.\nOutput : Output the square of the integer, one in each line.\n\n<b>SAMPLE INPUT</b>\n<code>\n1\n2\n3\n5\n</code>\n\n<b>SAMPLE OUTPUT </b>\n<code>\n1\n4\n9\n25\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0),
(2, 'TEST', 'Add', 'Ad-Hoc', 2, 'Active', 'Test', 'WAP to output addition of integer.\r\nInput : Read until the end of file.\r\nOutput : Output the addition of the integer, one in each line.\r\n\r\n<b>SAMPLE INPUT</b>\r\n<code>\r\n1\r\n2\r\n3\r\n5\r\n4\r\n6\r\n</code>\r\n\r\n<b>SAMPLE OUTPUT </b>\r\n<code>\r\n3\r\n8\r\n10\r\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '3\n7\n11\n15\n19\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0),
(3, 'TEST', 'Squares', 'Ad-Hoc', 4, 'Active', 'Test', 'WAP to output the square of an integer.\r\nInput : Read until the end of file. Each line contains a single positive integer less than or equal to 10.\r\nOutput : Output the square of the integer, one in each line.\r\n\r\n<b>SAMPLE INPUT</b>\r\n<code>\r\n1\r\n2\r\n3\r\n5\r\n</code>\r\n\r\n<b>SAMPLE OUTPUT </b>\r\n<code>\r\n1\r\n4\r\n9\r\n25\r\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0),
(4, 'TEST', 'Squares', 'Ad-Hoc', 4, 'Active', 'Test', 'WAP to output the square of an integer.\r\nInput : Read until the end of file. Each line contains a single positive integer less than or equal to 10.\r\nOutput : Output the square of the integer, one in each line.\r\n\r\n<b>SAMPLE INPUT</b>\r\n<code>\r\n1\r\n2\r\n3\r\n5\r\n</code>\r\n\r\n<b>SAMPLE OUTPUT </b>\r\n<code>\r\n1\r\n4\r\n9\r\n25\r\n</code>', NULL, NULL, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n', '1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n', 0.5, 0, 'Brain,C,C++,C#,Java,JavaScript,Pascal,Perl,PHP,Python,Ruby,Text', '', 1, 50000, 0, 0);

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
(14, 1, 1, 'Brain', '', NULL, 'public', NULL),
(15, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(16, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(17, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(18, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(19, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(20, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(21, 1, 1, 'C (gcc 5.4.0)', '', '', 'public', 2017),
(22, 1, 1, 'C (gcc 5.4.0)', '2', '', 'public', 2017),
(23, 1, 1, 'C (gcc 5.4.0)', '2', '0', 'public', 2017),
(24, 1, 1, 'C (gcc 5.4.0)', '2', '0', 'public', 2017),
(25, 1, 1, 'C (gcc 5.4.0)', '2', '0', 'public', 2017),
(26, 1, 1, 'C (gcc 5.4.0)', '2', '0', 'public', 2017),
(27, 1, 1, 'Bash (4.4)', '4', '', 'public', 2017),
(28, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017),
(29, 1, 1, 'Bash (4.4)', '4', '20', 'public', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `subs_code`
--

CREATE TABLE `subs_code` (
  `rid` int(11) NOT NULL,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `error` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `output` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subs_code`
--

INSERT INTO `subs_code` (`rid`, `name`, `code`, `error`, `output`) VALUES
(1, 'code', '#include<stdio.h>\nint main(){\n    int i;\n    while(scanf("%d", &i) != EOF)\n        printf("%d\\n", i*i);\n    return 0;\n    }\n', '', ''),
(2, 'code', '#include<iostream>\nusing namespace std;\nint main(){\n    int i;\n    while(cin>>i)\n        cout<<(i*i)<<endl;\n    return 0;\n    }\n', '', ''),
(3, 'code', 'using System;\r\nclass Program {\r\n  static void Main(string[] args){\r\n    int i; string s;\r\n    while ((s = Console.ReadLine()) != null){\r\n      i = Int16.Parse(s);\r\n      Console.WriteLine(i * i);\r\n      }\r\n    }\r\n  }', '', ''),
(4, 'Main', 'import java.io.*;\npublic class Main {\n    public static void main(String args[])throws IOException{\n        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));\n        int n;\n        String str;\n        while((str=in.readLine())!=null){\n            n = Integer.parseInt(str);\n            n = n*n;\n            System.out.println(n);\n            } // while\n        }\n    }', '', ''),
(5, 'code', 'importPackage(java.io);\r\nimportPackage(java.lang);\r\nvar reader = new BufferedReader( new InputStreamReader(System[''in'']) );\r\nwhile (true){\r\n    var line = reader.readLine();\r\n    if (line==null) break;\r\n    else {\r\n        i = parseInt(line);\r\n        System.out.println((i*i)+'''');\r\n        }\r\n    }', '', ''),
(6, 'code', 'program code;\nvar\n    i: integer;\nbegin\n    while not eof do begin\n        readln(i);\n        writeln(i*i);\n    end\nend. { code }', '', ''),
(7, 'code', 'while($n = <STDIN>){\r\n    print ($n*$n);\r\n    print "\\n";\r\n    }', '', ''),
(8, 'code', '<?php\r\n$stdin = fopen("php://stdin","r");\r\nwhile($i = trim(fgets($stdin))){\r\n    echo ($i*$i)."\\n";\r\n    }\r\nfclose($stdin);\r\n?>', '', ''),
(9, 'code', 'try:\n    while 1:\n        i = int(raw_input())\n        print i*i\nexcept:\n    pass\n', '', ''),
(10, 'code', 'while n = gets\n    n = n.chomp.to_i\n    puts (n*n).to_s\nend', '', ''),
(11, 'Main', 'try:\n    while 1:\n        i = int(input())\n        print(i*i)\nexcept:\n    pass', '', ''),
(12, 'Main', 'BEGIN{\r\n}\r\n{\r\n    n = $1;\r\n    printf("%d\\n", n*n);\r\n}\r\nEND{\r\n}\r\n', '', ''),
(13, 'Main', '#!/bin/bash\r\nwhile read line;\r\ndo\r\n    echo "$line*$line" | bc\r\ndone\r\n', '', ''),
(14, 'Main', '>>\r\n, +\r\n[\r\n    -\r\n    <+>\r\n    ----------\r\n    [\r\n        <-<[-]+>>\r\n        ++++++++++\r\n        >++++++++[<------>-]<\r\n        [\r\n            <<->>\r\n            [>+>+>+<<<-]>>>-\r\n            [<[<+<+>>-]<<[>>+<<-]>>>-]<< \r\n            >[-]>[-]++++++++++<<\r\n            [>>\r\n              [->+<<<-[>]>>>\r\n                [<\r\n                  [-<+>]\r\n                  >>\r\n                ]\r\n                <<\r\n              ]\r\n              <[>>[->>>+<<<]>>-<<<<[-]]>\r\n              >[-<+>]>>+<<<<<\r\n            ]\r\n            >>>>>\r\n            [>>[-]++++++[-<<++++++++>>]<<.[-]]\r\n            >\r\n            [>[-]++++++[-<++++++++>]<.[-]]\r\n            <<<<<<[-]\r\n        ]\r\n        <<[->++++++++[<++++++>-]<..[-]]\r\n    ]\r\n    <[+++++++++.[-]]>[-]>\r\n    , +\r\n]', '', ''),
(23, 'Main', '#include<stdio.h>', 'Compilation Error', ''),
(24, 'Main', '#include<stdio.h>', 'Compilation Error', ''),
(25, 'Main', '#include<stdio.h>', 'Compilation Error', ''),
(26, 'Main', '#include<stdio.h>', 'Compilation Error', ''),
(27, 'Main', '#include<stdio.h>', '', ''),
(28, 'Main', '#include<stdio.h>', '', ''),
(29, 'Main', '#include<stdio.h>', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contest`
--
ALTER TABLE `contest`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `contest_users`
--
ALTER TABLE `contest_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `editorials`
--
ALTER TABLE `editorials`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `subs_code`
--
ALTER TABLE `subs_code`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contest`
--
ALTER TABLE `contest`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contest_users`
--
ALTER TABLE `contest_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `subs_code`
--
ALTER TABLE `subs_code`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
