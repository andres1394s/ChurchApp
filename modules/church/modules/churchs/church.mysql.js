const mysql = require('../../dbconfig/config');
class ChurchMysql { 

   async getAllChurchs()
    {
    let operation = 'C1';
    var sql  = "call sp_ch_chrch (null,null,?,null,null,null,null,@o_rowcount,@o_return);"
    const conn = await mysql.getConnection();
    console.log(sql+'getall');
    //console.log(conn);
    let [rows, fields] = await conn.query(sql,[operation]);
   console.log(rows);
   return rows


    
   }

async getChurchInfo(req)
{
let operation = 'C';
var sql  = "call sp_ch_chrch (null,?,?,null,null,null,null,@o_rowcount,@o_return);"
const conn = await mysql.getConnection();
//console.log(conn);
let [rows, fields] = await conn.query(sql,[parseInt(req.id),operation]);
console.log(rows);
return rows
}

async UpdateChurchInfo(req)
{
   let operation = 'U';
   let id = parseInt(req.id);
   let churchname = req.ChurchName;
   let chstatus = req.sstus;
   let location_id = parseInt(req.Location_id);
   let addrr = req.Addr;
   let userid = parseInt(req.userid);
   var sql  = "call sp_ch_chrch (?,?,?,?,?,?,?,@o_rowcount,@o_return);"
   const conn = await mysql.getConnection();
   let [rows, fields] = await conn.query(sql,[userid,id,operation,churchname,chstatus,addrr,location_id]);
   console.log(rows);
   return rows
}

async CreateChurch()
{
   let operation = 'I';
   let id = 4;
   let churchname = 'Iglesia 3';
   let chstatus = 'A';
   let location_id = 1;
   let addrr = 'Juan Diaz';
   let userid = 2;
   var sql  = "call sp_ch_chrch (?,?,?,?,?,?,?,@o_rowcount,@o_return);"
   const conn = await mysql.getConnection();
   let [rows, fields] = await conn.query(sql,[userid,id,operation,churchname,chstatus,addrr,location_id]);
   console.log(rows);
   return rows
}

async DeleteChurch(req){
   let operation = 'D';
   let id_1 = parseInt(req.id);
   var sql  = "call sp_ch_chrch (null,?,?,null,null,null,null,@o_rowcount,@o_return);"
   const conn = await mysql.getConnection();
   let [rows, fields] = await conn.query(sql,[id_1,operation,]);
   console.log(rows);
   return rows
   
}


}
  
module.exports = new ChurchMysql();