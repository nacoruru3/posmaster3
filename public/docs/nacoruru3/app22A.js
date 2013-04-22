// expressの読み込み
var express = require('express');
// serverオブジェクトの作成
var app = express.createServer();
// ejsのレイアウトをoff
var DBNAME = 'Testdb';
var DBUSER = 'root';
var DBPASSWD = 'nomore532';
var mysql = require('mysql');
var fs = require("fs");
var mycode=0;
var myvalue;
//////////////////////////////////////
app.set('view options', { layout: false });
// postデータを扱う際のおまじない ---- ★2
app.use(express.bodyParser());
// postの処理 ---- ★1
app.post('/', function(req, res){
  console.log(req.body); // for logging
  //console.log(req.body.code);
 var code = req.body.code;
  //console.log(req.body.itemvalue);
///////////////////////////////////
if(code=='001'){
  res.render('post2.ejs');}else{res.render('post3.ejs')}
});
app.listen(3588);