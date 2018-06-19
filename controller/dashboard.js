var Warehouse = require('../models/warehouse');
var OtherD = require('../models/otherd');
var FabricD = require('../models/fabricd');
var FinishD = require('../models/finishd');
var FactoryD = require('../models/factoryd');
var OutPlaceD = require('../models/outplaced');
var ReceivePlaceD = require('../models/receiveplace');
var FabricTypeD = require('../models/fabrictype');
var BuyerD = require('../models/buyer');
var Const = require('../config/const');
var Outhouse = require('../models/outhouse');

exports.index = function(req, res){
  res.render('dashboard/index');
}

exports.manage = function(req, res) {
  var l_factory, l_outplace, l_receiveplace;
  var all_promises = [];
  all_promises.push(
    new Promise((resolve, reject) => {
      FactoryD.getA(function(err, result) {
        if(err) {
          l_factory = [];
        } else {
          l_factory = result;
        }
        resolve();
      })
    })
  );
  all_promises.push(
    new Promise((resolve, reject) => {
      OutPlaceD.getA(function(err, result) {
        if(err) {
          l_outplace = [];
        } else {
          l_outplace = result;
        }
        resolve();
      })
    })
  );
  all_promises.push(
    new Promise((resolve, reject) => {
      ReceivePlaceD.getA(function(err, result) {
        if(err) {
          l_receiveplace = [];
        } else {
          l_receiveplace = result;
        }
        resolve();
      })
    })
  );
  Promise.all(all_promises).then(()=> {
    res.render('dashboard/input/manage', {l_factory: l_factory, l_outplace: l_outplace, l_receiveplace: l_receiveplace});
  })  
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

exports.delete_warehouse = function(req, res) {
  Warehouse.removeWarehouse(req.body.idx, function(err) {
    if(err) {      
      res.json({status: 0});
    } else {
      switch(req.body.type) {
        case 'T':
          FabricD.remove(req.body.refno, function(err) {
            if(err) {
              res.json({status: 2})
            } else {
              res.json({status: 1});
            }
          })
          break;
        case 'F':
          FinishD.remove(req.body.refno, function(err) {
            if(err) {
              res.json({status: 2});
            } else {
              res.json({status: 1});
            }
          })
          break;
        case 'O':
          OtherD.remove(req.body.refno, function(err) {
            if(err) {
              res.json({status: 2});
            } else {
              res.json({status: 1});
            }
          })
          break;
      }
    }
  })
}

exports.detail = function(req, res) {
  var id = req.query.id;
  var type = req.query.type;
  switch(type) {
    case 'T':
      var l_fabrictype, l_buyer;
      var all_promises = [];
      all_promises.push(
        new Promise((resolve, reject) => {
          FabricTypeD.getA(function(err, result) {
            if(err) {
              l_fabrictype = [];
            } else {
              l_fabrictype = result;
            }
            resolve();
          })
        })
      )
      all_promises.push(
        new Promise((resolve, reject) => {
          BuyerD.getA(function(err, result) {
            if(err) {
              l_buyer = [];
            } else {
              l_buyer = result;
            }
            resolve();
          })
        })
      )
      Promise.all(all_promises).then(() => {
        FabricD.get(id, function(err, result) {
          if(err) {
            res.redirect('/dashboard');
          } else {
            res.render('dashboard/input/detail1', {data: result, l_fabrictype: l_fabrictype, l_buyer: l_buyer, l_movestatus: Const.movestatus});
          }
        })
      })
      
      break;
    case 'F':
      var l_buyer;
      var all_promises = [];    
      all_promises.push(
        new Promise((resolve, reject) => {
          BuyerD.getA(function(err, result) {
            if(err) {
              l_buyer = [];
            } else {
              l_buyer = result;
            }
            resolve();
          })
        })
      )
      Promise.all(all_promises).then(() => {
        FinishD.get(id, function(err, result) {
          if(err) {
            res.redirect('/dashboard');
          } else {
            res.render('dashboard/input/detail2', {data: result, l_movestatus: Const.movestatus, l_buyer: l_buyer});
          }
        })
      })
      break;
    case 'O':
      OtherD.get(id, function(err, result) {
        if(err){
          res.redirect('/dashboard');
        } else {
          res.render('dashboard/input/detail3', {data: result, l_movestatus: Const.movestatus, l_buyer: l_buyer});
        }
      })
      break;
  }
}

exports.detail_update = function(req, res) {
  var type = req.body.type;
  switch(type) {
    case 'T':
      FabricD.update(req.body, function(err) {
        if(err) {
          res.json({status: 0});
        } else {
          res.json({status: 1});
        }
      })
      break;
    case 'F':
      FinishD.update(req.body, function(err) {
        if(err) {
          res.json({status: 0});
        } else {
          res.json({status: 1});
        }
      })
      break;
    case 'O':
      OtherD.update(req.body, function(err) {
        if(err) {
          res.json({status: 0});
        } else {
          res.json({status: 1});
        }
      })
      break;
  }
}

exports.read_qr = function(req, res) {
  res.render('dashboard/read');
}

exports.output = function(req, res) {
  var l_outplace, l_receiveplace;
  var all_promises = []; 
  all_promises.push(
    new Promise((resolve, reject) => {
      OutPlaceD.getA(function(err, result) {
        if(err) {
          l_outplace = [];
        } else {
          l_outplace = result;
        }
        resolve();
      })
    })
  );
  all_promises.push(
    new Promise((resolve, reject) => {
      ReceivePlaceD.getA(function(err, result) {
        if(err) {
          l_receiveplace = [];
        } else {
          l_receiveplace = result;
        }
        resolve();
      })
    })
  );
  Promise.all(all_promises).then(()=> {
    res.render('dashboard/output/manage', {l_outplace: l_outplace, l_receiveplace: l_receiveplace});
  })
}

exports.load_output = function(req, res) {
  Outhouse.allout(function(err, list) {
    if(err) {
      res.json({status: 0});
    } else {
      res.json({status: 1, list: list});
    }
  })
}
exports.update_output = function(req, res) {
  Outhouse.updateout(req.body, function(err, list) {
    if(err) {
      res.json({status: 0});
    } else {
      res.json({status: 1});
    }
  })
}
exports.add_output = function(req, res) {
  Outhouse.addOutput(req.body, function(err) {
    if(err) {
      res.json({status: 0});
    } else {      
      res.json({status: 1});
    }
  })
}