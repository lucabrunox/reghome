/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');

var ErrorGuard = React.createClass({
		render: function() {
			if (this.props.error) {
				return <div className="alert alert-danger" role="alert">{this.props.error}</div>
			};
			
			return this.props.children;
		},
});

module.exports = ErrorGuard;