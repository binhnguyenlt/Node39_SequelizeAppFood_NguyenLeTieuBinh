/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `descr` varchar(200) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  `is_liked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `res_id` (`res_id`) USING BTREE,
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(1, 'Gà luộc', 'imageGa', 100, '', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(2, 'Gà chiên', 'imageGa', 100, '', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(3, 'Gà nướng', 'imageGa', 100, '', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(4, 'Vịt luộc', 'imageVit', 200, '', 2),
(5, 'Vịt chiên', 'imageVit', 200, '', 2),
(6, 'Vịt nướng', 'imageVit', 200, '', 2),
(7, 'Heo luộc', 'imageHeo', 300, '', 3),
(8, 'Heo chiên', 'imageHeo', 300, '', 3),
(9, 'Heo nướng', 'imageHeo', 300, '', 3),
(10, 'Dê luộc', 'imageDe', 400, '', 4),
(11, 'Dê chiên', 'imageDe', 400, '', 4),
(12, 'Dê nướng', 'imageDe', 400, '', 4),
(13, 'Bò luộc', 'imageBo', 500, '', 5),
(14, 'Bò chiên', 'imageBo', 500, '', 5),
(15, 'Bò nướng', 'imageBo', 500, '', 5),
(16, 'Chay trường', 'imageChay', 600, '', 6),
(17, 'Chay tuỳ ngày', 'imageChay', 600, '', 6),
(18, 'Chay tuỳ tháng', 'imageChay', 600, '', 6);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món Gà');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món Vịt');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món Heo');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Món Dê'),
(5, 'Món Bò'),
(6, 'Món Chay');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `is_liked`) VALUES
(1, 1, '2023-12-12 10:10:10', NULL);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `is_liked`) VALUES
(1, 2, '2023-12-12 10:10:10', NULL);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `is_liked`) VALUES
(1, 3, '2023-12-12 10:10:10', NULL);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `is_liked`) VALUES
(1, 4, '2023-12-12 10:10:10', NULL),
(1, 5, '2023-12-12 10:10:10', NULL),
(2, 1, '2023-12-12 10:10:10', NULL),
(2, 2, '2023-12-12 10:10:10', NULL),
(2, 3, '2023-12-12 10:10:10', NULL),
(2, 4, '2023-12-12 10:10:10', NULL),
(2, 5, '2024-03-01 14:20:29', 1),
(3, 1, '2023-12-12 10:10:10', NULL),
(3, 2, '2023-12-12 10:10:10', NULL),
(3, 3, '2023-12-12 10:10:10', NULL),
(4, 1, '2023-12-12 10:10:10', NULL),
(4, 2, '2023-12-12 10:10:10', NULL),
(4, 3, '2024-02-27 13:39:57', NULL),
(5, 1, '2023-12-12 10:10:10', NULL),
(5, 2, '2023-12-12 10:10:10', NULL),
(6, 1, '2023-12-12 10:10:10', NULL),
(7, 2, '2023-12-12 10:10:10', NULL),
(8, 3, '2023-12-12 10:10:10', NULL);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 3, '1', '1');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 3, '2', '1');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 4, '3', '1');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 3, '2', '1'),
(2, 3, 5, '2', '1'),
(2, 4, 2, '4', '1'),
(2, 5, 2, '2', '1'),
(2, 7, 2, '3', '1'),
(3, 5, 2, '5', '1'),
(3, 6, 2, '6', '1'),
(4, 7, 2, '7', '1'),
(4, 8, 1, '8', '1'),
(5, 9, 1, '9', '1'),
(5, 10, 1, '10', '1');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, '2023-12-12 10:10:10');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 8, '2024-03-02 14:40:02');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 9, '2024-03-02 14:39:34');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 3, 7, '2024-03-02 14:40:11'),
(3, 3, 3, '2023-12-12 10:10:10'),
(4, 4, 4, '2023-12-12 10:10:10'),
(5, 5, 5, '2023-12-12 10:10:10');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descr`) VALUES
(1, 'Nhà hàng A', 'imageA', 'Itatian');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descr`) VALUES
(2, 'Nhà hàng B', 'imageB', 'French');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descr`) VALUES
(3, 'Nhà hàng C', 'imageC', 'Chinese');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descr`) VALUES
(4, 'Nhà hàng D', 'imageD', 'Japanese'),
(5, 'Nhà hàng E', 'imageE', 'Vietnamese');



INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com', '4');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Nguyễn Văn B', 'b@gmail.com', '2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Nguyễn Văn C', 'c@gmail.com', '2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Nguyễn Văn D', 'd@gmail.com', '1'),
(5, 'Nguyễn Văn E', 'e@gmail.com', '2'),
(6, 'Nguyễn Văn F', 'f@gmail.com', '3'),
(7, 'Nguyễn Văn G', 'g@gmail.com', '3'),
(8, 'Nguyễn Văn H', 'h@gmail.com', '3'),
(9, 'Nguyễn Văn I', 'i@gmail.com', '3'),
(10, 'Nguyễn Văn J', 'j@gmail.com', '3');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;