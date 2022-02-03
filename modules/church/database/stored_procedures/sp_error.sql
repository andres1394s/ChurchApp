/*
procedure name: sp_error
This procedure manage diferets errors validations into databse and send it to backend

Andres Aparicio 03/02/2022 Initial Creation

*/
delimiter //
use churchapp;
//
drop procedure if exists sp_error;
//
create procedure sp_error (
i_num int,
i_sp_name varchar(25)
 )
sp_lbl: begin
   select ce_id as 'NUM_ERR',
          concat ( "(",i_sp_name,")",ce_err_descr) as 'DESCRIPCION'
          from c_error
          where ce_id = i_num; 
          
  if found_rows() = 0 then
   select 999999 as "NUM_ERR",
          "ERROR DESCONOCIDO" as 'DESCRIPTION';
 end if;
end ;
//
delimiter ;


