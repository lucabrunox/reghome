var path = require('path');

module.exports = {
    context: __dirname,
	entry: "./client/js/main.jsx",
    output: {
        path: __dirname + "/dist",
        filename: "bundle.js"
    },
	cache: true,
	module: {
        loaders: [
            { test: /\.jsx$/, loader: "jsx-loader" }
        ],
	},
	resolveLoader: {
		root: path.join(__dirname, "node_modules")
	}
}
