-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Current Database: `database`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `database`;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comparaison`
--

DROP TABLE IF EXISTS `Comparaison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comparaison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id1` int NOT NULL,
  `article_id2` int NOT NULL,
  `compte_id` int NOT NULL,
  `resultat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id1` (`article_id1`),
  KEY `article_id2` (`article_id2`),
  KEY `compte_id` (`compte_id`),
  CONSTRAINT `Comparaison_ibfk_1` FOREIGN KEY (`article_id1`) REFERENCES `Article` (`id`),
  CONSTRAINT `Comparaison_ibfk_2` FOREIGN KEY (`article_id2`) REFERENCES `Article` (`id`),
  CONSTRAINT `Comparaison_ibfk_3` FOREIGN KEY (`compte_id`) REFERENCES `Compte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comparaison`
--

LOCK TABLES `Comparaison` WRITE;
/*!40000 ALTER TABLE `Comparaison` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comparaison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compte`
--

DROP TABLE IF EXISTS `Compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compte`
--

LOCK TABLES `Compte` WRITE;
/*!40000 ALTER TABLE `Compte` DISABLE KEYS */;
INSERT INTO `Compte` VALUES (7,'admin','$2y$10$52lA7k0jvUgQBThKlW4hgubLhOjsQYk0Or2pWsLYVJbg1Gn8XF/m6','mail@mail.com','admin');
/*!40000 ALTER TABLE `Compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Historique`
--

DROP TABLE IF EXISTS `Historique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Historique` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_rec` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comp_id` (`comp_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Historique_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `Comparaison` (`id`),
  CONSTRAINT `Historique_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Compte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Historique`
--

LOCK TABLES `Historique` WRITE;
/*!40000 ALTER TABLE `Historique` DISABLE KEYS */;
/*!40000 ALTER TABLE `Historique` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-12 10:10:51
