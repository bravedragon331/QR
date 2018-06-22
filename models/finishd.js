var db = require('./db');

var get = function(id, callback) {
  db.query('SELECT * FROM whfinishd WHERE Pidx = ?', [id], function(err, result) {
    if(err) {
      callback(err);
    } else {
      callback(null, result);
    }
  })
}

var update = function(body, callback) {
  db.query('UPDATE whfinishd SET ? WHERE Idx = ?', [{
    Idx: body.idx, Pidx: body.pidx, Buyer: body.buyer, Fileno: body.fileno, Styleno: body.styleno,
    Pono: body.pono, Color: body.color, Size: body.size, Qty: body.qty, Status: body.status, MoveStatus: body.movestatus
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
    `DELETE FROM whfinishd WHERE Idx = ?`, [id], function(err) {
      callback(err);
    }
  )
}

var getAll = function(callback) {
  db.query(
    `SELECT whfinishd.*, Buyer.Name as Buyer
      FROM whfinishd as whfinishd
      JOIN buyer as buyer ON buyer.id = whfinishd.Buyer      
    `, [], function(err, rows) {
      callback(err, rows);
    })
}

exports.get = get;
exports.update = update;
exports.remove = remove;
exports.getAll = getAll;