
DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `contents` text NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`),
  KEY `no` (`no`,`table_name`,`email`),
  KEY `mail` (`email`),
  CONSTRAINT `mail` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `bbs_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_comments` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(20) NOT NULL,
  `bbs_no` int(11) NOT NULL,
  `contents` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `table_name` (`table_name`,`bbs_no`),
  KEY `default` (`bbs_no`,`table_name`),
  KEY `email` (`email`),
  CONSTRAINT `default` FOREIGN KEY (`bbs_no`, `table_name`) REFERENCES `bbs` (`no`, `table_name`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `bbs_view_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_view_log` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(20) NOT NULL,
  `bbs_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `table_name` (`table_name`,`bbs_no`,`date`) USING BTREE COMMENT '인기게시물 검색위하여',
  KEY `table_name_2` (`table_name`,`bbs_no`,`member_no`) USING BTREE COMMENT 'view페이지에서 조회시',
  KEY `de` (`bbs_no`,`table_name`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `de` FOREIGN KEY (`bbs_no`, `table_name`) REFERENCES `bbs` (`no`, `table_name`),
  CONSTRAINT `member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `matzib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matzib` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `contents` text NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `matzib_title` varchar(50) NOT NULL,
  `matzib_telephone` varchar(20) NOT NULL,
  `matzib_address` varchar(50) NOT NULL,
  `matzib_roadAddress` varchar(50) NOT NULL,
  `matzib_mapx` int(11) NOT NULL,
  `matzib_mapy` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `no` (`no`,`email`),
  KEY `members` (`email`),
  CONSTRAINT `members` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `matzib_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matzib_comments` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `matzib_no` int(11) NOT NULL,
  `contents` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `table_name` (`matzib_no`),
  KEY `member` (`email`),
  CONSTRAINT `matzib` FOREIGN KEY (`matzib_no`) REFERENCES `matzib` (`no`),
  CONSTRAINT `member` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `matzib_great`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matzib_great` (
  `matzib_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`matzib_no`,`member_no`),
  KEY `member_nos` (`member_no`),
  CONSTRAINT `mastzib` FOREIGN KEY (`matzib_no`) REFERENCES `matzib` (`no`),
  CONSTRAINT `member_nos` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `matzib_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matzib_search_log` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(20) NOT NULL,
  `member_no` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `mem` (`member_no`),
  CONSTRAINT `mem` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(5) NOT NULL,
  `nickname` varchar(5) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
