var Warehouse = require('../models/warehouse');
var OtherD = require('../models/otherd');
var FabricD = require('../models/fabricd');
var FinishD = require('../models/finishd');

exports.index = function(req, res){
  res.render('dashboard/index');
}

exports.manage = function(req, res) {
  res.render('dashboard/manage');
}

exports.add_warehouse = function(req, res) {
  Warehouse.addWarehouse(req.body, function(err, b) {
    if(err) {
      res.json({status: 0});
    } else {      
      res.json({status: b?1:0});
    }
  })  
}

exports.load_warehouse = function(req, res) {
  Warehouse.allWarehouse(function(err, result) {
    if(err) {
      res.json({status: 0});
    } else {
      res.json({status: 1, list: result});
    }
  })
}

exports.update_warehouse = function(req, res) {
  Warehouse.updateWarehouse(req.body, function(err) {
    if(err) {
      res.json({status: 0});
    } else {
      res.json({status: 1});
    }
  })
}

exports.detail = function(req, res) {
  var id = req.params.id;
  var type = req.params.type;
  switch(type) {
    case 'T':
      FabricD.get(id, function(err, result) {
        if(err) {
          res.redirect('/dashboard');
        } else {
          if(result.length == 0) {
            res.render('dashboard/empty');
          } else {
            res.render('dashboard/detail1', {data: result});
          }
        }
      })
      break;
    case 'O':
      FinishD.get(id, function(err, result) {
        if(err) {
          res.redirect('/dashboard');
        } else {
          if(result.length == 0) {
            res.render('dashboard/empty');
          } else {
            res.render('dashboard/detail2', {data: result});
          }
        }
      })
      break;
    case 'F':
      OtherD.get(id, function(err, result) {
        if(err){
          res.redirect('/dashboard');
        } else {
          if(result.length == 0) {
            res.render('dashboard/empty');
          } else {
            res.render('dashboard/detail3', {data: result});
          }
        }
      })
      break;
  }
}