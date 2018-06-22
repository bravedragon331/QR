var db = require('./db');
var createOutput = function(body, callback){
  db.query(
    `INSERT INTO outhouse (OutDate, OutPlace, Delivered, ReceivePlace, RcvdDate, Remark, OutType)
    values (?,?,?,?,?,?,?)`,
    [body.OutDate, body.OutPlace, body.Delivered, body.ReceivePlace, body.RcvdDate, body.Remarks, body.OutType],
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
    `SELECT * FROM outhouse WHERE OutDate=? AND OutPlace=? AND Delivered=? AND ReceivePlace=? AND RcvdDate=? AND Remark=? AND OutType=?`, 
    [body.OutDate, body.OutPlace, body.Delivered, body.ReceivePlace, body.RcvdDate, body.Remarks, body.OutType], function(err, rows) {
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
var updateOutPut = function(body, callback) {
  db.query(
    `UPDATE outhouse SET ? WHERE Idx = ?`, [{
      OutDate:body.OutDate, OutPlace:body.OutPlace, Delivered:body.Delivered, ReceivePlace:body.ReceivePlace,
      RcvdDate:body.RcvdDate, Remark:body.Remarks, OutType: body.OutType
    }, body.Idx],
    function(err, result) {
      console.log(err);
      callback(err);
    }
  )
}
var getOutput = function(id, callback) {
  db.query('SELECT * FROM outhouse WHERE Idx = ?', [id], function(err, rows) {
    if(err) {
      return callback(err);
    }
    return callback(null, rows);
  })
}
var removeOutput = function(body, callback) {
  db.query(
    `DELETE FROM outhouse WHERE Idx = ?`, [body.Idx], function(err) {
      callback(err);
    }
  )
}

exports.allout = allout;
exports.updateOutPut = updateOutPut;
exports.addOutput = addOutput;
exports.getOutput = getOutput;
exports.removeOutput = removeOutput;
