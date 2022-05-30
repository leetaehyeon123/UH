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
-- Table structure for table `board_table`
--

DROP TABLE IF EXISTS `board_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_table` (
  `board_idx` int NOT NULL AUTO_INCREMENT,
  `board_name` varchar(45) DEFAULT NULL,
  `board_category` varchar(45) DEFAULT NULL,
  `board_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_table`
--

LOCK TABLES `board_table` WRITE;
/*!40000 ALTER TABLE `board_table` DISABLE KEYS */;
INSERT INTO `board_table` VALUES (1,'배틀그라운드','게임',NULL),(2,'축구','스포츠',NULL),(3,'유머','일상',NULL),(4,'오버워치','게임',NULL),(5,'트와이스','연예',NULL),(6,'발로란트','게임',NULL),(7,'농구','스포츠',NULL),(8,'국내야구','스포츠',NULL),(9,'서든어택','게임',NULL),(10,'자유','일상',NULL),(11,'배구','스포츠',NULL),(12,'메이플스토리','게임',NULL),(13,'포켓몬스터','애니',NULL),(14,'방탄소년단','연예',NULL),(15,'오마이걸','연예',NULL),(16,'피파온라인','게임',NULL),(17,'요리','일상',NULL),(18,'컴퓨터견적','IT',NULL),(19,'스마트폰','IT',NULL),(20,'코딩','IT',NULL),(21,'리그오브레전드','게임',NULL),(22,'토탈워','게임',NULL),(23,'여행','일상',NULL),(24,'탁구','스포츠',NULL),(25,'해외야구','스포츠',NULL),(26,'씨름','스포츠',NULL),(27,'군대','일상',NULL),(28,'핫이슈','일상',NULL),(29,'수영','스포츠',NULL),(30,'수지','연예',NULL),(31,'설현','연예',NULL),(32,'아이린','연예',NULL),(33,'나현','연예',NULL),(34,'윤아','연예',NULL),(35,'손나은','연예',NULL),(36,'나혼자산다','방송',NULL),(37,'고등래퍼2','방송',NULL),(38,'하트시그널','방송',NULL),(39,'아는형님','방송',NULL),(40,'나의아저씨','방송',NULL),(41,'무한도전','방송',NULL),(42,'슈퍼맨이돌아왔다','방송',NULL),(43,'기타','일상',NULL);
/*!40000 ALTER TABLE `board_table` ENABLE KEYS */;
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
