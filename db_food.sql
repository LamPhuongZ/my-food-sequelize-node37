/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `tblFood` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `tblFood_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tblFood_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblFood_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblLike_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`) USING BTREE,
  CONSTRAINT `tblLike_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tblUser` (`user_id`),
  CONSTRAINT `tblLike_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `tblRestaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblOrder` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `tblOrder_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tblUser` (`user_id`),
  CONSTRAINT `tblOrder_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `tblFood` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblRate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `tblRate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tblUser` (`user_id`),
  CONSTRAINT `tblRate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `tblRestaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblRestaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblSub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `tblSub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `tblFood` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tblUser` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tblFood` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Coke', 'https://medicare.vn/wp-content/uploads/2021/01/0063149.jpg', 5, 'coca cola', 1);
INSERT INTO `tblFood` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Hủ tiếu', 'https://daubepgiadinh.vn/wp-content/uploads/2018/05/hinh-hu-tiu-nam-vang.jpg', 30, 'hủ tiếu gõ', 4);
INSERT INTO `tblFood` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Bún bò', 'https://i.ytimg.com/vi/A_o2qfaTgKs/maxresdefault.jpg', 50, 'bún bò', 4);
INSERT INTO `tblFood` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Khoai tây chiên', 'http://icdn.dantri.com.vn/zoom/1200_630/2017/khoai-tay-chien-1497363342895.jpg', 100, 'khoai tây chiên', 2),
(5, 'Bánh tráng', 'https://res.klook.com/image/upload/q_85/c_fill,w_750/v1596008298/blog/eibedalo0wncojkerkpg.jpg', 33, 'bánh tráng', 5),
(6, 'Sandwich', 'https://monngonmoingay.com/wp-content/uploads/2020/12/sandwich-kep-cha-tom-500.jpg', 2, 'sandwich', 2),
(7, 'Combo đồ chay', 'https://cdn.tgdd.vn/Files/2022/03/21/1421421/tong-hop-16-cach-lam-mon-chay-thanh-dam-dinh-duong-tai-nha-202203211050443101.jpg', 1, 'combo đồ ăn chay', 3),
(8, 'Burger', 'https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/r/crunchy_whp-min_1.jpg', 7, 'hum bơ gơ', 2);

INSERT INTO `tblFood_type` (`type_id`, `type_name`) VALUES
(1, 'Thức uống');
INSERT INTO `tblFood_type` (`type_id`, `type_name`) VALUES
(2, 'Thức ăn nhanh');
INSERT INTO `tblFood_type` (`type_id`, `type_name`) VALUES
(3, 'Món chay');
INSERT INTO `tblFood_type` (`type_id`, `type_name`) VALUES
(4, 'Món nước'),
(5, 'Ăn vặt');

INSERT INTO `tblLike_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-06-09 00:00:00');
INSERT INTO `tblLike_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2023-06-09 00:00:00');
INSERT INTO `tblLike_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2023-06-09 00:00:00');
INSERT INTO `tblLike_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 3, '2023-06-09 00:00:00'),
(3, 1, '2023-06-09 00:00:00'),
(4, 1, '2023-05-09 00:00:00'),
(4, 2, '2023-06-03 00:00:00'),
(4, 3, '2023-04-02 00:00:00'),
(5, 1, '2023-01-04 00:00:00'),
(5, 2, '2023-05-10 00:00:00'),
(5, 3, '2023-05-07 00:00:00'),
(6, 1, '2023-12-08 15:32:46'),
(6, 2, '2023-06-09 00:00:00');

INSERT INTO `tblOrder` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 3, '', '[1, 2]');
INSERT INTO `tblOrder` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 2, '', '[4,5]');
INSERT INTO `tblOrder` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 3, 10, '', '');
INSERT INTO `tblOrder` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 1, 1, '', ''),
(3, 3, 10, '', '[1,2,3]'),
(3, 4, 1, '', ''),
(3, 5, 5, '', ''),
(3, 6, 10, '', ''),
(3, 8, 10, '', '');

INSERT INTO `tblRate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 2, '2023-06-09 00:00:00');
INSERT INTO `tblRate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 4, '2023-06-09 00:00:00');
INSERT INTO `tblRate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 10, '2023-12-08 17:25:04');
INSERT INTO `tblRate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 1, '2023-06-09 00:00:00'),
(2, 3, 9, '2023-06-09 00:00:00'),
(3, 1, 10, '2023-06-09 00:00:00'),
(4, 1, 7, '2023-05-09 00:00:00'),
(4, 2, 6, '2023-06-03 00:00:00'),
(4, 3, 8, '2023-04-02 00:00:00'),
(5, 1, 15, '2023-01-04 00:00:00'),
(5, 2, 1, '2023-05-10 00:00:00'),
(5, 3, 100, '2023-05-07 00:00:00'),
(6, 2, 1, '2023-06-09 00:00:00');

INSERT INTO `tblRestaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Phúc Long', 'https://static.mservice.io/placebrand/s/momo-upload-				api-200218150929-637176353692616410.jpg', 'phúc long');
INSERT INTO `tblRestaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'KFC', '/public/img/1659847246771_test.mp4', 'kfc');
INSERT INTO `tblRestaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Kichi kichi', 'https://aeonmall-haiphong-lechan.com.vn/wp-content/uploads/2020/09/25.-kichi-kichi.jpg', 'kichi kichi');

INSERT INTO `tblSub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Hành phi', 1, 4);
INSERT INTO `tblSub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Tương ớt', 1, 2);
INSERT INTO `tblSub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Bò viên', 1, 3);
INSERT INTO `tblSub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Thịt bò', 1, 3);

INSERT INTO `tblUser` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@gmail.com', 'password');
INSERT INTO `tblUser` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Trần Kim Thùy', 'kimthuy@gmail.com', 'password');
INSERT INTO `tblUser` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Nguyễn Hồng Anh', 'honganh@gmail.com', 'password');
INSERT INTO `tblUser` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Lý Trung', 'lytrung@gmail.com', 'password'),
(5, 'Văn Kim Cúc', 'kimcuc@gmail.com', 'password'),
(6, 'Nguyễn Văn B', 'vanb@gmail.com', 'password'),
(7, 'Thái Văn A', 'thaia@gmail.com', 'password'),
(8, 'Thái Văn B', 'thaib@gmail.com', 'password'),
(9, 'Đỗ Lan', 'dolan@gmail.com', 'password'),
(10, 'Phạm Văn Công', 'vancong@gmail.com', 'password');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;