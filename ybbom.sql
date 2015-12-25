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
create database ybbom;
use ybbom; 

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (21,'Computer','Desctop Computers'),(22,'Smart Phones','Android Smart Phones');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `colorcode` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'BEECH','1'),(4,'BLACK','2'),(5,'BROWN','3'),(6,'No Color','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerinfo`
--

LOCK TABLES `customerinfo` WRITE;
/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` VALUES (21,'Niki13','Niki','NK13','Patna								','800020','Patna','Bihar','India','9097564794','FX13','Niki'),(23,'H30','Harshit','HT30','Patna','800020','Patna','Bihar','India','7890678588','HFX','HARSHIT'),(24,'V19','Vishu','VI12','Patna	','800001','Patna','Bihar','India','8079696980','VFX2','VISHU');
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
  `RegisterDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RequireDate` varchar(60) NOT NULL,
  `Qty` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`OrderNo`),
  KEY `Qty_idx` (`Qty`),
  KEY `ProdCode_idx` (`ProdCode`),
  KEY `Color1_idx1` (`Color2`,`Color3`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (56,21,'Hp Computers','BLACK','BLACK','BEECH','2015-12-23 12:30:30','Thu Dec 10 18:00:27 IST 2015','2'),(57,21,'Hp Computers','BEECH','BLACK','BLACK','2015-12-23 12:31:16','Wed Dec 09 18:01:06 IST 2015','2');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (2,'SH12','123','Shobha','Shobha'),(3,'pk','123','Prakash','Prakash'),(4,'Niki','niki','Niki','Niki'),(5,'Harsh','harsh','harsh','harsh');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiple_order`
--

DROP TABLE IF EXISTS `multiple_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiple_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` varchar(45) NOT NULL,
  `OrderNo` varchar(45) NOT NULL,
  `ProdCode` varchar(45) NOT NULL,
  `Color1` varchar(45) NOT NULL,
  `Color2` varchar(45) DEFAULT NULL,
  `Color3` varchar(45) DEFAULT NULL,
  `Qty` float NOT NULL,
  `RegisterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `customerId_idx` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple_order`
--

LOCK TABLES `multiple_order` WRITE;
/*!40000 ALTER TABLE `multiple_order` DISABLE KEYS */;
INSERT INTO `multiple_order` VALUES (21,'21','56','Hp Computers','BLACK','BLACK','BEECH',2,'2015-12-23 12:30:30'),(22,'21','56','Hp Computers','BLACK','BROWN','BLACK',3,'2015-12-23 12:30:48'),(23,'21','57','Hp Computers','BEECH','BLACK','BLACK',2,'2015-12-23 12:31:16');
/*!40000 ALTER TABLE `multiple_order` ENABLE KEYS */;
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
INSERT INTO `product` VALUES ('Hp Computers',NULL,NULL,NULL,2,NULL,1),('P002',NULL,NULL,NULL,89,NULL,78);
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
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemCode` (`ItemCode`),
  KEY `ProdCode_idx` (`ProdCode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_raw`
--

LOCK TABLES `product_raw` WRITE;
/*!40000 ALTER TABLE `product_raw` DISABLE KEYS */;
INSERT INTO `product_raw` VALUES (33,'Plastic','Hp Computers',3),(34,'glass','Hp Computers',1),(35,'0001','P002',78);
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
  `Specification` varchar(100) NOT NULL,
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
INSERT INTO `rawmaterial` VALUES ('0001','2','2','Smart Phones',900,'900*800','Smart'),('glass','0','0','Computer',8,'500*300','Glass'),('Plastic','2','2','Computer',9,'400*200','Black Plastic');
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

-- Dump completed on 2015-12-24 18:34:21
