var path = require('path');
var nodes = path.join(process.env.depsEnv, "lib/node_modules");
console.log("Node modules: ", nodes);

module.exports = {
	context: __dirname,
	entry: {
		app: "./client/js/main.jsx",
	},

	output: {
		path: __dirname + "/dist/",
		filename: "[name].js",
		publicPath: "/assets/"
	},

	module: {
		loaders: [
			{ test: /\.jsx$/, loader: "jsx" },
			{ test: /react-typeahead/, loader: "jsx" },
			{ test: /\.scss$/, loader: "style!css!sass?outputStyle=expanded&includePaths[]=" + (path.join(nodes, "bootstrap-sass/assets/stylesheets/"))  },
			{ test: /\.woff$/, loader: "url?limit=10000&mimetype=application/font-woff" },
			{ test: /\.ttf$/, loader: "file" },
			{ test: /\.eot$/, loader: "file" },
			{ test: /\.svg$/, loader: "file" },
			{ test: /\.html$/, loader: "file?name=index.html" },
			{ test: /\.gif$/, loader: "file?name=[name].gif" },
		],
	},

	resolve: {
		modulesDirectories: [
			path.join (__dirname, "client/"),
			nodes,
			path.join(nodes, "bootstrap-sass/assets/javascripts"),
			path.join(nodes, "jquery/dist"),
		],
	},
	
	resolveLoader: {
		root: [ nodes ]
	},

}
