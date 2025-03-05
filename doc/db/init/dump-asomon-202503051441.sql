-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: asomon
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asmontype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asmontype` (
  `asomontype_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`asomontype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='アソモンのタイプ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asmontype`
--

LOCK TABLES `asmontype` WRITE;
/*!40000 ALTER TABLE `asmontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `asmontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asomon`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asomon` (
  `asomon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名前',
  `stage` int(11) NOT NULL COMMENT '0: たね 1:1進化 2:2進化',
  `image` varchar(300) NOT NULL COMMENT '画像ファイル名',
  `asomontype_id` int(11) NOT NULL COMMENT '属性',
  `encountrate` double NOT NULL COMMENT '遭遇率',
  PRIMARY KEY (`asomon_id`),
  KEY `asomon_asmontype_FK` (`asomontype_id`),
  CONSTRAINT `asomon_asmontype_FK` FOREIGN KEY (`asomontype_id`) REFERENCES `asmontype` (`asomontype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asomon`
--

LOCK TABLES `asomon` WRITE;
/*!40000 ALTER TABLE `asomon` DISABLE KEYS */;
/*!40000 ALTER TABLE `asomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asomonlocation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asomonlocation` (
  `asomon_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `asomonlocation_asomon_FK` (`asomon_id`),
  KEY `asomonlocation_location_FK` (`location_id`),
  CONSTRAINT `asomonlocation_asomon_FK` FOREIGN KEY (`asomon_id`) REFERENCES `asomon` (`asomon_id`),
  CONSTRAINT `asomonlocation_location_FK` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='アソモンと場所の連関エンティティ\r\nどの場所で捕まるかを表す';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asomonlocation`
--

LOCK TABLES `asomonlocation` WRITE;
/*!40000 ALTER TABLE `asomonlocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `asomonlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'クラス名（A、B、C、Dなど。ない場合はNULL）',
  `grade` int(11) NOT NULL COMMENT '学年',
  `teacher_id` int(11) NOT NULL COMMENT '担任のID',
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `class_teacher_FK` (`teacher_id`),
  KEY `class_department_FK` (`department_id`),
  CONSTRAINT `class_department_FK` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `class_teacher_FK` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '学科名',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='学科';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evenrt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evenrt` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL COMMENT 'イベントのスタート日時',
  `end` datetime NOT NULL COMMENT 'イベントの終了日時',
  `title` varchar(100) NOT NULL COMMENT 'イベントタイトル',
  `summary` varchar(2000) NOT NULL COMMENT 'イベント説明文',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='特別日の設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evenrt`
--

LOCK TABLES `evenrt` WRITE;
/*!40000 ALTER TABLE `evenrt` DISABLE KEYS */;
/*!40000 ALTER TABLE `evenrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '場所の名前。XXX教室、４F自販機前など',
  `type` int(11) NOT NULL COMMENT '種別\r\n0:教室 1:教室以外',
  `location_info` int(11) NOT NULL COMMENT '場所の種類（将来用）\r\n水辺、草むらなどの場所情報',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='場所';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '先生の名前',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesetting` (
  `timesetting_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '制約種類\r\n0:制約なし 1:アソモン禁止',
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`timesetting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='時間帯設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesetting`
--

LOCK TABLES `timesetting` WRITE;
/*!40000 ALTER TABLE `timesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `stdentno` varchar(100) NOT NULL COMMENT '学籍番号',
  `mail` varchar(100) NOT NULL COMMENT 'メールアドレス',
  `nickname` varchar(100) NOT NULL COMMENT 'ニックネーム',
  `name` varchar(100) NOT NULL COMMENT '名前',
  `class_id` int(11) NOT NULL COMMENT '所属するクラス',
  `icon` varchar(100) NOT NULL DEFAULT 'noimage.jpg' COMMENT 'アイコン画像。未設定の場合はnoimage.jpgとなる',
  `continue_count` int(11) NOT NULL DEFAULT 0 COMMENT '朝の連続ログイン回数',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_unique` (`stdentno`),
  UNIQUE KEY `user_unique_1` (`mail`),
  KEY `user_class_FK` (`class_id`),
  CONSTRAINT `user_class_FK` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userasomon`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userasomon` (
  `user_id` int(11) NOT NULL,
  `asomon_id` int(11) NOT NULL,
  `experience_points` int(11) NOT NULL COMMENT 'このアソモンの経験値',
  `regularflg` int(11) NOT NULL COMMENT '手持ちアソモンかどうか\r\n0:手持ちではない 1:手持ちポケモン',
  KEY `userasomon_user_FK` (`user_id`),
  KEY `userasomon_asomon_FK` (`asomon_id`),
  CONSTRAINT `userasomon_asomon_FK` FOREIGN KEY (`asomon_id`) REFERENCES `asomon` (`asomon_id`),
  CONSTRAINT `userasomon_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='アソモンとユーザーの連関エンティティ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userasomon`
--

LOCK TABLES `userasomon` WRITE;
/*!40000 ALTER TABLE `userasomon` DISABLE KEYS */;
/*!40000 ALTER TABLE `userasomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asomon'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-05 14:41:39
