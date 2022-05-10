const mysql = require('mysql2/promise');
class DBConnection {
  async getConnection() {
     try {
       return await mysql.createConnection({
              host: 'localhost',
              user: 'root',
              password: 'root',
              database: 'churchapp',
              multipleStatements : true  
       });
       
    }
    catch(error) {
      console.log(error);
    }
  }
  
}
module.exports = new DBConnection();