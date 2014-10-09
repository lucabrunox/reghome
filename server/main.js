if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var config = require(process.argv[2]);
var express = require('express');
var url = require('url');
var ReactAsync = require('react-async');
var nodejsx = require('node-jsx').install({extension: '.jsx'});

var App = require('../client/js/main.jsx');
console.log(App);

function renderApp(req, res, next) {
  var path = url.parse(req.url).pathname;
  var app = App({path: path});
  ReactAsync.renderComponentToStringWithAsyncState(app, function(err, markup) {
    if (err) {
      return next(err);
    }
    res.send('<!doctype html>\n' + markup);
  });
}

var app = express();

app.enable('trust proxy');
app.use(express.static(config.staticDir));

app.listen(config.bindPort, function() {
		console.log("Started");
});
