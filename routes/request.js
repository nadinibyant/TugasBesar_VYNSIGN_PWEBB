var express = require('express');
var router = express.Router();
const {
    response
} = require('express');
const controllers = require('../controllers/index')

router.get('/request', controllers.request.getViewReqPending)
router.get('/request/completed', controllers.request.getViewsReqComp)

module.exports = router