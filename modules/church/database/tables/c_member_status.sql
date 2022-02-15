/* Created by Aparicio, Andrés
01/02/2022 
This table contains a descrpcion status from members*/

CREATE TABLE IF NOT EXISTS `churchapp`.`c_member_status` (
  `es_id` INT NOT NULL,
  `es_status_descr` VARCHAR(50) NULL,
  `es_crdate` DATETIME(1) NULL,
  PRIMARY KEY (`es_id`))
ENGINE = InnoDB