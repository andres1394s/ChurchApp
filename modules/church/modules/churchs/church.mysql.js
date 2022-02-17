const mysql = require('../../dbconfig/config');
class ChurchMysql { 
   async getAllChurchs() {
    var operation  = 'C';
    var rowinto
    var id = 1;
    var sql  = "select * from c_church"
    const conn = await mysql.getConnection();
    let [rows, fields] = await conn.execute(sql);
   console.log(rows);
   return rows


    
   }}
  
module.exports = new ChurchMysql();
