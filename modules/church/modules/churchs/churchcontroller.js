const church = require('./church');
const express = require('express');
const router = express.Router();

class ChurchController {
    constructor(app) {
      app.use(express.urlencoded({ extended: true }));
      //Church-routes//
      router.get('/Churchs',church.getAllChurchs);
      router.get('/Info', church.getChurchInfo);
      router.get('/ModC/',church.UpdateChurchInfo);
      router.get('/Create/',church.CreateChurch);
      router.get('/DelChurch/',church.DeleteChurch)
      app.use('/church', router);
    }
 }
module.exports = ChurchController;