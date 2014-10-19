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

function toFloat (x, d) {
	var i = parseFloat(x);
	if (isNaN(i)) {
		return d || 0.0;
	}
	return i;
}

var pg = fiberWrap(_pg, pgMethods);

var DB = function(conn) {
	this.conn = conn;
};

DB.prototype = {
	getJournal: function(pager) {
		var pager = sanitizePager (pager);
		var q = this.conn.query('SELECT id, note, (extract(epoch from data)*1000)::bigint as timestamp from partita order by data desc offset '+((pager.page-1)*pager.count)+' limit '+(pager.count));
		return { data: q.rows };
	},

	newJournal: function() {
		var ac = this.conn.query('SELECT conto.id, conto.nome FROM conto ORDER BY nome LIMIT 1');
		
		// create new jour
		var q = this.conn.query('INSERT INTO partita (id) VALUES (DEFAULT) RETURNING id');
		id = q.rows[0].id;

		// set conto to the first account we have, it's safe as debit and credit are zero
		var acid = ac.rows[0].id;
		// two entries at least
		this.conn.query('INSERT INTO riga (conto, partita) VALUES ($1, $2), ($1, $2)', [acid, id]);
	},

	deleteJournal: function(id) {
		var id = toInt(id);
		this.conn.query('DELETE FROM partita WHERE id=$1', [id]);
	},

	newJournalEntry: function(id) {
		var id = toInt(id);
		var ac = this.conn.query('SELECT conto.id, conto.nome FROM conto ORDER BY nome LIMIT 1');
		// set conto to the first account we have, it's safe as debit and credit are zero
		var acid = ac.rows[0].id;
		this.conn.query('INSERT INTO riga (conto, partita) VALUES ($1, $2)', [acid, id]);
	},

	deleteJournalEntry: function(jdate, id) {
		var partita = toInt(jdate);
		var id = toInt(id);
		this.conn.query('DELETE FROM riga WHERE partita=$1 AND id=$2', [jdate, id]);
	},

	getJournalEntries: function(id) {
		var id = toInt(id);
		var q = this.conn.query('SELECT conto.id as conto_id, conto.nome as conto_nome, riga.* FROM riga JOIN conto ON (conto.id = riga.conto) WHERE riga.partita = '+id+' ORDER BY riga.dare DESC, riga.avere');
		var ac = this.conn.query('SELECT conto.id, conto.nome FROM conto ORDER BY nome');
		return { data: q.rows, accounts: ac.rows };
	},

	setJournalEntry: function(data) {
		if (id === "new") {
			this.conn.query('INSERT INTO riga SET dare = $1, avere = $2, note = $3, conto = $4',
											[toFloat(data.dare), toFloat(data.avere), data.note, data.conto_id]);
		} else {
			var id = toInt(data.id);
			if (id > 0) {
				this.conn.query('UPDATE riga SET dare = $1, avere = $2, note = $3, conto = $4 WHERE id = $5',
												[toFloat(data.dare), toFloat(data.avere), data.note, data.conto_id, id]);
			}
		}
	},

	/* Ledger and accounts */

	getLedger: function() {
		var q = this.conn.query('SELECT conto.id, conto.nome, sum(riga.dare) as dare, sum(riga.avere) as avere FROM conto JOIN riga ON (conto.id = riga.conto) GROUP BY conto.id, conto.nome');
		return { data: q.rows };
	},
};

module.exports = function(config) {
	return function (f) {
		Future.task(function() {
				var conn = pg.connect(config.db);
				conn.client.query("SET search_path to luca");
				conn.client.query("SET lc_monetary to 'C'");
				var db = new DB(conn.client);
				f(db);
				conn.done ();
		}).detach();
	};
};
