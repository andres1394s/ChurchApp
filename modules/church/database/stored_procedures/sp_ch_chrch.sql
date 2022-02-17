/*
procedure name: sp_ch_church
This procedure manage the data from backend for insert, update, logical delete

Andres Aparicio 15/02/2022 Initial Creation

*/
delimiter //
use churchapp;
//
drop procedure if exists sp_ch_chrch;
//
create procedure sp_ch_chrch (
s_userid int,
i_ch_id int,
i_operation char (2),
i_ch_name varchar(50),
i_ch_status char(1),
i_ch_location varchar(45),
i_c_location_cl_id int,
out o_rowcount int,
out o_return int )
sp_lbl: 
begin
/*Variables for data manipulation (Future Releases)*/
declare w_sp_name varchar(34) default 'sp_ch_chrch';
declare w_ch_name varchar(16);
declare w_return int;

lbl_manage: 
begin 

if i_operation = 'I' then /*Verify if exists the id for change the operation for update if exists*/
  select *  from c_church
  where id = i_ch_id; 

  if found_rows() > 0 then
     set i_operation = 'U';
  end if;

end if;

if i_operation = 'I' /*Operation for insert */ then
	if ifnull(i_ch_name,'') = '' or ifnull(i_ch_location,'') = '' or ifnull(i_c_location_cl_id,'') = ''  then
    set w_return = 1;
    leave lbl_manage;
  end if; /*if ifnull(i_cm_first_name,'') ....*/

  insert into c_church (ch_name,ch_status,ch_creation_date,ch_created_by,ch_location,c_location_cl_id) 
  values (i_ch_name,i_ch_status,now(),s_userid,i_ch_location,i_c_location_cl_id) ;

end if; /* i_operation = 'I'*/

if i_operation = 'U' then
  update c_church 
  set ch_name = ifnull (i_ch_name,ch_name),
      ch_status = ifnull (i_ch_status,ch_status) ,
      ch_location = ifnull (i_ch_location,ch_location),
      c_location_cl_id =ifnull (i_c_location_cl_id,c_location_cl_id),
      ch_mod_date = now(),
      ch_mod_by = s_userid
  where id = i_ch_id;

  if  @@error_count != 0 then
      SHOW ERRORS;
      leave lbl_manage;
  end if;
 
end if ; /* i_operation = 'U'*/

if i_operation = 'C' then
  select 
      ch_name as 'CHURCH_NAME',
      ch_status as 'CHURCH_STATUS' ,
      ch_location as 'CHURCH_LOCATION_DETAIL',
      c_location_cl_id as 'PROVINCE_LOCATION',
      ch_creation_date as 'CREATION_DATE',
      ch_created_by as 'CREATED_BY',
      ch_mod_date as 'LAST_MODIFICATION',
      ch_mod_by as 'MODIFIED_BY'
  from c_church
  where id = i_ch_id ;

 set o_rowcount = found_rows();
 
end if ; /* i_operation = 'C'*/

if i_operation = 'D'  then
   delete 
   from c_church
   where id = i_ch_id;

end if ; /* i_operation = 'D'*/

end ; /*lbl_manage*/

  if w_return <> 0 then
   call sp_error(w_return,w_sp_name);
  end if ;
  
set o_return = w_return;
end ; /*sp_lbl*/
//
delimiter ;
