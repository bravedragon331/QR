var db = require('./db');

var get = function(id, callback) {
  db.query('SELECT * FROM whotherd WHERE Pidx = ?', [id], function(err, result) {
    if(err) {
      callback(err);
    } else {
      callback(null, result);
    }
  })
}

var update = function(body, callback) {
  db.query('UPDATE whotherd SET ? WHERE Idx = ?', [{
    Idx: body.idx, Pidx: body.pidx, ItemType: body.itemtype, Description: body.description,
    Qty: body.qty, Status: body.status, MoveStatus: body.movestatus
  }, body.idx], function(err) {
    if(err) {
      callback(err) ;
    } else {
      callback(null);
    }
  })
}

var remove = function(id, callback) {
  db.query(
    `DELETE FROM whotherd WHERE Pidx = ?`, [id], function(err) {
      callback(err);
    }
  )
}

var getAll = function(callback) {
  db.query(
    `SELECT whotherd.*
      FROM whotherd as whotherd
    `, [], function(err, rows) {
      callback(err, rows);
    })
}

exports.get = get;
exports.update = update;
exports.remove = remove;
exports.getAll = getAll;