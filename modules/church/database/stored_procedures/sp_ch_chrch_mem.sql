/*
procedure name: sp_ch_church
This procedure manage the data from backend for insert, update, logical delete
Logical delete its about change the status of member for example from Active to Inactive, not fisical delete

Andres Aparicio 03/02/2022 Initial Creation
Andres Aparicio 15/02/2022 Update Operation
*/
delimiter //
use churchapp;
//
drop procedure if exists sp_ch_chrch_mem;
//
create procedure sp_ch_chrch_mem (
s_userid int,
i_operation char (2),
i_cm_ced_id VARCHAR(16),
i_cm_first_name  VARCHAR(45),
i_cm_last_name  VARCHAR(45),
i_cm_born_date DATE,
i_cm_member_type char (1),
i_cm_number_phone VARCHAR(9),
i_cm_address VARCHAR(80),
out o_rowcount int,
out o_return int )
sp_lbl: 
begin
declare w_sp_name varchar(34) default 'sp_ch_chrch_mem';
declare w_cm_ced_id varchar(16);
declare w_today datetime;
declare w_cm_first_name varchar(45);
declare w_cm_last_name varchar(45);
declare w_return int;

lbl_manage: 
begin 

select *  from c_member
where cm_ced_id = i_cm_ced_id; 

if found_rows() > 0 then
set i_operation = 'U';
end if;

if i_operation = 'I' /*Operation for insert */ then
	if ifnull(i_cm_first_name,'') = '' or ifnull(i_cm_last_name,'') = '' or ifnull(i_cm_number_phone,'') = '' or ifnull(i_cm_address, '') = '' then
    set w_return = 1;
    leave lbl_manage;
  end if; /*if ifnull(i_cm_first_name,'') ....*/

  insert into c_member (cm_ced_id,cm_first_name,cm_last_name,cm_number_phone,cm_born_date,cm_address,cm_created_by,cm_creation_date,c_church_id) 
  values (i_cm_ced_id,i_cm_first_name,i_cm_last_name,i_cm_number_phone,i_cm_born_date,i_cm_address,s_userid,now(),1);

end if; /* i_operation = 'I'*/

if i_operation = 'U' then
  update c_member 
  set cm_first_name = i_cm_first_name,
      cm_ced_id = i_cm_ced_id ,
      cm_last_name = i_cm_last_name,
      cm_number_phone =i_cm_number_phone ,
      cm_born_date = i_cm_born_date,
      cm_mod_by = s_userid,
      cm_mod_date = now()
  where i_cm_ced_id = i_cm_ced_id;

  if  @@error_count != 0 then
      SHOW ERRORS;
      leave lbl_manage;
  end if;
 
end if ; /* i_operation = 'U'*/

if i_operation = 'C' then
  select 
      cm_first_name as 'FIRST_NAME',
      cm_address as 'ADDRESS',
      cm_ced_id as 'CID',
      cm_last_name as 'LAST_NAME',
      cm_number_phone as 'NUMBER_PHONE',
      cm_born_date as 'BORN_DATE',
      c_church_id as 'CHURCH_ID',
      cm_created_by as 'CREATED_BY',
      cm_creation_date as 'CREATION_DATE',
      cm_mod_by as 'MODIFICADO_POR',
      cm_mod_date as 'FECHA_MODIFICACION'  
  from c_member
  where i_cm_ced_id = i_cm_ced_id;
 
 set o_rowcount = found_rows();
 
end if ; /* i_operation = 'C'*/
  
end ; /*lbl_manage*/
  
  if w_return <> 0 then
   call sp_error(w_return,w_sp_name);
  end if ;
  
set o_return = w_return;
end ; /*sp_lbl*/
//
delimiter ;

