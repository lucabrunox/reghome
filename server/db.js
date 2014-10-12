var Future = require("fibers/future");
fiberWrap = require("./fiberwrap.js");

var _pg = require('pg');

pgClientMethods = ["query"];
pgMethods = [
	["connect", ["client", pgClientMethods], "done"]
];

function sanitizePager(pager) {
	var page = parseInt(pager.page);
	if (!(page > 1)) {
		page = 1;
	}
	
	return {
		page: page,
		count: pager.count,
	}
}

function toInt (x, d) {
	var i = parseInt(x);
	if (isNaN(i)) {
		return d || 0;
	}
	return i;
}

var pg = fiberWrap(_pg, pgMethods);

var DB = function(conn) {
	this.conn = conn;
};

DB.prototype = {
	journal: function(pager) {
		var pager = sanitizePager (pager);
		var q = this.conn.query('SELECT * from partita order by data desc offset '+((pager.page-1)*pager.count)+' limit '+(pager.count));
		return q.rows;
	},

	journalEntries: function(id) {
		var id = toInt(id);
		var q = this.conn.query('SELECT riga.* from riga WHERE riga.partita = '+id+' ORDER BY riga.dare DESC, riga.avere');
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
