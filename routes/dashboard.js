var auth = require('../utils/auth');
var express = require('express');
var router = express.Router();
var dashboard = require('../controller/dashboard');

// Main routes for app
router.use('/', auth.requireLogin, function(req, res, next) {
  next();
})
router.get('/', dashboard.index);
router.get('/input/manage',  dashboard.manage);
router.post('/input/manage/add_warehouse', dashboard.add_warehouse);
router.post('/input/manage/load_warehouse', dashboard.load_warehouse);
router.post('/input/manage/update_warehouse', dashboard.update_warehouse);
router.post('/input/manage/delete_warehouse', dashboard.delete_warehouse);

router.get('/input/manage/detail', dashboard.detail);
router.post('/input/manage/detail/update', dashboard.detail_update);
router.post('/input/manage/detail_read', dashboard.detail_read);

router.get('/output/manage', dashboard.output);
router.post('/output/manage/load_output', dashboard.load_output);
router.post('/output/manage/update_output', dashboard.update_output);
router.post('/output/manage/add_output', dashboard.add_output);
router.post('/output/manage/remove_output', dashboard.remove_output);

router.get('/output/manage/detail', dashboard.detail_output);
router.post('/output/manage/add_detail', dashboard.add_output_detail);
router.post('/output/manage/load_detail1', dashboard.load_output_detail1);
router.post('/output/manage/load_detail2', dashboard.load_output_detail2);
router.post('/output/manage/load_detail3', dashboard.load_output_detail3);
router.post('/output/manage/detail_update', dashboard.load_detail_update);
router.post('/output/manage/detail_remove', dashboard.load_detail_remove);

router.post('/stock_load', dashboard.stock_load);
module.exports = router;