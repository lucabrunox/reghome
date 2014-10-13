/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
React.addons = require('react/addons').addons;

var Input = React.createClass({
	getInitialState: function() {
		return { editing: false };
	},

	getDefaultProps: function() {
		return {
			onSave: function(val) { },
			preInput: function() { return null; },
		};
	},
	
	componentDidUpdate: function() {
		if (this.state.editing) {
			$(this.refs.input.getDOMNode()).focus();
		}
	},

	handleBlur: function() {
		this.setState ({ editing: false });
	},

	handleKeyUp: function(e) {
		if (e.keyCode == 27) {
			this.setState ({ editing: false });
		}
	},
	
	handleSave: function(e) {
		e.preventDefault();
		var val = $(this.refs.input.getDOMNode()).val();
		this.props.onSave (val);
		this.setState ({ editing: false });
	},

	startEdit: function() {
		this.setState ({ editing: true });
	},
	
	render: function() {
		if (!this.state.editing) {
			return <div onClick={this.startEdit}>{this.props.children}</div>;
		} else {
			var props = React.addons.update (this.props, { ref: {$set: "input"}});
			delete props.preInput;
			delete props.onSave;
			delete props.children;
			var child = React.addons.cloneWithProps (<input onBlur={this.handleBlur} onKeyUp={this.handleKeyUp} />, props);

			return (
				<form className="form-inline" onSubmit={this.handleSave} role="form">
				<div className="form-group">
					<div className="input-group">
					  {this.props.preInput}
						{child}
						<span onMouseDown={this.handleSave} className="input-group-addon btn-default glyphicon glyphicon-ok" />
					</div>
				</div>
				</form>
			);
		}
	},
});

module.exports = {
	Input: Input
};