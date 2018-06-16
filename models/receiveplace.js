var db = require('./db');

var getA = function(callback) {
  db.query('SELECT * FROM receiveplace', [], function(err, result) {
    callback(err, result);
  })
}

exports.getA = getA;