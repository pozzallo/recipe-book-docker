CREATE DATABASE  IF NOT EXISTS `recipe-book` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe-book`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe-book
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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `user_id` int NOT NULL,
  `authority` int NOT NULL,
  PRIMARY KEY (`user_id`,`authority`),
  KEY `authority` (`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`authority`) REFERENCES `authority` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,1),(21,1),(32,1),(38,1),(39,1),(40,1),(41,1),(21,2);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `recipe_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredients_ibfk_1` (`recipe_id`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (11,'meat',5,NULL),(12,'salt',50,NULL),(13,'tomatos',10,NULL),(14,'salt',50,NULL),(15,'tomatos',10,NULL),(16,'meat',5,NULL),(17,'meat',5,NULL),(18,'tomatos',100,NULL),(19,'salt',50,NULL),(20,'tomatos',100,NULL),(21,'meat',5,NULL),(22,'salt',500,NULL),(53,'bread',4,NULL),(54,'salt',10,NULL),(55,'bread',3,NULL),(56,'test',9,NULL),(81,'tomatos',1,NULL),(82,'sausage',2,NULL),(83,'cheese',10,NULL),(167,'test',3,NULL),(168,'shugar',20,4),(169,'nuts',12,4),(170,'tomatoes',15,14),(171,'cheese',12,14),(172,'test-1',1,NULL),(173,'test-2',2,NULL),(174,'meat',100,NULL),(175,'meat',100,NULL),(181,'milk',2,NULL),(182,'shugar',2,NULL),(183,'test',9,NULL),(187,'ingr',1,NULL),(188,'ing',88,NULL),(189,'bread',2,NULL),(190,'salt',2,NULL),(193,'coffee',1,46),(194,'milk',10,46),(195,'cinamon',10,46),(197,'meat',100,39),(205,'eggs',10,18),(206,'milk',4,18),(207,'shugar',20,40),(208,'nuts',12,40),(215,'coffee',1,53),(216,'milk',10,53),(217,'cinamon',10,53),(259,'eggs',10,NULL),(260,'milk',4,NULL),(261,'meat',100,56),(262,'tomatoes',87,56),(263,'meat',100,2),(264,'tomatoes',87,2),(266,'test',11,58),(270,'meat',100,64),(271,'tomatoes',87,64),(272,'meat',100,65),(273,'tomatoes',87,65);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_pending_to_approve` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `recipes_ibfk_1_idx` (`user_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (2,'Barbeque-1','Tasty Barbeque','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',NULL,0),(4,'Cookie','Light cookie','https://media.istockphoto.com/photos/masala-vada-spicy-fried-fritters-picture-id1169098788',NULL,0),(14,'Pizza','...mmmm','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-homemade-pizza-horizontal-1542312378.png?crop=1.00xw:1.00xh;0,0&resize=980:*',NULL,0),(18,'Omelet-my','Very easy to prepare','https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/cheeseomelette_80621_16x9.jpg',1,0),(39,'Barbeque-my','Tasty Barbeque','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',1,0),(40,'Cookie','Light cookie','https://media.istockphoto.com/photos/masala-vada-spicy-fried-fritters-picture-id1169098788',1,0),(46,'Cappuccino','Light fragrant coffee','https://media3.s-nbcnews.com/j/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p_67dfb6820f7d3898b5486975903c2e51.fit-1240w.jpg',NULL,0),(53,'Cappuccino','Light fragrant coffee','https://media3.s-nbcnews.com/j/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p_67dfb6820f7d3898b5486975903c2e51.fit-1240w.jpg',1,0),(56,'Barbeque-admin','Tasty Barbeque','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',21,0),(58,'test','test pending to approve','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',1,0),(61,'Omelet','Very easy to prepare','https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/cheeseomelette_80621_16x9.jpg',NULL,0),(64,'Barbeque-1','Tasty Barbeque','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',15,0),(65,'Barbeque-1','Tasty Barbeque','https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_1280.jpg',NULL,1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_list_item`
--

DROP TABLE IF EXISTS `shopping_list_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_list_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `recipe_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_list_item`
--

LOCK TABLES `shopping_list_item` WRITE;
/*!40000 ALTER TABLE `shopping_list_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_list_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `google_sub` varchar(256) DEFAULT NULL,
  `facebook_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','user@email.com','$2a$10$vsGpW3iaytUTW8h/CwZF5OjQQQ1NfuY4xuSDFsAf5GgkVYqJ/nD4O',1,NULL,NULL),(15,'?????????? ??????????','kniha.paul@gmail.com',NULL,0,'112285667393507862495',NULL),(21,'admin','super_admin@gmail.com','$2a$10$AsOqxa0pKqOP3g5LvppuEOT0zpyVkxCqhhmdBUhPt6lH1yVG50y1W',1,NULL,NULL),(32,'Pavel Kniga','pozzallo706123@gmail.com',NULL,0,'114767993219124311356','1341441426229572'),(38,'Open Graph Test User','open_atuxzut_user@tfbnw.net',NULL,0,NULL,'109224224645248'),(39,'var','var@gmail.com','$2a$10$QYIPUGwV/lGLlG4Wlsgp4u7g2z5LAiDwiN5Y659V.s2YvzHZy/BDy',1,NULL,NULL),(40,'test100','test100@gmail.com','$2a$10$XQCGkVLDx3YjbPBEdhgRru.g8y/MYpaaBhFmLGB5c7Nm/WAt5qCjK',1,NULL,NULL),(41,'test101','test101@test.com','$2a$10$Q3fYod/gf0M9CwTuJIvfNOfc5qDz3XnOISXEzHPguhfCoSDiuSLYO',1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-08 10:06:18
