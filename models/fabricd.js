var db = require('./db');

var get = function(id, callback) {
  db.query('SELECT * FROM whfabricd WHERE Pidx = ?', [id], function(err, result) {
    if(err) {
      callback(err);
    } else {
      callback(null, result);
    }
  })
}

var update = function(body, callback) {
  db.query('UPDATE whfabricd SET ? WHERE Idx = ?', [{
    Idx: body.idx, Pidx: body.pidx, FabricType: body.fabrictype, Buyer: body.buyer, Color: body.color,
    Lote: body.lote, Rack: body.rack, QtyYds: body.qtyyds, QtyRoll: body.qtyroll, Width: body.width,
    Weight: body.weight, Fileno: body.fileno, Remarks: body.remarks, MoveStatus: body.movestatus
  }, body.idx], function(err) {
    if(err) {
      callback(err) ;
    } else {
      callback(null);
    }
  })
}

var getAll = function(callback) {
  db.query(
    `SELECT whfabricd.* , fabrictype.Name as FabricType, buyer.Name as Buyer
      FROM whfabricd as whfabricd
      JOIN fabrictype as fabrictype ON fabrictype.id = whfabricd.FabricType
      JOIN buyer as buyer ON buyer.id = whfabricd.Buyer      
    `, [], function(err, rows) {
      callback(err, rows);
    })
}

var remove = function(id, callback) {
  db.query(
    `DELETE FROM whfabricd WHERE Idx = ?`, [id], function(err) {
      callback(err);
    }
  )
}

exports.get = get;
exports.update = update;
exports.remove = remove;
exports.getAll = getAll;
