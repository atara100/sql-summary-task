-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: יוני 28, 2022 בזמן 11:47 AM
-- גרסת שרת: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--

DELIMITER $$
--
-- נהלים
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_function` ()  BEGIN
DECLARE num int;
set num=1;
WHILE num <=6 DO
SELECT mediators.mediator_name,price FROM יhouses INNER JOIN mediators
ON mediator_id=mediators.id WHERE price=(SELECT max(price) FROM יhouses where mediator_id=num);
set num=num+1;
end WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `mediators`
--

CREATE TABLE `mediators` (
  `id` int(11) NOT NULL,
  `mediator_name` varchar(45) DEFAULT NULL,
  `seniority` int(11) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- הוצאת מידע עבור טבלה `mediators`
--

INSERT INTO `mediators` (`id`, `mediator_name`, `seniority`, `phone`) VALUES
(1, 'ido', 10, '0582511408'),
(2, 'yael', 15, '0581299300'),
(3, 'naama', 20, '0578455201'),
(4, 'daniel', 35, '0586239502'),
(5, 'israel', 7, '0502488101'),
(6, 'shira', 9, '0526300104');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `יhouses`
--

CREATE TABLE `יhouses` (
  `id` int(11) NOT NULL,
  `num_rooms` int(11) DEFAULT NULL,
  `num_Terraces` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `mediator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- הוצאת מידע עבור טבלה `יhouses`
--

INSERT INTO `יhouses` (`id`, `num_rooms`, `num_Terraces`, `age`, `price`, `mediator_id`) VALUES
(1, 5, 1, 70, 900000, 2),
(2, 4, 2, 40, 800000, 1),
(3, 4, 2, 60, 1000000, 1),
(4, 3, 1, 50, 1500000, 4),
(5, 5, 3, 10, 950000, 5),
(6, 6, 1, 20, 920000, 6);

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `mediators`
--
ALTER TABLE `mediators`
  ADD PRIMARY KEY (`id`);

--
-- אינדקסים לטבלה `יhouses`
--
ALTER TABLE `יhouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mediator_id_constraint` (`mediator_id`);

--
-- הגבלות לטבלאות שהוצאו
--

--
-- הגבלות לטבלה `יhouses`
--
ALTER TABLE `יhouses`
  ADD CONSTRAINT `mediator_id_constraint` FOREIGN KEY (`mediator_id`) REFERENCES `mediators` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
