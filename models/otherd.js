var db = require('./db');

var get = function(id, callback) {
  db.query('SELECT * FROM whotherd', [], function(err, result) {
    if(err) {
      callback(err);
    } else {
      callback(null, result);
    }
  })
}

exports.get = get;