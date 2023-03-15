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
    console.log(req.body.id);
    let id  = req.body.id;
    const output = await ChurchMysql.getChurchInfo(id);
    res.send(output);
   
   }
   catch (error) {
   console.log(error);
 }


 
}

async UpdateChurchInfo(req,res) {
   try {
       console.log(req.body);
       const output = await ChurchMysql.UpdateChurchInfo(req.body);
       res.send(output);
   
   }
   catch (error) {
   console.log(error);
 }
}

async CreateChurch(req,res) {
   try {
       const output = await ChurchMysql.CreateChurch();
       res.send(output);
   
   }
   catch (error) {
   console.log(error);
 }

 
}

async DeleteChurch(req,res) {
   try {
       const output = await ChurchMysql.DeleteChurch(req.body);
       res.send(output);
   
   }
   catch (error) {
   console.log(error);
 }

 
}
}
module.exports = new church();