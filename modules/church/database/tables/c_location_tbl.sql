/* Created by Aparicio, Andrés
01/02/2022 
This table contains descripcion id about location churchs
for example 1- representing Juan Diaz, 2- Pedregal etc.. */


CREATE TABLE IF NOT EXISTS `churchapp`.`c_location` (
  `cl_id` INT NOT NULL,
  `cl_location_descr` VARCHAR(45) NULL,
  `cl_status` CHAR(1) NULL,
  `cl_crdate` DATETIME(1) NULL,
  PRIMARY KEY (`cl_id`))
ENGINE = InnoDB