/**
* @jsx React.DOM
*/
'use strict';

var React = require('react');
React.addons = require('react/addons').addons;
var Util = require('./util.js');
var querystring = require('querystring');

function trimSlashes(path) {
	return path.toString().replace(/\/$/, '').replace(/^\//, '');
}

function getPath() {
	var fragment = trimSlashes(decodeURI(location.pathname));
	return trimSlashes(fragment.replace(this.root, ''));
}

var Router = React.createClass ({
	
	getInitialState: function() {
    return this.getNewState();
	},

	getNewState: function() {
		return {
			path: this.getPath(),
			query: Util.getQuery()
		};
  },

	getDefaultProps: function() {
    return {
			root: ''
		};
  },

	getPath: function() {
		var path = trimSlashes(decodeURI(location.pathname));
		return trimSlashes(path.replace(this.props.root, ''));
	},

	componentWillMount: function() {
		if (trimSlashes(this.props.root) == '') {
			var self = this;
			$(window).on("linkClicked", function(e) {
					self.setState (self.getNewState ());
			}).on("popstate", function(e) {
					self.setState (self.getNewState ());
			});
		}
	},
	
	componentWillUnmount: function() {
		if (trimSlashes(this.props.root) == '') {
			$(window).off("linkClicked").off("popstate");
		}
	},
	
	render: function() {

		for (var i=0; i < this.props.children.length; i++) {
			var child = this.props.children[i];
			var match = this.state.path.match (child.props.path);
			if (match) {
				match.shift();
				var route = { root: this.props.root, path: this.state.path, query: this.state.query, match: match };
				return React.addons.cloneWithProps (child, { key: i, route: route });
			}
		}

		return <div>Not found</div>;

	}
});

var Route = React.createClass ({

	getDefaultProps: function() {
		return {
			path: ''
		};
	},
		
	render: function() {
		return React.addons.cloneWithProps (this.props.children, { route: this.props.route });
	},
	
});

var Link = React.createClass ({
	getHref: function () {
		var href = this.props.href || location.pathname;
		
		if (!$.isEmptyObject (this.props.query)) {
			var q = querystring.decode (location.search.substring(1));
			q = React.addons.update (q, this.props.query);
			href = location.pathname+"?"+querystring.encode(q);
		}

		return href;
	},
	
	handleClick: function(e) {
		e.stopPropagation();
		history.pushState (null, null, this.getHref());
		$(window).triggerHandler("linkClicked");

		return false;
	},
	
	render: function() {
		return this.transferPropsTo (<a href={this.getHref()} onClick={this.handleClick}>{this.props.children}</a>);
	}
});

module.exports = {
	Router: Router,
	Route: Route,
	Link: Link
};