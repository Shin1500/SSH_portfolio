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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `buy_id` bigint(20) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `product_id` varchar(12) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `buy_price` int(11) NOT NULL,
  `buy_count` int(11) NOT NULL,
  `product_image` varchar(16) DEFAULT 'nothing.jpg',
  `buy_date` datetime NOT NULL,
  `account` varchar(50) NOT NULL,
  `deliveryName` varchar(10) NOT NULL,
  `deliveryTel` varchar(20) NOT NULL,
  `deliveryAddress` varchar(100) NOT NULL,
  `sanction` varchar(10) DEFAULT '상품 준비중'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (2024022300001,'abc@customer.com','15','피크닉',900,1,'피크닉4.jpg','2024-02-23 10:44:00','1111-11111-1111 국민은행 홍길동','홍길동','대구시 신천동','010-1234-1234','상품 준비중'),(2024022310002,'abc@customer.com','15','피크닉',900,1,'피크닉4.jpg','2024-02-23 11:06:57','1111-11111-1111 국민은행 홍길동','홍길동','대구시 신천동','010-1234-1234','상품 준비중'),(2024022310003,'abc@customer.com','13','오징어 땅콩',900,1,'003.jpg','2024-02-23 11:40:47','1111-11111-1111 국민은행 홍길동','홍길동','대구시 신천동','010-1234-1234','상품 준비중'),(2024022310003,'abc@customer.com','12','오레오',1350,1,'0022.jpg','2024-02-23 11:40:47','1111-11111-1111 국민은행 홍길동','홍길동','대구시 신천동','010-1234-1234','상품 준비중');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 13:30:28
