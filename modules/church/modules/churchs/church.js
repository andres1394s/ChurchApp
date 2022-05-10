const ChurchMysql = require('./church.mysql');
class church {
   async getAllChurchs(req,res) {
      try {
          const output = await ChurchMysql.getAllChurchs();
         res.send(output);
      
      }
      catch (error) {
      console.log(error);
    }
 }

 async getChurchInfo(req,res) {
   try {
       const output = await ChurchMysql.getChurchInfo();
      res.send(output);
   
   }
   catch (error) {
   console.log(error);
 }
}
}
module.exports = new church();