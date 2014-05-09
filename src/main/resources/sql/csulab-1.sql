-- MySQL dump 10.13  Distrib 5.1.60, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: csulab
-- ------------------------------------------------------
-- Server version	5.1.60-log

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
-- Table structure for table `autologin`
--

DROP TABLE IF EXISTS `autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autologin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESSIONID` char(50) DEFAULT NULL,
  `USERNO` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autologin`
--

LOCK TABLES `autologin` WRITE;
/*!40000 ALTER TABLE `autologin` DISABLE KEYS */;
/*!40000 ALTER TABLE `autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_num` char(10) DEFAULT NULL,
  `class_grade` int(10) DEFAULT NULL,
  `class_state` int(5) DEFAULT NULL,
  `major_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `major_id` (`major_id`),
  KEY `class_num` (`class_num`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'0901',11,11,1),(2,'0902',NULL,1,1),(3,'0903',NULL,1,1),(4,'0904',NULL,1,1),(5,'0905',NULL,1,1),(6,'1001',NULL,1,1),(7,'1002',NULL,1,1),(8,'1003',NULL,1,1),(10,'1004',0,0,1),(11,'1101',NULL,1,1),(12,'1102',NULL,1,1),(13,'1103',NULL,1,1),(14,'1104',NULL,1,1),(15,'1105',NULL,1,1),(16,'0900',NULL,1,1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `college_num` int(15) unsigned DEFAULT NULL,
  `college_name` char(20) NOT NULL,
  `college_state` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_name` (`college_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,11231,'信息科学与工程学院',0),(2,2,'航空航天学院',0);
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dev_num` char(10) DEFAULT NULL,
  `dev_name` char(10) DEFAULT NULL,
  `dev_version` char(10) DEFAULT NULL,
  `dev_function` char(200) DEFAULT NULL,
  `dev_price` int(10) DEFAULT NULL,
  `dev_count` int(10) DEFAULT NULL,
  `dev_manufacturers
manufacturers
dev_manufacturers` char(10) DEFAULT NULL,
  `labroom_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `labroom_id` (`labroom_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_course`
--

DROP TABLE IF EXISTS `exp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_course` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `exp_name` char(20) DEFAULT NULL,
  `exp_course_name` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_name` (`exp_name`),
  KEY `exp_course_name` (`exp_course_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_course`
--

LOCK TABLES `exp_course` WRITE;
/*!40000 ALTER TABLE `exp_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_course_toptitle`
--

DROP TABLE IF EXISTS `exp_course_toptitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_course_toptitle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exp_course_name` char(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_course_name` (`exp_course_name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_course_toptitle`
--

LOCK TABLES `exp_course_toptitle` WRITE;
/*!40000 ALTER TABLE `exp_course_toptitle` DISABLE KEYS */;
INSERT INTO `exp_course_toptitle` VALUES (3,'PLC控制技术与应用'),(1,'化工仪表与控制'),(16,'毕业设计'),(12,'测控与技术总线设计'),(13,'测控系统课程设计'),(7,'测量与控制总线技术'),(11,'测量与控制系统课程设计'),(6,'现代测控系统'),(8,'网络化控制技术'),(15,'自动化工程训练'),(14,'虚拟仪器课程设计'),(5,'计算机控制系统'),(2,'过程控制仪表'),(9,'过程控制仪表课程设计'),(4,'过程控制系统');
/*!40000 ALTER TABLE `exp_course_toptitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_obj`
--

DROP TABLE IF EXISTS `exp_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_obj` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exp_level` int(10) DEFAULT NULL,
  `exp_range` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_range` (`exp_range`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_obj`
--

LOCK TABLES `exp_obj` WRITE;
/*!40000 ALTER TABLE `exp_obj` DISABLE KEYS */;
INSERT INTO `exp_obj` VALUES (1,1,'大一'),(2,2,'大二'),(3,3,'大三'),(4,4,'大四'),(5,5,'研一'),(6,6,'研二'),(7,7,'研三'),(8,8,'博士'),(9,9,'本科生'),(10,10,'研究生'),(11,11,'博士生'),(12,12,'本科生,研究生'),(13,13,'研究生,博士生'),(14,14,'本科生,研究生,博士生');
/*!40000 ALTER TABLE `exp_obj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ralationship`
--

DROP TABLE IF EXISTS `exp_ralationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_ralationship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `college_name` char(20) DEFAULT NULL,
  `major_name` char(20) DEFAULT NULL,
  `labroom_name` char(20) DEFAULT NULL,
  `experiment_name` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_name` (`college_name`),
  KEY `major_name` (`major_name`),
  KEY `labroom_name` (`labroom_name`),
  KEY `experiment_name` (`experiment_name`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ralationship`
--

LOCK TABLES `exp_ralationship` WRITE;
/*!40000 ALTER TABLE `exp_ralationship` DISABLE KEYS */;
INSERT INTO `exp_ralationship` VALUES (1,NULL,NULL,'网络化控制系统实验室','超声波液位检测仪表'),(2,NULL,NULL,'网络化控制系统实验室','压力检测与变送'),(3,NULL,NULL,'网络化控制系统实验室','涡轮流量传感器测试'),(4,NULL,NULL,'网络化控制系统实验室','温度检测与变送'),(5,NULL,NULL,'网络化控制系统实验室','电动执行器'),(6,NULL,NULL,'网络化控制系统实验室','变频控制器'),(7,NULL,NULL,'网络化控制系统实验室','液位控制'),(8,NULL,NULL,'网络化控制系统实验室','管道压力控制'),(9,NULL,NULL,'网络化控制系统实验室','流量控制'),(10,NULL,NULL,'网络化控制系统实验室','温度控制'),(11,NULL,NULL,'网络化控制系统实验室','PLC系列可编程逻辑控制器'),(12,NULL,NULL,'网络化控制系统实验室','智能仪表控制的单回路液位、压力、流量、温度控制系统构建与投运'),(13,NULL,NULL,'网络化控制系统实验室','过程参数对过程动态特性的影响'),(14,NULL,NULL,'网络化控制系统实验室','控制系统的投运及参数整定'),(15,NULL,NULL,'网络化控制系统实验室','串级控制系统'),(16,NULL,NULL,'网络化控制系统实验室','比值控制系统'),(17,NULL,NULL,'网络化控制系统实验室','选择控制系统构建与投运的仿真'),(18,NULL,NULL,'网络化控制系统实验室','分程控制系统构建与投运的仿真'),(19,NULL,NULL,'网络化控制系统实验室','均匀控制系统构建与投运的仿真'),(20,NULL,NULL,'网络化控制系统实验室','前馈-反馈控制系统'),(21,NULL,NULL,'网络化控制系统实验室','阶跃响应法参数辨识实验'),(22,NULL,NULL,'网络化控制系统实验室','数字PID控制实验'),(23,NULL,NULL,'网络化控制系统实验室','模糊PID控制实验'),(24,NULL,NULL,'网络化控制系统实验室','控制周期调整实验'),(25,NULL,NULL,'网络化控制系统实验室','PLC液位、压力、流量、温度控制系统实验'),(26,NULL,NULL,'网络化控制系统实验室','计算机测量与工业控制实验');
/*!40000 ALTER TABLE `exp_ralationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment`
--

DROP TABLE IF EXISTS `experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `experiment_num` char(10) DEFAULT NULL,
  `experiment_name` varchar(40) NOT NULL,
  `experiment_time` int(11) DEFAULT NULL,
  `experiment_type` char(10) DEFAULT NULL,
  `experiment_require` char(10) DEFAULT NULL,
  `experiment_grounp` char(10) DEFAULT NULL,
  `experiment_grounp_now` char(10) DEFAULT NULL,
  `experiment_obj` char(30) DEFAULT NULL,
  `experiment_remark` char(50) DEFAULT NULL,
  `experiment_state` int(5) DEFAULT NULL,
  `totalStuNum` int(15) DEFAULT NULL,
  `labroom_name` char(20) DEFAULT NULL,
  `exp_course_name` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experiment_name` (`experiment_name`),
  KEY `experiment_obj` (`experiment_obj`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment`
--

LOCK TABLES `experiment` WRITE;
/*!40000 ALTER TABLE `experiment` DISABLE KEYS */;
INSERT INTO `experiment` VALUES (1,NULL,'超声波液位检测仪表',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(2,NULL,'压力检测与变送',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(3,NULL,'涡轮流量传感器测试',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(4,NULL,'温度检测与变送',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(5,NULL,'电动执行器',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(6,NULL,'变频控制器',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(7,NULL,'液位控制',2,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(8,NULL,'管道压力控制',4,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(9,NULL,'流量控制',4,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(10,NULL,'温度控制',4,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(11,NULL,'PLC系列可编程逻辑控制器',4,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(12,NULL,'智能仪表控制的单回路液位、压力、流量、温度控制系统构建与投运',4,'验证设计',NULL,NULL,NULL,'本科生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(14,NULL,'过程参数对过程动态特性的影响',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(16,NULL,'控制系统的投运及参数整定',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(17,NULL,'串级控制系统',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(18,NULL,'比值控制系统',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(19,NULL,'选择控制系统构建与投运的仿真',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(20,NULL,'分程控制系统构建与投运的仿真',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(21,NULL,'均匀控制系统构建与投运的仿真',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(22,NULL,'前馈-反馈控制系统',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(23,NULL,'阶跃响应法参数辨识实验',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(24,NULL,'数字PID控制实验',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(25,NULL,'模糊PID控制实验',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(26,NULL,'控制周期调整实验',4,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(27,NULL,'PLC液位、压力、流量、温度控制系统实验',8,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL),(28,NULL,'计算机测量与工业控制实验',8,'设计综合',NULL,NULL,NULL,'本科生,研究生,博士生',NULL,NULL,NULL,'网络控制系统实验室',NULL);
/*!40000 ALTER TABLE `experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jys`
--

DROP TABLE IF EXISTS `jys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jys_num` char(10) DEFAULT NULL,
  `jys_name` char(20) NOT NULL,
  `major_id` int(10) unsigned DEFAULT NULL,
  `college_id` int(20) unsigned DEFAULT NULL,
  `jys_state` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major_id` (`major_id`),
  KEY `college_id` (`college_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jys`
--

LOCK TABLES `jys` WRITE;
/*!40000 ALTER TABLE `jys` DISABLE KEYS */;
/*!40000 ALTER TABLE `jys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengbiao_fenbiao`
--

DROP TABLE IF EXISTS `kechengbiao_fenbiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengbiao_fenbiao` (
  `id` int(40) unsigned NOT NULL AUTO_INCREMENT,
  `startDate` varchar(30) DEFAULT NULL,
  `endDate` varchar(30) DEFAULT NULL,
  `xingqiji` int(20) DEFAULT NULL,
  `experiment_name` char(50) DEFAULT NULL,
  `teacher_name` char(30) DEFAULT NULL,
  `dijijie` int(11) DEFAULT NULL,
  `kechengbiao_name` varchar(40) DEFAULT NULL,
  `weekpage` int(30) DEFAULT NULL,
  `labroom` char(30) DEFAULT NULL,
  `curentDate` date DEFAULT NULL,
  `totalStuNum` int(10) DEFAULT NULL,
  `curentStuNum` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `experiment_name` (`experiment_name`),
  KEY `teacher_name` (`teacher_name`),
  KEY `kechengbiao_name` (`kechengbiao_name`),
  KEY `labroom` (`labroom`)
) ENGINE=MyISAM AUTO_INCREMENT=1386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengbiao_fenbiao`
--

LOCK TABLES `kechengbiao_fenbiao` WRITE;
/*!40000 ALTER TABLE `kechengbiao_fenbiao` DISABLE KEYS */;
INSERT INTO `kechengbiao_fenbiao` VALUES (1282,'2012-09-03','2012-09-14',1,'流量控制','牛五',1,'2',1,'网络化控制系统实验室','2012-09-03',30,12),(1283,'2012-09-03','2012-09-14',5,'温度控制','崔永元',2,'2',1,'网络化控制系统实验室','2012-09-07',30,0),(1284,'2012-09-03','2012-09-14',1,'变频控制器','肖凡',5,'2',1,'网络化控制系统实验室','2012-09-03',30,1),(1285,'2012-09-03','2012-09-14',2,'电动执行器','李维',5,'2',1,'网络化控制系统实验室','2012-09-04',30,1),(1286,'2012-09-03','2012-09-14',3,'管道压力控制','张森',5,'2',1,'网络化控制系统实验室','2012-09-05',30,0),(1287,'2012-09-03','2012-09-14',3,'液位控制','张靠靠',6,'2',2,'网络化控制系统实验室','2012-09-12',30,1),(1306,'2012-08-27','2012-08-31',4,'变频控制器','张艾嘉',1,'3',1,'网络化控制系统实验室','2012-08-28',30,0),(1307,'2012-08-27','2012-08-31',1,'液位控制','李维嘉',3,'3',1,'网络化控制系统实验室','2012-08-27',30,0),(1309,'2012-08-27','2012-08-31',1,'电动执行器','何培培',4,'3',1,'网络化控制系统实验室','2012-08-27',30,0),(1311,'2012-08-27','2012-08-31',4,'压力检测与变送','王小五',5,'3',1,'网络化控制系统实验室','2012-08-30',30,5),(1312,'2012-08-27','2012-08-31',5,'温度检测与变送','吴三桂',5,'3',1,'网络化控制系统实验室','2012-08-31',30,0),(1313,'2012-08-27','2012-08-31',1,'流量控制','邹一百',6,'3',1,'网络化控制系统实验室','2012-08-27',30,0),(1314,'2012-08-27','2012-08-31',4,'管道压力控制','杨之力',6,'3',1,'网络化控制系统实验室','2012-08-30',30,1),(1323,'2012-09-18','2012-09-27',4,'温度检测与变送','李维嘉',1,'4',1,'网络化控制系统实验室','2012-09-20',NULL,0),(1324,'2012-09-18','2012-09-27',5,'变频控制器','高晓松',1,'4',1,'网络化控制系统实验室','2012-09-21',NULL,0),(1325,'2012-09-18','2012-09-27',4,'液位控制','钱物流',4,'4',1,'网络化控制系统实验室','2012-09-20',NULL,0),(1326,'2012-09-18','2012-09-27',2,'流量控制','牛五',5,'4',1,'网络化控制系统实验室','2012-09-18',NULL,0),(1327,'2012-09-18','2012-09-27',2,'涡轮流量传感器测试','张靠靠',1,'4',2,'网络化控制系统实验室','2012-09-25',NULL,0),(1328,'2012-09-18','2012-09-27',3,'压力检测与变送','彭松',4,'4',2,'网络化控制系统实验室','2012-09-26',NULL,0),(1329,'2012-09-18','2012-09-27',1,'超声波液位检测仪表','牛五',5,'4',2,'网络化控制系统实验室','2012-09-24',NULL,0),(1330,'2012-09-18','2012-09-27',2,'管道压力控制','戴新城',5,'4',2,'网络化控制系统实验室','2012-09-25',NULL,0),(1331,'2012-08-01','2012-08-07',5,'压力检测与变送','赵校方',3,'1',1,'网络化控制系统实验室','2012-08-03',NULL,0),(1332,'2012-08-01','2012-08-07',3,'超声波液位检测仪表','钱物流',4,'1',1,'网络化控制系统实验室','2012-08-01',NULL,0),(1333,'2012-08-01','2012-08-07',4,'涡轮流量传感器测试','李维嘉',4,'1',1,'网络化控制系统实验室','2012-08-02',NULL,0),(1334,'2012-08-01','2012-08-07',5,'温度检测与变送','宁浩',6,'1',1,'网络化控制系统实验室','2012-08-03',NULL,0),(1335,'2012-08-01','2012-08-07',2,'液位控制','何培培',2,'1',2,'网络化控制系统实验室','2012-08-07',NULL,0),(1336,'2012-08-01','2012-08-07',2,'电动执行器','邹一百',3,'1',2,'网络化控制系统实验室','2012-08-07',NULL,0),(1337,'2012-08-01','2012-08-07',1,'变频控制器','崔永元',6,'1',2,'网络化控制系统实验室','2012-08-06',NULL,0),(1362,'2012-11-23','2012-12-07',3,'前馈-反馈控制系统钱物流',NULL,2,'2012-11-21',1,'网络化控制系统实验室','2012-11-21',NULL,0),(1363,'2012-11-23','2012-12-07',3,'压力检测与变送李维嘉',NULL,5,'2012-11-21',1,'网络化控制系统实验室','2012-11-21',NULL,0),(1364,'2012-11-23','2012-12-07',1,'过程参数对过程动态特性的影响','牛丽丽',1,'2012-11-21',2,'网络化控制系统实验室','2012-11-26',NULL,0),(1365,'2012-11-23','2012-12-07',2,'均匀控制系统构建与投运的仿真','崔永元',1,'2012-11-21',2,'网络化控制系统实验室','2012-11-27',NULL,0),(1366,'2012-11-23','2012-12-07',3,'串级控制系统','张艾嘉',1,'2012-11-21',2,'网络化控制系统实验室','2012-11-28',NULL,0),(1367,'2012-11-23','2012-12-07',4,'选择控制系统构建与投运的仿真','牛丽丽',1,'2012-11-21',2,'网络化控制系统实验室','2012-11-29',NULL,0),(1368,'2012-11-23','2012-12-07',5,'比值控制系统','杨之力',1,'2012-11-21',2,'网络化控制系统实验室','2012-11-30',NULL,0),(1369,'2012-11-23','2012-12-07',1,'电动执行器','张艾嘉',2,'2012-11-21',2,'网络化控制系统实验室','2012-11-26',NULL,0),(1370,'2012-11-23','2012-12-07',2,'控制系统的投运及参数整定','李双江',2,'2012-11-21',2,'网络化控制系统实验室','2012-11-27',NULL,0),(1371,'2012-11-23','2012-12-07',3,'模糊PID控制实验','高晓松',2,'2012-11-21',2,'网络化控制系统实验室','2012-11-28',NULL,0),(1372,'2012-11-23','2012-12-07',5,'流量控制','邹一百',2,'2012-11-21',2,'网络化控制系统实验室','2012-11-30',NULL,0),(1373,'2012-11-23','2012-12-07',3,'数字PID控制实验','何培培',3,'2012-11-21',2,'网络化控制系统实验室','2012-11-28',NULL,0),(1374,'2012-11-23','2012-12-07',1,'液位控制','邹一百',4,'2012-11-21',2,'网络化控制系统实验室','2012-11-26',NULL,0),(1375,'2012-11-23','2012-12-07',4,'阶跃响应法参数辨识实验','王小五',4,'2012-11-21',2,'网络化控制系统实验室','2012-11-29',NULL,0),(1376,'2012-11-23','2012-12-07',5,'分程控制系统构建与投运的仿真','崔永元',4,'2012-11-21',2,'网络化控制系统实验室','2012-11-30',NULL,0),(1377,'2012-11-23','2012-12-07',3,'变频控制器','何培培',5,'2012-11-21',2,'网络化控制系统实验室','2012-11-28',NULL,0),(1378,'2012-11-23','2012-12-07',2,'温度控制','钱物流',6,'2012-11-21',2,'网络化控制系统实验室','2012-11-27',NULL,0),(1379,'2012-11-23','2012-12-07',4,'管道压力控制','牛丽丽',6,'2012-11-21',2,'网络化控制系统实验室','2012-11-29',NULL,0),(1380,'2012-11-23','2012-12-07',1,'控制周期调整实验','宁浩',1,'2012-11-21',3,'网络化控制系统实验室','2012-12-03',NULL,0),(1381,'2012-11-23','2012-12-07',3,'PLC系列可编程逻辑控制器','何培培',1,'2012-11-21',3,'网络化控制系统实验室','2012-12-05',NULL,0),(1382,'2012-11-23','2012-12-07',5,'涡轮流量传感器测试','李双江',1,'2012-11-21',3,'网络化控制系统实验室','2012-12-07',NULL,0),(1383,'2012-11-23','2012-12-07',3,'智能仪表控制的单回路液位、压力、流量、温度控制系统构建与投运','崔永元',2,'2012-11-21',3,'网络化控制系统实验室','2012-12-05',NULL,0),(1384,'2012-11-23','2012-12-07',1,'温度检测与变送','赵校方',3,'2012-11-21',3,'网络化控制系统实验室','2012-12-03',NULL,0),(1385,'2012-11-23','2012-12-07',1,'PLC液位、压力、流量、温度控制系统实验','李维嘉',4,'2012-11-21',3,'网络化控制系统实验室','2012-12-03',NULL,0);
/*!40000 ALTER TABLE `kechengbiao_fenbiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengbiao_total`
--

DROP TABLE IF EXISTS `kechengbiao_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengbiao_total` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `kechengbiao_name` varchar(40) NOT NULL,
  `kechengbiao_createTime` char(20) NOT NULL,
  `labroom` char(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kechengbiao_name` (`kechengbiao_name`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengbiao_total`
--

LOCK TABLES `kechengbiao_total` WRITE;
/*!40000 ALTER TABLE `kechengbiao_total` DISABLE KEYS */;
INSERT INTO `kechengbiao_total` VALUES (40,'1','2012-08-27 16:21:49','网络化控制系统实验室'),(41,'2','2012-08-27 16:29:49','网络化控制系统实验室'),(42,'3','2012-08-30 01:27:34','网络化控制系统实验室'),(43,'4','2012-09-02 00:30:51','网络化控制系统实验室'),(44,'2012-11-21','2012-11-22 17:02:08','网络化控制系统实验室');
/*!40000 ALTER TABLE `kechengbiao_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labroom`
--

DROP TABLE IF EXISTS `labroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labroom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `labroom_num` char(10) DEFAULT NULL,
  `labroom_name` char(10) DEFAULT NULL,
  `major_name` char(15) DEFAULT NULL,
  `college_name` char(15) DEFAULT NULL,
  `labroom_state` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major_name` (`major_name`),
  KEY `college_name` (`college_name`),
  KEY `labroom_name` (`labroom_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labroom`
--

LOCK TABLES `labroom` WRITE;
/*!40000 ALTER TABLE `labroom` DISABLE KEYS */;
INSERT INTO `labroom` VALUES (1,NULL,'网络化控制系统实验室',NULL,NULL,NULL),(2,NULL,'嵌入式系统实验室',NULL,NULL,NULL),(3,NULL,'自动控制原理实验室',NULL,NULL,NULL);
/*!40000 ALTER TABLE `labroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `major_num` int(15) unsigned DEFAULT NULL,
  `major_name` char(25) NOT NULL,
  `college_name` char(15) NOT NULL,
  `major_state` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_name` (`college_name`),
  KEY `major_name` (`major_name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,1,'通信工程','信息科学与工程学院',0),(2,2,'电子信息工程','信息科学与工程学院',NULL),(3,3,'计算机科学与技术','信息科学与工程学院',0),(4,4,'电气工程','信息科学与工程学院',NULL),(5,5,'自动化','信息科学与工程学院',0),(6,6,'控制理论与控制工程','信息科学与工程学院',0),(7,7,'信息安全','信息科学与工程学院',NULL),(8,8,'航空飞行11','航空航天学院',1),(12,9,'1','航空航天学院',0);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_title` char(50) DEFAULT NULL,
  `message_cont` varchar(250) DEFAULT NULL,
  `message_date` datetime NOT NULL,
  `message_from` char(10) NOT NULL,
  `message_to` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_no` char(40) DEFAULT NULL,
  `news_cat` int(20) DEFAULT NULL,
  `news_state` int(5) DEFAULT NULL,
  `news_title` varchar(100) DEFAULT NULL,
  `news_date` datetime DEFAULT NULL,
  `new_cont` varchar(200) DEFAULT NULL,
  `teacher_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,NULL,1,1,'澳洲Macquarie大学王岩副教授应邀来信息学院讲学','2012-10-08 00:47:55','/root/src/DOCFILE/1/澳洲Macquarie大学王岩副教授应邀来信息学院讲学.txt','李维'),(2,NULL,1,1,'我校SSCI和A&HCI数据库正式开通','2012-10-27 22:48:14','/root/src/DOCFILE/1/我校SSCI和A&HCI数据库正式开通.txt','李维'),(3,NULL,1,1,'加拿大维多利亚大学潘建平副教授来我院讲学','2012-10-31 05:10:42','/root/src/DOCFILE/1/加拿大维多利亚大学潘建平副教授来我院讲学.txt','李维'),(4,NULL,1,1,'第八届全国高等学校计算机课件评比大会成功召开','2012-10-31 05:23:48','/root/src/DOCFILE/1/第八届全国高等学校计算机课件评比大会成功召开.txt','李维'),(5,NULL,1,1,'信息学院顺利召开铁道校区全体学生干部会议','2012-10-31 05:24:45','/root/src/DOCFILE/1/信息学院顺利召开铁道校区全体学生干部会议.txt','李维'),(6,NULL,1,1,'信息学院邀请湖南省消防协会成功举办消防安全知识讲座','2012-10-31 05:25:13','/root/src/DOCFILE/1/信息学院邀请湖南省消防协会成功举办消防安全知识讲座.txt','李维'),(7,NULL,1,1,'中国电波传播研究所张明高院士应邀来信息学院讲学 ','2012-10-31 05:25:33','/root/src/DOCFILE/1/中国电波传播研究所张明高院士应邀来信息学院讲学 .txt','李维'),(8,NULL,1,1,'日本会津大学程子学教授、华中科技大学杨天若教授应邀来我院讲学','2012-10-31 05:26:05','/root/src/DOCFILE/1/日本会津大学程子学教授、华中科技大学杨天若教授应邀来我院讲学.txt','李维'),(9,NULL,1,1,'中国科学网、中国科学报报道：我国研制出新一代云计算操作系统','2012-10-31 05:27:07','/root/src/DOCFILE/1/中国科学网、中国科学报报道：我国研制出新一代云计算操作系统.txt','李维'),(10,NULL,2,1,'通知一','2012-10-31 05:51:46','/root/src/DOCFILE/2/通知一.txt','李维'),(11,NULL,2,1,'通知二','2012-10-31 05:52:43','/root/src/DOCFILE/2/通知二.txt','李维'),(12,NULL,1,1,'通知三','2012-10-31 05:53:02','/root/src/DOCFILE/1/通知三.txt','李维'),(13,NULL,2,1,'通知四','2012-10-31 05:53:22','/root/src/DOCFILE/2/通知四.txt','李维'),(14,NULL,2,1,'通知五','2012-10-31 05:53:46','/root/src/DOCFILE/2/通知五.txt','李维'),(15,NULL,2,1,'通知六','2012-10-31 05:54:02','/root/src/DOCFILE/2/通知六.txt','李维'),(16,NULL,1,1,'通知七','2012-10-31 05:54:18','/root/src/DOCFILE/1/通知七.txt','李维'),(17,NULL,2,1,'ugujgvugviuvg','2012-10-31 22:15:45','/root/src/DOCFILE/2/ugujgvugviuvg.txt','李维'),(18,NULL,1,1,'中国第二款隐形战机歼-31今日首飞成功','2012-10-31 22:35:33','/root/src/DOCFILE/1/中国第二款隐形战机歼-31今日首飞成功.txt','李维');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online`
--

DROP TABLE IF EXISTS `online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` char(10) NOT NULL,
  `online_date` datetime NOT NULL,
  `online_ip` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online`
--

LOCK TABLES `online` WRITE;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
/*!40000 ALTER TABLE `online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stu_id` int(10) unsigned NOT NULL,
  `experiment_id` int(10) unsigned NOT NULL,
  `experiment_part1` int(10) DEFAULT NULL,
  `experimnet_part2` int(10) DEFAULT NULL,
  `experiment_part3` int(10) DEFAULT NULL,
  `experiment_part4` int(10) DEFAULT NULL,
  `experiment_total` int(10) DEFAULT NULL,
  `teacher_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experiment_id` (`experiment_id`),
  KEY `stu_id` (`stu_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu`
--

DROP TABLE IF EXISTS `stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stu_num` char(10) NOT NULL,
  `stu_name` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `stu_sex` char(2) DEFAULT NULL,
  `class_id` int(10) DEFAULT NULL,
  `major_name` char(20) DEFAULT NULL,
  `college_name` char(20) DEFAULT NULL,
  `stu_state` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major_name` (`major_name`),
  KEY `college_name` (`college_name`),
  KEY `stu_num` (`stu_num`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu`
--

LOCK TABLES `stu` WRITE;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
INSERT INTO `stu` VALUES (1,'0909090417','廖金铭','123456','男',1,'通信工程','信息科学与工程学院',NULL),(2,'0909090620','杨明','123456','男',1,'通信工程','信息科学与工程学院',NULL),(4,'0909090101','张一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(5,'0909090102','张二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(6,'0909090103','张三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(7,'0909090104','张四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(8,'0909090105','张五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(9,'0909090106','张六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(10,'0909090107','张七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(11,'0909090108','张八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(12,'0909090109','张九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(13,'0909090110','张十','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(14,'0909090111','张十一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(15,'0909090112','张十二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(16,'0909090113','张十三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(17,'0909090114','张十四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(18,'0909090115','张十五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(19,'0909090116','张十六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(20,'0909090117','张十七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(21,'0909090118','张十八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(22,'0909090119','张十九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(23,'0909090120','张二十','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(24,'0909090121','张二十一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(25,'0909090122','张二十二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(26,'0909090123','张二十三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(27,'0909090124','张二十四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(28,'0909090125','张二十五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(29,'0909090126','张二十六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(30,'0909090127','张二十七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(31,'0909090128','张二十八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(32,'0909090129','张二十九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(33,'0909090130','张三十','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(34,'0909090201','张一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(35,'0909090202','张二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(36,'0909090203','张三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(37,'0909090204','张四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(38,'0909090205','张五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(39,'0909090206','张六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(40,'0909090207','张七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(41,'0909090208','张八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(42,'0909090209','张九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(43,'0909090210','张十','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(44,'0909090211','张十一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(45,'0909090212','张十二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(46,'0909090213','张十三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(47,'0909090214','张十四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(48,'0909090215','张十五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(49,'0909090216','张十五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(50,'0909090217','张十六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(51,'0909090218','张十七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(52,'0909090219','张十八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(53,'0909090220','张十九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(54,'0909090221','张二十','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(55,'0909090222','张二十一','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(56,'0909090223','张二十二','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(57,'0909090224','张二十三','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(58,'0909090225','张二十四','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(59,'0909090226','张二十五','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(60,'0909090227','张二十六','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(61,'0909090228','张二十七','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(62,'0909090229','张二十八','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(63,'0909090230','张二十九','123456','男',NULL,'通信工程','信息科学与工程学院',NULL),(66,'0909090302','李二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(67,'0909090303','李三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(68,'0909090304','李四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(69,'0909090305','李五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(70,'0909090306','李六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(71,'0909090307','李七','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(72,'0909090308','李八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(73,'0909090309','李九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(74,'0909090310','李十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(75,'0909090311','李十一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(76,'0909090312','李十二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(77,'0909090313','李十三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(78,'0909090314','李十四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(79,'0909090315','李十五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(80,'0909090316','李十六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(81,'0909090317','李十七','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(82,'0909090318','李十八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(83,'0909090319','李十九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(84,'0909090320','李二十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(85,'0909090321','李二十一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(86,'0909090322','李二十二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(87,'0909090323','李二十三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(88,'0909090324','李二十四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(89,'0909090325','李二十五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(90,'0909090326','李二十六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(91,'0909090327','李二十七','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(92,'0909090328','李二十八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(93,'0909090329','李二十九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(94,'0909090330','李三十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(95,'0909090301','李一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(96,'0909090402','李二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(97,'0909090403','李三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(98,'0909090404','李四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(99,'0909090405','李五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(100,'0909090406','李六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(101,'0909090407','李七','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(102,'0909090408','李八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(103,'0909090409','李九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(104,'0909090410','李十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(105,'0909090411','李十一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(106,'0909090412','李十二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(107,'0909090413','李十三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(108,'0909090414','李十四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(109,'0909090415','李十五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(110,'0909090416','李十六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(112,'0909090418','李十八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(113,'0909090419','李十九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(114,'0909090420','李二十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(115,'0909090421','李二十一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(116,'0909090422','李二十二','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(117,'0909090423','李二十三','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(118,'0909090424','李二十四','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(119,'0909090425','李二十五','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(120,'0909090426','李二十六','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(121,'0909090427','李二十七','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(122,'0909090428','李二十八','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(123,'0909090429','李二十九','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(124,'0909090430','李三十','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(125,'0909090401','李一','123456','男',NULL,'计算机科学与技术','信息科学与工程学院',NULL),(126,'0909090501','王一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(127,'0909090502','王二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(128,'0909090503','王三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(129,'0909090504','王四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(130,'0909090505','王五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(131,'0909090506','王六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(132,'0909090507','王七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(133,'0909090508','王八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(134,'0909090509','王九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(135,'0909090510','王十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(136,'0909090511','王十一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(137,'0909090512','王十二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(138,'0909090513','王十三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(139,'0909090514','王十四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(140,'0909090515','王十五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(141,'0909090516','王十六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(142,'0909090517','王十七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(143,'0909090518','王十八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(144,'0909090519','王十九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(145,'0909090520','王二十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(146,'0909090521','王二十一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(147,'0909090522','王二十二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(148,'0909090523','王二十三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(149,'0909090524','王二十四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(150,'0909090525','王二十五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(151,'0909090526','王二十六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(152,'0909090527','王二十七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(153,'0909090528','王二十八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(154,'0909090529','王二十九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(155,'0909090530','王三十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(156,'0909090701','周一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(157,'0909090702','周二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(158,'0909090703','周三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(159,'0909090704','周四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(160,'0909090705','周五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(161,'0909090706','周六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(162,'0909090707','周七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(163,'0909090708','周八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(164,'0909090709','周九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(165,'0909090710','周十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(166,'0909090711','周十一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(167,'0909090712','周十二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(168,'0909090713','周十三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(169,'0909090714','周十四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(170,'0909090715','周十五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(171,'0909090716','周十六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(172,'0909090717','周十七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(173,'0909090718','周十八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(174,'0909090719','周十九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(175,'0909090720','周二十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(176,'0909090721','周二十一','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(177,'0909090722','周二十二','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(178,'0909090723','周二十三','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(179,'0909090724','周二十四','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(180,'0909090725','周二十五','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(181,'0909090726','周二十六','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(182,'0909090727','周二十七','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(183,'0909090728','周二十八','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(184,'0909090729','周二十九','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(185,'0909090730','周三十','123456','男',NULL,'电子信息工程','信息科学与工程学院',NULL),(186,'1','1',NULL,'1',1,NULL,NULL,1);
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_order`
--

DROP TABLE IF EXISTS `stu_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stu_num` char(30) NOT NULL,
  `kb_id` int(11) NOT NULL,
  `QD_state` int(2) DEFAULT '0',
  `QD_time` char(20) DEFAULT '',
  `score1` int(4) DEFAULT '0',
  `score2` int(4) DEFAULT '0',
  `score3` int(4) DEFAULT '0',
  `scoreTotal` int(4) DEFAULT '0',
  `dcj_state` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_order`
--

LOCK TABLES `stu_order` WRITE;
/*!40000 ALTER TABLE `stu_order` DISABLE KEYS */;
INSERT INTO `stu_order` VALUES (10,'0909090417',1282,1,'0:35:39',32,32,23,32,0),(12,'0909090417',1284,NULL,'',NULL,NULL,NULL,NULL,0),(13,'0909090417',1287,NULL,'',NULL,NULL,NULL,NULL,0),(14,'0909090417',1285,NULL,'',94,96,96,95,1),(15,'0909090417',1311,1,'20:47:15',NULL,NULL,NULL,NULL,0),(16,'0909090101',1311,1,'20:41:33',NULL,NULL,NULL,NULL,0),(17,'0909090102',1311,1,'20:41:50',NULL,NULL,NULL,NULL,0),(18,'0909090103',1311,1,'20:47:58',NULL,NULL,NULL,NULL,0),(19,'0909090417',1314,0,'',NULL,NULL,NULL,NULL,0),(20,'0909090417',1311,1,'20:47:15',NULL,NULL,NULL,NULL,0),(21,'0909090418',1285,0,'',100,100,100,100,1),(22,'0909090419',1285,0,'',100,100,100,100,1);
/*!40000 ALTER TABLE `stu_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_file`
--

DROP TABLE IF EXISTS `tb_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_file` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `file_savename` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` varchar(10) DEFAULT NULL,
  `file_fileinfo` varchar(400) DEFAULT NULL,
  `file_uptime` datetime DEFAULT NULL,
  `file_lab` varchar(50) DEFAULT NULL,
  `file_exp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_file`
--

LOCK TABLES `tb_file` WRITE;
/*!40000 ALTER TABLE `tb_file` DISABLE KEYS */;
INSERT INTO `tb_file` VALUES (1,'08302012234755207.rar','Java鏁版嵁缁撴瀯鍜岀畻娉�锛堢浜岀増锛�part1.rar','application/x-rar-compressed','8.58  M','','2012-08-30 23:47:55','null','null');
/*!40000 ALTER TABLE `tb_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_num` char(20) NOT NULL,
  `teacher_name` char(15) NOT NULL,
  `password` char(15) NOT NULL,
  `teacher_sex` char(4) DEFAULT NULL,
  `teacher_degree` char(10) DEFAULT NULL,
  `teacher_titles` char(10) DEFAULT NULL,
  `teacher_institution` char(20) DEFAULT NULL,
  `college_name` char(20) DEFAULT NULL,
  `major_name` char(20) DEFAULT NULL,
  `teacher_state` int(5) DEFAULT NULL,
  `teacher_rage` int(5) DEFAULT NULL,
  `teacher_phone` char(20) DEFAULT NULL,
  `teacher_email` char(50) DEFAULT NULL,
  `teacher_introduction` char(200) DEFAULT NULL,
  `teacher_permisson` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_name` (`college_name`),
  KEY `teacher_num` (`teacher_num`),
  KEY `teacher_name` (`teacher_name`),
  KEY `teacher_ibfk_2` (`major_name`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'0909090620','肖凡','123456','男','硕士','讲师',NULL,'信息科学与工程学院','计算机科学与技术',0,1,'','enjoylast@gmail.com','','0'),(2,'001','李维','123456','1','1','1',NULL,'信息科学与工程学院','通信工程',0,1,'','','','1'),(5,'123654','张森','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,1,NULL,NULL,NULL,'1'),(6,'345646','牛五','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,1,NULL,NULL,NULL,'1'),(7,'397503','邹一百','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(8,'480398','钱物流','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(9,'475209','李维嘉','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(10,'827533','赵校方','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(11,'256246','宁浩','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(12,'745674','刘丽','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(13,'968364','谭于洋','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(14,'952562','陈御座','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(15,'313234','戴新城','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(16,'984282','赵新','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(17,'475875','李双江','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(18,'758750','崔永元','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(19,'085029','张艾嘉','123','男','硕士','讲师',NULL,'信息科学与工程学院','计算机科学与技术',0,NULL,'1','enjoylast@gmail.com','','1'),(20,'028202','高晓松','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(21,'608203','何培培','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(22,'802605','王小五','123456','','','','某某1研究所','信息科学与工程学院','通信工程',NULL,NULL,NULL,NULL,NULL,'1'),(23,'986829','何五就','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(24,'060294','张庆峰','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(25,'672852','彭松','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(26,'502938','李里','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(27,'748365','杨之力','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(28,'854736','张靠靠','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(29,'246847','牛丽丽','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(30,'946452','吴萌萌','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(31,'946843','张欣欣','123456','','','','某某1研究所','信息科学与工程学院','电子信息工程',NULL,NULL,NULL,NULL,NULL,'1'),(32,'946833','邓家家','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(33,'865365','邓聪聪','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(34,'066532','汪申二','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(35,'765356','李加成','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(36,'345353','王心理','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(37,'645735','张加以','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(38,'967345','范彬彬','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(39,'964224','吴三桂','123456','','','','某某1研究所','信息科学与工程学院','计算机科学与技术',NULL,NULL,NULL,NULL,NULL,'1'),(40,'136278','张三丰.无穷','123456',NULL,NULL,NULL,NULL,'信息科学与工程学院','控制理论与控制工程',NULL,NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_order`
--

DROP TABLE IF EXISTS `teacher_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `experiment_id` int(10) unsigned NOT NULL,
  `order_date` date NOT NULL,
  `order_part` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `experiment_id` (`experiment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_order`
--

LOCK TABLES `teacher_order` WRITE;
/*!40000 ALTER TABLE `teacher_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-26 15:08:46
