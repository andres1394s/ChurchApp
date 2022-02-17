const config = {
    db: {
      /* don't expose password or any sensitive info, done only for demo */
      host: "localhost",
      user: "root",
      password: "localtest",
      database: "churchapp",
      multipleStatements : true
    },
  };
  module.exports = config;
