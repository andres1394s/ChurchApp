const mysql = require('mysql'); 
var mysqlConnection = mysql.createConnection({  
    host: 'localhost',  
    user : 'root',  
    password : 'localtest',   
    database : 'churchapp',  
    multipleStatements : true  
});  

module.exports = mysqlConnection;