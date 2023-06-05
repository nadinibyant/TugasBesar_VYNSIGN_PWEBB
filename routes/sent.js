var express = require('express');
var router = express.Router();
const {
    response
} = require('express');
const controllers = require('../controllers/index')

router.get('/sent', controllers.sent.getViewSent)
router.get('/sent/addSign', controllers.sent.getViewSign)
router.post('/sent/addSign', controllers.sent.addSign)

module.exports = router