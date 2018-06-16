var db = require('./db');

var getA = function(callback) {
  db.query('SELECT * FROM buyer', [], function(err, result) {
    callback(err, result);
  })
}

exports.getA = getA;