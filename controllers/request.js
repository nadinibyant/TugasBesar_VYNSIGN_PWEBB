var user = require('../models/users');
const {
    response
} = require('express');
const jwt = require('jsonwebtoken');
var document = require('../models/documents');
var signature = require('../models/signature');
const controllers = {}

const verifyToken = (req, res, next) => {
    const token = req.cookies.token;

    //   console.log(token)

    if (!token) {
        // Token tidak ada, redirect ke halaman login
        return res.redirect('/signin');
    }

    try {
        const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
        req.user = decoded.userId;
        next();
    } catch (error) {
        // Token tidak valid atau kedaluwarsa, redirect ke halaman login
        return res.redirect('/signin');
    }
};

const getViewReqPending = async (req,res) => {
    try {
        const foundUser = await user.findOne({
          where: {
            id: req.session.userId
          }
        });
    
        if (!foundUser) {
          return res.redirect('/signin');
        }
    
        const username = foundUser.username;
        res.render('request/pendingReq', {
          username
        });
      } catch (error) {
        return res.redirect('/signin');
      }
} 

controllers.getViewReqPending = [verifyToken, getViewReqPending]

const getViewsReqComp = async (req, res) => {
  try {
    const foundUser = await user.findOne({
      where: {
        id: req.session.userId
      }
    });

    if (!foundUser) {
      return res.redirect('/signin');
    }

    const username = foundUser.username;
    res.render('request/compReq', {
      username
    });
  } catch (error) {
    return res.redirect('/signin');
  }
}

controllers.getViewsReqComp = [verifyToken, getViewsReqComp]


module.exports = controllers

