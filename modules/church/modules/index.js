class Module {
    constructor(app) {
       this.app = app;
    }
   init() {
    const churchcontroller = require('./churchs/churchcontroller');
    new churchcontroller(this.app);
   }
  }
  module.exports = Module;