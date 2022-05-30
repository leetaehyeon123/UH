-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: uhdb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `member_table`
--

DROP TABLE IF EXISTS `member_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_table` (
  `member_idx` int NOT NULL AUTO_INCREMENT,
  `member_nick` varchar(500) DEFAULT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `member_pw` varchar(45) DEFAULT NULL,
  `member_phone` varchar(45) DEFAULT NULL,
  `member_kakao` varchar(45) DEFAULT NULL,
  `member_google` varchar(45) DEFAULT NULL,
  `member_naver` varchar(45) DEFAULT NULL,
  `member_facebook` varchar(45) DEFAULT NULL,
  `member_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_table`
--

LOCK TABLES `member_table` WRITE;
/*!40000 ALTER TABLE `member_table` DISABLE KEYS */;
INSERT INTO `member_table` VALUES (15,'123','mscks1234','123123','01024019761','mscks123@naver.com',NULL,NULL,NULL,'이준창'),(17,'박성우',NULL,NULL,'01048109461','kmcslo@naver.com',NULL,NULL,NULL,NULL),(20,'<span style=\"color:red\">운영자</span>',NULL,NULL,'01045207141','harry7141@naver.com','harry7141@gmail.com',NULL,NULL,NULL),(21,'1','1','1','1',NULL,NULL,NULL,NULL,'1'),(22,'행신동냐옹이','행신동냐옹이','aoimh4923','01049232904',NULL,NULL,NULL,NULL,'김지원'),(23,'jin','abc','1111','01095577746','0205kjl@naver.com',NULL,NULL,NULL,'김진렬');
/*!40000 ALTER TABLE `member_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31  0:25:55
