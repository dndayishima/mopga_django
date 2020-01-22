-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: db_mopga
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add commentaire',7,'add_commentaire'),(26,'Can change commentaire',7,'change_commentaire'),(27,'Can delete commentaire',7,'delete_commentaire'),(28,'Can view commentaire',7,'view_commentaire'),(29,'Can add projet',8,'add_projet'),(30,'Can change projet',8,'change_projet'),(31,'Can delete projet',8,'delete_projet'),(32,'Can view projet',8,'view_projet'),(33,'Can add like',9,'add_like'),(34,'Can change like',9,'change_like'),(35,'Can delete like',9,'delete_like'),(36,'Can view like',9,'view_like'),(37,'Can add financer',10,'add_financer'),(38,'Can change financer',10,'change_financer'),(39,'Can delete financer',10,'delete_financer'),(40,'Can view financer',10,'view_financer'),(41,'Can add evaluer',11,'add_evaluer'),(42,'Can change evaluer',11,'change_evaluer'),(43,'Can delete evaluer',11,'delete_evaluer'),(44,'Can view evaluer',11,'view_evaluer'),(45,'Can add profile',12,'add_profile'),(46,'Can change profile',12,'change_profile'),(47,'Can delete profile',12,'delete_profile'),(48,'Can view profile',12,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$z5VZKcas3qsH$a1a6S2BbOZYNEdj5eb1GDcr+2NB/Lav38/h9xr9Ddns=','2020-01-22 14:17:48.613800',1,'admin','','','topndiv@gmail.com',1,1,'2020-01-22 14:06:02.080032'),(2,'pbkdf2_sha256$150000$fN0bAx9pxYbL$knHHc0eEflPqgnB44lbob9Tlggs7RA1EuJtvswMAnHg=',NULL,0,'uti','','','uti@gmail.com',0,1,'2020-01-22 14:08:16.000000'),(3,'pbkdf2_sha256$150000$NSsAaF9CTmI5$fpZivCW1pLs5xwyZEhITLHBdc7wDngcsyyNtrUpcZn8=','2020-01-22 14:11:18.570962',0,'divin','','','divin.ndayishima@outlook.com',0,1,'2020-01-22 14:11:09.921005'),(4,'pbkdf2_sha256$150000$wcVX8oZn16qm$08Hq9xnJmlyYPgLhY4e0zqnGoXfE02BCBTo35qIIpTE=','2020-01-22 14:15:55.633511',0,'Youssef','','','msalimyoussef@gmail.com',0,1,'2020-01-22 14:15:46.828491');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-01-22 14:08:56.820504','2','uti',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(2,'2020-01-22 14:18:03.676052','1','Qu\'est-ce que le Lorem Ipsum?',2,'[{\"changed\": {\"fields\": [\"est_finance\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','commentaire'),(11,'main','evaluer'),(10,'main','financer'),(9,'main','like'),(8,'main','projet'),(6,'sessions','session'),(12,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-22 14:02:23.089528'),(2,'auth','0001_initial','2020-01-22 14:02:23.232501'),(3,'admin','0001_initial','2020-01-22 14:02:23.514343'),(4,'admin','0002_logentry_remove_auto_add','2020-01-22 14:02:23.586634'),(5,'admin','0003_logentry_add_action_flag_choices','2020-01-22 14:02:23.605170'),(6,'contenttypes','0002_remove_content_type_name','2020-01-22 14:02:23.662532'),(7,'auth','0002_alter_permission_name_max_length','2020-01-22 14:02:23.681438'),(8,'auth','0003_alter_user_email_max_length','2020-01-22 14:02:23.706788'),(9,'auth','0004_alter_user_username_opts','2020-01-22 14:02:23.715527'),(10,'auth','0005_alter_user_last_login_null','2020-01-22 14:02:23.745774'),(11,'auth','0006_require_contenttypes_0002','2020-01-22 14:02:23.747100'),(12,'auth','0007_alter_validators_add_error_messages','2020-01-22 14:02:23.753421'),(13,'auth','0008_alter_user_username_max_length','2020-01-22 14:02:23.765645'),(14,'auth','0009_alter_user_last_name_max_length','2020-01-22 14:02:23.776200'),(15,'auth','0010_alter_group_name_max_length','2020-01-22 14:02:23.786672'),(16,'auth','0011_update_proxy_permissions','2020-01-22 14:02:23.792943'),(17,'main','0001_initial','2020-01-22 14:02:23.969021'),(18,'sessions','0001_initial','2020-01-22 14:02:24.250508'),(19,'users','0001_initial','2020-01-22 14:02:24.313767');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_commentaire`
--

DROP TABLE IF EXISTS `main_commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` longtext NOT NULL,
  `reactions` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_commentaire_auteur_id_4a4b09d2_fk_auth_user_id` (`auteur_id`),
  KEY `main_commentaire_projet_id_609fb2ff_fk_main_projet_id` (`projet_id`),
  CONSTRAINT `main_commentaire_auteur_id_4a4b09d2_fk_auth_user_id` FOREIGN KEY (`auteur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `main_commentaire_projet_id_609fb2ff_fk_main_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `main_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_commentaire`
--

LOCK TABLES `main_commentaire` WRITE;
/*!40000 ALTER TABLE `main_commentaire` DISABLE KEYS */;
INSERT INTO `main_commentaire` VALUES (1,'Projet très très intéressant ! Bravo à l\'équipe qui l\'a proposé...',2,'2020-01-22 14:18:51.303567','2020-01-22 14:18:51.303616',1,2),(2,'Projet super intéressant et très enrichissant. À financer...',1,'2020-01-22 14:20:15.566719','2020-01-22 14:20:15.566748',1,1),(3,'Je vous invite à venir supporter ce projet révolutionnaire. Merci pour tout !',2,'2020-01-22 14:25:12.383954','2020-01-22 14:25:12.384056',1,3);
/*!40000 ALTER TABLE `main_commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_evaluer`
--

DROP TABLE IF EXISTS `main_evaluer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_evaluer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_projet` int(10) unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `evaluateur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_evaluer_evaluateur_id_a7b8f815_fk_auth_user_id` (`evaluateur_id`),
  KEY `main_evaluer_projet_id_658d9bda_fk_main_projet_id` (`projet_id`),
  CONSTRAINT `main_evaluer_evaluateur_id_a7b8f815_fk_auth_user_id` FOREIGN KEY (`evaluateur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `main_evaluer_projet_id_658d9bda_fk_main_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `main_projet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_evaluer`
--

LOCK TABLES `main_evaluer` WRITE;
/*!40000 ALTER TABLE `main_evaluer` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_evaluer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_financer`
--

DROP TABLE IF EXISTS `main_financer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_financer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `financeur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_financer_financeur_id_68358901_fk_auth_user_id` (`financeur_id`),
  KEY `main_financer_projet_id_95548a8e_fk_main_projet_id` (`projet_id`),
  CONSTRAINT `main_financer_financeur_id_68358901_fk_auth_user_id` FOREIGN KEY (`financeur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `main_financer_projet_id_95548a8e_fk_main_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `main_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_financer`
--

LOCK TABLES `main_financer` WRITE;
/*!40000 ALTER TABLE `main_financer` DISABLE KEYS */;
INSERT INTO `main_financer` VALUES (1,1000.00,'2020-01-22 14:25:31.194316',1,3);
/*!40000 ALTER TABLE `main_financer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_like`
--

DROP TABLE IF EXISTS `main_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `date_like` datetime(6) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `like_authenticate_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_like_evaluation_id_c9c8a40e_fk_main_commentaire_id` (`evaluation_id`),
  KEY `main_like_like_authenticate_user_id_79d475cd_fk_auth_user_id` (`like_authenticate_user_id`),
  CONSTRAINT `main_like_evaluation_id_c9c8a40e_fk_main_commentaire_id` FOREIGN KEY (`evaluation_id`) REFERENCES `main_commentaire` (`id`),
  CONSTRAINT `main_like_like_authenticate_user_id_79d475cd_fk_auth_user_id` FOREIGN KEY (`like_authenticate_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_like`
--

LOCK TABLES `main_like` WRITE;
/*!40000 ALTER TABLE `main_like` DISABLE KEYS */;
INSERT INTO `main_like` VALUES (2,1,'2020-01-22 14:19:34.741198',1,1),(3,1,'2020-01-22 14:20:21.345435',2,1),(4,1,'2020-01-22 14:25:16.986691',3,1);
/*!40000 ALTER TABLE `main_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_projet`
--

DROP TABLE IF EXISTS `main_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `montant_souhaite` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `est_finance` tinyint(1) NOT NULL,
  `date_finance` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_projet_auteur_id_1f2ff825_fk_auth_user_id` (`auteur_id`),
  CONSTRAINT `main_projet_auteur_id_1f2ff825_fk_auth_user_id` FOREIGN KEY (`auteur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_projet`
--

LOCK TABLES `main_projet` WRITE;
/*!40000 ALTER TABLE `main_projet` DISABLE KEYS */;
INSERT INTO `main_projet` VALUES (1,'Qu\'est-ce que le Lorem Ipsum?','Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',7000.00,'projects_pics/projet-01.jpg',1,NULL,'2020-01-22 14:14:35.471173','2020-01-22 14:18:03.668482',3),(2,'Où puis-je m\'en procurer?','Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d\'entre elles a été altérée par l\'addition d\'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard. Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu\'il n\'y a rien d\'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin, ce qui fait de lipsum.com le seul vrai générateur de Lorem Ipsum. Iil utilise un dictionnaire de plus de 200 mots latins, en combinaison de plusieurs structures de phrases, pour générer un Lorem Ipsum irréprochable. Le Lorem Ipsum ainsi obtenu ne contient aucune répétition, ni ne contient des mots farfelus, ou des touches d\'humour.',5500.00,'projects_pics/projet-2.jpg',0,NULL,'2020-01-22 14:17:03.923240','2020-01-22 14:17:03.923260',4),(3,'Donations','Si vous utiliser fréquemment ce site et voulez l\'aider à continuer sur Internet, pensez à une donation d\'une somme minime pour nous aider à payer l\'hébergement et la bande passante. Il n\'y a pas de minimum de donation, et toute somme sera appréciée - cliquez ici pour donner en utilisant Paypal. Nous vous remercions de votre soutien.',20000.00,'projects_pics/projet-2.jpg',0,NULL,'2020-01-22 14:24:43.198859','2020-01-22 14:24:43.198898',1);
/*!40000 ALTER TABLE `main_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `is_expert` tinyint(1) NOT NULL,
  `points_gagnes` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'profile_pics/Marline2-300x300.jpg',0,0,1),(2,'default.png',0,0,2),(3,'profile_pics/man.png',0,0,3),(4,'profile_pics/man.png',0,0,4);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 14:30:18
