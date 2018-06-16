var db = require('./db');

var createWarehouse = function(body, callback){
  db.query(
    `INSERT INTO whwarehouse (idx, factoryidx, workorderidx, outplace, delivered, receiveplace, outdate, rcvddate, remarks, outtype, location, refno)
    values (?,?,?,?,?,?,?,?,?,?,?,?)`, 
    [body.idx, body.factoryidx, body.workorderidx, body.outplace, body.delivered, body.receiveplace, body.outdate, body.rcvddate, body.remarks, body.outtype, body.location, body.refno],
    function(err){
      console.log(err);
      if(err){
        if (err.code === 'ER_DUP_ENTRY') {
          // If we somehow generated a duplicate user id, try again
          return createQR(body, callback);
        }
        return callback(err);
      }
      return callback(null);
  })
}

var addWarehouse = function(body, callback) {
  db.query(`SELECT * FROM whwarehouse WHERE idx = ?`, [body.idx], function(err, rows) {
    if(err) {
      return callback(err);
    }
    if(rows.length) {
      return callback(null, false);
    } else {
      return createWarehouse(body, callback);
    }
  })
}

var allWarehouse = function(callback) {
  db.query(`SELECT * FROM whwarehouse`, [], function(err, rows) {
    if(err) {
      return callback(err);
    } else {
      return callback(null, rows);
    }
  })
}

var updateWarehouse = function(body, callback) {
  db.query(
    `UPDATE whwarehouse SET ? WHERE Idx = ?`, [{
      FactoryIdx: body.FactoryIdx, WorkOrderIdx:body.WorkOrderIdx, OutPlace:body.OutPlace, Delivered:body.Delivered, OutDate:body.OutDate,
      RcvdDate:body.RcvdDate, Remarks:body.Remarks, OutType:body.OutType, Location:body.Location, RefNo:body.RefNo
    }, body.Idx],
    function(err, result) {
      console.log(err);
      callback(err);
    }
  )
}

var deleteWarehouse = function(body, callback) {
  db.query(
    `DELETE FROM whwarehouse WHERE idx = ?`, [body.idx], function(err, result) {
      callback(err);
    }
  )
}

exports.addWarehouse = addWarehouse;
exports.allWarehouse = allWarehouse;
exports.updateWarehouse = updateWarehouse;
exports.deleteWarehouse = deleteWarehouse;