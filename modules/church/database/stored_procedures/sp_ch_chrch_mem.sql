/*
procedure name: sp_ch_church
This procedure manage the data from backend for insert, update, logical delete
Logical delete its about change the status of member for example from Active to Inactive, not fisical delete

Andres Aparicio 03/02/2022 Initial Creation

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

lbl_manage: begin 
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
  select i_operation;
  
  end if ;
  end ; /*lbl_manage*/
  
  if w_return <> 0 then
  call sp_error(w_return,w_sp_name);
  end if ;
  
set o_return = w_return;
end ; /*sp_lbl*/
//
delimiter ;

