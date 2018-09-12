# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.9-MariaDB)
# Database: php_cambridge
# Generation Time: 2018-09-12 19:18:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `shipped` decimal(12,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `client`, `product_id`, `shipped`, `date`, `status`)
VALUES
	(1,'Sahah Johnson',1,1,'2018-09-06','shipped'),
	(2,'Lucy Cartwright',1,2,'2018-09-12','draft');

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `starting_inventory` decimal(12,0) DEFAULT NULL,
  `minimum_required` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `name`, `part_number`, `starting_inventory`, `minimum_required`)
VALUES
	(1,'iPad','3992',5,2),
	(2,'Newton','0003',0,2),
	(3,'Apple Pensil','9242',0,6);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `quantity` decimal(12,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;

INSERT INTO `purchase` (`id`, `product_id`, `status`, `quantity`, `date`)
VALUES
	(1,1,'received',10,'2018-09-12'),
	(2,2,'draft',5,'2012-05-15');

/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
