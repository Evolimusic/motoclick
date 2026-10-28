-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: motoclick
-- ------------------------------------------------------
-- Server version	8.0.45

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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',19,'add_authgroup'),(26,'Can change auth group',19,'change_authgroup'),(27,'Can delete auth group',19,'delete_authgroup'),(28,'Can view auth group',19,'view_authgroup'),(29,'Can add auth group permissions',20,'add_authgrouppermissions'),(30,'Can change auth group permissions',20,'change_authgrouppermissions'),(31,'Can delete auth group permissions',20,'delete_authgrouppermissions'),(32,'Can view auth group permissions',20,'view_authgrouppermissions'),(33,'Can add auth permission',21,'add_authpermission'),(34,'Can change auth permission',21,'change_authpermission'),(35,'Can delete auth permission',21,'delete_authpermission'),(36,'Can view auth permission',21,'view_authpermission'),(37,'Can add auth user',22,'add_authuser'),(38,'Can change auth user',22,'change_authuser'),(39,'Can delete auth user',22,'delete_authuser'),(40,'Can view auth user',22,'view_authuser'),(41,'Can add auth user groups',23,'add_authusergroups'),(42,'Can change auth user groups',23,'change_authusergroups'),(43,'Can delete auth user groups',23,'delete_authusergroups'),(44,'Can view auth user groups',23,'view_authusergroups'),(45,'Can add auth user user permissions',24,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',24,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',24,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',24,'view_authuseruserpermissions'),(49,'Can add django admin log',25,'add_djangoadminlog'),(50,'Can change django admin log',25,'change_djangoadminlog'),(51,'Can delete django admin log',25,'delete_djangoadminlog'),(52,'Can view django admin log',25,'view_djangoadminlog'),(53,'Can add django content type',26,'add_djangocontenttype'),(54,'Can change django content type',26,'change_djangocontenttype'),(55,'Can delete django content type',26,'delete_djangocontenttype'),(56,'Can view django content type',26,'view_djangocontenttype'),(57,'Can add django migrations',27,'add_djangomigrations'),(58,'Can change django migrations',27,'change_djangomigrations'),(59,'Can delete django migrations',27,'delete_djangomigrations'),(60,'Can view django migrations',27,'view_djangomigrations'),(61,'Can add django session',28,'add_djangosession'),(62,'Can change django session',28,'change_djangosession'),(63,'Can delete django session',28,'delete_djangosession'),(64,'Can view django session',28,'view_djangosession'),(65,'Can add moto',8,'add_moto'),(66,'Can change moto',8,'change_moto'),(67,'Can delete moto',8,'delete_moto'),(68,'Can view moto',8,'view_moto'),(69,'Can add orden',12,'add_orden'),(70,'Can change orden',12,'change_orden'),(71,'Can delete orden',12,'delete_orden'),(72,'Can view orden',12,'view_orden'),(73,'Can add orden repuestos',11,'add_ordenrepuestos'),(74,'Can change orden repuestos',11,'change_ordenrepuestos'),(75,'Can delete orden repuestos',11,'delete_ordenrepuestos'),(76,'Can view orden repuestos',11,'view_ordenrepuestos'),(77,'Can add orden servicio',17,'add_ordenservicio'),(78,'Can change orden servicio',17,'change_ordenservicio'),(79,'Can delete orden servicio',17,'delete_ordenservicio'),(80,'Can view orden servicio',17,'view_ordenservicio'),(81,'Can add referencia moto',10,'add_referenciamoto'),(82,'Can change referencia moto',10,'change_referenciamoto'),(83,'Can delete referencia moto',10,'delete_referenciamoto'),(84,'Can view referencia moto',10,'view_referenciamoto'),(85,'Can add repuesto',16,'add_repuesto'),(86,'Can change repuesto',16,'change_repuesto'),(87,'Can delete repuesto',16,'delete_repuesto'),(88,'Can view repuesto',16,'view_repuesto'),(89,'Can add rol',7,'add_rol'),(90,'Can change rol',7,'change_rol'),(91,'Can delete rol',7,'delete_rol'),(92,'Can view rol',7,'view_rol'),(93,'Can add servicio',18,'add_servicio'),(94,'Can change servicio',18,'change_servicio'),(95,'Can delete servicio',18,'delete_servicio'),(96,'Can view servicio',18,'view_servicio'),(97,'Can add taller',14,'add_taller'),(98,'Can change taller',14,'change_taller'),(99,'Can delete taller',14,'delete_taller'),(100,'Can view taller',14,'view_taller'),(101,'Can add taller repuestos',15,'add_tallerrepuestos'),(102,'Can change taller repuestos',15,'change_tallerrepuestos'),(103,'Can delete taller repuestos',15,'delete_tallerrepuestos'),(104,'Can view taller repuestos',15,'view_tallerrepuestos'),(105,'Can add taller servicio',13,'add_tallerservicio'),(106,'Can change taller servicio',13,'change_tallerservicio'),(107,'Can delete taller servicio',13,'delete_tallerservicio'),(108,'Can view taller servicio',13,'view_tallerservicio'),(109,'Can add usuario',9,'add_usuario'),(110,'Can change usuario',9,'change_usuario'),(111,'Can delete usuario',9,'delete_usuario'),(112,'Can view usuario',9,'view_usuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$ZQ5jL3D8zAxeUCqwnI6gRC$d/ptgpkj1TYZgiW/embL3O+FHGsp0FaOmmzarKy01QU=','2026-04-21 07:25:04.732504',1,'Oscar','','','motoclick@motoclick.com',1,1,'2026-04-21 07:19:44.230363'),(2,'pbkdf2_sha256$1200000$WRjcpC8Jin61dC5TT03lM8$CYk9mOt9Y6PuuGP64alk4e6GsVymlsTifRArARHElRI=','2026-06-28 08:10:45.890660',1,'admin','','','',1,1,'2026-05-12 22:20:56.278442'),(3,'','2026-06-25 02:20:26.333993',0,'juan@gmail.com','juan','cortes','juan@gmail.com',0,1,'2026-06-25 02:20:26.300347'),(4,'','2026-06-25 06:53:56.599344',0,'thomas@gmail.com','thomas','torres','thomas@gmail.com',0,1,'2026-06-25 02:29:18.286474'),(5,'','2026-06-25 07:40:11.626066',0,'angelus_2394@hotmail.com','Angie','alfonso','angelus_2394@hotmail.com',0,1,'2026-06-25 07:40:11.243545'),(6,'','2026-06-26 04:37:39.679126',0,'Daniel123@gmail.com','Daniel','Ramirez','Daniel123@gmail.com',0,1,'2026-06-26 04:37:39.651277'),(7,'','2026-06-27 01:06:48.873401',0,'dayerli@gmail.com','Dayerli','Camacho','dayerli@gmail.com',0,1,'2026-06-27 01:06:48.814372');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-04-21 07:38:48.761902','1','Rol object (1)',1,'[{\"added\": {}}]',7,1),(2,'2026-04-21 07:40:22.291752','2','Rol object (2)',1,'[{\"added\": {}}]',7,1),(3,'2026-04-21 07:43:23.761597','1','Usuario object (1)',1,'[{\"added\": {}}]',9,1),(4,'2026-04-21 07:44:04.427132','1','ReferenciaMoto object (1)',1,'[{\"added\": {}}]',10,1),(5,'2026-04-21 07:44:06.454681','1','Moto object (1)',1,'[{\"added\": {}}]',8,1),(6,'2026-04-21 16:56:24.260750','1','Moto object (1)',2,'[]',8,1),(7,'2026-04-27 05:34:24.923030','3','Rol object (3)',1,'[{\"added\": {}}]',7,1),(8,'2026-04-27 05:36:18.746591','1','Taller object (1)',1,'[{\"added\": {}}]',14,1),(9,'2026-04-27 05:39:08.088289','2','Taller object (2)',1,'[{\"added\": {}}]',14,1),(10,'2026-04-27 05:41:25.494160','2','ReferenciaMoto object (2)',1,'[{\"added\": {}}]',10,1),(11,'2026-04-27 05:41:31.403140','1','Repuesto object (1)',1,'[{\"added\": {}}]',16,1),(12,'2026-04-27 05:41:45.897754','1','TallerRepuestos object (1)',1,'[{\"added\": {}}]',15,1),(13,'2026-04-27 05:44:00.466077','3','Taller object (3)',1,'[{\"added\": {}}]',14,1),(14,'2026-04-27 05:45:11.680247','1','Servicio object (1)',1,'[{\"added\": {}}]',18,1),(15,'2026-04-27 05:45:26.239180','1','TallerServicio object (1)',1,'[{\"added\": {}}]',13,1),(16,'2026-04-27 06:05:10.449956','2','Usuario object (2)',1,'[{\"added\": {}}]',9,1),(17,'2026-04-27 06:06:17.439641','2','Usuario object (2)',2,'[{\"changed\": {\"fields\": [\"Id rol\"]}}]',9,1),(18,'2026-04-27 06:09:08.164400','2','Moto object (2)',1,'[{\"added\": {}}]',8,1),(19,'2026-05-12 22:26:01.660039','3','Moto object (3)',1,'[{\"added\": {}}]',8,2),(20,'2026-06-17 04:50:32.220157','1','Orden object (1)',1,'[{\"added\": {}}]',12,2),(21,'2026-06-17 04:51:01.157950','1','OrdenRepuestos object (1)',1,'[{\"added\": {}}]',11,2),(22,'2026-06-17 04:51:37.575841','2','Orden object (2)',1,'[{\"added\": {}}]',12,2),(23,'2026-06-17 04:54:51.531323','3','Orden object (3)',1,'[{\"added\": {}}]',12,2),(24,'2026-06-17 04:54:57.383066','1','OrdenServicio object (1)',1,'[{\"added\": {}}]',17,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(19,'motoclick','authgroup'),(20,'motoclick','authgrouppermissions'),(21,'motoclick','authpermission'),(22,'motoclick','authuser'),(23,'motoclick','authusergroups'),(24,'motoclick','authuseruserpermissions'),(25,'motoclick','djangoadminlog'),(26,'motoclick','djangocontenttype'),(27,'motoclick','djangomigrations'),(28,'motoclick','djangosession'),(8,'motoclick','moto'),(12,'motoclick','orden'),(11,'motoclick','ordenrepuestos'),(17,'motoclick','ordenservicio'),(10,'motoclick','referenciamoto'),(16,'motoclick','repuesto'),(7,'motoclick','rol'),(18,'motoclick','servicio'),(14,'motoclick','taller'),(15,'motoclick','tallerrepuestos'),(13,'motoclick','tallerservicio'),(9,'motoclick','usuario'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-04-21 06:40:58.277116'),(2,'auth','0001_initial','2026-04-21 06:40:59.021203'),(3,'admin','0001_initial','2026-04-21 06:40:59.173833'),(4,'admin','0002_logentry_remove_auto_add','2026-04-21 06:40:59.182433'),(5,'admin','0003_logentry_add_action_flag_choices','2026-04-21 06:40:59.192385'),(6,'contenttypes','0002_remove_content_type_name','2026-04-21 06:40:59.319991'),(7,'auth','0002_alter_permission_name_max_length','2026-04-21 06:40:59.395245'),(8,'auth','0003_alter_user_email_max_length','2026-04-21 06:40:59.427195'),(9,'auth','0004_alter_user_username_opts','2026-04-21 06:40:59.435688'),(10,'auth','0005_alter_user_last_login_null','2026-04-21 06:40:59.503474'),(11,'auth','0006_require_contenttypes_0002','2026-04-21 06:40:59.505851'),(12,'auth','0007_alter_validators_add_error_messages','2026-04-21 06:40:59.514191'),(13,'auth','0008_alter_user_username_max_length','2026-04-21 06:40:59.618838'),(14,'auth','0009_alter_user_last_name_max_length','2026-04-21 06:40:59.716951'),(15,'auth','0010_alter_group_name_max_length','2026-04-21 06:40:59.739720'),(16,'auth','0011_update_proxy_permissions','2026-04-21 06:40:59.750146'),(17,'auth','0012_alter_user_first_name_max_length','2026-04-21 06:40:59.826383'),(18,'sessions','0001_initial','2026-04-21 06:40:59.865575'),(19,'motoclick','0001_initial','2026-05-14 05:55:39.828428');
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
INSERT INTO `django_session` VALUES ('8hie57lro3e4bt5q93hka1m7udy6jz1p','.eJxVjDEKwzAMAP-iuZjYiomdsXvfYGRJrtOWBOJkKv17CWRo17vj3pBo32ram65pEhjBwuWXZeKnzoeQB833xfAyb-uUzZGY0zZzW0Rf17P9G1RqFUaInQZW4dAhORe9G1RpwCLYcygRqWdRseTRRSTxtmCgwByH4DV7gc8X-qA4oQ:1wF5Tk:NiiGMGQ12NGDLzAlo2sdRwJaBpgnHPKyoC7E41h8CEc','2026-05-05 07:25:04.736717'),('dmvxwmuocqk73pg1hjjjxuik1d9p7uhk','.eJxVjEEKwyAQAP-y5yLqRl1y7L1vEHU3NW0xEJNT6d9LIIf2OjPMG2Latxr3LmucGUawcPllOZWntEPwI7X7osrStnXO6kjUabu6LSyv69n-DWrqFUZwhTIOgTJrMlZQU7F-Is3ZWiPosidyiMVoNok0Bh4wuDAFLwaFDXy-wUg22w:1wMvU4:PfsuqG1lK4rfEee29OXIRYAKibXw3vo9RIT2uLQKJKQ','2026-05-26 22:21:48.933915'),('dvv4hjw3ti8301s97yfxfydeso7sfh70','.eJxVy8sOwiAQheF3mbVpuFWgO3XtM5ApM4SmKkmBlfHdTZMudPv957whYG859MpbWAgmMHD6tRnjyq89PEsr8bHEdTisDvfSym2nS2_5eiz_7hlrhglmKXUidbbeEhpCVmI0NCaKSpKfjSClmGJy0aF0VgtJ1mstyDN5RgefL5D1N9w:1wcac5:PNNr93hWZSxCTXvhJwq7W3gajvtCsnPNm-_3UQtEaRA','2026-07-09 03:18:49.652453'),('hu5vxdgyik6rvl6z9n9hvj8zp3e67t7e','.eJxVy8sOwiAQheF3mbVpuFWgO3XtM5ApM4SmKkmBlfHdTZMudPv957whYG859MpbWAgmMHD6tRnjyq89PEsr8bHEdTisDvfSym2nS2_5eiz_7hlrhglmKXUidbbeEhpCVmI0NCaKSpKfjSClmGJy0aF0VgtJ1mstyDN5RgefL5D1N9w:1wcbb4:viLo1R2aCxMiszOL7_st1wI1q9a9OBi5BQtI_B0U-ks','2026-07-09 04:21:50.999159'),('pbxo8lt476o1qt1cvvhe9cgikpfh0s9e','.eJxVjEEKwyAQAP-y5yLqRl1y7L1vEHU3NW0xEJNT6d9LIIf2OjPMG2Latxr3LmucGUawcPllOZWntEPwI7X7osrStnXO6kjUabu6LSyv69n-DWrqFUZwhTIOgTJrMlZQU7F-Is3ZWiPosidyiMVoNok0Bh4wuDAFLwaFDXy-wUg22w:1wcz8w:ELgA7z1gHHYkT5EnomYmgFoVVTlsO1A3zJnFD16c-Ko','2026-07-10 05:30:22.378258'),('tos8q2mdzgt80ymlm7ait6t8qc4o32x3','.eJxVjEEKwyAQAP-y5yLqRl1y7L1vEHU3NW0xEJNT6d9LIIf2OjPMG2Latxr3LmucGUawcPllOZWntEPwI7X7osrStnXO6kjUabu6LSyv69n-DWrqFUZwhTIOgTJrMlZQU7F-Is3ZWiPosidyiMVoNok0Bh4wuDAFLwaFDXy-wUg22w:1wdkbF:CLdOZaMJhqTkNmAJoByNSsUziN1MPRd4AJ0OZZB_I7Q','2026-07-12 08:10:45.976289');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moto`
--

DROP TABLE IF EXISTS `moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moto` (
  `id_moto` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) NOT NULL,
  `id_usuario` int NOT NULL,
  `id_referencia_moto` int NOT NULL,
  PRIMARY KEY (`id_moto`),
  UNIQUE KEY `placa` (`placa`),
  KEY `fk_moto_usuario` (`id_usuario`),
  KEY `fk_moto_referencia` (`id_referencia_moto`),
  CONSTRAINT `fk_moto_referencia` FOREIGN KEY (`id_referencia_moto`) REFERENCES `referencia_moto` (`id_referencia_moto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_moto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moto`
--

LOCK TABLES `moto` WRITE;
/*!40000 ALTER TABLE `moto` DISABLE KEYS */;
INSERT INTO `moto` VALUES (1,'dtv89',1,1),(2,'hkl72',2,1),(3,'jhfj',2,2),(4,'ksi73g',2,1),(5,'LKJ23',7,18),(6,'ABC22D',8,3),(7,'NLN06G',9,8),(8,'DFF68G',10,3);
/*!40000 ALTER TABLE `moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_moto` int NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `observacion` varchar(500) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_orden_moto` (`id_moto`),
  CONSTRAINT `fk_orden_moto` FOREIGN KEY (`id_moto`) REFERENCES `moto` (`id_moto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,'2026-06-17 09:50:27','pendiente','Buena'),(2,2,'2026-06-17 09:51:22','pendiente','transito'),(3,2,'2026-06-17 09:54:48','por revisión','Buena');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_repuestos`
--

DROP TABLE IF EXISTS `orden_repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_repuestos` (
  `id_orden_repuesto` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_taller_repuesto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_orden_repuesto`),
  KEY `fk_orden_repuesto_orden` (`id_orden`),
  KEY `fk_orden_repuesto_taller_repuesto` (`id_taller_repuesto`),
  CONSTRAINT `fk_orden_repuesto_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orden_repuesto_taller_repuesto` FOREIGN KEY (`id_taller_repuesto`) REFERENCES `taller_repuestos` (`id_taller_repuesto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_repuestos`
--

LOCK TABLES `orden_repuestos` WRITE;
/*!40000 ALTER TABLE `orden_repuestos` DISABLE KEYS */;
INSERT INTO `orden_repuestos` VALUES (1,1,1,1,120000.00);
/*!40000 ALTER TABLE `orden_repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `id_orden_servicio` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_taller_servicio` int NOT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `adicional` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_orden_servicio`),
  KEY `fk_orden_servicio_orden` (`id_orden`),
  KEY `fk_orden_servicio_taller_servicio` (`id_taller_servicio`),
  CONSTRAINT `fk_orden_servicio_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orden_servicio_taller_servicio` FOREIGN KEY (`id_taller_servicio`) REFERENCES `taller_servicio` (`id_taller_servicio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,3,1,'por revisión','Buena',NULL);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia_moto`
--

DROP TABLE IF EXISTS `referencia_moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia_moto` (
  `id_referencia_moto` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `cilindraje` int NOT NULL,
  `tipo_moto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_referencia_moto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia_moto`
--

LOCK TABLES `referencia_moto` WRITE;
/*!40000 ALTER TABLE `referencia_moto` DISABLE KEYS */;
INSERT INTO `referencia_moto` VALUES (1,'nkd','2010',110,'combate'),(2,'akt bajaj','2012',125,'combate'),(3,'AKT','NKD 125 LED',124,'Calle / Urbana'),(4,'AKT','Special 115 FI',114,'Semiautomática'),(5,'AKT','TT DS 200 Rally',197,'Enduro / Doble Propósito'),(6,'AKT','Dynamic Pro 125',125,'Scooter'),(7,'Bajaj','Boxer CT 100 ES',99,'Calle / Trabajo'),(8,'Bajaj','Pulsar NS 200 FI',199,'Naked / Deportiva'),(9,'Bajaj','Pulsar NS 125',124,'Calle / Urbana'),(10,'Yamaha','NMAX 155 Connected',155,'Scooter'),(11,'Yamaha','Crypton FI 115',114,'Semiautomática'),(12,'Yamaha','XTZ 150',149,'Enduro / Doble Propósito'),(13,'Yamaha','FZ25 ABS',249,'Naked / Urbana'),(14,'Suzuki','GN 125 E',124,'Clásica / Urbana'),(15,'Suzuki','AX 4 Evolution',113,'Calle / Trabajo'),(16,'Suzuki','Gixxer 150 FI',155,'Naked / Deportiva'),(17,'Suzuki','DR 150',149,'Enduro / Doble Propósito'),(18,'Honda','CB 125F Twister',124,'Calle / Urbana'),(19,'Honda','XR 150L Euro 3',149,'Enduro / Doble Propósito'),(20,'TVS','Apache RTR 160 4V',159,'Naked / Deportiva'),(21,'TVS','Raider 125 LED',124,'Calle / Urbana'),(22,'Hero','Eco Deluxe CW',97,'Calle / Trabajo'),(23,'Hero','Xpulse 200 4V',199,'Enduro / Adventure'),(24,'KTM','Duke 200 NG',200,'Naked / Deportiva'),(25,'KTM','Duke 390 ABS',373,'Naked / Deportiva'),(26,'BMW','G 310 GS',313,'Trail / Doble Propósito'),(27,'BMW','R 1250 GS Premium',1254,'Maxi Trail / Turismo');
/*!40000 ALTER TABLE `referencia_moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuesto` (
  `id_repuesto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `tipo_repuesto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `id_referencia_moto` int DEFAULT NULL,
  PRIMARY KEY (`id_repuesto`),
  KEY `fk_repuesto_referencia` (`id_referencia_moto`),
  CONSTRAINT `fk_repuesto_referencia` FOREIGN KEY (`id_referencia_moto`) REFERENCES `referencia_moto` (`id_referencia_moto`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'kit de arrastre akt','akt125 bajaj',NULL,'cadena, piñon, plato',100000.00,0,2),(2,'Aceite Motul 5100 4T 10W40 Semisintético 1L','Motul',NULL,NULL,48500.00,1,3),(3,'Aceite Mobil Super Moto 4T 20W50 Mineral 1L','Mobil',NULL,NULL,29000.00,1,5),(4,'Aceite Yamalube 4T 10W40 Mineral 1L','Yamalube',NULL,NULL,34500.00,1,8),(5,'Lubricante de Cadena Chain Lube Spray 400ml','Motul',NULL,NULL,36000.00,1,3),(6,'Líquido de Frenos DOT 4 250ml','Mobil',NULL,NULL,16000.00,1,3),(7,'Pastillas de Freno Delanteras Sinterizadas','Ichiban',NULL,NULL,24900.00,1,3),(8,'Pastillas de Freno Traseras Orgánicas','Incolbest',NULL,NULL,18500.00,1,8),(9,'Bandas de Freno Traseras Convencionales','Ichiban',NULL,NULL,16900.00,1,5),(10,'Kit de Arrastre Reforzado NKD 125 (428H)','Cassarella',NULL,NULL,128000.00,1,3),(11,'Kit de Arrastre Racing Pulsar NS 200 (520)','Revo',NULL,NULL,145000.00,1,6),(12,'Cadena Dorada Reforzada 428H-132','KMC',NULL,NULL,46000.00,1,5),(13,'Piñón Delantero 14T de Fuerza','Cassarella',NULL,NULL,16500.00,1,3),(14,'Bujía de Iridium Alta Gama CR8EIX','NGK',NULL,NULL,42900.00,1,6),(15,'Bujía Estándar CPR7EA-9','NGK',NULL,NULL,14500.00,1,8),(16,'Batería Seca de Gel 12V 7Ah (MTX7A)','Magneti Marelli',NULL,NULL,89900.00,1,3),(17,'Filtro de Aire de Alto Flujo','Revo',NULL,NULL,24000.00,1,6),(18,'Filtro de Aceite de Cartucho','Yamaha',NULL,NULL,18900.00,1,8),(19,'Llanta Delantera 2.75-18 City Extra','Michelin',NULL,NULL,118000.00,1,3),(20,'Llanta Trasera 90/90-18 City Extra Sellomatic','Michelin',NULL,NULL,231000.00,1,3),(21,'Llanta Trasera 130/70-17 Pilot Street 2','Michelin',NULL,NULL,249900.00,1,6),(22,'Llanta Trasera 110/80-14 City Grip 2','Michelin',NULL,NULL,189000.00,1,8),(23,'Neumático Reforzado R18','MRF',NULL,NULL,23500.00,1,3),(24,'Guaya de Cloche / Embrague Reforzada','Chongqing',NULL,NULL,12500.00,1,3),(25,'Guaya de Acelerador Original','Chongqing',NULL,NULL,14900.00,1,5),(26,'Espejos Retrovisores Homologados Universales','Revo',NULL,NULL,29000.00,1,3),(27,'Kit de Cunas de Dirección Completo','Ichiban',NULL,NULL,24500.00,1,5);
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `codigo` char(10) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'cliente','1'),(2,'admin','2'),(3,'Taller','3');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'mantenimiento','mantenimiento general');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `id_taller` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(150) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_taller`),
  KEY `fk_taller_usuario` (`id_usuario`),
  CONSTRAINT `fk_taller_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (1,'Taller JHD','cra 100#55a-15 sur','3200286313','JHDTaller@gmail.com',1),(2,'Taller si aqui no lo hay no existe','calle 19 # 27 - 12','3114658739','TallerSANE@gmail.com',1),(3,'Motoracing','Cra 80 # 45 -25 sur','3253547219','Motoracing@gmail.com',1);
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller_repuestos`
--

DROP TABLE IF EXISTS `taller_repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller_repuestos` (
  `id_taller_repuesto` int NOT NULL AUTO_INCREMENT,
  `id_taller` int NOT NULL,
  `id_repuesto` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int DEFAULT '0',
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_taller_repuesto`),
  KEY `fk_taller_repuesto_taller` (`id_taller`),
  KEY `fk_taller_repuesto_repuesto` (`id_repuesto`),
  CONSTRAINT `fk_taller_repuesto_repuesto` FOREIGN KEY (`id_repuesto`) REFERENCES `repuesto` (`id_repuesto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_taller_repuesto_taller` FOREIGN KEY (`id_taller`) REFERENCES `taller` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller_repuestos`
--

LOCK TABLES `taller_repuestos` WRITE;
/*!40000 ALTER TABLE `taller_repuestos` DISABLE KEYS */;
INSERT INTO `taller_repuestos` VALUES (1,2,1,100000.00,5,NULL);
/*!40000 ALTER TABLE `taller_repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller_servicio`
--

DROP TABLE IF EXISTS `taller_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller_servicio` (
  `id_taller_servicio` int NOT NULL AUTO_INCREMENT,
  `id_taller` int NOT NULL,
  `id_servicio` int NOT NULL,
  `nombre_personalizado` varchar(150) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_taller_servicio`),
  KEY `fk_taller_servicio_taller` (`id_taller`),
  KEY `fk_taller_servicio_servicio` (`id_servicio`),
  CONSTRAINT `fk_taller_servicio_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_taller_servicio_taller` FOREIGN KEY (`id_taller`) REFERENCES `taller` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller_servicio`
--

LOCK TABLES `taller_servicio` WRITE;
/*!40000 ALTER TABLE `taller_servicio` DISABLE KEYS */;
INSERT INTO `taller_servicio` VALUES (1,3,1,'Motoracing',250000.00);
/*!40000 ALTER TABLE `taller_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `correo_electronico` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `fk_usuario_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'juan','cortes','cc','1657554','juan@gmail.com','pbkdf2_sha256$1200000$Dc1NnU1P7Fg6wllmYGIfk6$kzvhgOY/IW6YBRkDYvpd6nOfrSd241Fqq+kvOAMBUak=','24566666','2026-04-10 12:43:06',1,1),(2,'Oscar','Calle','cc','1073003830','Oscarcalle007@gmail.com','pbkdf2_sha256$1200000$tKHKbMd3c5ABMMPzuAWe8y$abmpxeYyn6JQgN7cnM7p73mLMQL9VbsQh8IbTFnuGQg=','3218003202','2026-04-27 11:04:53',1,1),(3,'angie','saavedra','cc','1075672668','angelx@gmail.com','pbkdf2_sha256$1200000$bj65E45zE0JxS1rOEYHd01$LNeJQQp4/Q/9vArj4+pQ6MTqkZ4bHOi4zAyQ/cWwi4s=','3507030438',NULL,NULL,2),(6,'santiago','lamo','cc','9237023','evolimusic93873@gmail.com','pbkdf2_sha256$1200000$WjDI0xcjcNIPYMODuW3gc6$Oryucg8Ev5Z6+6EOut4t4eobMUhJORuu3+bnHvtq9O8=','3507030483','2026-06-22 05:00:00',NULL,1),(7,'thomas','torres','cc','87939230','thomas@gmail.com','pbkdf2_sha256$1200000$PpBKLzwdPneQ5vZ5ay75hr$5Sa2vH7xQ4f0sJS6I7e5tuhLZvCMjRDSMjivgVnoPTA=','3507038323','2026-06-22 05:00:00',NULL,1),(8,'Angie','alfonso','cc','1075672662','angelus_2394@hotmail.com','pbkdf2_sha256$1200000$i2Ff1TCn4zbnRxktbwxwRS$XR46tLQIzqlzvYbtbHpXfZTuKoLf+y9bYMT7hDLFPdI=','3133158226','2026-06-22 05:00:00',NULL,1),(9,'Daniel','Ramirez','cc','1075423662','Daniel123@gmail.com','pbkdf2_sha256$1200000$7sZhLdzwyD01jtCTRZ9ECt$dlCNkAI+d8K44MsYcc7sOQx7Iz2Sv/KrIRMq2Gx+SYg=','3207684532','2026-06-25 05:00:00',NULL,1),(10,'Dayerli','Camacho','cc','107644345','dayerli@gmail.com','pbkdf2_sha256$1200000$bZWeoz8qhhQmxzEfQQ2NMf$9klMtG4W6jWTKE8q2XZdX19ZUm+6CoM4jrA9FrTO3ec=','347445322','2026-06-26 05:00:00',NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-28  3:44:40
