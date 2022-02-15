/* Created by Aparicio, Andrés
01/02/2022 
This table contains the descripcion of general errors from database. */


CREATE TABLE IF NOT EXISTS `churchapp`.`c_error` (
  `ce_id` INT NOT NULL,
  `ce_err_descr` VARCHAR(45) NULL,
  PRIMARY KEY (`ce_id`))
ENGINE = InnoDB