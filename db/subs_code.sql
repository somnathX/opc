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
(1, 'code', '#include<stdio.h>\r\nint main(){\r\n    int i;\r\n    while(scanf("%d", &i) != EOF)\r\n        printf("%d\\n", i*i);\r\n    return 0;\r\n    }\r\n', '', ''),
(2, 'code', '#include<iostream>\r\nusing namespace std;\r\nint main(){\r\n    int i;\r\n    while(cin>>i)\r\n        cout<<(i*i)<<endl;\r\n    return 0;\r\n    }\r\n', '', ''),
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
(14, 'Main', '>>\r\n, +\r\n[\r\n    -\r\n    <+>\r\n    ----------\r\n    [\r\n        <-<[-]+>>\r\n        ++++++++++\r\n        >++++++++[<------>-]<\r\n        [\r\n            <<->>\r\n            [>+>+>+<<<-]>>>-\r\n            [<[<+<+>>-]<<[>>+<<-]>>>-]<< \r\n            >[-]>[-]++++++++++<<\r\n            [>>\r\n              [->+<<<-[>]>>>\r\n                [<\r\n                  [-<+>]\r\n                  >>\r\n                ]\r\n                <<\r\n              ]\r\n              <[>>[->>>+<<<]>>-<<<<[-]]>\r\n              >[-<+>]>>+<<<<<\r\n            ]\r\n            >>>>>\r\n            [>>[-]++++++[-<<++++++++>>]<<.[-]]\r\n            >\r\n            [>[-]++++++[-<++++++++>]<.[-]]\r\n            <<<<<<[-]\r\n        ]\r\n        <<[->++++++++[<++++++>-]<..[-]]\r\n    ]\r\n    <[+++++++++.[-]]>[-]>\r\n    , +\r\n]', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subs_code`
--
ALTER TABLE `subs_code`
  ADD PRIMARY KEY (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subs_code`
--
ALTER TABLE `subs_code`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
