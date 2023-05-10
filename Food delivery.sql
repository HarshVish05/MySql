DROP DATABASE IF EXISTS `food_delivery`;
CREATE DATABASE `food_delivery`;
USE `food_delivery`;
create table `restaurants`(
`restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`address` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
Primary Key(`restaurant_id`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `restaurants` VALUES(1,'Oudh 1950','behala','Kolkata');
INSERT INTO `restaurants` VALUES(2,'Arsalan','ruby','Kolkata');
INSERT INTO `restaurants` VALUES(3,'ozora','New Alipore','Kolkata');
INSERT INTO `restaurants` VALUES(4,'byepass dhaba','ruby','Kolkata');
INSERT INTO `restaurants` VALUES(5,'azad hind','New Alipore','Kolkata');
INSERT INTO `restaurants` VALUES(6,'aminia','behala','Kolkata');

create table `customers`(
`customer_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`email` varchar(50) NOT NULL,
`phone` varchar(50) DEFAULT NULL,
`address` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
Primary Key(`customer_id`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customers` VALUES(1,'devansh','abc@gmail.com','1234567890','new town','Kolkata');
INSERT INTO `customers` VALUES(2,'Harsh','harsh@gmail.com','6565656555','Behala','Kolkata');
INSERT INTO `customers` VALUES(3,'Rohit','rohit@gmail.com','111112333211','ruby','kolkata');

create table `menu`(
`menu_id` int(11) NOT NULL AUTO_INCREMENT,
`restaurant_id` int(11) NOT NULL,
`name` varchar(50) NOT NULL,
`price` int(11) NOT NULL,
Primary Key(`menu_id`),
 CONSTRAINT FK_MENUORDER FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `menu` VALUES(1,1,'chicken  kebab',300);
INSERT INTO `menu` VALUES(2,1,'chicken Biryani',200);
INSERT INTO `menu` VALUES(3,2,'Mutton biryani',300);
INSERT INTO `menu` VALUES(4,2,'chicken Butter Masala',300);
INSERT INTO `menu` VALUES(5,3,'chole bhature',200);
INSERT INTO `menu` VALUES(6,3,'paneer pasanda',400);
INSERT INTO `menu` VALUES(7,4,'plain dosa',70);
INSERT INTO `menu` VALUES(8,4,'paneer butter masala',300);
INSERT INTO `menu` VALUES(9,5,'masala dosa',150);
INSERT INTO `menu` VALUES(10,5,'vada',100);
INSERT INTO `menu` VALUES(11,6,'idli',100);
INSERT INTO `menu` VALUES(12,6,'dal makhani',200);

create table `order`(
`order_id` int(11) NOT NULL AUTO_INCREMENT ,
`restaurant_id` int(11) NOT NULL,
`customer_id` int(11) NOT NULL,
`menu_id` int(11) NOT NULL,
Primary Key(`order_id`),
 CONSTRAINT FK_RESTRO FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_CUST FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_MENU FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order` VALUES(1,1,1,2);
INSERT INTO `order` VALUES(2,2,2,4);
INSERT INTO `order` VALUES(3,3,3,6);