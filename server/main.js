if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var config = require(process.argv[2]);
var express = require('express');
var path = require('path');
var dbconn = require('./db')(config);

function wrapdb(res, f) {
	return dbconn(function() {
		try {
			return res.send({ data: f.apply(null, arguments) });
		} catch (err) {
			return res.status(500).send({ error: err.message });
		}
	});
}

var app = express();

app.enable('trust proxy');

app.use("/assets", express.static (config.staticDir));

app.get("/api/journal", function(req, res, next) {
		wrapdb(res, function (db) {
			var data = db.journal ();
			return data;
		});
});

/* app.get("/api/*", function( */

app.use('/api', function(req, res, next) {
		res.status(404).send({ error: 'Not found' });
});

app.get("/*", function(req, res, next) {
		res.sendFile (path.resolve (config.staticDir, "./index.html"));
});

app.listen(config.bindPort, function() {
		console.log("Started");
});
