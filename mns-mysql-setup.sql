-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: Message360_Notification_Demo
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.16-MariaDB

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
-- Table structure for table `audios`
--

DROP TABLE IF EXISTS `audios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audios` (
  `audio_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `server_dir` varchar(200) DEFAULT NULL,
  `server_name` varchar(55) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`audio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audios`
--

LOCK TABLES `audios` WRITE;
/*!40000 ALTER TABLE `audios` DISABLE KEYS */;
/*!40000 ALTER TABLE `audios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `code3` char(3) NOT NULL,
  `phone_code` int(7) NOT NULL,
  `postcode_required` tinyint(1) NOT NULL DEFAULT '0',
  `isEU` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'United States','US','USA',1,0,0),(2,'Canada','CA','CAN',1,0,0),(3,'Afghanistan','AF','AFG',93,0,0),(4,'Albania','AL','ALB',355,0,0),(5,'Algeria','DZ','DZA',213,0,0),(6,'American Samoa','DS','ASM',44,0,0),(7,'Andorra','AD','AND',376,0,0),(8,'Angola','AO','AGO',244,0,0),(9,'Anguilla','AI','AIA',1264,0,0),(10,'Antarctica','AQ','ATA',672,0,0),(11,'Antigua and Barbuda','AG','ATG',1268,0,0),(12,'Argentina','AR','ARG',54,0,0),(13,'Armenia','AM','ARM',374,0,0),(14,'Aruba','AW','ABW',297,0,0),(15,'Australia','AU','AUS',61,0,0),(16,'Austria','AT','AUT',43,0,1),(17,'Azerbaijan','AZ','AZE',994,0,0),(18,'Bahamas','BS','BHS',1242,0,0),(19,'Bahrain','BH','BHR',973,0,0),(20,'Bangladesh','BD','BGD',880,0,0),(21,'Barbados','BB','BRB',1246,0,0),(22,'Belarus','BY','BLR',375,0,0),(23,'Belgium','BE','BEL',32,0,1),(24,'Belize','BZ','BLZ',501,0,0),(25,'Benin','BJ','BEN',229,0,0),(26,'Bermuda','BM','BMU',1441,0,0),(27,'Bhutan','BT','BTN',975,0,0),(28,'Bolivia','BO','BOL',591,0,0),(29,'Bosnia and Herzegovina','BA','BIH',387,0,0),(30,'Botswana','BW','BWA',267,0,0),(31,'Bouvet Island','BV','',44,0,0),(32,'Brazil','BR','BRA',55,0,0),(33,'British lndian Ocean Territory','IO','IOT',0,0,0),(34,'Brunei Darussalam','BN','BRN',673,0,0),(35,'Bulgaria','BG','BGR',359,0,1),(36,'Burkina Faso','BF','BFA',226,0,0),(37,'Burundi','BI','BDI',257,0,0),(38,'Cambodia','KH','KHM',855,0,0),(39,'Cameroon','CM','CMR',237,0,0),(40,'Cape Verde','CV','CPV',238,0,0),(41,'Cayman Islands','KY','CYM',1345,0,0),(42,'Central African Republic','CF','CAF',236,0,0),(43,'Chad','TD','TCD',235,0,0),(44,'Chile','CL','CHL',56,0,0),(45,'China','CN','CHN',86,0,0),(46,'Christmas Island','CX','CXR',61,0,0),(47,'Cocos (Keeling) Islands','CC','CCK',61,0,0),(48,'Colombia','CO','COL',57,0,0),(49,'Comoros','KM','COM',269,0,0),(50,'Congo','CG','COG',242,0,0),(51,'Cook Islands','CK','COK',682,0,0),(52,'Costa Rica','CR','CRC',506,0,0),(53,'Croatia (Hrvatska)','HR','HRV',385,0,0),(54,'Cuba','CU','CUB',53,0,0),(55,'Cyprus','CY','CYP',357,0,1),(56,'Czech Republic','CZ','CZE',420,0,1),(57,'Denmark','DK','DNK',45,0,1),(58,'Djibouti','DJ','DJI',253,0,0),(59,'Dominica','DM','DMA',1767,0,0),(60,'Dominican Republic','DO','DOM',1809,0,0),(61,'East Timor','TP','',44,0,0),(62,'Ecuador','EC','ECU',593,0,0),(63,'Egypt','EG','EGY',20,0,0),(64,'El Salvador','SV','SLV',503,0,0),(65,'Equatorial Guinea','GQ','GNQ',240,0,0),(66,'Eritrea','ER','ERI',291,0,0),(67,'Estonia','EE','EST',372,0,1),(68,'Ethiopia','ET','ETH',251,0,0),(69,'Falkland Islands (Malvinas)','FK','FLK',500,0,0),(70,'Faroe Islands','FO','FRO',298,0,0),(71,'Fiji','FJ','FJI',679,0,0),(72,'Finland','FI','FIN',358,0,1),(73,'France','FR','FRA',33,0,1),(74,'France, Metropolitan','FX','',44,0,0),(75,'French Guiana','GF','',44,0,0),(76,'French Polynesia','PF','PYF',689,0,0),(77,'French Southern Territories','TF','',44,0,0),(78,'Gabon','GA','GAB',241,0,0),(79,'Gambia','GM','GMB',220,0,0),(80,'Georgia','GE','GEO',995,0,0),(81,'Germany','DE','DEU',49,0,1),(82,'Ghana','GH','GHA',233,0,0),(83,'Gibraltar','GI','GIB',350,0,0),(84,'Greece','GR','GRC',30,0,1),(85,'Greenland','GL','GRL',299,0,0),(86,'Grenada','GD','GRD',1473,0,0),(87,'Guadeloupe','GP','',44,0,0),(88,'Guam','GU','GUM',1671,0,0),(89,'Guatemala','GT','GTM',502,0,0),(90,'Guinea','GN','GIN',224,0,0),(91,'Guinea-Bissau','GW','GNB',245,0,0),(92,'Guyana','GY','GUY',592,0,0),(93,'Haiti','HT','HTI',509,0,0),(94,'Heard and Mc Donald Islands','HM','',44,0,0),(95,'Honduras','HN','HND',504,0,0),(96,'Hong Kong','HK','HKG',852,0,0),(97,'Hungary','HU','HUN',36,0,1),(98,'Iceland','IS','IS',354,0,0),(99,'India','IN','IND',91,0,0),(100,'Indonesia','ID','IDN',62,0,0),(101,'Iran (Islamic Republic of)','IR','IRN',98,0,0),(102,'Iraq','IQ','IRQ',964,0,0),(103,'Ireland','IE','IRL',353,0,1),(104,'Israel','IL','ISR',972,0,0),(105,'Italy','IT','ITA',39,0,1),(106,'Ivory Coast','CI','CIV',225,0,0),(107,'Jamaica','JM','JAM',1876,0,0),(108,'Japan','JP','JPN',81,0,0),(109,'Jordan','JO','JOR',962,0,0),(110,'Kazakhstan','KZ','KAZ',7,0,0),(111,'Kenya','KE','KEN',254,0,0),(112,'Kiribati','KI','KIR',686,0,0),(113,'Korea, Democratic People\'s Republic of','KP','PRK',850,0,0),(114,'Korea, Republic of','KR','KOR',82,0,0),(115,'Kuwait','KW','KWT',965,0,0),(116,'Kyrgyzstan','KG','KGZ',996,0,0),(117,'Lao People\'s Democratic Republic','LA','LAO',856,0,0),(118,'Latvia','LV','LVA',371,0,1),(119,'Lebanon','LB','LBN',961,0,0),(120,'Lesotho','LS','LSO',266,0,0),(121,'Liberia','LR','LBR',231,0,0),(122,'Libyan Arab Jamahiriya','LY','LBY',218,0,0),(123,'Liechtenstein','LI','LIE',423,0,0),(124,'Lithuania','LT','LTU',370,0,1),(125,'Luxembourg','LU','LUX',352,0,1),(126,'Macau','MO','MAC',853,0,0),(127,'Macedonia','MK','MKD',389,0,0),(128,'Madagascar','MG','MDG',261,0,0),(129,'Malawi','MW','MWI',265,0,0),(130,'Malaysia','MY','MYS',60,0,0),(131,'Maldives','MV','MDV',960,0,0),(132,'Mali','ML','MLI',223,0,0),(133,'Malta','MT','MLT',356,0,1),(134,'Marshall Islands','MH','MHL',692,0,0),(135,'Martinique','MQ','',44,0,0),(136,'Mauritania','MR','MRT',222,0,0),(137,'Mauritius','MU','MUS',230,0,0),(138,'Mayotte','TY','MYT',262,0,0),(139,'Mexico','MX','MEX',52,0,0),(140,'Micronesia, Federated States of','FM','FSM',691,0,0),(141,'Moldova, Republic of','MD','MDA',373,0,0),(142,'Monaco','MC','MCO',377,0,0),(143,'Mongolia','MN','MNG',976,0,0),(144,'Montserrat','MS','MSR',1664,0,0),(145,'Morocco','MA','MAR',212,0,0),(146,'Mozambique','MZ','MOZ',258,0,0),(147,'Myanmar','MM','MMR',95,0,0),(148,'Namibia','NA','NAM',264,0,0),(149,'Nauru','NR','NRU',674,0,0),(150,'Nepal','NP','NPL',977,0,0),(151,'Netherlands','NL','NLD',31,0,1),(152,'Netherlands Antilles','AN','ANT',599,0,0),(153,'New Caledonia','NC','NCL',687,0,0),(154,'New Zealand','NZ','NZL',64,0,0),(155,'Nicaragua','NI','NIC',505,0,0),(156,'Niger','NE','NER',227,0,0),(157,'Nigeria','NG','NGA',234,0,0),(158,'Niue','NU','NIU',683,0,0),(159,'Norfork Island','NF','',44,0,0),(160,'Northern Mariana Islands','MP','MNP',1670,0,0),(161,'Norway','NO','NOR',47,0,0),(162,'Oman','OM','OMN',968,0,0),(163,'Pakistan','PK','PAK',92,0,0),(164,'Palau','PW','PLW',680,0,0),(165,'Panama','PA','PAN',507,0,0),(166,'Papua New Guinea','PG','PNG',675,0,0),(167,'Paraguay','PY','PRY',595,0,0),(168,'Peru','PE','PER',51,0,0),(169,'Philippines','PH','PHL',63,0,0),(170,'Pitcairn','PN','PCN',870,0,0),(171,'Poland','PL','POL',48,0,1),(172,'Portugal','PT','PRT',351,0,1),(173,'Puerto Rico','PR','PRI',1,0,0),(174,'Qatar','QA','QAT',974,0,0),(175,'Reunion','RE','',44,0,0),(176,'Romania','RO','ROU',40,0,1),(177,'Russian Federation','RU','RUS',7,0,0),(178,'Rwanda','RW','RWA',250,0,0),(179,'Saint Kitts and Nevis','KN','KNA',1869,0,0),(180,'Saint Lucia','LC','LCA',1758,0,0),(181,'Saint Vincent and the Grenadines','VC','VCT',1784,0,0),(182,'Samoa','WS','WSM',685,0,0),(183,'San Marino','SM','SMR',378,0,0),(184,'Sao Tome and Principe','ST','STP',239,0,0),(185,'Saudi Arabia','SA','SAU',966,0,0),(186,'Senegal','SN','SEN',221,0,0),(187,'Seychelles','SC','SYC',248,0,0),(188,'Sierra Leone','SL','SLE',232,0,0),(189,'Singapore','SG','SGP',65,0,0),(190,'Slovakia','SK','SVK',421,0,1),(191,'Slovenia','SI','SVN',386,0,1),(192,'Solomon Islands','SB','SLB',677,0,0),(193,'Somalia','SO','SOM',252,0,0),(194,'South Africa','ZA','ZAF',27,0,0),(195,'South Georgia South Sandwich Islands','GS','',44,0,0),(196,'Spain','ES','ESP',34,0,1),(197,'Sri Lanka','LK','LKA',94,0,0),(198,'St. Helena','SH','SHN',290,0,0),(199,'St. Pierre and Miquelon','PM','SPM',508,0,0),(200,'Sudan','SD','SDN',249,0,0),(201,'Suriname','SR','SUR',597,0,0),(202,'Svalbarn and Jan Mayen Islands','SJ','SJM',0,0,0),(203,'Swaziland','SZ','SWZ',268,0,0),(204,'Sweden','SE','SWE',46,0,1),(205,'Switzerland','CH','CHE',41,0,0),(206,'Syrian Arab Republic','SY','SYR',963,0,0),(207,'Taiwan','TW','TWN',886,0,0),(208,'Tajikistan','TJ','TJK',992,0,0),(209,'Tanzania, United Republic of','TZ','TZA',255,0,0),(210,'Thailand','TH','THA',66,0,0),(211,'Togo','TG','TGO',228,0,0),(212,'Tokelau','TK','TKL',690,0,0),(213,'Tonga','TO','TON',676,0,0),(214,'Trinidad and Tobago','TT','TTO',1868,0,0),(215,'Tunisia','TN','TUN',216,0,0),(216,'Turkey','TR','TUR',90,0,0),(217,'Turkmenistan','TM','TKM',993,0,0),(218,'Turks and Caicos Islands','TC','TCA',1649,0,0),(219,'Tuvalu','TV','TUV',688,0,0),(220,'Uganda','UG','UGA',256,0,0),(221,'Ukraine','UA','UKR',380,0,0),(222,'United Arab Emirates','AE','ARE',971,0,0),(223,'United Kingdom','GB','GBR',44,1,1),(224,'United States minor outlying islands','UM','',44,0,0),(225,'Uruguay','UY','URY',598,0,0),(226,'Uzbekistan','UZ','UZB',998,0,0),(227,'Vanuatu','VU','VUT',678,0,0),(228,'Vatican City State','VA','VAT',39,0,0),(229,'Venezuela','VE','VEN',58,0,0),(230,'Vietnam','VN','VNM',84,0,0),(231,'Virigan Islands (British)','VG','VGB',1284,0,0),(232,'Virgin Islands (U.S.)','VI','VIR',1340,0,0),(233,'Wallis and Futuna Islands','WF','WLF',681,0,0),(234,'Western Sahara','EH','ESH',0,0,0),(235,'Yemen','YE','YEM',967,0,0),(236,'Yugoslavia','YU','',44,0,0),(237,'Zaire','ZR','',44,0,0),(238,'Zambia','ZM','ZMB',260,0,0),(239,'Zimbabwe','ZW','ZWE',263,0,0),(240,'Kosovo','XK','',381,0,0),(243,'Montenegro','ME','MNE',382,0,0),(386,'Serbia','RS','SRB',381,0,0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_lists`
--

DROP TABLE IF EXISTS `number_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_lists` (
  `number_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(100) NOT NULL,
  `list_discriptions` varchar(500) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`number_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_lists`
--

LOCK TABLES `number_lists` WRITE;
/*!40000 ALTER TABLE `number_lists` DISABLE KEYS */;
INSERT INTO `number_lists` VALUES (1,'Message360','Message360','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `number_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `number_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_list_id` int(11) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `opt_in_tfn` tinyint(1) DEFAULT '0',
  `add_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`number_id`),
  KEY `fk_n_number_list_id_idx` (`number_list_id`),
  KEY `i_n_phone_number_asc` (`phone_number`),
  KEY `i_n_phone_number_desc` (`phone_number`),
  CONSTRAINT `fk_n_number_list_id` FOREIGN KEY (`number_list_id`) REFERENCES `number_lists` (`number_list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_queues`
--

DROP TABLE IF EXISTS `send_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_queues` (
  `send_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(46) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1:sms,2:call',
  `number_list_id` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '0:just inputed,1:in queue,2:processing,3:done,4:done-error,5:delay',
  `message` varchar(500) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `current` int(11) DEFAULT '0',
  `success` int(11) DEFAULT '0',
  `error` int(11) DEFAULT '0',
  `request_by` int(11) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `next_try_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`send_queue_id`),
  KEY `fk_sq_number_list_id_idx` (`number_list_id`),
  CONSTRAINT `fk_sq_number_list_id` FOREIGN KEY (`number_list_id`) REFERENCES `number_lists` (`number_list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_queues`
--

LOCK TABLES `send_queues` WRITE;
/*!40000 ALTER TABLE `send_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_queues` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 19:49:02
