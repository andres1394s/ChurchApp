/* Created by Aparicio, Andrés
01/02/2022 
This table contains description status abouts churchs*/


CREATE TABLE IF NOT EXISTS `churchapp`.`c_church_status` (
  `cs_id` TINYINT(1) NOT NULL,
  `cd_status_descr` VARCHAR(45) NULL,
  `cd_status` CHAR(1) NULL,
  `cs_crdate` DATETIME(1) NULL,
  PRIMARY KEY (`cs_id`))
ENGINE = InnoDB
