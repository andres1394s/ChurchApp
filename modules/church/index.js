const express = require("express");
const mysql = require("./dbconfig/config");
const app = express();
const port = 3000;


mysql.connect((err) => {  
    if(!err) {  
        console.log("DB Conection success");  
    }  
    else{  
        console.log("Db connect Failed \n Error :" + JSON.stringify(err,undefined,2));  
    }  
});  


app.listen(3000,()=> console.log("Express server is running at port no : 3000")); 