/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
React.addons = require('react/addons').addons;

var ConfirmDelete = React.createClass({
	getInitialState: function () {
		return { confirm: false };
	},

	handleDelete: function (e) {
		e.preventDefault();
		e.stopPropagation();

		this.setState ({ confirm: true });
	},

	handleConfirm: function(e) {
		e.preventDefault();
		e.stopPropagation();

		this.props.onDelete ();
	},
	
	render: function() {
		if (!this.state.confirm) {
			return React.addons.cloneWithProps (this.props.children, { onClick: this.handleDelete });
		} else {
			return this.transferPropsTo (
				<button onClick={this.handleConfirm} className="btn btn-sm btn-danger">
					<span className="glyphicon glyphicon-warning-sign" /> Confirm
				</button>
			);
		}
	}
});

module.exports = ConfirmDelete;
