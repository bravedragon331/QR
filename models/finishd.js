var db = require('./db');

var get = function(id, callback) {
  db.query('SELECT * FROM whfinishd', [], function(err, result) {
    if(err) {
      callback(err);
    } else {
      callback(null, result);
    }
  })
}

exports.get = get;