/* Created by Aparicio, Andrés
01/02/2022 
This table contains general information about churchs members*/

CREATE TABLE IF NOT EXISTS `churchapp`.`c_member` (
  `cm_id` INT NOT NULL,
  `cm_first_name` VARCHAR(45) NULL,
  `cm_last_name` VARCHAR(45) NULL,
  `cm_age` VARCHAR(45) NULL,
  `cm_status` CHAR(1) NULL,
  `cm_number_phone` VARCHAR(8) NULL,
  `cm_creation_date` DATE NULL,
  `cm_mod_date` DATE NULL,
  `cm_address` VARCHAR(45) NULL,
  `cm_created_by` INT NULL,
  `cm_mod_by` INT NULL,
  `cm_member_type` TINYINT(1) NULL,
  `c_church_id` INT NOT NULL,
  PRIMARY KEY (`cm_id`),
  INDEX `fk_c_member_c_church1_idx` (`c_church_id` ASC),
  CONSTRAINT `fk_c_member_c_church1`
    FOREIGN KEY (`c_church_id`)
    REFERENCES `churchapp`.`c_church` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB