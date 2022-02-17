const church = require('./church');
const express = require('express');
const router = express.Router();
class ChurchController {
    constructor(app) {
      router.get('/', church.getAllChurchs);
      app.use('/api/v1/products', router);
    }
 }
module.exports = ChurchController;