var auth = require('../utils/auth');
var express = require('express');
var router = express.Router();
var dashboard = require('../controller/dashboard');

// Main routes for app
router.use('/', auth.requireLogin, function(req, res, next) {
  next();
})
router.get('/', dashboard.index);
router.get('/manage',  dashboard.manage);
router.post('/manage/add_warehouse', dashboard.add_warehouse);
router.post('/manage/load_warehouse', dashboard.load_warehouse);
router.post('/manage/update_warehouse', dashboard.update_warehouse);
router.post('/manage/delete_warehouse', dashboard.delete_warehouse);

router.get('/manage/detail', dashboard.detail);
router.post('/manage/detail/update', dashboard.detail_update);

router.get('/read', dashboard.read_qr);
module.exports = router;