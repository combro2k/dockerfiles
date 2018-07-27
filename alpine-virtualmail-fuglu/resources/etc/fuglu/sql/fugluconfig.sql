CREATE TABLE IF NOT EXISTS `fugluconfig` (
  `scope` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`scope`,`section`,`option`)
)
