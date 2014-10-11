/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');

var ResultGuard = React.createClass({
		render: function() {
			if (this.props.data == false) {
				return <div className="alert alert-info" role="alert">No results found, <a href="javascript:history.back()">go back</a>.</div>
			};
			
			return this.props.children;
		},
});

module.exports = ResultGuard;