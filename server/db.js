var Future = require("fibers/future");
fiberWrap = require("./fiberwrap.js");

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
