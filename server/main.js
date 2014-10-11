if (process.argv.length < 3) {
	console.log ("Error: must specify a configuration");
	process.exit(1);
}

var config = require(process.argv[2]);
var express = require('express');
var path = require('path');

var app = express();

app.enable('trust proxy');
app.use("/assets", express.static (config.staticDir));
app.get("/*", function(req, res, next) {
		res.sendFile (path.resolve (config.staticDir, "./index.html"));
});

app.listen(config.bindPort, function() {
		console.log("Started");
});
