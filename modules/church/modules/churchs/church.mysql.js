const mysql = require('../../dbconfig/config');
class ChurchMysql { 
   async getAllChurchs()
    {
    let operation = 'C1';
    var sql  = "call sp_ch_chrch (null,null,?,null,null,null,null,@o_rowcount,@o_return);"
    const conn = await mysql.getConnection();
    console.log(sql+'getall');
    console.log(conn);
    let [rows, fields] = await conn.query(sql,[operation]);
   console.log(rows);
   return rows


    
   }

async getChurchInfo()
{
let operation = 'C';
var id = 1;
var sql  = "call sp_ch_chrch (null,?,?,null,null,null,null,@o_rowcount,@o_return);"
const conn = await mysql.getConnection();
console.log(sql+'chrchinfo');
console.log(conn);
let [rows, fields] = await conn.query(sql,[id,operation]);
console.log(rows);
return rows
}

}
  
module.exports = new ChurchMysql();