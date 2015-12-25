-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: ybbom
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'CHIPBOARD','ghdhdd'),(3,'CHIPBOARD','ghdhdd'),(4,'POLYFOAM','POLYFOAM'),(5,'POLYFOAM','ghdhsd'),(6,'POLYFOAM','f44'),(7,'SmartPhone','android'),(8,'Gsm mobile','asdgt'),(9,'bike dffdfd','dfghgfhfgh');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--
Create database ybbom;
use ybbom;

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Red'),(2,'Green'),(4,'Blue'),(5,'Black'),(6,'red');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerCode` varchar(45) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `RegCode` varchar(15) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `City` varchar(15) NOT NULL,
  `State` varchar(15) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `PhoneNo` varchar(25) NOT NULL,
  `Fax` varchar(25) NOT NULL,
  `ContPerson` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerinfo`
--

LOCK TABLES `customerinfo` WRITE;
/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` VALUES (1,'Red','Shobha','123','Patna','800020','Patna','Bihar','India','123456789','1234567','Shobha Singh'),(2,'1234','Singh','123','Patna','800001','Patna','Bihar','India','12356789','1234578','Shobha Singh'),(5,'dfghj','dfdgh','dzfg','dfsdgfh','dfsgh','dfsgh','dfsgh','dfgh','dfsgh','dsfgh','dfgh'),(6,'dfghj','dfdgh','dzfg','dfsdgfh','dfsgh','dfsgh','dfsgh','dfgh','dfsgh','dsfgh','dfgh'),(7,'65432','gafgf','sfg','sg','fgafg','fgdfg','fdgdfg','dfgdfg','dfgdfg','dfgfd','fdgfdg'),(8,'1234','ertyhj','fgh','adsfgh','arsdg','sfgh','dfghafgh','fgh','dsfgd','fsghfg','dffg'),(9,'123456','FGH','DFGHJ','DFG','DFGH','FARDSGH','ARDSG','FSDRGHX','RFHGJ','ERSTD','ERASGH'),(10,'rgdgfh','sdfg','waedsfg','asdfgh','waedfg','WQezrxt','wgwfrgh','fghe','rftghr','ghj','ertgh'),(11,'765432','ddfghnbm','cvxbn ','XZDcvbndszfgh','dfghn','sdfgbn','nbdfg','dfvnbdfg','dfgfg','hb','dfgn'),(12,'9786','ret','q2er','wear','wq3','wqer','d','ghm','vgm','f','h'),(13,'7656','reh','Fd','adf','z','dszfc','dzfv','fxvb','ffn','fg','dfg'),(14,'13256','fg','dfg','asdf','sf','sd','sd','s','as','sd','xdc'),(15,'34AS','AGH','@W','W','2','d','w','e','4444','44ss','weeed'),(16,'sdfghj','sdfg','dfgg','sadfg','234','wedfg','dfg','dfg','xdfg','xcv','dcfv'),(17,'4s','s3','23s','we','as23','was','a','a','as','a','aas'),(18,'ttr23','23','23WE','2we','24333','wert','wer','asd','2345','23','asdfg');
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorder` (
  `OrderNo` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `ProdCode` varchar(25) NOT NULL,
  `Color1` varchar(255) NOT NULL,
  `Color2` varchar(255) NOT NULL,
  `Color3` varchar(255) NOT NULL,
  `RegisterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RequireDate` varchar(40) NOT NULL,
  `Qty` int(20) NOT NULL,
  PRIMARY KEY (`OrderNo`),
  KEY `Qty_idx` (`Qty`),
  KEY `ProdCode_idx` (`ProdCode`),
  KEY `Color1_idx1` (`Color2`,`Color3`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (2,2,'p001','h','k','h','2015-12-21 12:46:25','Wed Dec 30 18:17:07 IST 2015',56),(3,1,'p002','k','k','h','2015-12-21 12:51:04','d MMM, yyyy',78),(4,2,'P003','Balck','Blue','yellow','2015-12-21 12:55:24','d MMM, yyyy',78),(5,2,'p003','h','j','k','2015-12-21 13:01:24','d MMM, yyyy',67),(6,5,'p003','h','j','k','2015-12-21 13:01:32','d MMM, yyyy',67);
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'shobha','shobha','',''),(2,'SH12','123','Shobha','Shobha'),(3,'pk','123','Prakash','Prakash'),(4,'Niki','niki','Niki','Niki'),(5,'Harsh','harsh','harsh','harsh'),(6,'12','123456789012345','sh','shobha');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProdCode` varchar(25) NOT NULL,
  `ItemCode` varchar(40) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Weight` float NOT NULL,
  `Specification` varchar(45) DEFAULT NULL,
  `Size` float NOT NULL,
  PRIMARY KEY (`ProdCode`),
  KEY `Category_idx` (`Category`),
  CONSTRAINT `Category` FOREIGN KEY (`Category`) REFERENCES `categories` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('23','44','CHIPBOARD',23,23,'we',23),('23WE','12SHHHH','CHIPBOARD',23,23,'wer',23),('abcd','12SHHHH','CHIPBOARD',4,23,'xddcfggh',23),('AD1','12SHHHH','CHIPBOARD',23,23,'we',12),('AD2','12SHHHH','CHIPBOARD',23,23,'sdg',23),('AS2','12SHHHH','CHIPBOARD',23,23,'werty',2),('asdf','12SHHHH','CHIPBOARD',4,2,'gf',34),('DD3','12SHHHH','CHIPBOARD',23,23,'ss',2),('e4','44','POLYFOAM',2,44,'sds',44),('eer','44','CHIPBOARD',33,5,'dsd',4),('p001','ss3','CHIPBOARD',34,2,'er',23),('p002',NULL,NULL,NULL,34,NULL,45),('P023',NULL,NULL,NULL,23,NULL,24),('qwerty','12SHHHH','CHIPBOARD',4,9,'dfghj',7),('qwertyu','12SHHHH','CHIPBOARD',2,2,'asdfg',2),('sdd','12Cement','CHIPBOARD',34,35,'rrrere',43),('ss3','12SHHHH','CHIPBOARD',3,3,'3',3),('w3','44','CHIPBOARD',3,3,'dd',4),('weeeee','12Cement','POLYFOAM',34,67,'sss',5),('wertye','12SHHHH','POLYFOAM',4,44,'fgbn',4),('www','44','CHIPBOARD',2,2,'2dd',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_raw`
--

DROP TABLE IF EXISTS `product_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_raw` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemCode` varchar(45) NOT NULL,
  `ProdCode` varchar(45) NOT NULL,
  `Qty` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemCode` (`ItemCode`),
  KEY `ProdCode_idx` (`ProdCode`),
  CONSTRAINT `ItemCode` FOREIGN KEY (`ItemCode`) REFERENCES `rawmaterial` (`ItemCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ProdCode` FOREIGN KEY (`ProdCode`) REFERENCES `product` (`ProdCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_raw`
--

LOCK TABLES `product_raw` WRITE;
/*!40000 ALTER TABLE `product_raw` DISABLE KEYS */;
INSERT INTO `product_raw` VALUES (1,'12Cement','p001',7),(2,'44','p001',9),(3,'12Cement','p001',4);
/*!40000 ALTER TABLE `product_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterial`
--

DROP TABLE IF EXISTS `rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rawmaterial` (
  `ItemCode` varchar(40) NOT NULL,
  `ColorD1` varchar(20) NOT NULL,
  `ColorD2` varchar(20) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `UnitPrice` float NOT NULL,
  `LastUpdate` varchar(45) NOT NULL,
  PRIMARY KEY (`ItemCode`),
  KEY `name_idx` (`ColorD1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES ('12Cement','4','2','POLYFOAM',333,''),('12SHHHH','2','2','POLYFOAM',44,''),('44','2','2','POLYFOAM',9,''),('ss3','2','2','HARDWARE',34.8,'dsd');
/*!40000 ALTER TABLE `rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-21 19:43:52
