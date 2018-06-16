var auth = require('../utils/auth');
var express = require('express');
var router = express.Router();
var dashboard = require('../controller/dashboard');

// Main routes for app
router.get('/', auth.requireLogin, dashboard.index);
router.get('/manage', auth.requireLogin, dashboard.manage);
router.post('/manage/add_warehouse', auth.requireLogin, dashboard.add_warehouse);
router.post('/manage/load_warehouse', auth.requireLogin, dashboard.load_warehouse);
router.post('/manage/update_warehouse', auth.requireLogin, dashboard.update_warehouse);
router.post('/manage/delete_warehouse', auth.requireLogin, dashboard.delete_warehouse);

router.get('/manage/detail', auth.requireLogin, dashboard.detail);
router.post('/manage/detail/update', auth.requireLogin, dashboard.detail_update);
module.exports = router;