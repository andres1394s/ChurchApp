const church = require('./church');
const express = require('express');
const router = express.Router();

class ChurchController {
    constructor(app) {
      //Church-routes//
      router.get('/Churchs', church.getAllChurchs);
      router.get('/Info', church.getChurchInfo);
      app.use('/church', router);
    }
 }
module.exports = ChurchController;