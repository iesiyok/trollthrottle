-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: trollthrottle
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

CREATE DATABASE `trollthrottle`;

USE `trollthrottle`;
--
-- Table structure for table `issuer_gpk`
--

DROP TABLE IF EXISTS `issuer_gpk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_gpk` (
  `seed` int(11) NOT NULL,
  `g1` varchar(400) DEFAULT NULL,
  `h1` varchar(400) DEFAULT NULL,
  `h2` varchar(400) DEFAULT NULL,
  `g2` varchar(1500) DEFAULT NULL,
  `w` varchar(1500) DEFAULT NULL,
  `t4` longtext,
  `or_der` varchar(200) DEFAULT NULL,
  `prec_hash` varchar(200) DEFAULT NULL,
  `ts` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_gpk`
--

LOCK TABLES `issuer_gpk` WRITE;
/*!40000 ALTER TABLE `issuer_gpk` DISABLE KEYS */;
INSERT INTO `issuer_gpk` VALUES (1542564187,'16B01AAD79A2F74FBA63DD3DC329992921AA1A8503210C05B4798699441A3E7A\n24D658920AF87DE2F51ACAD4ECE1D2AC31198FD46192FCB86E6E9AF54B68A018\n\n','DE7A8A307409F9104A4BD7A6218A880B33DE18B97CF02C8B616817B9FA38395\n17783EC68934E7E4E79A5DB8C5E120A7DFCA82A0718F99DE9F3FE4E4C981B910\n\n','D1F37A1408DD8C5A2D25E5AA5A971B103B0539D94B555FBB11311EAD0A18C1\n7C26B3C5D232322289E475299B09EAF7AA30F53FD7C2724E0B425FB7B1683F6\n\n','3ECAD531FAD952A9A7414424D8F6F467D689B06CCEAE117D4B51CB3045F8FF1\n12B27DB2DAB10B8B4B72838E5CFAE7C5C3D5107FE6D9EAA7AFF5BA1719D866DB\n\nE1A75BBF73E157601FCBAE1617F36F60D06C3199C4542412DFD75DDFA6F42E\nD07A803B6C6A527F8FA872696B878C7B4A98D61C0F42DF631D332D0AAD7FD9B\n\n\n','1BCA5ED7B78D126B34DADD04EB2E60FC8B1B79B40C72690378E93F4CEAF64106\n5C8EDC74290E01A372C83D3BB7CACE734C094446574332AFB32A2774ADB115D\n\n1A777841D308729CB4342A8BE4B27E5A3BEC8A04A7DC14248D6811D5FFE85875\nE370F34C7626EC307200CEFB3C1F4CC81BBA5E729815C6784E486C6EE7765D1\n\n\n','1AF304C59E25AD3E1C83EE666013DE9AE834D5053C4AF19D41131CFAF8CA1CA1\nD3E82DD3294C44D5857DA15EED61D073342FF1713D3F0758E638BA61F93B639\n20830931FF0520913C2D672109DAE9D565FEFE393494AE0FE3073BDD0D22C311\n1375A6625E199A4BD39053676667F3B6ECAED107D4A5EA87826C3EA0CD9094CF\n\n8FE62239AD592854DBD0901F8AF3C154458FDEF515A5B956BCEBFAB519B7130\n12E9FF9A5B8F2A8A086AFF6C160CEF8E4417E7614EF81AE249FFE7D323F284D4\n66AF1F1A0A1BA5D37797060440AC2B8205C3C26482F96E584D19FC6D893B190\n199F42696C2636D7793EAF80B42C3A0480438EE256B493FFB07EA055AED934F8\n\nE2CE6E9FE5DFF0D70C7BCB4F1BBCDF9A95370F511CE4618985CE6A5B99DBDB4\n1B7C3D0C8BBCA280091409F4929E37ECC81C827A51BAD0B3126C27745CB983A3\n6D26FA079803F156A56FD90DA9B049BDD7C6490FB1B5E5DEA4DB1602A85ADAC\n24E7ED8F456393141D9AD2BF34A85B1CDD1B1014BF6D2FDBC7F74DFD09ACFC74\n\n\n','2523648240000001BA344D8000000007FF9F800000000010A10000000000000D\n','200E3C9BA0FDE45BB536CFFF2F867D160FEFD250A0E7A601E7C1529E663CB13D\n','2020-04-15 20:24:09.179460');
/*!40000 ALTER TABLE `issuer_gpk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuer_identities`
--

DROP TABLE IF EXISTS `issuer_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuer_identities` (
  `t_CI` varchar(100) DEFAULT NULL,
  `t_hrU` varchar(100) DEFAULT NULL,
  `t_sid` varchar(100) DEFAULT NULL,
  `t_login` varchar(100) DEFAULT NULL,
  UNIQUE KEY `ix_t_ci` (`t_CI`),
  UNIQUE KEY `ix_login` (`t_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuer_identities`
--

LOCK TABLES `issuer_identities` WRITE;
/*!40000 ALTER TABLE `issuer_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuer_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_user`
--

DROP TABLE IF EXISTS `new_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_user` (
  `author` varchar(100) NOT NULL,
  UNIQUE KEY `UQ_author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_user`
--

LOCK TABLES `new_user` WRITE;
/*!40000 ALTER TABLE `new_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_daa_signatures`
--

DROP TABLE IF EXISTS `user_daa_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_daa_signatures` (
  `h_login` varchar(150) NOT NULL,
  `cred` longtext NOT NULL,
  `ts` varchar(30) NOT NULL,
  UNIQUE KEY `ix_login` (`h_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_daa_signatures`
--

LOCK TABLES `user_daa_signatures` WRITE;
/*!40000 ALTER TABLE `user_daa_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_daa_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_identities`
--

DROP TABLE IF EXISTS `verified_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_identities` (
  `t_CI` varchar(100) DEFAULT NULL,
  `t_rU` varchar(100) DEFAULT NULL,
  `t_nbd` varchar(60) DEFAULT NULL,
  `t_sig_cI` varchar(100) DEFAULT NULL,
  UNIQUE KEY `ix_nbd` (`t_nbd`),
  UNIQUE KEY `ix_t_ci` (`t_CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_identities`
--

LOCK TABLES `verified_identities` WRITE;
/*!40000 ALTER TABLE `verified_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_comments`
--

DROP TABLE IF EXISTS `website_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_comments` (
  `topic_id` int(11) NOT NULL,
  `aenc` varchar(5000) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `W` varchar(60) DEFAULT NULL,
  `domain` varchar(60) DEFAULT NULL,
  `ts` varchar(30) NOT NULL,
  `nym` varchar(400) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  UNIQUE KEY `ix_nym` (`nym`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_comments`
--

LOCK TABLES `website_comments` WRITE;
/*!40000 ALTER TABLE `website_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_cookies`
--

DROP TABLE IF EXISTS `website_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_cookies` (
  `t_login` varchar(100) DEFAULT NULL,
  `nym` varchar(400) DEFAULT NULL,
  `h_login` varchar(150) DEFAULT NULL,
  `A` varchar(400) DEFAULT NULL,
  `x` varchar(200) DEFAULT NULL,
  `sk` varchar(200) DEFAULT NULL,
  `bd` varchar(20) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  UNIQUE KEY `ix_login` (`t_login`),
  UNIQUE KEY `ix_nym` (`nym`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_cookies`
--

LOCK TABLES `website_cookies` WRITE;
/*!40000 ALTER TABLE `website_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_temp_comments`
--

DROP TABLE IF EXISTS `website_temp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_temp_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `nv` varchar(400) DEFAULT NULL,
  `ts` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_temp_comments`
--

LOCK TABLES `website_temp_comments` WRITE;
/*!40000 ALTER TABLE `website_temp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_temp_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-15 20:25:57
