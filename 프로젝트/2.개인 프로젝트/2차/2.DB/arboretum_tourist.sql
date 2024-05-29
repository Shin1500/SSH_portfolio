-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: arboretum
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
-- Table structure for table `tourist`
--

DROP TABLE IF EXISTS `tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourist` (
  `Year` text,
  `Month` text,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
INSERT INTO `tourist` VALUES ('2018년','1월',1791),('2018년','2월',1527),('2018년','3월',3789),('2018년','4월',10334),('2018년','5월',38652),('2018년','6월',33651),('2018년','7월',18033),('2018년','8월',21039),('2018년','9월',18476),('2018년','10월',40889),('2018년','11월',17699),('2018년','12월',3936),('2019년','1월',3778),('2019년','2월',4435),('2019년','3월',6810),('2019년','4월',18475),('2019년','5월',27266),('2019년','6월',19027),('2019년','7월',18560),('2019년','8월',25598),('2019년','9월',18225),('2019년','10월',41252),('2019년','11월',17547),('2019년','12월',4652),('2020년','1월',5070),('2020년','2월',1825),('2020년','3월',0),('2020년','4월',2416),('2020년','5월',14273),('2020년','6월',6646),('2020년','7월',8092),('2020년','8월',12099),('2020년','9월',6800),('2020년','10월',24952),('2020년','11월',10084),('2020년','12월',2065),('2021년','1월',1250),('2021년','2월',2934),('2021년','3월',2210),('2021년','4월',8984),('2021년','5월',15916),('2021년','6월',9822),('2021년','7월',8415),('2021년','8월',14021),('2021년','9월',15005),('2021년','10월',27601),('2021년','11월',11447),('2021년','12월',3347),('2022년','1월',3616),('2022년','2월',1863),('2022년','3월',1594),('2022년','4월',11400),('2022년','5월',23676),('2022년','6월',12448),('2022년','7월',14428),('2022년','8월',21801),('2022년','9월',20231),('2022년','10월',44462),('2022년','11월',30359),('2022년','12월',31700);
/*!40000 ALTER TABLE `tourist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 14:51:13
