var db = require('./db');
var createOutput = function(body, callback){
  db.query(
    `INSERT INTO outhouse (OutDate, OutPlace, Delivered, ReceivePlace, RcvdDate, Remark)
    values (?,?,?,?,?,?)`,
    [body.OutDate, body.OutPlace, body.Delivered, body.ReceivePlace, body.RcvdDate, body.Remarks],
    function(err){
      console.log(err);
      if(err){
        if (err.code === 'ER_DUP_ENTRY') {
          // If we somehow generated a duplicate user id, try again
          return createOutput(body, callback);
        }
        return callback(err);
      }
      return callback(null);
  })
}

var addOutput = function(body, callback) {
  db.query(
    `SELECT * FROM outhouse WHERE OutDate=? AND OutPlace=? AND Delivered=? AND ReceivePlace=? AND RcvdDate=? AND Remark=?`, 
    [body.OutDate, body.OutPlace, body.Delivered, body.ReceivePlace, body.RcvdDate, body.Remarks], function(err, rows) {
    if(err) {
      return callback(err);
    }
    if(rows.length) {
      return callback(null, false);
    } else {
      return createOutput(body, callback);
    }
  })
}
var allout = function(callback) {
  db.query(`SELECT * FROM outhouse`, [], function(err, rows) {
    if(err) {
      return callback(err);
    }
    return callback(null, rows);
  })
}
var updateout = function(body, callback) {
  db.query(
    `UPDATE outhouse SET ? WHERE Idx = ?`, [{
      OutDate:body.OutDate, OutPlace:body.OutPlace, Delivered:body.Delivered, ReceivePlace:body.ReceivePlace,
      RcvdDate:body.RcvdDate, Remark:body.Remarks
    }, body.Idx],
    function(err, result) {
      console.log(err);
      callback(err);
    }
  )
}

exports.allout = allout;
exports.updateout = updateout;
exports.addOutput = addOutput;