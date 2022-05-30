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
-- Table structure for table `reply_table`
--

DROP TABLE IF EXISTS `reply_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply_table` (
  `reply_idx` int NOT NULL AUTO_INCREMENT,
  `reply_post_idx` int DEFAULT NULL,
  `reply_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `reply_member_nick` varchar(45) DEFAULT NULL,
  `reply_con` varchar(15000) DEFAULT NULL,
  `reply_step` varchar(45) DEFAULT NULL,
  `reply_depth` varchar(45) DEFAULT NULL,
  `reply_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reply_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_table`
--

LOCK TABLES `reply_table` WRITE;
/*!40000 ALTER TABLE `reply_table` DISABLE KEYS */;
INSERT INTO `reply_table` VALUES (18,364,'2020-12-18 19:43:30','jinjinjara','zzzzzzzzzzzzzzzz','0','0',NULL),(19,364,'2020-12-18 19:43:49','jinjinjara','안녕하세요','0','0',NULL),(20,364,'2020-12-18 19:44:38','jinjinjara','ㅁ','0','0',NULL),(21,364,'2020-12-18 19:44:57','jinjinjara','ㅁ','0','0',NULL),(22,364,'2020-12-18 19:48:16','jinjinjara','ㅁ','0','0',NULL),(23,364,'2020-12-18 19:48:19','jinjinjara','ㅁㄴㅇㄻㄴㅇㄹ','0','0',NULL),(24,364,'2020-12-18 19:50:13','jinjinjara','테스트입니다.','0','0',NULL),(25,364,'2020-12-18 19:52:30','jinjinjara','ㅁㄴㅇ','0','0',NULL),(26,364,'2020-12-18 19:52:34','jinjinjara','ㅓㅓㅓㅓㅓ','0','0',NULL),(28,362,'2020-12-18 19:57:23','jinjinjara','ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㄴㅇ','0','0',NULL),(29,363,'2020-12-18 19:59:03','jinjinjara','ㅁㅁㅁㅁㅁㅁ','0','0',NULL),(30,363,'2020-12-18 19:59:38','jinjinjara','123123123123123123','0','0',NULL),(31,363,'2020-12-18 20:01:24','jinjinjara','ㅁ','0','0',NULL),(32,363,'2020-12-18 20:01:30','jinjinjara','1111','0','0',NULL),(33,363,'2020-12-18 20:01:42','jinjinjara','ㅁ','0','0',NULL),(34,363,'2020-12-18 20:01:44','jinjinjara','ㅁㅁㅁㅁㅁㅁ','0','0',NULL),(35,363,'2020-12-18 20:01:48','jinjinjara','123123','0','0',NULL),(36,363,'2020-12-18 20:03:10','jinjinjara','1','0','0',NULL),(37,363,'2020-12-18 20:03:30','jinjinjara','ㅁ','0','0',NULL),(38,363,'2020-12-18 20:03:35','jinjinjara','ㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕ','0','0',NULL),(39,363,'2020-12-18 20:03:41','jinjinjara','@@@@@@@@@@@@@@@@@@@@@@@@','0','0',NULL),(40,363,'2020-12-18 20:04:01','jinjinjara','aslkfhals;dfasd;lkfla;sdf','0','0',NULL),(41,363,'2020-12-18 20:04:11','jinjinjara','pppppppppppppppppppppp','0','0',NULL),(42,363,'2020-12-18 20:04:49','jinjinjara','a','0','0',NULL),(43,364,'2020-12-18 20:05:15','jinjinjara','zxczxczxczxczxc','0','0',NULL),(44,364,'2020-12-18 20:05:44','jinjinjara','반가워요','0','0',NULL),(45,364,'2020-12-18 20:06:04','jinjinjara','2','0','0',NULL),(46,364,'2020-12-18 20:06:18','jinjinjara','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','0','0',NULL),(47,348,'2020-12-18 20:06:43','jinjinjara','인지용','0','0',NULL),(48,348,'2020-12-18 20:06:49','jinjinjara','ㅁ','0','0',NULL),(49,354,'2020-12-18 20:06:58','jinjinjara','ㅁㅁ','0','0',NULL),(50,354,'2020-12-18 20:08:53','jinjinjara','ㄴ','0','0',NULL),(51,354,'2020-12-18 20:09:00','jinjinjara','ㅁ','0','0',NULL),(52,354,'2020-12-18 20:12:01','jinjinjara','ㅁ','0','0',NULL),(53,364,'2020-12-18 20:39:42','jinjinjara','a','0','0',NULL),(54,365,'2020-12-18 20:40:11','jinjinjara','배그 하고 싶다','0','0',NULL),(55,364,'2020-12-18 21:52:45','jinjinjara','ㅁ','0','0',NULL),(56,364,'2020-12-18 21:53:50','jinjinjara','123','0','0',NULL),(57,364,'2020-12-18 21:53:53','jinjinjara','ㅋㅋㅋㅋ','0','0',NULL),(58,364,'2020-12-18 22:19:09','이태현','댓글','0','0',NULL),(59,357,'2020-12-18 22:19:20','이태현','ㅁㅁㅁㅁ','0','0',NULL),(60,356,'2020-12-18 22:19:30','이태현','ㄹㄹㄹㄹ','0','0',NULL),(61,356,'2020-12-18 22:19:38','이태현','ㅁㄴㅇㄾㅋㅍㅌㅋㅊㅍㅌㅋㅊㅍㅌㅋㅇㄹㄴㄴㅇㅇㅇㅇㅇㅇㄹㄴㄹㅇㄹㄴㄹㄴ','0','0',NULL),(62,356,'2020-12-18 22:19:58','이태현','ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ','0','0',NULL),(63,356,'2020-12-18 22:21:11','이태현','ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ','0','0',NULL),(64,375,'2020-12-18 22:53:58','이태현','ㄴㅇ','0','0',NULL),(65,375,'2020-12-18 22:54:22','이태현','가족탈퇴 ㄱ','0','0',NULL),(66,386,'2020-12-18 23:06:38','jinjinjara','역시 아이폰이 짱이죠','0','0',NULL),(74,394,'2020-12-18 23:23:58','이태현','ㅀ','0','0',NULL),(75,394,'2020-12-18 23:24:02','이태현','ㄴㄴㄴㄴㄴ','0','0',NULL),(76,386,'2020-12-18 23:24:19','jinjinjara','ㅁㅁㅁ','0','0',NULL),(77,394,'2020-12-18 23:24:41','123','저요저요 제가 알려드려요~','0','0',NULL),(78,393,'2020-12-18 23:24:53','123','제보부탁드려요..','0','0',NULL),(79,392,'2020-12-18 23:24:53','박성우','ㅇㅉㄺ','0','0',NULL),(80,393,'2020-12-18 23:24:55','jinjinjara','누구지','0','0',NULL),(81,394,'2020-12-18 23:25:02','이태현','두루와','0','0',NULL),(82,391,'2020-12-18 23:25:03','123','저 java 고수입니다 연락주세요 .','0','0',NULL),(83,395,'2020-12-18 23:25:58',NULL,'5년치고 너무 적은거 아닌가요','0','0',NULL),(84,395,'2020-12-18 23:26:02','행신동냐옹이','라는 내용 애니 추천좀','0','0',NULL),(85,396,'2020-12-18 23:26:10','123','어디있어유','0','0',NULL),(86,386,'2020-12-18 23:26:39','행신동냐옹이','이건 엘지네요','0','0',NULL),(87,395,'2020-12-18 23:26:39','jinjinjara','5년치고 너무 적네요','0','0',NULL),(88,396,'2020-12-18 23:27:50','jinjinjara','찾아요','0','0',NULL),(89,397,'2020-12-18 23:33:09','123','저요저요 브론즈 3이랑 같이해용','0','0',NULL),(90,393,'2020-12-18 23:36:30','<span style=\"color:red\">운영자</span>','저도 거기 출신인데 처음들어요','0','0',NULL),(91,399,'2020-12-18 23:40:06',NULL,'aa','0','0',NULL),(92,395,'2020-12-18 23:44:37',NULL,'ㄷㄷ','0','0',NULL),(93,399,'2020-12-18 23:46:08','<span style=\"color:red\">운영자</span>','ㅇㄹ','0','0',NULL),(94,384,'2020-12-18 23:49:34','jin','안녕하세요','0','0',NULL),(95,384,'2020-12-18 23:49:49','jin','반갑습니다','0','0',NULL),(96,386,'2020-12-18 23:50:00','jin','엘지 폰 최고','0','0',NULL),(97,386,'2020-12-18 23:53:44','<span style=\"color:red\">운영자</span>','안사요','0','0',NULL),(98,401,'2022-05-31 00:06:57','<span style=\"color:red\">운영자</span>','하이','0','0',NULL),(99,401,'2022-05-31 00:07:17','<span style=\"color:red\">운영자</span>','레오나 정글 장인입니다 연락주세요','0','0',NULL),(100,393,'2022-05-31 00:13:54','123','그 새끼 병신임 ㅋㅋ','0','0',NULL),(101,402,'2022-05-31 00:14:54','123','일산통 이태현은 나와라 ㅇㅇ','0','0',NULL),(102,402,'2022-05-31 00:15:51','123','나와 도착함','0','0',NULL),(103,402,'2022-05-31 00:16:26','123','3 대 500은 빠져','0','0',NULL),(104,402,'2022-05-31 00:16:36','<span style=\"color:red\">운영자</span>','나 3대 50친다 까불지마라','0','0',NULL),(105,402,'2022-05-31 00:18:21','123','뻑킹 ;;;','0','0',NULL);
/*!40000 ALTER TABLE `reply_table` ENABLE KEYS */;
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
