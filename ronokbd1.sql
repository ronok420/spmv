-- phpMyAdmin SQL Dump
-- version 5.2.0-dev+20220114.2efb835723
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 07, 2022 at 05:14 AM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ronokbd1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_bodie`
--

DROP TABLE IF EXISTS `accreditation_bodie`;
CREATE TABLE IF NOT EXISTS `accreditation_bodie` (
  `Accreditation_BodieID` varchar(5) NOT NULL,
  `ABName` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Accreditation_BodieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accreditation_bodie`
--

INSERT INTO `accreditation_bodie` (`Accreditation_BodieID`, `ABName`) VALUES
('AB22', 'Mr.TOM');

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
CREATE TABLE IF NOT EXISTS `assessment` (
  `AssessmentID` varchar(10) CHARACTER SET utf8 NOT NULL,
  `ObtainMarks` int(3) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Year` year(4) NOT NULL,
  `CourseID` int(10) NOT NULL,
  `SectionID` int(10) NOT NULL,
  PRIMARY KEY (`AssessmentID`),
  KEY `Course ID` (`CourseID`,`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`AssessmentID`, `ObtainMarks`, `Semester`, `Year`, `CourseID`, `SectionID`) VALUES
('1', 20, '', 0000, 303, 1),
('2', 30, '', 0000, 303, 1),
('3', 20, '', 0000, 303, 1),
('4', 50, '', 0000, 303, 1);

-- --------------------------------------------------------

--
-- Table structure for table `co`
--

DROP TABLE IF EXISTS `co`;
CREATE TABLE IF NOT EXISTS `co` (
  `CO_ID` varchar(5) NOT NULL,
  `CO_Description` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `PLOID` varchar(10) NOT NULL,
  `CourseID` varchar(10) NOT NULL,
  `CoNo` varchar(30) NOT NULL,
  PRIMARY KEY (`CO_ID`),
  KEY `Course ID` (`CourseID`,`PLOID`),
  KEY `PLOID` (`PLOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `co`
--

INSERT INTO `co` (`CO_ID`, `CO_Description`, `PLOID`, `CourseID`, `CoNo`) VALUES
('CO1', 'asdf', 'PLO1', '203', ''),
('CO3', 'asfdagdsagh', 'PLO1', '203', ''),
('CO5', 'fdsas', 'PLO1', '203', '');

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

DROP TABLE IF EXISTS `coordinator`;
CREATE TABLE IF NOT EXISTS `coordinator` (
  `CoID` int(4) NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `role` varchar(1000) NOT NULL,
  `CourseID` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`CoID`),
  KEY `CourseID_FK` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coordinator`
--

INSERT INTO `coordinator` (`CoID`, `Name`, `role`, `CourseID`) VALUES
(1001, 'Mrs.Mouli', 'coordinator', 'CSE303'),
(1002, 'Haider Ali', 'coordinator', 'CSE203'),
(1003, 'Khadeza Begum', 'coordinator', 'CSE211');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int(30) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `CourseCredit` int(1) NOT NULL,
  `ProgramID` varchar(10) CHARACTER SET utf8 NOT NULL,
  `CourseContent` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `CoursePolicy` varchar(3000) NOT NULL,
  `CourseObjective` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `MarkDistribution` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `ReferenceBook` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `AssessmentID` varchar(30) NOT NULL,
  `FacultyID` int(30) NOT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `ProgramID` (`ProgramID`),
  KEY `ProgramID_2` (`ProgramID`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseCredit`, `ProgramID`, `CourseContent`, `CoursePolicy`, `CourseObjective`, `MarkDistribution`, `ReferenceBook`, `AssessmentID`, `FacultyID`) VALUES
(203, 'Data Structure', 3, 'PRO1', 'This is an introductory Data Structure course in Computer Science and Engineering with particular \nemphasis on logic building and algorithm designing; able to communicate with computers through data \nstructures that are designed using C++ programming language. The main objective of this course is to \nenable students thinking logically and rationally. Understanding basic concepts and theories of data \nstructure would inspire students to build workable solutions for algorithmic or computer based \ncomputational problems.', '1. It is the student’s responsibility to gather information about the assignments and covered topics if\nthey miss lectures. Regular class attendance is mandatory. Points will be taken off for missing class\ntests. Without 70% of attendance, sitting for final exam is NOT allowed. According to IUB system\nstudents must enter the classroom within the first 10 minutes to get the attendance submitted.\n2. The syllabus of quiz, midterm and final exam is already given here, however, announcements will\nbe given ahead of time. There is NO provision for make-up quizzes.\n3. The reading materials for each class may be given prior to that class so that student may have a\ncursory look into the materials.\n4. Class participation is vital for better understanding of data structure. Students are invited to raise\nquestions.\n5. Students should take tutorials with the instructor during the office hours. Prior appointment is\nrequired.\n6. Students must maintain the IUB code of conduct and ethical guidelines offered by the school of\nengineering and computer sciences.', 'This is an introductory Data Structure course in Computer Science and Engineering with particular emphasis on logic building and algorithm designing; able to communicate with computers through data structures that are designed using C++ programming language. The main objective of this course is to enable students thinking logically and rationally. Understanding basic concepts and theories of data structure would inspire students to build workable solutions for algorithmic or computer based computational problems.', 'Students will be assessed on the basis of their overall performance in all the exams, quizzes, and class participation. Final numeric reward will be the compilation of:\n\n\n 	Assignments (programming based) + HW Exam (20%)\n 	Quizzes due in different times of the semester (20%)\n 	One written mid-term test (30%)\n 	A written final exam (40%)\n 	Total (110%)\n\n[Class attendance is mandatory; failure to do so may deduct the final marks]\n\n', 'The course will be based mostly on the following book and online materials [some other books and web links may be referred time to time]:\n\n1.	Schaum’s Outline of Data Structure with C by Seymour Lipchutz (McGraw-Hill 2000) \n2.	Schaum’s Outline of Data Structure with C ++ by John R. Hubbard (McGraw-Hill 2000) \n3.	A Practical Introduction to. Data Structures and Algorithm Analysis. Third Edition (C++ Version)-by Clifford A. Shaffer. (Prentice Hall 2000).\n4.	Introduction to Algorithms- by T.H. Cormen, C.E.Leiserson, R.L. Rivest, and C. Stein,  McGraw-Hill, 2002.More Books and Web links:\n 	C++: The Complete Reference by Herbert Schildt\n 	http://www.tutorialspoint.com/data_structures_algorithms/index.htm\n 	http://www.cprogramming.com/algorithms-and-data-structures.html\n 	http://opendatastructures.org/ods-cpp.pdf \n', '', 2001),
(211, 'Algorithm', 3, 'PRO1', '', '1. It is the student’s responsibility to gather information about the assignments and covered topics if they miss lectures. Regular class attendance is mandatory. Points will be taken off for missing class tests. Without 70% of attendance, sitting for final exam is NOT allowed. According to IUB system students must enter the classroom within the first 10 minutes to get the attendance submitted. 2. The syllabus of quiz, midterm and final exam is already given here, however, announcements will be given ahead of time. There is NO provision for make-up quizzes. 3. The reading materials for each class may be given prior to that class so that student may have a cursory look into the materials. 4. Class participation is vital for better understanding of data structure. Students are invited to raise questions. 5. Students should take tutorials with the instructor during the office hours. Prior appointment is required. 6. Students must maintain the IUB code of conduct and ethical guidelines offered by the school of engineering and computer sciences.', 'In this course, students will get an overview of the following:  1. Foundation knowledge in database concepts, technology, and practice to groom students into well- informed database application developers.  2. Strong practice in SQL programming through a variety of database problems. 3. Develop database applications using front-end tools and back-end DBMS.', 'Students will be assessed on the basis of their overall performance in all the exams, quizzes, and c', 'The course will be based mostly on the following book and online materials [some other books and web  links may be referred time to time]: 1. Schaum’s Outline of Data Structure with C by Seymour Lipchutz (McGraw-Hill 2000)  2. Schaum’s Outline of Data Structure with C ++ by John R. Hubbard (McGra', '', 2002),
(214, 'Computer Organization and Arch', 3, 'PRO1', 'This is one of the core courses of Computer Science and Engineering with particular emphasis on \r\ncomputer organization and architecture; concept of computer as hierarchical system; and problems and \r\nmethods of designing computers. The main objective of this course is to learn how certain operating system \r\nfunctions are supported by computer hardware organization. Understanding how various performance \r\nenhancements to computers are achieved and to be able to make an informed comparison among competing \r\narchitectures for a given purpose. ', '1. It is the student’s responsibility to gather information about the assignments and covered topics \r\nduring the lectures missed. Regular class attendance is mandatory. Points will be taken off for \r\nmissing classes. Without 70% of attendance, sitting for final exam is NOT allowed. According to \r\nIUB system students must enter the classroom within the first 20 minutes to get the attendance \r\nsubmitted. \r\n2. The date and syllabus of quiz, midterm and final exam is already given here, however, \r\nannouncements will be given ahead of time. There is NO provision for make-up quizzes. \r\n3. The reading materials for each class will be given prior to that class so that student may have a \r\ncursory look into the materials. \r\n4. Class participation is vital for better understanding of sociological issues. Students are invited to \r\nraise questions. \r\n5. Students should take tutorials with the instructor during the office hours. Prior appointment is \r\nrequired. \r\n6. Students must maintain the IUB code of conduct and ethical guidelines offered by the school of \r\nengineering and computer sciences. \r\n', '1. Introduce the concept of Computer Architecture and Organization \r\n2. Understand the details of Computer System such as memories, I/O devices etc. \r\n3. Learn about Computer Arithmetic and Hardware algorithm \r\n4. Understand and Design CPU functions and Instruction Sets \r\n5. Design Hardware and Micro programmed control Unit \r\n2 of 6\r\n6. Analyze the performance of parallel and multicore processor ', 'Students will be assessed on the basis of their overall performance in all the exams, quizzes, and class \r\nparticipation. Final numeric reward will be the compilation of: \r\nTest/ quizzes due in different times of the semester (15%) \r\n Assignment (Home works/Simulation/Case study) (10%) \r\nAttendance (10%) \r\nOne mid-term test (25%) \r\nA cumulative final exam (40%) \r\n[Class attendance is mandatory; failure to do so may deduct the final marks] ', 'The course will be based mostly on the following books [some other books and journals may be referred \r\ntime to time]: \r\nWilliam Stallings – Computer Organization and Architecture – Design for Performance – [11th \r\nEditions], Prentice Hall \r\nHennessy and Peterson – Computer Architecture, A Quantitative Approach – [4th or later \r\nInternational Editions] Elsevier \r\nAudit: \r\nStudents who are willing to audit the course are welcome during the first two classes and are advised to \r\ncontact the instructor after that. \r\nNote: \r\nPlagiarism – that is, the presentation of another person’s thoughts or words as though they were the \r\nstudent’s own – must be strictly avoided. Cheating and plagiarism on exam and assignments are \r\nunacceptable. ', '', 2002),
(303, 'Database Mannagement', 3, 'PRO1', 'Conventional and database approaches. Basic concepts of DBMS. Hierarchical, network and relational data\nmodels. Entity-relationship modeling. Relational database designing: decomposition and normalization;\nfunctional dependencies. Relational algebra and calculus. Structured query language (SQL). Query\noptimization. Database programming with SQL and PL/SQL. Database security and administration. Distributed\ndatabases. Object-oriented data modeling. Specific database systems: oracle, MS SQL server, access.', '1. It is the student’s responsibility to gather information about the assignments and covered topics if they miss lectures. Regular class attendance is mandatory. Points will be taken off for missing class tests. Without 70% of attendance, sitting for final exam is NOT allowed. According to IUB system students must enter the classroom within the first 10 minutes to get the attendance submitted. 2. The syllabus of quiz, midterm and final exam is already given here, however, announcements will be given ahead of time. There is NO provision for make-up quizzes. 3. The reading materials for each class may be given prior to that class so that student may have a cursory look into the materials. 4. Class participation is vital for better understanding of data structure. Students are invited to raise questions. 5. Students should take tutorials with the instructor during the office hours. Prior appointment is required. 6. Students must maintain the IUB code of conduct and ethical guidelines offered by the school of engineering and computer sciences.', 'In this course, students will get an overview of the following:\n\n1. Foundation knowledge in database concepts, technology, and practice to groom students into well-\ninformed database application developers.\n\n2. Strong practice in SQL programming through a variety of database problems.\n3. Develop database applications using front-end tools and back-end DBMS.', 'Students will be assessed on the basis of their overall performance in all the exams, quizzes, and c', 'The course will be based mostly on the following book and online materials [some other books and web links may be referred time to time]:\n\n1.	Schaum’s Outline of Data Structure with C by Seymour Lipchutz (McGraw-Hill 2000) \n2.	Schaum’s Outline of Data Structure with C ++ by John R. Hubbard (McGraw-H', '', 2003);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` varchar(10) CHARACTER SET utf8 NOT NULL,
  `DepartmentName` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`) VALUES
('BBA', 'Bachelor of Business Administration'),
('CS', 'Computer Science'),
('CSE', 'Computer Science and Engineering'),
('EEE', 'Electrical and Electronics Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `FacultyID` int(4) NOT NULL,
  `FacultyName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `FacultyGender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `FacultyDateOfBirth` date NOT NULL,
  `FacultyEmail` varchar(20) CHARACTER SET utf8 NOT NULL,
  `role` varchar(10) COLLATE tis620_bin NOT NULL,
  `DepartmentID` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`FacultyID`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `FacultyID` (`FacultyID`),
  KEY `FacultyID_2` (`FacultyID`),
  KEY `FacultyID_3` (`FacultyID`),
  KEY `FacultyID_4` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_bin;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `FacultyName`, `FacultyGender`, `FacultyDateOfBirth`, `FacultyEmail`, `role`, `DepartmentID`) VALUES
(1001, 'Sabrina', 'Female', '1990-10-10', 'sabrina@gmail.com', 'faculty', 'BBA'),
(2001, 'Azam', 'Male', '1985-07-07', 'azam@gmail.com', 'faculty', 'CSE'),
(2002, 'Khan', 'Male', '0000-00-00', 'khan@gmail.com', 'faculty', 'CSE'),
(2003, 'Nobita', 'Male', '0000-00-00', 'nobita@gmail.com', 'faculty', 'CS'),
(3001, 'Kabir', 'Male', '1980-03-18', 'kabir@gmail.com', 'faculty', 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `head_of_the_department`
--

DROP TABLE IF EXISTS `head_of_the_department`;
CREATE TABLE IF NOT EXISTS `head_of_the_department` (
  `HOTDID` int(4) NOT NULL,
  `HOTDName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `HOTDEmail` varchar(30) CHARACTER SET utf8 NOT NULL,
  `role` varchar(10) NOT NULL,
  `DepartnemtID` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`HOTDID`),
  KEY `DepartmentID_FK` (`DepartnemtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `head_of_the_department`
--

INSERT INTO `head_of_the_department` (`HOTDID`, `HOTDName`, `HOTDEmail`, `role`, `DepartnemtID`) VALUES
(1011, 'RONY', 'rony@gmail.com', 'head', 'CSE'),
(2011, 'HASAN', 'hasan@gmail.com', 'head', 'EEE'),
(3011, 'MINHAZ', 'minhaz@gmail.com', 'head', 'BBA');

-- --------------------------------------------------------

--
-- Table structure for table `plo`
--

DROP TABLE IF EXISTS `plo`;
CREATE TABLE IF NOT EXISTS `plo` (
  `PLO_ID` varchar(10) NOT NULL,
  `ProgramID` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLODescription` varchar(1000) NOT NULL,
  `PloNo` varchar(10) NOT NULL,
  PRIMARY KEY (`PLO_ID`),
  KEY `Program ID` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plo`
--

INSERT INTO `plo` (`PLO_ID`, `ProgramID`, `PLODescription`, `PloNo`) VALUES
('PLO1', 'PRO1', '', ''),
('PLO2', 'PRO2', '', ''),
('PLO3', 'PRO3', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `ProgramID` varchar(10) NOT NULL,
  `ProgramName` varchar(50) NOT NULL,
  `DepartmentID` varchar(10) NOT NULL,
  PRIMARY KEY (`ProgramID`),
  KEY `DepartmentID` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`ProgramID`, `ProgramName`, `DepartmentID`) VALUES
('PRO1', 'Engineering', 'CSE'),
('PRO2', 'Engineering', 'EEE'),
('PRO3', 'Business', 'BBA');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `QuestionID` int(4) NOT NULL AUTO_INCREMENT,
  `Semester` varchar(8) CHARACTER SET utf8 NOT NULL,
  `Year` year(4) NOT NULL,
  `TotalMark` int(3) NOT NULL,
  `CoID` varchar(30) NOT NULL,
  `MidQuestion` mediumtext NOT NULL,
  `FinalQuestion` varchar(10000) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `FacultyID` int(4) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `Course ID` (`CourseID`),
  KEY `FacultyID` (`FacultyID`),
  KEY `CoID` (`CoID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuestionID`, `Semester`, `Year`, `TotalMark`, `CoID`, `MidQuestion`, `FinalQuestion`, `CourseID`, `FacultyID`) VALUES
(1, '[SUMMER]', 2012, 50, '', '', 'A small racing league wants a database to keep track of teams, drivers, races and scores in the league. The \nleague is run for teams, which are identified by their names. Each team has one or more drivers signed up, \nand each driver is registered with the league and has a unique league licence number. First and last names \nof the drivers should also be included. A driver may only participate for a single team throughout the \nseason. Races are identified simply by the dates when they are run. For each race, the league also wants to \nstore the venue where it took place. Drivers participate in races, and for each participating driver the \ndatabase should store the total race time for that driver, and the league score they got from that race. \nYour task is to draw an ER diagram that correctly models this domain and its constraints.', 303, 2001),
(2, '[SUMMER]', 2013, 30, '', '', '', 303, 2002),
(3, '', 2014, 0, '', '', '', 303, 0),
(4, '', 2015, 0, '', '', '', 303, 0),
(5, '', 2016, 0, '', '', '', 303, 0),
(6, '', 2017, 0, '', '', '', 303, 0),
(7, '', 2018, 0, '', '', '', 303, 0),
(8, '', 2019, 0, '', 'Assume we have the following application that models soccer teams, the games they play, and the players in each team. In the design, we want to capture the following: •	We have a set of teams, each team has a unique identifier, name, main stadium, and to which city this team belongs. •	Each team must have many players, and each player belongs to one team for a given season. The player can change teams based on the offer that they receive from the team. Therefore, for each season the contract amount between the team and player should be stored in the system. Each player has a number, name, Date of Birth, start year and skill level. The players play in different position on regular basis (such as Goalkeeper or Midfielder). For Goalkeeper, they need to store number of goals saved by the keeper. For Defender they need to store the defending score and for Scorer they store number of goals scored. Players have a set of injury records where each record has an ID, date of injury and injury description. Each team must assign a player as captain of the team. The team can use more than one player as captain (substitute captain). A player may serve many teams as captain in different seasons.  •	Teams play matches, in each match there is a host team and a guest team. The match takes place in the stadium of the host team. For each match we need to keep track of the following: •	The date on which the game is played. •	The final score of the match for both teams. •	The players participated in the match. For each player, how many goals he scored, whether or not he took yellow card, and whether or not he took red card. •	During the match, one player may substitute another player. We want to capture this substitution and the time at which it took place. •	Each match has three referees. For each referee we have an ID, name, Date of Birth, years of experience. One referee is the main referee and the other two are assistant referee.  Create an EER diagram for the above scenario and indicate the cardinality of relationships and the nature of the associations (one/many and mandatory/optional). You should allocate adequate attributes to the entities of interest, and specify the identifiers.         ', 'A car dealership company maintains a database system. The dealership sells both new and used cars, and it operates a service facility. The following are the description of the company system: •	The system keeps records of three types of people: customer, salesperson and mechanic. The system stores their identification number, first and last names, address, and contact details (cellphone, email). The system also stores the details of a car; its serial number, model, color, country and year of manufacturing.     •	A salesperson can sell many cars, but each car is sold by only one salesperson. A salesperson writes a single invoice for each car he/she sells which has a unique invoice number and date.  •	A customer can buy many cars. A customer may also come in just to have his/her car serviced. The system maintains a service history for each of the cars serviced by storing the date when the service request was received from the customer and the return date to the customer.        •	A car brought in for service can be worked on by many mechanics, and each mechanic may work on many cars. The amount for servicing a car is distributed between the mechanics by the hours they worked on that car.     ', 303, 0),
(9, '', 2020, 0, '', '', '', 303, 0),
(10, '', 2021, 0, '', '', '', 303, 0),
(11, '', 2022, 0, '', '', '', 303, 0);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `SectionID` int(5) NOT NULL,
  `Semester` varchar(8) NOT NULL,
  `Year` year(4) NOT NULL,
  `CourseID` varchar(10) NOT NULL,
  `FacultyID` int(4) NOT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `CourseID` (`CourseID`,`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SectionID`, `Semester`, `Year`, `CourseID`, `FacultyID`) VALUES
(1, 'Summer', 0000, 'CSE303', 2001),
(2, 'Summer', 0000, 'CSE303', 2002),
(3, 'Summer', 0000, 'CSE303', 2003);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` int(7) NOT NULL,
  `StudentName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `StudentGender` varchar(8) CHARACTER SET utf8 NOT NULL,
  `StudentPhone` text CHARACTER SET utf8 NOT NULL,
  `StudentEmail` varchar(20) CHARACTER SET utf8 NOT NULL,
  `role` varchar(10) NOT NULL,
  `Marks` varchar(30) NOT NULL,
  `DepartmentID` varchar(10) CHARACTER SET utf8 NOT NULL,
  `CourseID` varchar(30) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `Department ID` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `StudentName`, `StudentGender`, `StudentPhone`, `StudentEmail`, `role`, `Marks`, `DepartmentID`, `CourseID`) VALUES
(7000001, 'Amin', 'Male', '01938772388', 'amin@gmail.com', 'student', '', 'CS', ''),
(7000002, 'Ahsanul', 'Male', '01938772387', 'ahsanul@gmail.com', 'student', '', 'CSE', ''),
(7000003, 'Shanto', 'Male', '01938772390', 'shanto@gmail.com', 'student', '', 'CSE', ''),
(7000004, 'Shariar', 'Male', '01938772395', 'shariar@gmail.com', 'student', '', 'CSE', ''),
(7000005, 'Ronok', 'Male', '01938772309', 'ronok@gmail.com', 'student', '', 'CS', ''),
(7000006, 'Koushik', 'Male', '01938772307', 'koushik@gmail.com', 'student', '', 'CS', ''),
(7000007, 'Dewri', 'Male', '01938772407', 'dewri@gmail.com', 'student', '', 'CSE', ''),
(7000008, 'Shuvo', 'Male', '01938772837', 'shuvo@gmail.com', 'student', '', 'BBA', ''),
(7000009, 'Hussain', 'Male', '01938773288', 'hussain@gmail.com', 'student', '', 'EEE', ''),
(7000010, 'Hasnin', 'Female', '01303030303', 'hasnin@gmail.com', 'student', '', 'BBA', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useremail` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userpass` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `useremail`, `userpass`, `user_type`) VALUES
(1, 'Salman Amin', 'a@a.com', '$2a$08$yR7l1qX2PuV0hwsESaI/hufAP8XA/IVxuRiDNbqWgGJwis/o41UY2', '1'),
(2, 'aa', 'aa@a.com', '$2a$08$yC7c819dLhjiCuITMMCf/uACsnjWyy8sS5KhnOiqfc0ehY/Kltiae', '2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
