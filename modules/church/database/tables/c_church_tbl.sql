/* Created by Aparicio, Andrés
01/02/2022 
This table contains general information about churchs*/


CREATE TABLE IF NOT EXISTS `churchapp`.`c_church` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ch_name` VARCHAR(50) NULL,
  `ch_status` CHAR(1) NULL,
  `ch_creation_date` DATE NULL,
  `ch_created_by` INT NULL,
  `ch_mod_date` DATE NULL,
  `ch_mod_by` INT NULL,
  `ch_location` VARCHAR(45) NULL,
  `c_location_cl_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_c_church_c_location_idx` (`c_location_cl_id` ASC),
  CONSTRAINT `fk_c_church_c_location`
    FOREIGN KEY (`c_location_cl_id`)
    REFERENCES `churchapp`.`c_location` (`cl_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB