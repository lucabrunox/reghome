var Future = require('fibers/future');
var fiberWrap = require('./fiberwrap');

if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var config = require(process.argv[2]);

var _pg = require('pg');
var conString = "/tmp";

pgClientMethods = ["query"];
pgMethods = [
	["connect", ["client", pgClientMethods], "done"]
];

var pg = fiberWrap(_pg, pgMethods);
var app = Future.task(function() {
  var conn = pg.connect(config.db);
  var result = conn.client.query('SELECT $1::int as number', ['1']);
  console.log(result);
  conn.done();
  conn.client.orig.end();
}).detach();
