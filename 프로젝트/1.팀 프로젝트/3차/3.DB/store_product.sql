-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_kind` varchar(3) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `product_weight` int(11) NOT NULL,
  `publishing_com` varchar(30) NOT NULL,
  `publishing_date` varchar(15) NOT NULL,
  `product_image` varchar(16) DEFAULT 'nothing.jpg',
  `discount_rate` int(11) DEFAULT '10',
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (11,'100','칙촉',2000,10,100,'롯데제과','2024-01-01','0011.jpg',10,'2024-02-22 10:06:57'),(12,'100','오레오',1500,9,100,'몬델리즈','2023-10-01','0022.jpg',10,'2024-02-22 10:08:35'),(13,'100','오징어 땅콩',1000,9,100,'오리온','2024-02-03','003.jpg',10,'2024-02-22 10:08:57'),(14,'200','카프리썬',1000,10,100,'농심','2023-12-05','카프리썬4.jpg',10,'2024-02-22 10:09:46'),(15,'200','피크닉',1000,8,100,'매일유업','2023-11-22','피크닉4.jpg',10,'2024-02-22 10:10:19'),(16,'200','웰치스',1000,10,100,'농심','2024-02-03','009.jpg',10,'2024-02-22 10:11:13'),(17,'300','스프링노트',2000,10,100,'문구점','2022-05-01','스프링 노트4.jpg',10,'2024-02-22 10:11:48'),(18,'300','가위',800,10,50,'문구점','2024-01-01','코팅가위9.jpg',10,'2024-02-22 10:12:14'),(19,'300','제트스트림 볼펜',1000,10,80,'문구점','2023-11-17','제트스트림5.jpg',10,'2024-02-22 10:12:43');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 13:30:26
