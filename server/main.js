var Future = require('fibers/future');
var fiberWrap = require('./fiberwrap');

if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var config = require(process.argv[2]);

var express = require('express');
var app = express();

app.enable('trust proxy');
app.use(express.static(config.staticDir));

var _pg = require('pg');
var conString = "/tmp";

pgClientMethods = ["query"];
pgMethods = [
	["connect", ["client", pgClientMethods], "done"]
];

var pg = fiberWrap(_pg, pgMethods);

Future.task(function() {
  var conn = pg.connect(config.db);
  var result = conn.client.query('SELECT $1::int as number', ['1']);
  console.log(result);
  conn.done();
}).detach();

app.listen(config.bindPort);
