var db = require('./db');

var addDetail = function(body, callback) {
  db.query(
    `INSERT INTO outdetail (outPidx, inIdx, Qty1, Qty2)
    values (?,?,?,?)`,
    [body.outPidx, body.inIdx, body.Qty1, body.Qty2],
    function(err){
      if(err){
        if (err.code === 'ER_DUP_ENTRY') {
          // If we somehow generated a duplicate user id, try again
          return addDetail(body, callback);
        }
        return callback(err);
      }
      return callback(null);
  })
}

var getDetails1 = function(id, callback) {
  db.query(`
    SELECT outdetail.*, whfabricd.*, buyer.Name as Buyer, fabrictype.Name as FabricType
    FROM outdetail as outdetail
    JOIN outhouse as outhouse ON outhouse.Idx = outdetail.outPidx
    JOIN whfabricd as whfabricd ON outhouse.OutType = "T" AND outdetail.inIdx = whfabricd.Idx
    JOIN buyer as buyer ON buyer.id = whfabricd.Buyer
    JOIN fabrictype as fabrictype ON fabrictype.id = whfabricd.FabricType
    WHERE outdetail.outPidx = ?`, [id], function(err, rows) {
    if(err) {
      console.log(err);
      callback(err);
    } else {
      callback(null, rows);
    }
  })
}
var getDetails2 = function(id, callback) {
  db.query(`
    SELECT outdetail.*, whfinishd.*, buyer.Name as Buyer
    FROM outdetail as outdetail
    JOIN outhouse as outhouse ON outhouse.Idx = outdetail.outPidx
    JOIN whfinishd as whfinishd ON outhouse.OutType = "F" AND outdetail.inIdx = whfinishd.Idx
    JOIN buyer as buyer ON buyer.id = whfinishd.Buyer
    WHERE outdetail.outPidx = ?`, [id], function(err, rows) {
    if(err) {
      console.log(err);
      callback(err);
    } else {
      callback(null, rows);
    }
  })
}
var getDetails3 = function(id, callback) {
  db.query(`
    SELECT outdetail.*, whotherd.*
    FROM outdetail as outdetail
    JOIN outhouse as outhouse ON outhouse.Idx = outdetail.outPidx
    JOIN whotherd as whotherd ON outhouse.OutType = "O" AND outdetail.inIdx = whotherd.Idx
    WHERE outdetail.outPidx = ?`, [id], function(err, rows) {
    if(err) {
      callback(err);
    } else {
      callback(null, rows);
    }
  })
}
var updateDetail = function(body, callback) {
  db.query(`
    UPDATE outdetail SET ? WHERE idx = ?`, [{
      Qty1: parseInt(body.qty1), Qty2: parseInt(body.qty2)
    }, body.idx], function(err) {
      callback(err);
    }
  )
}
var removeDetail = function(body, callback) {
  db.query(
    `DELETE FROM outdetail WHERE idx = ?`, [body.idx], function(err) {
      callback(err);
    }
  )
}

var getByType = function(type, callback) {
  db.query(`
    SELECT outdetail.*
    FROM outdetail as outdetail
    JOIN outhouse as outhouse ON outhouse.OutType = ? AND outhouse.Idx = outdetail.outPidx
    `, [type], function(err, list) {
      callback(err, list);
    }
  )
}

exports.addDetail = addDetail;
exports.getDetails1 = getDetails1;
exports.getDetails2 = getDetails2;
exports.getDetails3 = getDetails3;
exports.updateDetail = updateDetail;
exports.removeDetail = removeDetail;
exports.getByType = getByType;