-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: EventBookingDB
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add bookingdetails',6,'add_bookingdetails'),(22,'Can change bookingdetails',6,'change_bookingdetails'),(23,'Can delete bookingdetails',6,'delete_bookingdetails'),(24,'Can view bookingdetails',6,'view_bookingdetails'),(25,'Can add events',7,'add_events'),(26,'Can change events',7,'change_events'),(27,'Can delete events',7,'delete_events'),(28,'Can view events',7,'view_events'),(29,'Can add user profile',8,'add_userprofile'),(30,'Can change user profile',8,'change_userprofile'),(31,'Can delete user profile',8,'delete_userprofile'),(32,'Can view user profile',8,'view_userprofile'),(33,'Can add user',9,'add_customuser'),(34,'Can change user',9,'change_customuser'),(35,'Can delete user',9,'delete_customuser'),(36,'Can view user',9,'view_customuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_EventBook` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_EventBook` FOREIGN KEY (`user_id`) REFERENCES `eventbookingapp_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-16 08:00:05.370269','2','vasanth',1,'[{\"added\": {}}]',9,1),(2,'2025-07-16 08:00:44.105501','2','vasanth',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Full name\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'EventBookingapp','bookingdetails'),(9,'EventBookingapp','customuser'),(7,'EventBookingapp','events'),(8,'EventBookingapp','userprofile'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-16 06:20:09.504514'),(2,'contenttypes','0002_remove_content_type_name','2025-07-16 06:20:09.619358'),(3,'auth','0001_initial','2025-07-16 06:20:10.126386'),(4,'auth','0002_alter_permission_name_max_length','2025-07-16 06:20:10.229608'),(5,'auth','0003_alter_user_email_max_length','2025-07-16 06:20:10.240967'),(6,'auth','0004_alter_user_username_opts','2025-07-16 06:20:10.249965'),(7,'auth','0005_alter_user_last_login_null','2025-07-16 06:20:10.271094'),(8,'auth','0006_require_contenttypes_0002','2025-07-16 06:20:10.275712'),(9,'auth','0007_alter_validators_add_error_messages','2025-07-16 06:20:10.285159'),(10,'auth','0008_alter_user_username_max_length','2025-07-16 06:20:10.295140'),(11,'auth','0009_alter_user_last_name_max_length','2025-07-16 06:20:10.303288'),(12,'auth','0010_alter_group_name_max_length','2025-07-16 06:20:10.325600'),(13,'auth','0011_update_proxy_permissions','2025-07-16 06:20:10.334938'),(14,'auth','0012_alter_user_first_name_max_length','2025-07-16 06:20:10.344883'),(15,'EventBookingapp','0001_initial','2025-07-16 06:20:10.959708'),(16,'admin','0001_initial','2025-07-16 06:20:11.247275'),(17,'admin','0002_logentry_remove_auto_add','2025-07-16 06:20:11.258174'),(18,'admin','0003_logentry_add_action_flag_choices','2025-07-16 06:20:11.270610'),(19,'sessions','0001_initial','2025-07-16 06:20:11.328292'),(20,'EventBookingapp','0002_customuser_is_admin','2025-07-16 07:09:18.619247');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xqfb084rd2p2grd36wavihasrjt5bg4k','.eJxVjEEOwiAQRe_C2pC2YAdcuu8ZyAwzSNVAUtqV8e7apAvd_vfef6mA25rD1mQJM6uLGtTpdyOMDyk74DuWW9WxlnWZSe-KPmjTU2V5Xg_37yBjy98azWg9jyQsYDBxBE8kZ44dmsFBlN6Rs9CJdYkRuLcOLDAQJyLvjHp_ABVKOQw:1uc92x:bWMsTiyXT7NJlzAjdyK-MLqRHTnRrY5WxO7H9WrOMYI','2025-07-30 20:48:11.542273');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_bookingdetails`
--

DROP TABLE IF EXISTS `eventbookingapp_bookingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_bookingdetails` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Seats` int DEFAULT NULL,
  `Event_id` int DEFAULT NULL,
  `Booking_Id` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Booking_Id` (`Booking_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_bookingdetails`
--

LOCK TABLES `eventbookingapp_bookingdetails` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_bookingdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventbookingapp_bookingdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_customuser`
--

DROP TABLE IF EXISTS `eventbookingapp_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_customuser`
--

LOCK TABLES `eventbookingapp_customuser` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_customuser` DISABLE KEYS */;
INSERT INTO `eventbookingapp_customuser` VALUES (1,'pbkdf2_sha256$1000000$f9zjGLRn8uIdy0N9ZUmrSu$YGn3NuTxIu0J/GrvMCLJ28gTgvCGOwfYRH7aUgBJYvE=','2025-07-16 18:05:57.585993',1,'admin','','','vasanths2468@gmail.com',1,1,'2025-07-16 06:22:29.199165',NULL,0);
/*!40000 ALTER TABLE `eventbookingapp_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_customuser_groups`
--

DROP TABLE IF EXISTS `eventbookingapp_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EventBookingapp_customus_customuser_id_group_id_fb2955a8_uniq` (`customuser_id`,`group_id`),
  KEY `EventBookingapp_cust_group_id_18bee7a1_fk_auth_grou` (`group_id`),
  CONSTRAINT `EventBookingapp_cust_customuser_id_798b20e4_fk_EventBook` FOREIGN KEY (`customuser_id`) REFERENCES `eventbookingapp_customuser` (`id`),
  CONSTRAINT `EventBookingapp_cust_group_id_18bee7a1_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_customuser_groups`
--

LOCK TABLES `eventbookingapp_customuser_groups` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventbookingapp_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_customuser_user_permissions`
--

DROP TABLE IF EXISTS `eventbookingapp_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EventBookingapp_customus_customuser_id_permission_18c718ec_uniq` (`customuser_id`,`permission_id`),
  KEY `EventBookingapp_cust_permission_id_307022be_fk_auth_perm` (`permission_id`),
  CONSTRAINT `EventBookingapp_cust_customuser_id_2a104e14_fk_EventBook` FOREIGN KEY (`customuser_id`) REFERENCES `eventbookingapp_customuser` (`id`),
  CONSTRAINT `EventBookingapp_cust_permission_id_307022be_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_customuser_user_permissions`
--

LOCK TABLES `eventbookingapp_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventbookingapp_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_events`
--

DROP TABLE IF EXISTS `eventbookingapp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_title` varchar(100) DEFAULT NULL,
  `event_scheduled_date` datetime(6) DEFAULT NULL,
  `event_description` varchar(200) DEFAULT NULL,
  `event_available_seats` int DEFAULT NULL,
  `event_total_seats` int DEFAULT NULL,
  `event_price` int DEFAULT NULL,
  `is_sold_out` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_events`
--

LOCK TABLES `eventbookingapp_events` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventbookingapp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventbookingapp_userprofile`
--

DROP TABLE IF EXISTS `eventbookingapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventbookingapp_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventbookingapp_userprofile`
--

LOCK TABLES `eventbookingapp_userprofile` WRITE;
/*!40000 ALTER TABLE `eventbookingapp_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventbookingapp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17  3:01:16
