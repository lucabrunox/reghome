var Future = require("fibers/future");
fiberWrap = require("./fiberwrap.js");

var _pg = require('pg');

pgClientMethods = ["query"];
pgMethods = [
	["connect", ["client", pgClientMethods], "done"]
];

var pg = fiberWrap(_pg, pgMethods);

var DB = function(conn) {
	this.conn = conn;
};

DB.prototype = {
	journal: function() {
			var q = this.conn.query('SELECT * from libro');
			return q.rows;
	},
};

module.exports = function(config) {
	return function (f) {
		Future.task(function() {
				var conn = pg.connect(config.db);
				conn.client.query('SET search_path to luca');
				var db = new DB(conn.client);
				f(db);
				conn.done ();
		}).detach();
	};
};
