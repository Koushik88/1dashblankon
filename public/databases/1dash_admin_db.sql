-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: global_basics_admin
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.15.04.1

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
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(150) CHARACTER SET utf8 NOT NULL,
  `nested` tinyint(1) NOT NULL,
  `nested_parent_id` int(11) NOT NULL,
  `parent_level` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `open_sub_level` int(1) NOT NULL,
  `class_active` int(11) NOT NULL,
  `href` varchar(450) CHARACTER SET utf8 NOT NULL,
  `admin_token` varchar(250) CHARACTER SET utf8 NOT NULL,
  `base_icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `address` text,
  `logo` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `menu_password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'TVS NEXT Pvt Ltd','We are an Enterprise Solutions provider for core industries like Manufacturing, Automotive and Distribution.\r\n\r\nSince our inception, we have built long-term relationships with our customers serving their IT & ERP needs. We help our customers to compete and grow by collaboratively solving their business problems through technology solutions, and partnering with them on their IT transformation journey.\r\n\r\nWe are a part of $5 billion TVS  group of companies well known for a century of Trust, Value & Service with a wide foot print in multiple domains. With the backing from such a reputed group, we are right-sized to address comprehensive IT needs and offer the advantages of nimbleness, flexibility, longevity, commitment to completion and excellent support to our business relationships.\r\n\r\nOur Smart iT OutSourcing (SiTOS) provides companies the flexibility to use us as their extended IT arm, with services ranging from program management, enterprise solutions, infrastructure management, IT applications to website and portal management.','73, Venkata krishna Road, \nR.A.Puram, Chennai - 600 028. \nTamil Nadu. India. ','logo58.jpg',1,0,'npediaanalyzr');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_credentials`
--

DROP TABLE IF EXISTS `company_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_credentials` (
  `key` varchar(20) NOT NULL,
  `company_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `data` blob,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_credentials`
--

LOCK TABLES `company_credentials` WRITE;
/*!40000 ALTER TABLE `company_credentials` DISABLE KEYS */;
INSERT INTO `company_credentials` VALUES ('smtp',1,'ponnar.veeramalai@tvsinfotech.com','nG ÓY¹i’KÛ82','{\"company_id\":\"1\",\"cred_key\":\"1\",\"chk-semail\":\"1\",\"smtp_servername\":\"mail.tvsinfotech.com\",\"smtp_portno\":\"143\",\"smtp_username\":\"ponnar.veeramalai@tvsinfotech.com\",\"smtp_password\":\"pon#123$\",\"btn_subsmpt\":\"\"}',1),('cron',1,'manoharan','•|÷’Õ€B>Ÿ7hÉ[«','{\"company_id\":\"1\",\"cred_key\":\"1\",\"cron_ipaddress\":\"10.0.0.99\",\"cron_username\":\"manoharan\",\"cron_password\":\"team-php\",\"cron_paths\":\"/usr/lib/cgi-bin\",\"btn_subcron\":\"\"}',1),('scpcred',1,'','',NULL,1),('bq',1,'welcome','KÞqœ€Õ]§Z°ÅPƒëâF','{\"company_id\":\"1\",\"cred_key\":\"1\",\"bq_username\":\"welcome\",\"bq_password\":\"welcome\",\"bq_auth_key\":\"authkey\",\"bq_project_id\":\"projectid\",\"btn_bq_profile\":\"\"}',1),('ldap',1,'','','{\"company_id\":\"1\",\"chk-sldap\":\"1\",\"cred_key\":\"1\",\"ldap_url\":\"ldap://10.91.19.110:389/\",\"ldap_dom_comp\":\"DC=TVSi,DC=local\",\"ldap_auth_attr\":\"tvsi$login\",\"btn_subldap\":\"\",\"ldap_username\":\"\",\"ldap_password\":\"\"}',0),('extshare',1,'','',NULL,0),('customupload',1,'','',NULL,0),('gdrive',1,'','','{\"company_id\":\"1\",\"cred_key\":\"1\",\"gd_clientid\":\"752739413641.apps.googleusercontent.com\",\"gd_clientsecret\":\"4AEDXskt871EBRalzBZig7UJ\",\"gd_redirecturi\":\"http://localhost/analyzr/portal/page/gdrive.php\",\"gd_scope\":\"https://www.googleapis.com/auth/drive\",\"gd_token\":\"https://accounts.google.com/o/oauth2/token\",\"api_key\":\"ffff\",\"btn_gdprofile\":\"\",\"gdrive_username\":\"\",\"gdrive_password\":\"\"}',1),('fb',1,'','ÿÔ|+Ã6u¸NØÕ©ìñ','{\"company_id\":\"1\",\"cred_key\":\"1\",\"fb_appid\":\"100929283281389\",\"fb_appsecret\":\"100929283281389\",\"btn_fbprofile\":\"\",\"fb_username\":\"\",\"fb_password\":\"\"}',1),('ganalytics',1,'m9oystor@gmail.comdd','{UÈ	þ¡ÿdÎwˆ_|×','{\"company_id\":\"1\",\"cred_key\":\"1\",\"ganalytics_username\":\"m9oystor@gmail.comdd\",\"ganalytics_password\":\"oystor9000\",\"ganalytics_profile\":\"42898490\",\"btn_gprofile\":\"\"}',1),('bigquery',1,'welcome','KÞqœ€Õ]§Z°ÅPƒëâF','{\"company_id\":\"1\",\"cred_key\":\"1\",\"bigquery_username\":\"welcome\",\"bigquery_password\":\"welcome\",\"bigquery_auth_key\":\"authkey\",\"bigquery_project_id\":\"projectid\",\"btn_bq_profile\":\"\"}',1),('print',1,'','',NULL,1),('export',1,'','',NULL,1),('importdb',1,'','',NULL,1),('ruleengine',1,'','',NULL,1);
/*!40000 ALTER TABLE `company_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_group` tinyint(1) NOT NULL DEFAULT '0',
  `chat_user_randomId` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_group`
--

DROP TABLE IF EXISTS `conversation_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_logo` varchar(100) NOT NULL DEFAULT 'defaultlogo1.jpg',
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Active  D - Deleted',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_group`
--

LOCK TABLES `conversation_group` WRITE;
/*!40000 ALTER TABLE `conversation_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_group_reply`
--

DROP TABLE IF EXISTS `conversation_group_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_group_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(250) NOT NULL,
  `group_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL COMMENT 'Who send a message?',
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_type` char(1) NOT NULL DEFAULT 'M' COMMENT 'M - Message, N - Notification',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_group_reply`
--

LOCK TABLES `conversation_group_reply` WRITE;
/*!40000 ALTER TABLE `conversation_group_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_group_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_group_user`
--

DROP TABLE IF EXISTS `conversation_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removedtime` timestamp NULL DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Active/ D - Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_group_user`
--

LOCK TABLES `conversation_group_user` WRITE;
/*!40000 ALTER TABLE `conversation_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_reply`
--

DROP TABLE IF EXISTS `conversation_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_reply` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` varchar(250) NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_one` char(1) NOT NULL DEFAULT 'U',
  `status_two` char(1) NOT NULL DEFAULT 'U',
  `c_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`cr_id`),
  KEY `conversation_reply_ibfk_1` (`user_id_fk`),
  KEY `conversation_reply_ibfk_2` (`c_id_fk`),
  CONSTRAINT `conversation_reply_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_reply`
--

LOCK TABLES `conversation_reply` WRITE;
/*!40000 ALTER TABLE `conversation_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gmail_api_users`
--

DROP TABLE IF EXISTS `gmail_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmail_api_users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(250) NOT NULL,
  `googleplus_id` varchar(250) NOT NULL,
  `youtubechannel_id` varchar(250) NOT NULL,
  `refresh_token` varchar(250) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmail_api_users`
--

LOCK TABLES `gmail_api_users` WRITE;
/*!40000 ALTER TABLE `gmail_api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmail_api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_users`
--

DROP TABLE IF EXISTS `menu_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_users` (
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `types` varchar(50) NOT NULL DEFAULT 'web',
  PRIMARY KEY (`menu_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_users`
--

LOCK TABLES `menu_users` WRITE;
/*!40000 ALTER TABLE `menu_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(90) DEFAULT NULL,
  `section` int(3) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `procedure_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT '1',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `enhance_proc_id` text NOT NULL,
  `link_reports_id` int(11) DEFAULT NULL,
  `report_icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1332,'1View',6,0,0,1,1,1,'',NULL,'sj-side-home'),(1333,'Social',6,0,0,103,1,1,'',NULL,'sj-side-socialmedia'),(1334,'Profile',12,0,0,105,1,1,'',NULL,''),(1335,'Calendar',6,0,0,107,1,1,'',NULL,'sj-side-calendar'),(1336,'Mail',6,0,0,108,1,1,'',NULL,'sj-side-email'),(1337,'Admin',12,0,0,2,1,1,'',NULL,''),(1338,'Ecommerce',6,0,0,110,1,1,'',NULL,'sj-side-ecommerce');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_events`
--

DROP TABLE IF EXISTS `notification_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `event_id` varchar(50) NOT NULL,
  `event_name` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `allday` int(11) NOT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_events`
--

LOCK TABLES `notification_events` WRITE;
/*!40000 ALTER TABLE `notification_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_login_details`
--

DROP TABLE IF EXISTS `page_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_login_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_id` varchar(100) NOT NULL,
  `auto_gen_key` varchar(100) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `page_time` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_login_details`
--

LOCK TABLES `page_login_details` WRITE;
/*!40000 ALTER TABLE `page_login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_assign_user`
--

DROP TABLE IF EXISTS `plugin_assign_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_assign_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plugin_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_assign_user`
--

LOCK TABLES `plugin_assign_user` WRITE;
/*!40000 ALTER TABLE `plugin_assign_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_assign_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_details`
--

DROP TABLE IF EXISTS `plugin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_details` (
  `name` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET dec8 NOT NULL,
  `data` text,
  `releam_id` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `userID` int(11) NOT NULL,
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_details`
--

LOCK TABLES `plugin_details` WRITE;
/*!40000 ALTER TABLE `plugin_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `plugin_id` int(11) NOT NULL,
  `plugin_name` varchar(30) NOT NULL,
  `security_code` varchar(60) NOT NULL,
  `installed` varchar(10) NOT NULL,
  PRIMARY KEY (`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(35) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `procedure_type` varchar(50) NOT NULL DEFAULT 'Installed',
  `created_on` datetime DEFAULT NULL,
  `dashboard` int(11) NOT NULL DEFAULT '0',
  `col_exclude_row` text NOT NULL,
  `total_proc_column` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `product_version` varchar(5) NOT NULL,
  `installed_date` datetime NOT NULL,
  `license_id` varchar(30) NOT NULL,
  `license_key` varchar(30) NOT NULL,
  `product_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Standard , 80 = Cloud,90 = Enterprise - level1,100 = Enterprise - level2',
  `mobile_available` char(1) NOT NULL DEFAULT 'Y',
  `company_id` int(10) NOT NULL,
  `mobile_logo` varchar(250) DEFAULT NULL,
  `api_key` varchar(100) NOT NULL,
  `webservice` int(11) NOT NULL DEFAULT '1',
  `windows8_logo` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_feed`
--

DROP TABLE IF EXISTS `rss_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_feed` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `uid` int(50) NOT NULL,
  `data` text NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_feed`
--

LOCK TABLES `rss_feed` WRITE;
/*!40000 ALTER TABLE `rss_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_master`
--

DROP TABLE IF EXISTS `section_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `for_menu` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `assigned_for` varchar(15) NOT NULL,
  `menu_image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_master`
--

LOCK TABLES `section_master` WRITE;
/*!40000 ALTER TABLE `section_master` DISABLE KEYS */;
INSERT INTO `section_master` VALUES (6,'Dashboard',1,1,0,1,'web','','section5.png'),(8,'Basic Reports - Mobile',1,1,0,9,'device','mobile','section6.png'),(12,'Sales Analysis',1,1,0,3,'web','','section10.png'),(18,'Sales Analysis Custom',1,1,0,5,'web','','section6.png'),(104,'Windows8 Reports',1,1,0,16,'device','windows8','section3.png'),(108,'AR Reports',1,1,0,11,'web','','section6.png'),(109,'Inventory Analysis',1,1,0,12,'web','','section4.png');
/*!40000 ALTER TABLE `section_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialmedia_counts`
--

DROP TABLE IF EXISTS `socialmedia_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialmedia_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialmedia_counts`
--

LOCK TABLES `socialmedia_counts` WRITE;
/*!40000 ALTER TABLE `socialmedia_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialmedia_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `php_name` varchar(30) NOT NULL,
  `tpl_name` varchar(30) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `for_menu` tinyint(1) NOT NULL DEFAULT '1',
  `controller` varchar(50) NOT NULL,
  `hash` varchar(70) NOT NULL,
  `template_type` varchar(250) NOT NULL,
  `data_source` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `tpltype_id` int(10) DEFAULT '0',
  `template_image` varchar(250) DEFAULT NULL,
  `procedure_type` varchar(50) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `php_name`, `tpl_name`, `is_enabled`, `for_menu`, `controller`, `hash`, `template_type`, `data_source`, `description`, `tpltype_id`, `template_image`, `procedure_type`) VALUES
(1, 'Widget Template', 'widget', 'widget', 1, 1, 'plugin', 'dasd', 'sandard', 'database', 'Widget Declaration', 1111, 'nill', '1'),
(2, 'Admin', 'admin', 'admin', 1, 1, 'page', 'dsad', 'standard', 'databases', 'demo', 1111, 'dasd', '1'),
(103, 'Dashboard Template', 'socialstream', 'socialstream', 1, 1, 'module', 'sdauj', 'standard', 'database', 'Calculate sum,Avg Variance', 1111, 'multiple-month-growth.png', '1'),
(105, 'Profile Template', 'profile', 'profile', 1, 1, 'page', 'jhujgh', 'standard', 'database', 'sales compare reports Multi month', 1111, 'multiple-month-growth.png', '1'),
(107, 'Calendar', 'calendar', 'calendar', 1, 1, 'module', 'fsdf', 'standard', 'database', '', 1111, NULL, '1'),
(108, 'Gmail Page', 'gmail_up', 'gmail_up', 1, 1, 'module', 'dsaufd', 'standard', 'standard', 'duaysfd', 1111, 'sad', '1'),
(110,'Ecomerce','ecommerce','ecommerce',1,1,'module','','standard','standard','',1111,'','1');



/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `todo` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `eventdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` char(1) NOT NULL DEFAULT 'U' COMMENT 'C - Completed D - Deleted U - Uncompleted',
  PRIMARY KEY (`id`),
  KEY `fk_userid` (`userid`),
  CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadertool_history`
--

DROP TABLE IF EXISTS `uploadertool_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadertool_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `server_type` varchar(30) NOT NULL,
  `account_name` varchar(17) NOT NULL,
  `type` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(250) NOT NULL,
  `size_in_bytes` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `msg` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadertool_history`
--

LOCK TABLES `uploadertool_history` WRITE;
/*!40000 ALTER TABLE `uploadertool_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadertool_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dashboard`
--

DROP TABLE IF EXISTS `user_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dashboard` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `report_title` varchar(250) DEFAULT NULL,
  `report_source` varchar(250) DEFAULT NULL,
  `menu_name` varchar(250) NOT NULL,
  `dashboard_type` varchar(250) NOT NULL,
  `procedure_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dashboard`
--

LOCK TABLES `user_dashboard` WRITE;
/*!40000 ALTER TABLE `user_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_details`
--

DROP TABLE IF EXISTS `user_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `auto_gen_key` varchar(100) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_role_map1` (`user_id`),
  CONSTRAINT `FK_users_role_map1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=954 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_details`
--

LOCK TABLES `user_login_details` WRITE;
/*!40000 ALTER TABLE `user_login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mail_log`
--

DROP TABLE IF EXISTS `user_mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mail_log` (
  `user_id` int(12) NOT NULL,
  `log_time` datetime NOT NULL,
  `report_name` varchar(40) NOT NULL,
  `template_name` varchar(40) NOT NULL,
  `procedure_name` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mail_log`
--

LOCK TABLES `user_mail_log` WRITE;
/*!40000 ALTER TABLE `user_mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(50) NOT NULL,
  `password_string` varchar(2) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `user_role` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '1',
  `user_type_id` int(2) NOT NULL DEFAULT '0',
  `allow_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `ldap` tinyint(1) NOT NULL DEFAULT '0',
  `browser_type` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `custom_upload` tinyint(4) NOT NULL,
  `gdrive_key` varchar(250) NOT NULL,
  `skydrive_key` varchar(500) DEFAULT NULL,
  `platform` varchar(50) NOT NULL,
  `allow_uploadtool` int(11) NOT NULL DEFAULT '0',
  `api_access_token` varchar(45) NOT NULL,
  `logo_image` varchar(100) NOT NULL,
  `export_level` int(2) NOT NULL DEFAULT '0',
  `export_type` varchar(50) NOT NULL DEFAULT 'Both',
  `additional_role` tinyint(1) NOT NULL DEFAULT '0',
  `admin_privilege_module` text NOT NULL COMMENT 'yprivilege module token stored in arra',
  `custom_role_one_id` int(11) NOT NULL,
  `custom_role_two_id` int(11) NOT NULL,
  `session` varchar(100) DEFAULT NULL,
  `last_logout` timestamp NULL DEFAULT NULL,
  `profilepic` varchar(100) NOT NULL DEFAULT 'default.png',
  `Link_update_time` datetime NOT NULL,
  `temeId` varchar(100) NOT NULL,
  `previous_login` datetime NOT NULL,
  `login_attempt_faild_time` datetime DEFAULT NULL,
  `login_attempt_faild_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_access_right`
--

DROP TABLE IF EXISTS `users_access_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_access_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_right` varchar(120) CHARACTER SET utf8 NOT NULL,
  `template_name` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_access_right`
--

LOCK TABLES `users_access_right` WRITE;
/*!40000 ALTER TABLE `users_access_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_access_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard`
--

DROP TABLE IF EXISTS `users_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard` (
  `user_id` int(11) NOT NULL,
  `charttype` blob NOT NULL,
  `layoutorder` blob NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  CONSTRAINT `users_dashboard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard`
--

LOCK TABLES `users_dashboard` WRITE;
/*!40000 ALTER TABLE `users_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_right_id` int(11) NOT NULL DEFAULT '1',
  `role` varchar(160) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
INSERT INTO `users_role` VALUES (1,1,'CEO'),(2,1,'CFO'),(3,1,'COO'),(4,3,'Manager'),(5,2,'Employee'),(6,2,'Associate'),(10,3,'Vendor'),(11,1,'Admin');
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersyncsettings`
--

DROP TABLE IF EXISTS `usersyncsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersyncsettings` (
  `UserSyncSettingId` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(40) NOT NULL,
  `EmailId` varchar(50) NOT NULL,
  `IsLock` tinyint(1) NOT NULL,
  `IsSync` int(1) NOT NULL,
  `SyncRefreshToken` text NOT NULL,
  `SyncedOn` datetime NOT NULL,
  `MaxUpdatedDate` datetime NOT NULL,
  `GoogleChannelId` varchar(90) NOT NULL,
  `GoogleResourceId` varchar(50) NOT NULL,
  `GoogleCalWatchDate` datetime NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `ModifiedDate` datetime NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserSyncSettingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersyncsettings`
--

LOCK TABLES `usersyncsettings` WRITE;
/*!40000 ALTER TABLE `usersyncsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersyncsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `widgetname` varchar(100) NOT NULL,
  `widgettype` varchar(10) NOT NULL,
  `procid` text NOT NULL,
  `reportid` int(5) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `layout` int(1) NOT NULL DEFAULT '2' COMMENT 'Widget Position on layout',
  `valuetype` varchar(20) NOT NULL COMMENT 'Value represent in widget',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_annotation`
--

DROP TABLE IF EXISTS `widget_annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_annotation` (
  `annoid` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(5) NOT NULL,
  `receiverid` int(5) NOT NULL,
  `message` text NOT NULL,
  `annotime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `annotype` char(1) NOT NULL DEFAULT 'S' COMMENT 'S - Single G -  Group',
  `widgetid` int(5) NOT NULL,
  PRIMARY KEY (`annoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_annotation`
--

LOCK TABLES `widget_annotation` WRITE;
/*!40000 ALTER TABLE `widget_annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_option`
--

DROP TABLE IF EXISTS `widget_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_option` (
  `optionid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `reportid` int(5) NOT NULL,
  `widgetoption` text NOT NULL COMMENT 'Widget Option Having Widget Wise Feature',
  `layoutoption` text NOT NULL COMMENT 'Layout Option 3 Layouts',
  `widgetlist` text COMMENT 'Available Widget List in Particular Report',
  `layout` varchar(10) NOT NULL DEFAULT 'layout7',
  PRIMARY KEY (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_option`
--

LOCK TABLES `widget_option` WRITE;
/*!40000 ALTER TABLE `widget_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-03 10:54:05
