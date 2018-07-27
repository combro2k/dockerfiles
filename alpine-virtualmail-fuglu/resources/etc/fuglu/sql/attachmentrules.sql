CREATE TABLE IF NOT EXISTS `attachmentrules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `regex` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `checktype` varchar(20) NOT NULL,
  `prio` int(11) NOT NULL,
  PRIMARY KEY (`rule_id`)
)
