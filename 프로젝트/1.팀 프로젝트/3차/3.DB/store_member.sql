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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(50) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `name` varchar(10) NOT NULL,
  `reg_date` datetime NOT NULL,
  `address` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('abcd@customer.com','1234','안길동','2024-02-23 10:15:36','주소를 수정가능함','010-1234-1234'),('customer10@store.com','1234','이손님','2024-02-23 10:59:23','대구 동구 불로동','010-1727-3747'),('customer1@store.com','1234','김손님','2024-02-23 10:56:42','경산시 경산로 7길 ','010-1234-5678'),('customer2@store.com','1234','박손님','2024-02-23 10:56:42','경상북도 경산시 옥곡동','010-1122-5678'),('customer3@store.com','1234','안손님','2024-02-23 10:56:43','대구 동구 둔산로','010-1122-5578'),('customer4@store.com','1234','황손님','2024-02-23 10:56:43','경기도 시흥시','010-1422-5578'),('customer5@store.com','1234','왕손님','2024-02-23 10:56:44','서울특별시 종로구 세종대로','010-1332-5558'),('customer6@store.com','1234','백손님','2024-02-23 10:56:44','서울특별시 서초구 서초동','010-1872-9678'),('customer7@store.com','1234','공손님','2024-02-23 10:57:41','대구 동구 백안동','010-7772-9678'),('customer8@store.com','1234','남손님','2024-02-23 10:58:12','대구 칠곡','010-9072-1054'),('customer9@store.com','1234','강손님','2024-02-23 10:59:02','대구 동구 중대동','010-5765-1294');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 13:30:24
