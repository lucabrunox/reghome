if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var path = require('path');

var workdir = process.cwd();
var configPath = path.resolve(workdir, process.argv[2]);
var config = require(configPath);
console.log ("Loaded config from ", configPath);

var staticDir = path.resolve (path.dirname (configPath), config.staticDir);
console.log ("Serving root ", staticDir);

var express = require('express');
var bodyParser = require('body-parser');
var dbconn = require('./db')(config);

function wrapdb(res, f) {
	return dbconn(function() {
		try {
			return res.send({ data: f.apply(null, arguments) });
		} catch (err) {
			console.log(err.message);
			return res.status(500).send({ error: err.message });
		}
	});
}

function makepager(q, count) {
	var page = parseInt(q.page);
	if (!(page > 1)) {
		page = 1;
	}
	
	return {
		page: page,
		count: count,
	}
}

var app = express();

app.enable('trust proxy');

app.use("/assets", express.static (staticDir));

app.use("/api", bodyParser.json());

app.get("/api/journal", function(req, res, next) {
		wrapdb(res, function (db) {
			var data = db.getJournal ({ page: req.query.page, count: 10 });
			return data;
		});
});

app.get("/api/journal/:id", function(req, res, next) {
		wrapdb(res, function (db) {
			var data = db.getJournalEntries (req.params.id);
			return data;
		});
});

app.post("/api/journal/entry", function(req, res, next) {
		wrapdb(res, function (db) {
			db.setJournalEntry (req.body);
		});
});

app.use('/api', function(req, res, next) {
		res.status(404).send({ error: 'Not found' });
});

app.get("/*", function(req, res, next) {
		res.sendFile (path.resolve (staticDir, "./index.html"));
});

app.listen(config.bindPort, function() {
		console.log("Started");
});
