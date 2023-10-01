-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 11:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `department_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `department_id`) VALUES
(1, 'Introduction to Programming', 'CS'),
(2, 'Database Management', 'CS'),
(3, 'Mechanics of Materials', 'ME'),
(4, 'Electromagnetic Fields', 'EE'),
(5, 'Marketing Management', 'BA'),
(6, 'Structural Engineering', 'CE'),
(7, 'Einführung in die Programmierung', 'CS'),
(8, 'Datenbankmanagement', 'CS'),
(9, 'Mechanik der Werkstoffe', 'ME'),
(10, 'Elektromagnetische Felder', 'EE'),
(11, 'Marketingmanagement', 'BA'),
(12, 'Datenstrukturen', 'CS'),
(13, 'Thermodynamik', 'ME'),
(14, 'Digitale Elektronik', 'EE'),
(15, 'Betriebswirtschaftslehre', 'BA'),
(16, 'Mathematik', 'MA'),
(17, 'Künstliche Intelligenz', 'CS'),
(18, 'Baustatik', 'CE'),
(19, 'Finanzmanagement', 'BA'),
(20, 'Maschinelles Lernen', 'CS'),
(21, 'Elektrische Schaltungen', 'EE'),
(22, 'Informatik', 'CS'),
(23, 'Architektur', 'CE'),
(24, 'Strömungsmechanik', 'ME'),
(25, 'Kommunikation', 'BA'),
(26, 'Regelungstechnik', 'EE');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(2) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
('BA', 'Business Administration'),
('CE', 'Civil Engineering'),
('CL', 'Bauingenieurwesen'),
('CS', 'Computer Science'),
('DA', 'Betriebswirtschaftslehre'),
('EA', 'Elektrotechnik'),
('EE', 'Electrical Engineering'),
('IL', 'Informatik'),
('MA', 'Mathematik'),
('MB', 'Maschinenbau'),
('ME', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES
(1, 1, 1, '2023-01-15'),
(2, 2, 1, '2023-01-20'),
(3, 3, 3, '2023-02-10'),
(4, 4, 4, '2023-02-15'),
(5, 5, 5, '2023-03-01'),
(6, 6, NULL, '2023-09-30'),
(7, 7, 2, '2023-09-30'),
(8, 8, 5, '2023-09-30'),
(49, 30, 3, '2023-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `student_id`, `course_id`, `grade`) VALUES
(1, 1, 1, 95),
(2, 2, 1, 88),
(3, 3, 3, 92),
(4, 4, 4, 89),
(5, 5, 5, 78);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(15) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `department_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `email`, `address`, `number`, `course_id`, `department_id`) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St', '123-456-7890', 1, 'CS'),
(2, 'John', 'Smith', 'janesmith@example.com', '456 Elm St', '987-654-3210', 2, 'CS'),
(3, 'Alice', 'Johnson', 'alicejohnson@example.com', '789 Oak St', '555-123-4567', 3, 'ME'),
(4, 'Bob', 'Williams', 'bobwilliams@example.com', '321 Pine St', '777-888-9999', 4, 'EE'),
(5, 'Eva', 'Brown', 'evabrown@example.com', '555 Cedar St', '111-222-3333', 5, 'BA'),
(8, 'Abdul', 'Rafay', 'rafay13@protonmail.com', 'shah faisal colony, House no. 69', '03114895725', 5, NULL),
(9, 'Iqbal', 'Hussain', 'IqbalHussain@example.com', '123 Main St', '123-456-7890', 6, 'CE'),
(10, 'Hans', 'Schmidt', 'hans.schmidt@example.com', '123 Hauptstrasse', '123-456-7890', 1, 'CS'),
(11, 'Marie', 'Dubois', 'marie.dubois@example.com', '456 Rue Principale', '987-654-3210', 2, 'CE'),
(12, 'Franz', 'Müller', 'franz.muller@example.com', '789 Hauptweg', '555-123-4567', 3, 'BA'),
(13, 'Sophie', 'Lefebvre', 'sophie.lefebvre@example.com', '123 Rue de la Poste', '111-222-3333', 4, 'EE'),
(14, 'Lukas', 'Martin', 'lukas.martin@example.com', '456 Avenue des Champs-Élysées', '222-333-4444', 5, 'ME'),
(15, 'Amélie', 'Schneider', 'amelie.schneider@example.com', '890 Quai de la Seine', '777-888-9999', 1, 'CS'),
(16, 'Paul', 'Dupont', 'paul.dupont@example.com', '123 Quai des Orfèvres', '444-555-6666', 2, 'CE'),
(17, 'Julie', 'Lemoine', 'julie.lemoine@example.com', '456 Avenue de la République', '999-888-7777', 3, 'BA'),
(18, 'Müller', 'Schmidt', 'muller.schmidt@example.com', '789 Hauptstrasse', '123-321-1111', 4, 'EE'),
(19, 'Leclerc', 'Dubois', 'leclerc.dubois@example.com', '123 Rue de la Liberté', '111-555-9999', 5, 'ME'),
(20, 'Eva', 'Berger', 'eva.berger@example.com', '890 Strasse der Einheit', '777-999-2222', 1, 'CS'),
(21, 'Élise', 'Lefevre', 'elise.lefevre@example.com', '123 Avenue de Gaulle', '222-777-3333', 2, 'CE'),
(22, 'Thomas', 'Müller', 'thomas.muller@example.com', '456 Friedrichstrasse', '999-111-4444', 3, 'BA'),
(23, 'Charlotte', 'Martin', 'charlotte.martin@example.com', '123 Boulevard Haussmann', '888-333-2222', 4, 'EE'),
(24, 'Léa', 'Schneider', 'lea.schneider@example.com', '456 Place de la Concorde', '777-666-5555', 5, 'ME'),
(25, 'Leon', 'Dubois', 'leon.dubois@example.com', '123 Quai Branly', '666-111-2222', 1, 'CS'),
(26, 'Manon', 'Dupont', 'manon.dupont@example.com', '456 Avenue de la Bastille', '111-777-8888', 2, 'CE'),
(27, 'Lucas', 'Lemoine', 'lucas.lemoine@example.com', '890 Rue de la Paix', '444-999-6666', 3, 'BA'),
(28, 'Müller', 'Schmidt', 'muller.schmidt@example.com', '123 Hauptstrasse', '888-555-2222', 4, 'EE'),
(29, 'Leclerc', 'Dubois', 'leclerc.dubois@example.com', '456 Rue de la Poste', '666-333-9999', 5, 'ME'),
(30, 'Syed', 'Nafay', 'Nafay@proton.me', 'Gulshan-e-Iqbal', '03201854856', 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
