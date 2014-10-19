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

	countDown: function() {
		if (this.state.confirm) {
			if (this.state.countdown === 1) {
				this.setState ({ confirm: false });
			} else {
				this.setState ({ countdown: this.state.countdown-1 });
				setTimeout(this.countDown.bind(this), 1000);
			}
		}
	},

	handleDelete: function (e) {
		e.preventDefault();
		e.stopPropagation();

		this.setState ({ confirm: true, countdown: 5 });
		setTimeout(this.countDown.bind(this), 1000);
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
					<span className="glyphicon glyphicon-warning-sign" /> Confirm {this.state.countdown}
				</button>
			);
		}
	}
});

module.exports = ConfirmDelete;
